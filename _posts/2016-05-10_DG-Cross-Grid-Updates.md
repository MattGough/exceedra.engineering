<div id="pagecontent">
<p>Using the UpdateToColumn field data can be passed from one grid to another.</p>
<pre><code>Example: &lt;UpdateToColumn&gt;G2$3rd_Party_Spend_UpdateTo&lt;/UpdateToColumn&gt;
</code></pre>
<p>Will pass the value from the current cell to the 3rd grid on the screen and push it to the column with a column<em>code of &lsquo;3rd</em>Party<em>Spend</em>UpdateTo&rsquo;
As these work in a similar way to calculated fields and are instantly
updated when fields change, be careful not to create circular references
across grids.</p>
<p>Implementing Cross Grid Updates
This gets a little complicated, but the process needs to be followed exactly to allow this to all hook together.</p>
<h2>XAML</h2>
<pre><code>&lt;Controls:DynamicGridControl 
x:Name="G3" 
    ItemDataSource="{Binding RelativeSource={RelativeSource AncestorType=Page}, 
Path=DataContext.G3FinancialScreenPlanningSkuMeasure, Mode=TwoWay}" 
/&gt;
</code></pre>
<h2>XAML.cs</h2>
<pre><code>    // No code needed for linking
</code></pre>
<h2>ViewModel</h2>
</div>