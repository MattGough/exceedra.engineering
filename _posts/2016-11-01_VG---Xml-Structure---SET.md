<div id="pagecontent">
<p><strong>Data in</strong></p>
<pre><code>&lt;Results&gt;                   &lt;!-- Standard DB wrapper--&gt;
    &lt;RootItem&gt;              &lt;!-- Root of vertical grid data --&gt;
        &lt;Item_Idx /&gt;        &lt;!-- Unique Item ID--&gt;
        &lt;Item_Type /&gt;       &lt;!-- Item type--&gt;
        &lt;Attributes&gt;        &lt;!-- Rows of horizontal data --&gt;
           &lt;Attribute&gt;      &lt;!-- Column inside a row--&gt;
            &lt;ColumnCode/&gt;   &lt;!-- Unique column code --&gt;
            &lt;Value /&gt;       &lt;!-- Single value/selected item --&gt;
            &lt;Values&gt;        
                &lt;Value /&gt;   &lt;!-- Multiple values/selected items --&gt;
            &lt;/Values&gt;
            &lt;IsTooltipVisible&gt;&lt;/IsTooltipVisible&gt;   &lt;!-- Allowed values: 0 or 1. Toggles tooltips for multi-selectable drodpowns that show the number of selected items, total items and lists all the selected items --&gt;
        &lt;/Attributes&gt;   
    &lt;/RootItem&gt;         
&lt;/Results&gt;                  
</code></pre>
</div>