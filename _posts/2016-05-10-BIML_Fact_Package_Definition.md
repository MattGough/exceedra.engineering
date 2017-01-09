
---
layout: post
title:  'BIML_Fact_Package_Definition'
author: 'chillfire'
exerpt: >
  As definitions may be re-usable, you can link different definitions to different packages in this table. 

---

  <div id="pagecontent">
<p><strong>Schema</strong>          : BIML</p>
<p><strong>Object</strong>          : Dim<em>Definition</em>Columns</p>
<p><strong>Author</strong>          : Brendan Roberts</p>
<p><strong>Created Date</strong>    : 2015</p>
<p><strong>Description</strong>     : As definitions may be re-usable, you can link different definitions to different packages in this table.</p>
<p><strong>Columns</strong>         :</p>
<pre><code>Package_Idx           : Foreign Key reference to BIML.Dim_Package
Source_Definition_Idx : Foreign Key reference to BIML.Dim_Definitions; This represents the Source End-Point in the Integration Layer.
Target_Definition_Idx : Foreign Key reference to BIML.Dim_Definitions; This represents the Target End-Point in the Intergration Layer.
</code></pre>
</div>