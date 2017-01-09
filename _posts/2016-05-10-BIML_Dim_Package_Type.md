
---
layout: post
title:  'BIML_Dim_Package_Type'
author: 'chillfire'
exerpt: >
  Certain types of tasks require different SSIS package structures. The package type represents a standard or customised package template within the BIML code interpreter. 

---

  <div id="pagecontent">
<p><strong>Schema</strong>: BIML</p>
<p><strong>Object</strong>: Dim<em>Package</em>Type</p>
<p><strong>Author</strong>: Brendan Roberts</p>
<p><strong>Created Date</strong>: 2015</p>
<p><strong>Description</strong> Certain types of tasks require different
SSIS package structures. The package type represents a standard or
customised package template within the BIML code interpreter.</p>
<p><strong>Columns</strong></p>
<pre><code>Package_Type_Code: The Code of the Package Type Picked up by the interpreter. Currently, the options supported by the standard templates are
  - FILE_TO_DB
  - DB_TO_FILE

Package_Type_Name: The human-readable name for the Package Type
</code></pre>
</div>