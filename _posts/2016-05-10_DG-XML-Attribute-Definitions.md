<div id="pagecontent">
<pre><code>Name        Unique  Column  Cell            Description
ColumnCode  x                               This code can be anything but must be unique and is ued to allow columns and cells to pass data between themselves
HeaderText                                  Visible header text at top of column
HeaderRow           x                       Columns can have multiple header rows
   HeaderRow &gt; HeaderOperation              If used will add a header row control to allow manipulation of column data, this control will only affect this column
   HeaderRow &gt; HeaderOperation.Label        Visible label for header grid row
   HeaderRow &gt; HeaderOperation.Type         Operation to be applied to main grid column 
Value               x                           Value to be displayed in the cell
Values              
   Values &gt; Value           x               Values to be selected/used in the cell
Format                      x               String format for the 'value'
ForeColour                  x               Text colour for the cell labels/non-editable data only
BackgroundColour            x               Cell background colour
BorderColour                x               Cell border colour
IsDisplayed     x                           Columns can be hidden
IsEditable      x                           Control is readonly
ControlType     x                           Label,TextBox, CalendarSelector, Date picker, Checkbox, DropdownList, File Location, Link
DataSource                  x               SQL proc to use to populate the cell
DataSourceInput             x               XML to pass through to SQL proc, app needs to know what is in this to allow for substitution. 
                                            This needs to be in this format: 

                                            &amp;lt;DataSourceInput&amp;gt;&amp;lt;User_Idx /&amp;gt;&amp;lt;MenuItem_Idx /&amp;gt;&amp;lt;GridItem_Code /&amp;gt;&amp;lt;SelectedItem_Idx /&amp;gt;&amp;lt;/DataSourceInput&amp;gt;
DependentColumns                
DependentColumns &gt; DependentColumn  x       Columns that are dependant on this column
UpdateToColumn      x                       The grid and column to send this data to.
                                            Format needs to be [Grid]$[ColumnCode].
                                            Grids need to need to be referenced in order ie G1, G2, G3, in the order they appear on the screen (top left, to bottom right)
ExternalData                x               Sometimes we need to add data that is not to be used as the visible value like a hyperlink/external path
TotalsAggregationMethod             x       SUM, AVG or COUNT the rows in this column and display this in a footer row
ColumnSortOrder     x       
</code></pre>
<p>Some nodes at used to build the grid itself through column binding and some are used at cell level.</p>
</div>