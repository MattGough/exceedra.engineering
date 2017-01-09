
---
layout: post
title:  'BIML_Dim_Definition_Type'
author: 'chillfire'
exerpt: >
   Definitions represent the end-points of the Integration Layer in SSIS. As each end-point has slightly different configuration, we need to be able to accommodate this. A definition type represents an end-point and the interpreter will handle how to set up each of these. 

---

  <div id="pagecontent">
<p><strong>Schema</strong> : BIML</p>
<p><strong>Object</strong>: Dim_Package_Type</p>
<p><strong>Author</strong>: Brendan Roberts</p>
<p><strong>Created Date</strong>    : 2015</p>
<p><strong>Description</strong>: Definitions represent the end-points of
the Integration Layer in SSIS. As each end-point has slightly different
configuration, we need to be able to accommodate this. A definition
type represents an end-point and the interpreter will handle how to set
up each of these.</p>
<p><strong>Columns</strong>:</p>
<pre><code>Definition_Type_Idx:  The Primary Key
Definition_Type_Code: The Code of the Definition Type Picked up by the interpreter Currently, the options supported by the standard templates are:
    - FLAT_FILE   - Represents a Delimited file (Text, CSV etc)
    - TABLE       - Represents a Database Table.
Definition_Type_Idx: The human-readable name for the Definition_Type
</code></pre>
</div>