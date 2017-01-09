
---
layout: post
title:  'Canvas-PivotGrid'
author: 'jakub.siuda@exceedra.com'
exerpt: >
  The pivot grid is a control used to aggregate records in a tabular format with its rows and columns grouped so the data can form a hierarchical structure. 

---

  <p><span style="font-size: 30px; line-height: 1.1; font-family: inherit; color: #000000;">PivotGrid Template</span></p>
<pre><a name="To-be-written-wait-patiently"></a><span style="font-size: 14px;">&lt;Results&gt;<br />&nbsp; &lt;Title&gt;Pivot title&lt;/Title&gt;<br />&nbsp; &lt;Canvas_Element_Idx&gt;1&lt;/Canvas_Element_Idx&gt;<br />&nbsp; &lt;PivotGrid_Code&gt;PIVOT_CODE&lt;/PivotGrid_Code&gt;<br />&nbsp; &lt;PivotMenuIsDisplayed&gt;1&lt;/PivotMenuIsDisplayed&gt;<br />&nbsp; &lt;PivotMenuIsEditable&gt;1&lt;/PivotMenuIsEditable&gt;<br />&nbsp; &lt;Settings&gt;<br />&nbsp; &nbsp; &lt;Setting Code="Aggregates_Position" Value="Rows" /&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; // (optional) Rows / Columns<br />&nbsp; &nbsp; &lt;Setting Code="Horizontal_Layout" Value="Compact" /&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;// (optional) Compact / Outline / Tabular<br />&nbsp; &nbsp; &lt;Setting Code="Vertical_Layout" Value="Compact" /&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;// (optional) Compact / Outline / Tabular<br />&nbsp; &nbsp; &lt;Setting Code="Row_Sub_Totals_Position" Value="Bottom" /&gt; &nbsp; &nbsp; &nbsp; &nbsp; // (optional) Top / Bottom / None<br />&nbsp; &nbsp; &lt;Setting Code="Column_Sub_Totals_Position" Value="Right" /&gt; &nbsp; &nbsp; &nbsp; // (optional) Right / Left / None<br />&nbsp; &nbsp; &lt;Setting Code="Row_Grand_Totals_Position" Value="Bottom" /&gt; &nbsp; &nbsp; &nbsp; // (optional) Top / Bottom / None<br />&nbsp; &nbsp; &lt;Setting Code="Column_Grand_Totals_Position" Value="Right" /&gt; &nbsp; &nbsp; // (optional) Right / Left / None<br />&nbsp; &nbsp; &lt;Setting Code="Expand_Rows" Value="True" Param="1" /&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; // (optional) True / False; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(optional) /any integer/<br />&nbsp; &nbsp; &lt;Setting Code="Expand_Columns" Value="True" Param="1" /&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;// (optional) True / False; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(optional) /any integer/<br />&nbsp; &lt;/Settings&gt;<br />&nbsp; &lt;FieldProperties&gt;<br />&nbsp; &nbsp; &lt;Property Code="PropertyCodeThatActsLikeId" &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; // /any string/<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Name="PropertyNameVisibleOnTheScreen" &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; // /any string/<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; PivotType="ToWhichPivotGridBoxItWillBeAssigned" &nbsp; &nbsp; &nbsp; &nbsp; // Filter / Row / Column / Value<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Type="PropertyTypeForDataTable" &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; // VARCHAR(int), VARCHAR(MAX), NVARCHAR(int), NVARCHAR(MAX), INT, BIG INT, FLOAT, BIT, DECIMAL(int a, int b) where a is precision and b is scale, e.g. DECIMAL(5,2) is a number that has 3 digits (at most) before the decimal, and 2 after (145.67)<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Format="FormatOfValueVisibleOnTheScreen" &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;// (optional) Nx / Px / Cx, where x is a number<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; PivotBoxSortOrder="NumberToSortWithinAPivotGridBox" &nbsp; &nbsp; // /any integer/<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; AggregationType="HowTheValuesAreAggregated" &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; // (optional) Sum / Avg or Average / Count / Max / Min<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; GridSorting="HowToSortValuesOfThisProperty" &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; // (optional) NONE / ASC / DESC<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Equation=""<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /&gt;<br />&nbsp;&lt;/FieldProperties&gt;<br />&nbsp;&lt;Fields&gt;<br />&nbsp; &nbsp;&lt;Field PropertyCodeThatActsLikeId="PropertyValue" /&gt;<br />&nbsp;&lt;/Fields&gt;<br />&nbsp; &lt;/FieldProperties&gt;<br />&lt;/Results&gt;</span></pre>
<h2><a name="Main-nodes"></a><span style="font-size: 14px;"><strong><span style="font-size: 28px;">Pivot grid - basic example</span></strong></span></h2>
<h2><span style="font-size: 14px;">One of the most basic examples of how to use the pivot grid would be to demonstrate the results of London's 2011 census:</span><br />
<br />
<pre>&lt;Results&gt;<br />&nbsp; &lt;FieldProperties&gt;<br />&nbsp; &nbsp; &lt;Property Code="CITY_NAME" &nbsp;   Name="City" &nbsp; &nbsp; &nbsp; &nbsp;   &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;PivotType="Column" /&gt;<br />&nbsp; &nbsp; &lt;Property Code="NATIONALITY"   Name="Nationality" &nbsp; &nbsp;   &nbsp; &nbsp; &nbsp; PivotType="Row" /&gt;<br />&nbsp; &nbsp; &lt;Property Code="POP" &nbsp; &nbsp; &nbsp; &nbsp;   Name="Population" Type="INT"   PivotType="Value" /&gt;<br />&nbsp; &lt;/FieldProperties&gt;<br />&nbsp; &lt;Fields&gt;<br />&nbsp; &nbsp; &lt;Field CITY_NAME="London"   NATIONALITY="United Kingdom"   &nbsp; &nbsp; &nbsp;POP="5175677" /&gt;<br />&nbsp; &nbsp; &lt;Field CITY_NAME="London"   NATIONALITY="India" &nbsp; &nbsp; &nbsp;   &nbsp; &nbsp; &nbsp; &nbsp; POP="262247" /&gt;<br />&nbsp; &nbsp; &lt;Field CITY_NAME="London"   NATIONALITY="Poland" &nbsp; &nbsp;   &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;POP="158300" /&gt;<br />&nbsp; &nbsp; &lt;Field CITY_NAME="London"   NATIONALITY="Republic of Ireland"   POP="129807" /&gt;<br />&nbsp; &nbsp; &lt;Field CITY_NAME="London"   NATIONALITY="Nigeria" &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp;  &nbsp; POP="114718" /&gt;<br />&nbsp; &nbsp; &lt;Field CITY_NAME="London"   NATIONALITY="Pakistan" &nbsp; &nbsp; &nbsp;  &nbsp;  &nbsp; &nbsp;POP="112457" /&gt;<br />&nbsp; &nbsp; &lt;Field CITY_NAME="London"   NATIONALITY="Bangladesh" &nbsp; &nbsp;  &nbsp;  &nbsp; &nbsp;POP="109948" /&gt;<br />&nbsp; &nbsp; &lt;Field CITY_NAME="London"   NATIONALITY="Jamaica" &nbsp; &nbsp;   &nbsp; &nbsp; &nbsp; &nbsp; POP="87467" /&gt;<br />&nbsp; &nbsp; &lt;Field CITY_NAME="London"   NATIONALITY="Sri Lanka"   &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; POP="84542" /&gt;<br />&nbsp; &nbsp; &lt;Field CITY_NAME="London"   NATIONALITY="France" &nbsp;   &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;POP="66654" /&gt;<br />&nbsp; &lt;/Fields&gt;<br />&lt;/Results&gt;</pre>
</h2>
<h2><img alt="" src="data:image/png;base64,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" /></h2>
<h2>PivotGrid with no fields</h2>
<p>If you provide an xml that doesn't have any fields specified, like this:</p>
<pre>&lt;Results&gt;<br />&nbsp; &lt;Title&gt;Pivot grid title&lt;/Title&gt;<br />&nbsp; &lt;FieldProperties&gt;<br />&nbsp; <span class="Apple-tab-span" style="white-space: pre;">	</span>(doesn't matter what is here actually)<br />&nbsp; &lt;/FieldProperties&gt;<br />&nbsp; &lt;Fields&gt;<br />&nbsp; &nbsp;&nbsp;<br />&nbsp; &lt;/Fields&gt;<br />&lt;/Results&gt;</pre>
<p>, regardless of its field properties it will generate the following output:</p>
<p><img alt="" src="/media/PivotGrid/PivotGridNoData.png" /></p>
<h2><a name="Settings"></a>Settings</h2>
<p>To set a setting for the pivot grid a &bdquo;Setting&rdquo; node must be placed as a child of the &bdquo;Settings&rdquo; node as follows:</p>
<p>
</p>
<pre><code>&lt;Settings&gt;
  &lt;Setting Code=&rdquo;code_of_the_setting&rdquo; Value=&rdquo;value_of_the_setting&rdquo; /&gt;   
  &lt;Setting Code=&rdquo;code_of_the_setting&rdquo; Value=&rdquo;value_of_the_setting&rdquo; /&gt;   
  &lt;Setting Code=&rdquo;code_of_the_setting&rdquo; Value=&rdquo;value_of_the_setting&rdquo; /&gt;   
&lt;/Settings&gt;
</code></pre>
<p>&nbsp;</p>
<p>The &ldquo;Settings&rdquo; node can have multiple "Setting" nodes.</p>
<hr />
<h3><a name="Aggregates-position"></a>Aggregates position</h3>
<p>When there is only one aggregate set in the data the pivot grid shows
the GrandTotals row and column.
When there is more than one aggregate instead of showing the GrandTotals
row and column the pivot grid visualizes the Totals for each of the
aggregates.
The Aggregate position setting defines where to place these Totals &ndash;
rows or columns.</p>
<p>
By default the aggregate position is set to rows.
</p>
<p>
Template:
</p>
<p>
</p>
<pre><code>&lt;Setting Code=&rdquo;Aggregates_Position&rdquo; Value=&rdquo;Rows or Columns&rdquo; /&gt;
</code></pre>
<p>&nbsp;</p>
<p>
Possible values with examples:
</p>
<ul>
    <li>Rows (default)</li>
</ul>
<p><img alt="" src="/media/PivotGrid/PivotGridAggregationPositionRows2.PNG" /></p>
<ul>
    <li>Column</li>
</ul>
<p><img alt="" src="/media/PivotGrid/PivotGridAggregationPositionColumns2.PNG" /></p>
<p>
Aggregates position setting is valid <strong>only when there is more than one aggregate</strong> in the data. Otherwise it&rsquo;s ignored.
</p>
<hr />
<h3><a name="Layouts"></a>Layouts</h3>
<p><a href="http://docs.telerik.com/devtools/wpf/controls/radpivotgrid/features/layouts#layout-types" rel="nofollow" class="external-link">Layouts explained here</a></p>
<p>It is possible to set separately the horizontal and the vertical layout.</p>
<p>
By default both layouts are set to compact.
</p>
<p>
Template for the horizontal layout (for columns):
</p>
<p>
</p>
<pre><code>&lt;Setting Code=&rdquo;Horizontal_Layout&rdquo; Value=&rdquo;Compact or Outline or Tabular&rdquo; /&gt;
</code></pre>
<p>&nbsp;</p>
<p>
Template for the vertical layout (for rows):
</p>
<p>
</p>
<pre><code>&lt;Setting Code=&rdquo;Vertical_Layout&rdquo; Value=&rdquo;Compact or Outline or Tabular&rdquo; /&gt;
</code></pre>
<p>&nbsp;</p>
<hr />
<h3><a name="Grand-totals-position"></a>Grand totals position</h3>
<p>There are two grand totals: </p>
<ul>
    <li>the row grand total to show aggregated data for all rows</li>
    <li>the column grand total to show aggregated data for all columns</li>
</ul>
<p>
By default the row grand total position is set to bottom and the column grand total position is set to right.
</p>
<p>&nbsp;</p>
<h4><a name="Row-grand-totals-position"></a>Row grand totals position</h4>
<p>
Template for the row grand totals position:
</p>
<p>
</p>
<pre><code>&lt;Setting Code=&rdquo;Row_Grand_Totals_Position&rdquo; Value=&rdquo;Top or Bottom or None&rdquo; /&gt;
</code></pre>
<p>&nbsp;</p>
<p>
Possible values with examples for the row grand position:
</p>
<ul>
    <li>Bottom (default)</li>
</ul>
<p><img alt="" style="width: 577px; height: 272px;" src="/media/PivotGrid/PivotGridRowGrandTotalsBottom.PNG" /></p>
<ul>
    <li>Top</li>
</ul>
<p><img alt="" src="/media/PivotGrid/PivotGridRowGrandTotalsTop.PNG" /></p>
<ul>
    <li>None</li>
</ul>
<p><img alt="" src="/media/PivotGrid/PivotGridRowGrandTotalsNone.PNG" /></p>
<p>&nbsp;</p>
<h4><a name="Column-grand-totals-position"></a>Column grand totals position</h4>
<p>
Template for the column grand totals position:
</p>
<p>
</p>
<pre><code>&lt;Setting Code=&rdquo;Column_Grand_Totals_Position&rdquo; Value=&rdquo;Right or Left or None&rdquo; /&gt;
</code></pre>
<p>&nbsp;</p>
<p>
Possible values with examples for the column grand position:
</p>
<ul>
    <li>Right (default)</li>
</ul>
<p><img alt="" src="/media/PivotGrid/PivotGridColumnGrandTotalsRight.PNG" /></p>
<ul>
    <li>Left</li>
</ul>
<p><img alt="" src="/media/PivotGrid/PivotGridColumnGrandTotalsLeft.PNG" /></p>
<ul>
    <li>None</li>
</ul>
<p><img alt="" src="/media/PivotGrid/PivotGridColumnGrandTotalsNone.PNG" /></p>
<p>
If there is more than one aggregation set the "Grand Total" column or
row (analogical to the aggregates position set) becomes divided between
Total columns or rows for each of the aggregation set. These rows /
columns are also being positioned by the mentioned grand totals
position.
</p>
<hr />
<h3><a name="Sub-totals-position"></a>Sub totals position</h3>
<p>Similarly to the grand totals, there are two sub totals as well:</p>
<ul>
    <li>the row sub total to show aggregated data for all row hierarchies</li>
    <li>the column sub total to show aggregated data for all column hierarchies</li>
</ul>
<p>Sub totals appear when you have set more than one aggregation on your
items. Sub totals will appear for each row / column which has more than
one hierarchy level.</p>
<p>
By default the row sub total position is set to bottom and the column subtotal position is set to right.
</p>
<p>&nbsp;</p>
<h4><a name="Row-sub-totals-position"></a>Row sub totals position</h4>
<p>
Template for the row sub totals position:
</p>
<p>
</p>
<pre><code>&lt;Setting Code=&rdquo;Row_Sub_Totals_Position&rdquo; Value=&rdquo;Top or Bottom or None&rdquo; /&gt;
</code></pre>
<p>&nbsp;</p>
<p>
Possible values with examples for the row sub position:
</p>
<ul>
    <li>Bottom (default)</li>
</ul>
<p><img alt="" src="/media/PivotGrid/PivotGridRowSubTotalsPositionBottom.PNG" /></p>
<ul>
    <li>Top</li>
</ul>
<p><img alt="" src="/media/PivotGrid/PivotGridRowSubTotalsPositionTop.PNG" /></p>
<ul>
    <li>None</li>
</ul>
<p><img alt="" src="/media/PivotGrid/PivotGridRowSubTotalsPositionNone.PNG" /></p>
<p>&nbsp;</p>
<h4><a name="Column-sub-totals-position"></a>Column sub totals position</h4>
<p>
Template for the column sub totals position:
</p>
<p>
</p>
<pre><code>&lt;Setting Code=&rdquo;Column_Sub_Totals_Position&rdquo; Value=&rdquo;Right or Left or None&rdquo; /&gt;
</code></pre>
<p>&nbsp;</p>
<p>
Possible values with examples for the column sub position:
</p>
<ul>
    <li>Right (default)</li>
</ul>
<p><img alt="" src="/media/PivotGrid/PivotGridColumnSubTotalsPositionRight.PNG" /></p>
<ul>
    <li>Left</li>
</ul>
<p><img alt="" src="/media/PivotGrid/PivotGridColumnSubTotalsPositionLeft.PNG" /></p>
<ul>
    <li>None</li>
</ul>
<p><img alt="" src="/media/PivotGrid/PivotGridColumnSubTotalsPositionNone.PNG" /></p>
<p>
If there is more than one aggregation set the "Grand Total" column or
row (analogical to the aggregates position set) becomes divided between
Total columns or rows for each of the aggregation set. These rows /
columns are also being positioned by the mentioned grand totals
position.
</p>
<hr />
<h3><a name="Initial-expanding"></a>Initial expanding</h3>
<p>It is possible to expand rows and columns initially, before the pivot
grid is rendered. To understand this concept the hierarchy levelling
must be explained beforehand.</p>
<p>
By default none rows or columns are expanded.
</p>
<p>&nbsp;</p>
<h4><a name="Hierarchy-levelling"></a>Hierarchy levelling</h4>
<p>
The most general rows and columns are considered as of level 1. Every
subcategory of those (sub row and sub column respectively) are
considered as of level 2 and so on.
</p>
<p>Example shown on the picture below (rows expanded initially up to the second level and column up to the first level):</p>
<p><img alt="" src="/media/PivotGrid/HierarchyLevelling2.PNG" /></p>
<p>&nbsp;</p>
<h4><a name="Initial-rows-expanding"></a>Initial rows expanding</h4>
<p>
Template for the initial rows expanding:
</p>
<p>
</p>
<pre><code>&lt;Setting Code="Expand_Rows" Value="True" Param="1" /&gt;
</code></pre>
<p>&nbsp;</p>
<p>where param defines up to which level of rows hierarchy the expanding
will be applied (exclusive). For instance, if set to 1, only rows in
the first level of the rows hierarchy will be initially expanded.</p>
<p>
Param is optional and it does not take any effect if Value is set to false.
</p>
<p>&nbsp;</p>
<h4><a name="Initial-columns-expanding"></a>Initial columns expanding</h4>
<p>
Template for the initial columns expanding:
</p>
<p>
</p>
<pre><code>&lt;Setting Code="Expand_Rows" Value="True" Param="1" /&gt;
</code></pre>
<p>&nbsp;</p>
<p>where param defines up to which level of columns hierarchy the
expanding will be applied (exclusive). For instance, if set to 1, only
columns in the first level of the the columns hierarchy will be
initially expanded.</p>
<p>
Param is optional and it does not take any effect if Value is set to false.<span style="font-size: 30px; line-height: 1.1; font-family: inherit; color: inherit;"></span></p>