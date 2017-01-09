
---
layout: post
title:  'DG-Calculations'
author: 'chillfire'
exerpt: >
  Calculated cells in dynamic grids 

---

  <div id="pagecontent">
<p>Any column can use any other column value as an embedded value to
generate complex equations.
Cells that have a calculated value cannot be editable by the user, so a
cell can either be edited or calculated.
To set up a calculated value, simply start the &lt;value&gt; with an
equals sign. Calculations can be complex and use a standard mathematics
library to perform the math so any standard equation can be done as long
as column data is valid.</p>
<pre><code>Example: &amp;lt;value&amp;gt;=RRPC_UpdateTo * PromoVol_SI * (Normal_Case_Price - Promo_Disc)&amp;lt;/value&amp;gt;
</code></pre>
<p>The app replaces the column code in the equation with the value of that column.
Because calculations occur whenever a field changes the equations can be chained.
For example, the value from the above column could be included in an equation for a different column.
This has to be taken into account to assure there are no circular references.</p>
<p><strong>IF Statements</strong></p>
<p>The DynamicGrid also support conditional IF statements within the Value tags.</p>
<p>Base Format:</p>
<pre><code> =IF(Conditional Statement, Then Statement, Else Statement) 
</code></pre>
<p>Example:</p>
<pre><code> =IF(Retro_Cumulative_Flag = true, 
     Promotion_CLP_Discount_Percent_Entry, 
     Promotion_CLP_Discount_Percent_Entry - Existing_Effective_LTA) 
</code></pre>
<p>It also supports nested IF statements:</p>
<p>Base Format:</p>
<pre><code> =IF(Conditional Statement, 
       IF(Conditional Statement, 
           Then Statement, 
           Else Statement), 
       IF(Conditional Statement, 
           Then Statement, 
           Else Statement)
   ) 
</code></pre>
<p>Example:</p>
<pre><code> =IF(Promotion_CLP_Discount_Percent_Entry = 0, 
       0, 
      IF(Retro_Cumulative_Flag = true, 
         Promotion_CLP_Discount_Percent_Entry,
         Promotion_CLP_Discount_Percent_Entry - Existing_Effective_LTA)) 
</code></pre>
<p><strong>Row Sum</strong></p>
<p>TODO</p>
<p><strong>Sum</strong></p>
<p>TODO</p>
<p>No additional coding is required to make embedded calculations work</p>
</div>