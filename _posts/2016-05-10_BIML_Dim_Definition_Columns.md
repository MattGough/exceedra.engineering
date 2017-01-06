<div id="pagecontent">
<p><strong>Schema</strong>          : BIML</p>
<p><strong>Object</strong>          : Dim_Definition_Columns</p>
<p><strong>Author</strong>          : Brendan Roberts</p>
<p><strong>Created Date</strong>    : 2015</p>
<p><strong>Description</strong>     : A column is encased within a definition. This table is where you specify each of the columns in your deifnition.</p>
<p><strong>Columns</strong>         :</p>
<pre><code>Column_Idx       : The Primary Key
Definition_Idx   : The definition that this column belongs to
Column_Num       : The order of the column (increment from 1)
Column_Code      : The short-hand representation of the column
Column_Name      : The human-readable representation of the column
Column_Type      :
  When IsUnicode = true use "String"
  When IsUNicode = false use "AnsiString"
Column_Length    : The number of characters expected. Generally setting this to something high (500), is a good option. If your incoming data is longer than this length, your package will fail with a truncation error.
Column_Delimiter : The character that separates your columns. "Tab" and "Comma" are common options. Note: You must set the final column in your data to either "LF" or "CRLF" where required or you'll get errors.
CodePage         : 
  When IsUnicode = false and using AnsiString use "1252"
  When IsUnicode = true and using String, Use "" (TBD)
</code></pre>
</div>