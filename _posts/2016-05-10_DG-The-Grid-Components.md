<div id="pagecontent">
<p>The control is split into to a number of separate controls, controlled by the XML</p>
<p><strong>Header Row</strong></p>
<p>Only used if an attribute has a valid HeaderRow section.</p>
<p><strong>Main Grid</strong></p>
<p><strong>Footer Grid</strong></p>
<p>Only visible if an attribute has a TotalsAggregationMethod set.</p>
<h2>XAML</h2>
<pre><code>xmlns:Controls="clr-namespace:Exceedra.Controls.DynamicGrid.Controls;assembly=Exceedra.Controls"

&lt;!&mdash;Dynamic grids bind like all other controls --&gt;
&lt;Controls:DynamicGridControl Grid.Row="5" 
x:Name="dynamicProductMeasures" 
Margin="6"
CanSort="False"
IsReadOnly="{Binding CurrentPromotion.IsEditable, Converter={StaticResource 
InverseConverter}}"
HorizontalAlignment="Stretch"   
VerticalAlignment="Stretch"
ItemDataSource="{Binding RelativeSource={RelativeSource AncestorType=Page}, 
Path=DataContext.G3FinancialScreenPlanningSkuMeasure, Mode=TwoWay}" 
/&gt;
&lt;!&mdash;
Note the ItemDataSource binding looks unusual but it is necessary to pass the changes in the grid around through the page to the usercontrol etc
--&gt;
</code></pre>
<h2>XAML.cs</h2>
<pre><code>private ViewModelBase _viewModel;

public NewPage(ViewModelBase viewModel)
{
    if (viewModel == null) throw new ArgumentNullException("viewModel");

    InitializeComponent();
    _viewModel = viewModel;
    DataContext = viewModel;

    _viewModel.PropertyChanged += ViewModelPropertyChanged;

    Loaded += Page_Loaded;
}

private void Page_Loaded(object sender, RoutedEventArgs e)
{
G3.Header = App.CurrentLang.GetValue("G3_label",
        "The Label for G3");

}   

private void ViewModelPropertyChanged(object sender, System.ComponentModel.PropertyChangedEventArgs e)
{
    if (e.PropertyName == "G3VM")
    { 
        G3.Visibility = (_viewModel.G3VM != null 
        &amp;&amp; _viewModel.G3VM.Records != null 
        &amp;&amp; _viewModel.G3VM.Records.Count() &gt; 0 ? Visibility.Visible : 
        Visibility.Collapsed);
    }


}
</code></pre>
<h2>ViewModel</h2>
<pre><code>//When you initialize the data 
G3VM = new RecordViewModel(DataAccess.LoadG3Data(SomeId));
G3VM.PropertyChanged += G3VM_PropertyChanged;



private void G3VM_PropertyChanged(object sender, PropertyChangedEventArgs e)
{
    if (e.PropertyName == "Records")
    {
        FireG2Changes();
    }
}



private void FireG2Changes ()
{
    //its changed, do stuff if neccesary
    GetG2ValuesFromG3();

}

private void GetG2ValuesFromG3()
{

 //todo
}


private Tuple&lt;string, string&gt; TableColumn(string UpdateToColumn)
{

    var updates = UpdateToColumn.Split('$');
    try
    {
        var table = updates[0];
        var column = updates[1];

        return new Tuple&lt;string, string&gt;(table,column);
    }
    catch (Exception)
    { 
        return null;
    }

}
</code></pre>
</div>