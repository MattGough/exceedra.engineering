
---
layout: post
title:  'BIML_Dim_Definition'
author: 'chillfire'
exerpt: >
  A definition represents an end-point in the integration layer. Each row in Dim_Definitions represents a different SSIS end-point 

---

  <div id="pagecontent">
<p><strong>Schema</strong>          : BIML</p>
<p><strong>Object</strong>          : Dim_Definition</p>
<p><strong>Author</strong>          : Brendan Roberts</p>
<p><strong>Created Date</strong>    : 2015</p>
<p><strong>Description</strong>     : A definition represents an
end-point in the integration layer. Each row in Dim_Definitions
represents a different SSIS end-point</p>
<p><strong>Columns</strong>         :</p>
<pre><code>Definition_Idx           : The Primary Key
Definition_Code          : Short-hand code representation of the Definition
Definition_Name          : The Definition's name
Definition_Type_Idx      : Foreign Key reference to Dim_Definition_Types
AdditionalDirectoryPath  : Allows extra directory configuration above the DATA_FOLDER configuration option. An example of when this would be useful is if you have different directories for each file type.
FileSpecOrTableName      : 
  When used with a FLAT_FILE definition type, this option specifies the part of the name that we should search for in the directory. There's no need to include a * Wildcard.
  When used with a TABLE definition type, this is the table name. You must set the schema name as wlel.
RowDelimiter             :
  When used with a FLAT_FILE definition type, this allows you to set what delimiter represents the end of a line. It's most likely to be a Line Feed (LF), or a Carriage-Return Line Feed(CRLF). User discretion will be required to determine the correct option.
    As a hint; you can determine this by using NotePad++, selecting the View-&gt; Show Symbol -&gt; Show End of Line characters. It will then display if it's a LF or a CRLF.
  Set this to an empty string for TABLE definition types
ColumnNamesInFirstDataRow: 
  When a FLAT_FILE definition type has the column names in the first row, set this to "true", otherwise set to "false". NOTE: Case is Important!
  Set this to an empty string for TABLE definition types
IsUnicode                :
  When you have need of special character-sets, or if you're using NVARCHAR fields, you'll need to use the IsUnicode option by setting this to true, otherwise leave it as false. NOTE: Case is Important!
  Set this to an empty string for TABLE definition types
Config_Item_Code         :
  For FLAT_FILE definition types, set this to DATA_FOLDER
  For TABLE definition types, set this to ETL_DB
</code></pre>
</div>