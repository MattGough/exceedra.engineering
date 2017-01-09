
---
layout: post
title:  'BIML_Dim_Config_Item'
author: 'chillfire'
exerpt: >
  Certain global configuration items are tied to different BIML objects within the interpreter. DimConfigItem is where they are stored. 

---

  <div id="pagecontent">
<p><strong>Schema</strong>          : BIML</p>
<p><strong>Object</strong>          : Dim_Config_Item</p>
<p><strong>Author</strong>          : Brendan Roberts</p>
<p><strong>Created Date</strong>    : 2015</p>
<p><strong>Description</strong>     : Certain global configuration items are tied to different BIML objects within the interpreter. Dim<em>Config</em>Item is where they are stored.</p>
<p><strong>Columns</strong>         :</p>
<pre><code>Config_Item_Idx        : The Primary Key
Config_Item_Code       : The Machine Readable Configuration Option. 
  Some configuration options require linking with the Dim_Definitions Table. These are:
    - DATA_FOLDER - The Base Location that ETL Files are Picked Up From this configuration option is mandatory.
                      e.g: \\localhost\Exceedra\Data\
    - ETL_DB      - The ETL Database Connection string.
                      e.g: Data Source=yourdatabase.exceedra-sp.com,yourport;User ID=YourUserID;Initial Catalog=YourDatabase;Password=YourPassword;Provider=SQLNCLI11.1;Auto Translate=False;

Config_Item_Value      : The configuration value. Please see examples as listed above.
Config_Item_Description: A human-readable description of the value.
</code></pre>
</div>