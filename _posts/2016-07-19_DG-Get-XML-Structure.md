<div id="pagecontent">
<p>From DB</p>
<pre><code>&lt;Results&gt;               &lt;!-- Standard DB wrapper--&gt;
    &lt;RootItem           &lt;!-- Root of Dynamic Grid data --&gt;
    &lt;Item_Idx /         &lt;!-- Unique Item ID--&gt;
    &lt;Item_Type /        &lt;!-- Item type--&gt;
    &lt;Attributes&gt;            &lt;!-- Rows of horizontal data --&gt;
        &lt;Attribute&gt;     &lt;!-- Column inside a row--&gt;
            &lt;ColumnCode/&gt;   &lt;!-- Unique column code --&gt;
            &lt;HeaderText /   &lt;!-- Column text --&gt;
            &lt;HeaderRow&gt; &lt;!-- If a header row is needed --&gt;
                &lt;HeaderOperation&gt;   &lt;!-- Multiple operations can be added --&gt;
                    &lt;Label/&gt;    &lt;!-- Header row label --&gt;
                    &lt;Type/&gt; &lt;!-- Type of calculation to do on rows in grid --&gt;
                &lt;/HeaderOperation   
            &lt;/HeaderRow&gt;    
            &lt;Value /&gt;       &lt;!-- Single value/selected item --&gt;
             &lt;Values&gt;       
                &lt;Value /    &lt;!-- Multiple values/selected items --&gt;
            &lt;/Values&gt;       
            &lt;Format /   &lt;!-- String format for column --&gt;
            &lt;ForeColour /   &lt;!-- Text colour --&gt;
            &lt;BackgroundColour / &lt;!-- Cell background colour --&gt;
            &lt;BorderColour / &lt;!-- Cell border colour--&gt;
            &lt;IsDisplayed /  &lt;!-- Is this column visible--&gt;
            &lt;IsEditable /   &lt;!-- Is this column editable --&gt;
            &lt;ControlType /  &lt;!-- type of control to use in this column --&gt;
            &lt;DataSource /   &lt;!-- SQL proc name to call to load data --&gt;
            &lt;DependentColumns   
                &lt;DependentColumn /  &lt;!-- Columns that need to change if data in this column do --&gt;
            &lt;/DependentColumns  
            &lt;UpdateToColumn /   &lt;!-- External grid/column to pass the data from this column into --&gt;
            &lt;ExternalData / &lt;!-- external data to use in this column --&gt;
            &lt;TotalsAggregationMethod /  &lt;!-- What sort of total column calculation --&gt;
            &lt;ColumnSortOrder /  &lt;!-- Column order in grid --&gt;
        &lt;/Attribute&gt;        
    &lt;/RootItem&gt;         
&lt;/Results&gt;              
</code></pre>
</div>
<p>&nbsp;</p>
<h2 style="font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; color: #000000;"><span style="font-size: 16px;"><strong>DynamicGrid with no root items</strong></span></h2>
<p style="color: #000000; font-size: 12px; line-height: 18px;">If you provide an xml that doesn't have any root items specified, like this:</p>
<pre style="line-height: 1.42857;">&lt;Results&gt;<br />&nbsp; &lt;Grid_Title&gt;Dynamic grid title&lt;/Grid_Title&gt;<br />&lt;/Results&gt;</pre>
<p style="color: #000000; font-size: 12px; line-height: 18px;">, it will generate the following output:</p>
<p style="color: #000000; font-size: 12px; line-height: 18px;"><img alt="" src="/media/DynamicGrid/NoData.png" /></p>