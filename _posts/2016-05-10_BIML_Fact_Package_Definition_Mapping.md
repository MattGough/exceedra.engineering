<div id="pagecontent">
<p><strong>Schema</strong>          : BIML</p>
<p><strong>Object</strong>          : Fact_Package_Definition_Mapping</p>
<p><strong>Author</strong>          : Brendan Roberts</p>
<p><strong>Created Date</strong>    : 2015</p>
<p><strong>Description</strong>     : Represents the column Mappings required between source/target definitions within a package</p>
<p><strong>Columns</strong>         :</p>
<pre><code>Package_Idx           : Foreign Key reference to BIML.Dim_Package
Source_Definition_Idx : Foreign Key reference to BIML.Dim_Definitions; This represents the Source End-Point in the Integration Layer.
Source_Column_Idx     : Foreign Key reference to BIML.Dim_Definition_Columns: This represents a source column within the source definition.
Target_Definition_Idx : Foreign Key reference to BIML.Dim_Definitions; This represents the Target End-Point in the Intergration Layer.
Target_Column_Idx     : Foreign Key reference to BIML.Dim_Definition_Columns: This represents a target columnw ithin the target definition.
</code></pre>
</div>