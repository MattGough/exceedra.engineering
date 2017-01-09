
---
layout: post
title:  'VG-Xml-Structure-GET'
author: 'chillfire'
exerpt: >
  What XML will we use for the GET 

---

  <div id="pagecontent">
<p>From DB</p>
<pre><code>&lt;Results&gt;                              &lt;!-- Standard DB wrapper--&gt;
    &lt;RootItem&gt;                         &lt;!-- Root of Vetical Grid data --&gt;
    &lt;Item_Idx /&gt;                       &lt;!-- Unique Item ID--&gt;
    &lt;Item_Type /&gt;                      &lt;!-- Item type/name--&gt;
    &lt;Attributes&gt;                       &lt;!-- Rows of controls --&gt;
        &lt;Attribute&gt;                    &lt;!-- Single control data--&gt;
            &lt;ColumnCode /&gt;             &lt;!-- Unique column code --&gt;
            &lt;HeaderText /&gt;             &lt;!-- Row label text --&gt;
            &lt;Value /&gt;                  &lt;!-- Single value/selected item --&gt;  
            &lt;Format /&gt;                 &lt;!-- String format for column --&gt;
            &lt;ForeColour /&gt;             &lt;!-- Text colour --&gt;
            &lt;BackgroundColour /&gt;       &lt;!-- Cell background colour --&gt;
            &lt;BorderColour /&gt;           &lt;!-- Cell border colour--&gt;
            &lt;IsDisplayed /&gt;            &lt;!-- Is this column visible--&gt;
            &lt;IsEditable /&gt;             &lt;!-- Is this column editable --&gt;     &lt;IsRequired&gt;               &lt;!-- Is required flag --&gt;
            &lt;ControlType /&gt;            &lt;!-- type of control to use in this column --&gt;
            &lt;DataSource /&gt;             &lt;!-- SQL proc name to call to load data --&gt;
            &lt;DataSourceInput /&gt;        &lt;!-- Data to send when calling the DataSource proc --&gt;
            &lt;DependentColumns   
                &lt;DependentColumn /&gt;    &lt;!-- Columns that need to change if data in this column do --&gt;
            &lt;/DependentColumns&gt; 
            &lt;UpdateToColumn /&gt;         &lt;!-- External grid/column to pass the data from this column into --&gt;
        &lt;/Attribute&gt;        
    &lt;/RootItem&gt;         
&lt;/Results&gt;              
</code></pre>
</div>