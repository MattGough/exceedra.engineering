
---
layout: post
title:  'Canvas-PivotGrid-Field-Properties'
author: 'jakub.siuda@exceedra.com'
exerpt: >
  How to create a field property 

---

  <h2 style="font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; color: #333333;">Field properties</h2>
<p style="line-height: 20px;">Field properties comprises the definition of a Field. They become attributes for the Field and need to have values assigned. Field properties are created in the &ldquo;FieldProperties&rdquo; node. Their values are assigned when creating Fields in the &ldquo;Fields&rdquo; node.</p>
<p style="line-height: 20px;">To create a field property a &bdquo;Property&rdquo; node must be placed as a child of the &bdquo;FieldProperties&rdquo; node as follows:</p>
<p style="line-height: 20px;">&nbsp;</p>
<pre style="line-height: 1.42857;"><code>&lt;FieldProperties&gt;
   &lt;!-- creating Fields' properties --&gt;
   &lt;Property Code=&rdquo;Property1Code&rdquo; AnotherAttribute1=&rdquo;Value1&rdquo;&hellip;&gt;
   &lt;Property Code=&rdquo;Property2Code&rdquo; AnotherAttribute1=&rdquo;Value1&rdquo;&hellip;&gt;
   &lt;Property Code=&rdquo;Property3Code&rdquo; AnotherAttribute1=&rdquo;Value1&rdquo;&hellip;&gt;
   ...
&lt;/FieldProperties&gt;
&lt;Fields&gt;
   &lt;!-- creating fields (records of data) - assigning values for each  Property for every Field --&gt;
   &lt;Field Property1Code="Value1" Property2Code="Value2" Property3Code="Value3" ...&gt;
   &lt;Field Property1Code="Value4" Property2Code="Value5" Property3Code="Value6" ...&gt;
   ...
&lt;/Fields&gt;
</code></pre>
<p style="line-height: 20px;">&nbsp;</p>
<hr style="line-height: 20px;" />
<h3 style="font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; color: #333333;"><a name="Common-attributes"></a>Common attributes</h3>
<p style="line-height: 20px;">There are few types of field properties and depending on the selected type a field property can have different set of attributes available. Below are listed the attributes that are available for every kind of field property.</p>
<hr style="line-height: 20px;" />
<h4 style="font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; color: #333333;"><a name="Code"></a>Code</h4>
<p style="line-height: 20px;">The&nbsp;<span style="font-weight: 700;">code</span>&nbsp;attribute is used to identify field properties when assigning values to them during creation of fields.</p>
<p style="line-height: 20px;">The template for the&nbsp;<span style="font-weight: 700;">code</span>&nbsp;attribute:</p>
<p style="line-height: 20px;">&nbsp;</p>
<pre style="line-height: 1.42857;"><code>&lt;Property Code=&rdquo;PropertyCode&rdquo; /&gt;
</code></pre>
<p style="line-height: 20px;">&nbsp;</p>
<p style="line-height: 20px;">In order to assign a value of a field to such field property the field must be created as follows:</p>
<p style="line-height: 20px;">&nbsp;</p>
<pre style="line-height: 1.42857;"><code>&lt;Field PropertyCode=&rdquo;Value&rdquo; /&gt;
</code></pre>
<p style="line-height: 20px;">&nbsp;</p>
<p style="line-height: 20px;">, so its&nbsp;<span style="font-weight: 700;">code</span>&nbsp;value matches the attribute&rsquo;s name in the field definition.</p>
<hr style="line-height: 20px;" />
<h4 style="font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; color: #333333;"><a name="PivotType"></a>PivotType</h4>
<p style="line-height: 20px;">A field property can be one of these types: a row, a column or a value.</p>
<p style="line-height: 20px;">To set the type for a field property its&nbsp;<span style="font-weight: 700;">PivotType</span>&nbsp;attribute must be set as follows:</p>
<p style="line-height: 20px;">&nbsp;</p>
<pre style="line-height: 1.42857;"><code>&lt;Property PivotType="Row or Column or Value" /&gt;
</code></pre>
<p style="line-height: 20px;">&nbsp;</p>
<p style="line-height: 20px;">Depending on this selection only part of other attributes for this field property will be applicable. To get to know which ones look for the &ldquo;Rows and columns attributes&rdquo; and &ldquo;Values attributes&rdquo; in this document.</p>
<hr style="line-height: 20px;" />
<h4 style="font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; color: #333333;"><a name="Name"></a>Name</h4>
<p style="line-height: 20px;">The&nbsp;<span style="font-weight: 700;">name</span>&nbsp;attribute defines the name of the field property that is (the name) visible to a user on a screen. If the field property type is set to &ldquo;Row&rdquo; or &ldquo;Column&rdquo; it acts as a name of the row or the column respectively. Moreover, the&nbsp;<span style="font-weight: 700;">name</span>&nbsp;is shown in the pop up that occurs after hovering the mouse over a column, row or a value cell.</p>
<p style="line-height: 20px;">To set the&nbsp;<span style="font-weight: 700;">name</span>&nbsp;follow the pattern below:</p>
<p style="line-height: 20px;">&nbsp;</p>
<pre style="line-height: 1.42857;"><code>&lt;Property Name="Value" /&gt;
</code></pre>
<p style="line-height: 20px;">&nbsp;</p>
<hr style="line-height: 20px;" />
<h4 style="font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; color: #333333;"><a name="PivotBoxSortOrder"></a>PivotBoxSortOrder</h4>
<p style="line-height: 20px;">If the&nbsp;<span style="font-weight: 700;">PivotBoxSortOrder</span>&nbsp;is set to a row or column field property it defines the level of the hierarchy of that row or column. If set to a value field property it calculates the position where this property will be placed in regard to other value field properties.</p>
<p style="line-height: 20px;">The value of the&nbsp;<span style="font-weight: 700;">PivotBoxSortOrder</span>&nbsp;attribute will be compared to the&nbsp;<span style="font-weight: 700;">PivotBoxSortOrder</span>&nbsp;values of other field properties. Lower value will cause the field property to be recognised as more general (with lower level) when greater one as more detailed (with greater level). Take into account that all the field properties are calculated separately for each type (rows, columns and values).</p>
<p style="line-height: 20px;">In order to set the&nbsp;<span style="font-weight: 700;">PivotBoxSortOrder</span>&nbsp;attribute the property must be created as below</p>
<p style="line-height: 20px;">&nbsp;</p>
<pre style="line-height: 1.42857;"><code>&lt;Property PivotBoxSortOrder=&rdquo;Value&rdquo; /&gt;
</code></pre>
<p style="line-height: 20px;">&nbsp;</p>
<p style="line-height: 20px;">, where "Value" must be an integer.</p>
<hr style="line-height: 20px;" />
<h3 style="font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; color: #333333;"><a name="Rows-and-columns-attributes"></a>Rows and columns attributes</h3>
<p style="line-height: 20px;">The attributes listed below are applicable to a field property only in case when its type is set to "Row" or "Column". See "PivotType" in "Common attributes".</p>
<hr style="line-height: 20px;" />
<h4 style="font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; color: #333333;"><a name="Type"></a>Type</h4>
<p style="line-height: 20px;">Setting a&nbsp;<span style="font-weight: 700;">type</span>&nbsp;to a field property actually defines how this property behaves under some circumstances. For instance, rows or columns are sorted in a different way when their type is integer (from the lowest to the greatest integer) or string (alphabetically).</p>
<p style="line-height: 20px;">In order to set the&nbsp;<span style="font-weight: 700;">Type</span></p>