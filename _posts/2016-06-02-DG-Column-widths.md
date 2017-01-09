
---
layout: post
title:  'DG-Column-widths'
author: 'chillfire'
exerpt: >
  How do we control the width of dynamic grid columns 

---

  <p>Inside the grid we can control column widths, by default columns are apportioned equal widths across the available space.</p>
<p>There are 2 options to control the width based on the data inside the grid using the &ldquo;FitWidth&rdquo; node:</p>
<p>&nbsp;</p>
<ul style="list-style-type: disc;">
    <li>Content = the app will find the biggest item in the column and set its width accordingly (other unset columns will be the same size)</li>
    <li>Header = the app will set the column width to the size of the header test (other unset columns will be the same size)</li>
</ul>
<p>&nbsp;</p>
<p>The last way is to set a physical &ldquo;Width&rdquo; in pixels, if you set FitWidth and Width, the Width will be used.</p>
<p>&nbsp;</p>
<p>Sample:</p>
<p>&nbsp;</p>
<p>&lt;Results&gt;</p>
<p><span>&nbsp;</span><span>&nbsp;</span>&lt;RootItem&gt;</p>
<p><span>&nbsp;&nbsp;&nbsp; </span>&lt;Item_Type /&gt;</p>
<p><span>&nbsp;&nbsp;&nbsp; </span>&lt;Item_Idx&gt;0&lt;/Item_Idx&gt;</p>
<p><span>&nbsp;&nbsp;&nbsp; </span>&lt;Item_RowSortOrder&gt;0&lt;/Item_RowSortOrder&gt;</p>
<p><span>&nbsp;&nbsp;&nbsp; </span>&lt;Item_IsDisplayed&gt;1&lt;/Item_IsDisplayed&gt;</p>
<p><span>&nbsp;&nbsp;&nbsp; </span>&lt;Attributes&gt;</p>
<p><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>&lt;Attribute&gt;</p>
<p><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>&lt;ColumnCode&gt;Cell0&lt;/ColumnCode&gt;</p>
<p><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>&lt;Alignment&gt;Left&lt;/Alignment&gt;</p>
<p><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>&lt;BackgroundColour&gt;#ffffff&lt;/BackgroundColour&gt;</p>
<p><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>&lt;BorderColour&gt;#ffffff&lt;/BorderColour&gt;</p>
<p><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>&lt;HeaderText&gt;Distributors&lt;/HeaderText&gt;</p>
<p><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>&lt;IsDisplayed&gt;1&lt;/IsDisplayed&gt;</p>
<p><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>&lt;ControlType&gt;Label&lt;/ControlType&gt;</p>
<p><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>&lt;IsEditable&gt;0&lt;/IsEditable&gt;</p>
<p><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>&lt;UpdateToCell /&gt;</p>
<p><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>&lt;Value&gt;Mission Beverage Company, CA&lt;/Value&gt;</p>
<p><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>&lt;Value2 /&gt;</p>
<p><span style="color: red;">&lt;FitWidth&gt;???&lt;/FitWidth&gt; &lt;!-- &nbsp;Content or Header --&gt;</span></p>
<p><span style="color: red;">&lt;Width&gt;???&lt;/Width&gt; &lt;!-- integer --&gt;</span></p>
<p><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>&lt;/Attribute&gt;</p>