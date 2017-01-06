<h2>Introduction</h2>
<p>Business Intelligence Markup Language or <a href="https://en.wikipedia.org/wiki/Business_Intelligence_Markup_Language" rel="nofollow" class="external-link">BIML</a> for short, allows a developer to generate SQL Server Integration Service <a href="https://en.wikipedia.org/wiki/SQL_Server_Integration_Services" rel="nofollow" class="external-link">SSIS</a> Packages through the use of XML structured code.</p>
<p>From a programming perspective, the main advantage to using BIML is
that it allows the user to automatically generate multiple SSIS packages
from template code and to allow the regeneration of all SSIS packages
at will.</p>
<p>The process of creating basic SSIS packages has been set up in a
table-driven manner and can be found in the Standard Sales Planner
Application. This guide is intended as introduction to configuring BIML
within Sales Planner.</p>
<h2><a name="Integration-Basics"></a>Integration Basics</h2>
<p><img alt="" src="https://wiki.exceedra-sp.com:10111/Attachments/SP_Integration_Basics.png" /></p>
<p>The basic integration methodology supported at Exceedra is visualised
in the above image and can be divided in to the following layers:</p>
<ul>
    <li>
    <p><strong>Integration Layer</strong> - The goal of the Integration
    Layer is to provide interfacing between the external data inputs and the
    Exceedra Sales Planner system. To manage this, an ETL database will sit
    in the middle.</p>
    </li>
    <li>
    <p><strong>Transformation Layer</strong> - The transformation layer
    is concerned with readying the data for import into the Exceedra
    systems. This is usually accomplished through cleanse procedures within
    the ETL Database that apply the basic data integrity validations that
    are generally outlined within the interface specification documents.
    During the transformation process, Data is  moved from the HOLD table to
    a STAGE table. This is done through the use of Cleanse Procedures.</p>
    </li>
    <li>
    <p><strong>Load Layer</strong> - The third layer is the Data Load layer. This layer is most commonly handled within the Sales Planner database through <em>ETL_Load</em>
    procedures within the client schema. This layer is specifically
    concerned with getting the data from the staging tables to the correct
    core tables within Sales Planner.</p>
    </li>
</ul>
<h3><a name="Tying-It-Together"></a>Tying It Together</h3>
<p>Due to the niche expertise, complexity and time requirements for
creating, testing and deploying SSIS objects, Exceedra has opted for a
minimally involved SSIS approach involving the integration layer only.
With that in mind, SSIS packages are to be designed as a data transport
method only. All transformation and validation of data should occur in
secondary steps within the database.</p>
<p>This means that the concept of what should be in an SSIS package can
be standardised and a table based configuration approach then be
applied. The following parts are what constitutes an SSIS Package:</p>
<ul>
    <li><strong>Package</strong> - The Container that houses all SSIS
    components. Generally we would see one package for each section within
    an interface specification. An example of this would be a Package that
    moves Customer Master Data from provided Files to the Database.</li>
    <li><strong>Definition</strong> - The source and destination objects
    housed within a package. In general, these represent the physical files
    and database tables that form the source and destination end-points of
    the Integration layer.</li>
    <li><strong>Column</strong> - The data column is housed within a definition.</li>
</ul>
<h4><a name="BIML-Database-Reference"></a>BIML Database Reference</h4>
<p><a href="https://wiki.exceedra-sp.com:10111/wiki/1026" rel="nofollow" class="external-link">BIML.Dim_Package_Type</a> - Allows the BIML Interpreter to choose from a range of different SSIS package templates.</p>
<p><a href="https://wiki.exceedra-sp.com:10111/wiki/1027" rel="nofollow" class="external-link">BIML.Dim_Definition_Type</a>
- Allows the BIML interpreter to determine what sort of object the
Definition represents and to generate the correct code accordingly.</p>
<p><a href="https://wiki.exceedra-sp.com:10111/wiki/1028" rel="nofollow" class="external-link">BIML.Dim_Config_Item</a>
- Allows the interpreter to set configured options against a
definition. Examples of this include File locations and Database
connection strings</p>
<p><a href="https://wiki.exceedra-sp.com:10111/wiki/1029" rel="nofollow" class="external-link">BIML.Dim_Package</a> - Stores The base information required by the interpreter to set up an SSIS package</p>
<p><a href="https://wiki.exceedra-sp.com:10111/wiki/1030" rel="nofollow" class="external-link">BIML.Dim_Definition</a> - Stores the base information required by the interpreter to create an end-point within SSIS</p>
<p><a href="https://wiki.exceedra-sp.com:10111/wiki/1031" rel="nofollow" class="external-link">BIML.Dim_Definition_Columns</a> - Represents the columns that make up a definition object</p>
<p><a href="https://wiki.exceedra-sp.com:10111/wiki/1032" rel="nofollow" class="external-link">BIML.Fact_Package_Definitions</a> - Represents the link between an SSIS Package and the Definitions that it should contain</p>
<p><a href="https://wiki.exceedra-sp.com:10111/wiki/1033" rel="nofollow" class="external-link">BIML.Fact_Package_Definition_Mapping</a> - Maps the Source and Destination columns of definitions within a package.</p>
<h2><a name="Example-Package"></a>Example Package</h2>
<p>
<pre><code>DECLARE @ServerName VARCHAR(100)= 'your.server.exceedra-sp.com'
      , @Port       VARCHAR(100)= '10301'
      , @UserID     VARCHAR(100)= 'MyUserName'
      , @Password   VARCHAR(100)= 'MyPassword'
      , @ETLDB      VARCHAR(100)= 'MyETL_DB_DEV'

DECLARE @ConnectionString VARCHAR(500)= 'Data Source='+@ServerName+','+@Port+';User ID='+@UserID+';Initial Catalog='+@ETLDB+';Password='+@Password+';Provider=SQLNCLI11.1;Auto Translate=False;'

/*
  Clear The Existing Data
*/
DELETE FROM BIML.Fact_Package_Definition_Mapping
DELETE FROM BIML.Fact_Package_Definitions
DELETE FROM BIML.Dim_Definition_Columns
DELETE FROM BIML.Dim_Definition
DELETE FROM BIML.Dim_Package
DELETE FROM BIML.Dim_Config_Item

/*
  Add the Dim_Package_Types if they don't already exist
*/
IF NOT EXISTS (SELECT * FROM BIML.Dim_Package_Type)
BEGIN
  INSERT 
  INTO    BIML.Dim_Package_Type
          (Package_Type_Code, Package_Type_Name)
  VALUES  ('FILE_TO_DB'     , 'File to DB')
        , ('DB_TO_FILE'     , 'DB to File')
END
/*
  Save the Package Types to variables for later use
*/
DECLARE @Package_Type_Idx_For_File_To_DB  INT = (SELECT Package_Type_Idx FROM BIML.Dim_Package_Type WHERE Package_Type_Code = 'FILE_TO_DB')
      , @Package_Type_Idx_For_DB_To_File  INT = (SELECT Package_Type_Idx FROM BIML.Dim_Package_Type WHERE Package_Type_Code = 'DB_TO_FILE')

/*
  Add the Dim_Definition_Types if they don't already exist.
*/
IF NOT EXISTS (SELECT * FROM BIML.Dim_Definition_Type)
BEGIN
  INSERT
  INTO    BIML.Dim_Definition_Type
          (Definition_Type_Code , Definition_Type_Name)
  VALUES  ('FLAT_FILE'          , 'Flat File'         )
        , ('TABLE'              , 'Database Table'    )
END

/*
  Save the definition Types to variables for later use.
*/
DECLARE @Definition_Type_Idx_For_FLAT_FILE INT  = (
                                                    SELECT Definition_Type_Idx
                                                    FROM BIML.Dim_Definition_Type
                                                    WHERE Definition_Type_Code = 'FLAT_FILE'
                                                  )
      , @Definition_Type_Idx_For_TABLE     INT  = (
                                                    SELECT Definition_Type_Idx
                                                    FROM BIML.Dim_Definition_Type
                                                    WHERE Definition_Type_Code = 'TABLE'
                                                  )

/*
  Populate our Config Items
*/
IF NOT EXISTS (SELECT * FROM BIML.Dim_Config_Item)
BEGIN
  INSERT
  INTO    BIML.Dim_Config_Item(Config_Item_Code , Config_Item_Value    , Config_Item_Description)
  VALUES  ('DATA_FOLDER'      , '\\localhost\Exceedra\Data\'    , 'The Base Location that ETL Files are Picked Up From (One Level Up From /../In')
        , ('ETL_DB'         , @ConnectionString             , 'ETL DB Connection String'                                                     )

END

/*
  Let's Create a Package
*/
INSERT  BIML.DIm_Package
        (Package_Code , Package_Name        , Package_Type_Idx                  , Pre_Package_SQL_Text, Post_Package_SQL_Text, Pre_Load_SQL_Text                              , Post_Load_SQL_Text, Failure_Mode_SQL_Text, Success_Mode_SQL_Text)
VALUES  ('EX01'       , 'Product_Hierarchy' , @Package_Type_Idx_For_File_To_DB  , 'SELECT 1'          , 'SELECT 1'           , 'TRUNCATE TABLE ETL_IN.HOLD_Product_Hierarchy' , 'SELECT 1'        , 'SELECT 1'           ,  'SELECT 1'          )

/*
  And we'll need the Package_IDX later.
*/
DECLARE @Package_Idx_For_EX01 INT = (SELECT Package_Idx FROM BIML.Dim_Package WHERE Package_Code = 'EX01')

/*
  Now we need to add some end-points
*/
INSERT  BIML.Dim_Definition
        (Definition_Code          , Definition_Name           , Definition_Type_Idx                 , AdditionalDirectoryPath , FileSpecOrTableName             , RowDelimiter, ColumnNamesInFirstDataRow , IsUnicode, Config_Item_Code)
VALUES  ('Product_Hierarchy_File' , 'Product Hierarchy File'  , @Definition_Type_Idx_For_FLAT_FILE  , ''                      , 'Product_Hierarchy'             , 'LF'        , 'true'                    , 'false'  , 'DATA_FOLDER')
      , ('Product_Hierarchy_Table', 'Product Hierarchy Table' , @Definition_Type_Idx_For_TABLE      , ''                      , 'ETL_IN.HOLD_Product_Hierarchy' , ''          , 'false'                   , 'false'  , 'ETL_DB')

/*
  We'll need the Definition_Idx later.
*/
DECLARE @Def_Idx_Product_Hierarchy_File  INT = (SELECT Definition_Idx FROM BIML.Dim_Definition WHERE Definition_Code = 'Product_Hierarchy_File' )
      , @Def_Idx_Product_Hierarchy_Table INT = (SELECT Definition_Idx FROM BIML.Dim_Definition WHERE Definition_Code = 'Product_Hierarchy_Table')


/*
  Link the Package to the Definitions
*/
INSERT  BIML.Fact_Package_Definitions 
        (Package_Idx            , Source_Definition_Idx                       , Target_Definition_Idx                       )
VALUES  (@Package_Idx_For_EX01  , @Def_Idx_Product_Hierarchy_File  , @Def_Idx_Product_Hierarchy_Table )

/*
  Add some columns
*/
INSERT  BIML.Dim_Definition_Columns
        (Definition_Idx                   , Column_Num, Column_Code        , Column_Name               , Column_Type , Column_Length , Column_Delimiter, CodePage)
VALUES  (@Def_Idx_Product_Hierarchy_File  , 1  , 'Segment_c'               , 'Segment_c'               , 'AnsiString', 500           , 'Tab'           , '1252'  )
      , (@Def_Idx_Product_Hierarchy_File  , 2  , 'Brand_Family_c'          , 'Brand_Family_c'          , 'AnsiString', 500           , 'Tab'           , '1252'  )
      , (@Def_Idx_Product_Hierarchy_File  , 3  , 'Brand_c'                 , 'Brand_c'                 , 'AnsiString', 500           , 'Tab'           , '1252'  )
      , (@Def_Idx_Product_Hierarchy_File  , 4  , 'Container_Size_c'        , 'Container_Size_c'        , 'AnsiString', 500           , 'Tab'           , '1252'  )
      , (@Def_Idx_Product_Hierarchy_File  , 5  , 'Case_UPC_c'              , 'Case_UPC_c'              , 'AnsiString', 500           , 'Tab'           , '1252'  )
      , (@Def_Idx_Product_Hierarchy_File  , 6  , 'Name'                    , 'Name'                    , 'AnsiString', 500           , 'Tab'           , '1252'  )
      , (@Def_Idx_Product_Hierarchy_File  , 7  , 'AN_Item_Number_c'        , 'AN_Item_Number_c'        , 'AnsiString', 500           , 'Tab'           , '1252'  )
      , (@Def_Idx_Product_Hierarchy_File  , 8  , 'Form_c'                  , 'Form_c'                  , 'AnsiString', 500           , 'Tab'           , '1252'  )
      , (@Def_Idx_Product_Hierarchy_File  , 9  , 'Package_Size_c'          , 'Package_Size_c'          , 'AnsiString', 500           , 'Tab'           , '1252'  )
      , (@Def_Idx_Product_Hierarchy_File  , 10 , 'Unit_UPC_c'              , 'Unit_UPC_c'              , 'AnsiString', 500           , 'Tab'           , '1252'  )
      , (@Def_Idx_Product_Hierarchy_File  , 11 , 'Carton_UPC_c'            , 'Carton_UPC_c'            , 'AnsiString', 500           , 'Tab'           , '1252'  )
      , (@Def_Idx_Product_Hierarchy_File  , 12 , 'Units_Per_Carton_c'      , 'Units_Per_Carton_c'      , 'AnsiString', 500           , 'Tab'           , '1252'  )
      , (@Def_Idx_Product_Hierarchy_File  , 13 , 'Cartons_Per_Case_c'      , 'Cartons_Per_Case_c'      , 'AnsiString', 500           , 'Tab'           , '1252'  )
      , (@Def_Idx_Product_Hierarchy_File  , 14 , 'Units_Per_Case_c'        , 'Units_Per_Case_c'        , 'AnsiString', 500           , 'Tab'           , '1252'  )
      , (@Def_Idx_Product_Hierarchy_File  , 15 , 'Flavor_c'                , 'Flavor_c'                , 'AnsiString', 500           , 'Tab'           , '1252'  )
      , (@Def_Idx_Product_Hierarchy_File  , 16 , 'Truckload_Cost_c'        , 'Truckload_Cost_c'        , 'AnsiString', 500           , 'Tab'           , '1252'  )
      , (@Def_Idx_Product_Hierarchy_File  , 17 , 'First_Ship_Date_c'       , 'First_Ship_Date_c'       , 'AnsiString', 500           , 'Tab'           , '1252'  )
      , (@Def_Idx_Product_Hierarchy_File  , 18 , 'Discontinue_Date_c'      , 'Discontinue_Date_c'      , 'AnsiString', 500           , 'LF'            , '1252'  )

      , (@Def_Idx_Product_Hierarchy_Table , 1  , 'Segment_Desc'            , 'Segment_Desc'            , NULL        , NULL          , NULL            , NULL    )
      , (@Def_Idx_Product_Hierarchy_Table , 2  , 'Brand_Family_Desc'       , 'Brand_Family_Desc'       , NULL        , NULL          , NULL            , NULL    )
      , (@Def_Idx_Product_Hierarchy_Table , 3  , 'Brand_Desc'              , 'Brand_Desc'              , NULL        , NULL          , NULL            , NULL    )
      , (@Def_Idx_Product_Hierarchy_Table , 4  , 'Container_Size'          , 'Container_Size'          , NULL        , NULL          , NULL            , NULL    )
      , (@Def_Idx_Product_Hierarchy_Table , 5  , 'Case_UPC'                , 'Case_UPC'                , NULL        , NULL          , NULL            , NULL    )
      , (@Def_Idx_Product_Hierarchy_Table , 6  , 'Item_Name'               , 'Item_Name'               , NULL        , NULL          , NULL            , NULL    )
      , (@Def_Idx_Product_Hierarchy_Table , 7  , 'Item_Number'             , 'Item_Number'             , NULL        , NULL          , NULL            , NULL    )
      , (@Def_Idx_Product_Hierarchy_Table , 8  , 'Form'                    , 'Form'                    , NULL        , NULL          , NULL            , NULL    )
      , (@Def_Idx_Product_Hierarchy_Table , 9  , 'Pack_Size'               , 'Pack_Size'               , NULL        , NULL          , NULL            , NULL    )
      , (@Def_Idx_Product_Hierarchy_Table , 10 , 'Unit_UPC'                , 'Unit_UPC'                , NULL        , NULL          , NULL            , NULL    )
      , (@Def_Idx_Product_Hierarchy_Table , 11 , 'Carton_UPC'              , 'Carton_UPC'              , NULL        , NULL          , NULL            , NULL    )
      , (@Def_Idx_Product_Hierarchy_Table , 12 , 'Units_Per_Carton'        , 'Units_Per_Carton'        , NULL        , NULL          , NULL            , NULL    )
      , (@Def_Idx_Product_Hierarchy_Table , 13 , 'Cartons_Per_Case'        , 'Cartons_Per_Case'        , NULL        , NULL          , NULL            , NULL    )
      , (@Def_Idx_Product_Hierarchy_Table , 14 , 'Units_Per_Case'          , 'Units_Per_Case'          , NULL        , NULL          , NULL            , NULL    )
      , (@Def_Idx_Product_Hierarchy_Table , 15 , 'Scanning_Units_Per_Case' , 'Scanning_Units_Per_Case' , NULL        , NULL          , NULL            , NULL    )
      , (@Def_Idx_Product_Hierarchy_Table , 16 , 'Flavor'                  , 'Flavor'                  , NULL        , NULL          , NULL            , NULL    )
      , (@Def_Idx_Product_Hierarchy_Table , 17 , 'Truckload_Cost'          , 'Truckload_Cost'          , NULL        , NULL          , NULL            , NULL    )
      , (@Def_Idx_Product_Hierarchy_Table , 18 , 'Start_Date'              , 'Start_Date'              , NULL        , NULL          , NULL            , NULL    )
      , (@Def_Idx_Product_Hierarchy_Table , 19 , 'End_Date'                , 'End_Date'                , NULL        , NULL          , NULL            , NULL    )

/*
  Probably a better way to do this ;)
*/
DECLARE @Col_Idx_PHF_Segment_c          INT = (SELECT Column_Idx FROM BIML.Dim_Definition_Columns WHERE Column_Code = 'Segment_c'          AND Definition_Idx = @Def_Idx_Product_Hierarchy_File)
DECLARE @Col_Idx_PHF_Brand_Family_c     INT = (SELECT Column_Idx FROM BIML.Dim_Definition_Columns WHERE Column_Code = 'Brand_Family_c'     AND Definition_Idx = @Def_Idx_Product_Hierarchy_File)
DECLARE @Col_Idx_PHF_Brand_c            INT = (SELECT Column_Idx FROM BIML.Dim_Definition_Columns WHERE Column_Code = 'Brand_c'            AND Definition_Idx = @Def_Idx_Product_Hierarchy_File)
DECLARE @Col_Idx_PHF_Container_Size_c   INT = (SELECT Column_Idx FROM BIML.Dim_Definition_Columns WHERE Column_Code = 'Container_Size_c'   AND Definition_Idx = @Def_Idx_Product_Hierarchy_File)
DECLARE @Col_Idx_PHF_Case_UPC_c         INT = (SELECT Column_Idx FROM BIML.Dim_Definition_Columns WHERE Column_Code = 'Case_UPC_c'         AND Definition_Idx = @Def_Idx_Product_Hierarchy_File)
DECLARE @Col_Idx_PHF_Name               INT = (SELECT Column_Idx FROM BIML.Dim_Definition_Columns WHERE Column_Code = 'Name'               AND Definition_Idx = @Def_Idx_Product_Hierarchy_File)
DECLARE @Col_Idx_PHF_AN_Item_Number_c   INT = (SELECT Column_Idx FROM BIML.Dim_Definition_Columns WHERE Column_Code = 'AN_Item_Number_c'   AND Definition_Idx = @Def_Idx_Product_Hierarchy_File)
DECLARE @Col_Idx_PHF_Form_c             INT = (SELECT Column_Idx FROM BIML.Dim_Definition_Columns WHERE Column_Code = 'Form_c'             AND Definition_Idx = @Def_Idx_Product_Hierarchy_File)
DECLARE @Col_Idx_PHF_Package_Size_c     INT = (SELECT Column_Idx FROM BIML.Dim_Definition_Columns WHERE Column_Code = 'Package_Size_c'     AND Definition_Idx = @Def_Idx_Product_Hierarchy_File)
DECLARE @Col_Idx_PHF_Unit_UPC_c         INT = (SELECT Column_Idx FROM BIML.Dim_Definition_Columns WHERE Column_Code = 'Unit_UPC_c'         AND Definition_Idx = @Def_Idx_Product_Hierarchy_File)
DECLARE @Col_Idx_PHF_Carton_UPC_c       INT = (SELECT Column_Idx FROM BIML.Dim_Definition_Columns WHERE Column_Code = 'Carton_UPC_c'       AND Definition_Idx = @Def_Idx_Product_Hierarchy_File)
DECLARE @Col_Idx_PHF_Units_Per_Carton_c INT = (SELECT Column_Idx FROM BIML.Dim_Definition_Columns WHERE Column_Code = 'Units_Per_Carton_c' AND Definition_Idx = @Def_Idx_Product_Hierarchy_File)
DECLARE @Col_Idx_PHF_Cartons_Per_Case_c INT = (SELECT Column_Idx FROM BIML.Dim_Definition_Columns WHERE Column_Code = 'Cartons_Per_Case_c' AND Definition_Idx = @Def_Idx_Product_Hierarchy_File)
DECLARE @Col_Idx_PHF_Units_Per_Case_c   INT = (SELECT Column_Idx FROM BIML.Dim_Definition_Columns WHERE Column_Code = 'Units_Per_Case_c'   AND Definition_Idx = @Def_Idx_Product_Hierarchy_File)
DECLARE @Col_Idx_PHF_Flavor_c           INT = (SELECT Column_Idx FROM BIML.Dim_Definition_Columns WHERE Column_Code = 'Flavor_c'           AND Definition_Idx = @Def_Idx_Product_Hierarchy_File)
DECLARE @Col_Idx_PHF_Truckload_Cost_c   INT = (SELECT Column_Idx FROM BIML.Dim_Definition_Columns WHERE Column_Code = 'Truckload_Cost_c'   AND Definition_Idx = @Def_Idx_Product_Hierarchy_File)
DECLARE @Col_Idx_PHF_First_Ship_Date_c  INT = (SELECT Column_Idx FROM BIML.Dim_Definition_Columns WHERE Column_Code = 'First_Ship_Date_c'  AND Definition_Idx = @Def_Idx_Product_Hierarchy_File)
DECLARE @Col_Idx_PHF_Discontinue_Date_c INT = (SELECT Column_Idx FROM BIML.Dim_Definition_Columns WHERE Column_Code = 'Discontinue_Date_c' AND Definition_Idx = @Def_Idx_Product_Hierarchy_File)

DECLARE @Col_Idx_PHT_Segment_Desc       INT = (SELECT Column_Idx FROM BIML.Dim_Definition_Columns WHERE Column_Code = 'Segment_Desc'       AND Definition_Idx = @Def_Idx_Product_Hierarchy_Table)
DECLARE @Col_Idx_PHT_Brand_Family_Desc  INT = (SELECT Column_Idx FROM BIML.Dim_Definition_Columns WHERE Column_Code = 'Brand_Family_Desc'  AND Definition_Idx = @Def_Idx_Product_Hierarchy_Table)
DECLARE @Col_Idx_PHT_Brand_Desc         INT = (SELECT Column_Idx FROM BIML.Dim_Definition_Columns WHERE Column_Code = 'Brand_Desc'         AND Definition_Idx = @Def_Idx_Product_Hierarchy_Table)
DECLARE @Col_Idx_PHT_Container_Size     INT = (SELECT Column_Idx FROM BIML.Dim_Definition_Columns WHERE Column_Code = 'Container_Size'     AND Definition_Idx = @Def_Idx_Product_Hierarchy_Table)
DECLARE @Col_Idx_PHT_Case_UPC           INT = (SELECT Column_Idx FROM BIML.Dim_Definition_Columns WHERE Column_Code = 'Case_UPC'           AND Definition_Idx = @Def_Idx_Product_Hierarchy_Table)
DECLARE @Col_Idx_PHT_Item_Name          INT = (SELECT Column_Idx FROM BIML.Dim_Definition_Columns WHERE Column_Code = 'Item_Name'          AND Definition_Idx = @Def_Idx_Product_Hierarchy_Table)
DECLARE @Col_Idx_PHT_Item_Number        INT = (SELECT Column_Idx FROM BIML.Dim_Definition_Columns WHERE Column_Code = 'Item_Number'        AND Definition_Idx = @Def_Idx_Product_Hierarchy_Table)
DECLARE @Col_Idx_PHT_Form               INT = (SELECT Column_Idx FROM BIML.Dim_Definition_Columns WHERE Column_Code = 'Form'               AND Definition_Idx = @Def_Idx_Product_Hierarchy_Table)
DECLARE @Col_Idx_PHT_Pack_Size          INT = (SELECT Column_Idx FROM BIML.Dim_Definition_Columns WHERE Column_Code = 'Pack_Size'          AND Definition_Idx = @Def_Idx_Product_Hierarchy_Table)
DECLARE @Col_Idx_PHT_Unit_UPC           INT = (SELECT Column_Idx FROM BIML.Dim_Definition_Columns WHERE Column_Code = 'Unit_UPC'           AND Definition_Idx = @Def_Idx_Product_Hierarchy_Table)
DECLARE @Col_Idx_PHT_Carton_UPC         INT = (SELECT Column_Idx FROM BIML.Dim_Definition_Columns WHERE Column_Code = 'Carton_UPC'         AND Definition_Idx = @Def_Idx_Product_Hierarchy_Table)
DECLARE @Col_Idx_PHT_Units_Per_Carton   INT = (SELECT Column_Idx FROM BIML.Dim_Definition_Columns WHERE Column_Code = 'Units_Per_Carton'   AND Definition_Idx = @Def_Idx_Product_Hierarchy_Table)
DECLARE @Col_Idx_PHT_Cartons_Per_Case   INT = (SELECT Column_Idx FROM BIML.Dim_Definition_Columns WHERE Column_Code = 'Cartons_Per_Case'   AND Definition_Idx = @Def_Idx_Product_Hierarchy_Table)
DECLARE @Col_Idx_PHT_Units_Per_Case     INT = (SELECT Column_Idx FROM BIML.Dim_Definition_Columns WHERE Column_Code = 'Units_Per_Case'     AND Definition_Idx = @Def_Idx_Product_Hierarchy_Table)
DECLARE @Col_Idx_PHT_Flavor             INT = (SELECT Column_Idx FROM BIML.Dim_Definition_Columns WHERE Column_Code = 'Flavor'             AND Definition_Idx = @Def_Idx_Product_Hierarchy_Table)
DECLARE @Col_Idx_PHT_Truckload_Cost     INT = (SELECT Column_Idx FROM BIML.Dim_Definition_Columns WHERE Column_Code = 'Truckload_Cost'     AND Definition_Idx = @Def_Idx_Product_Hierarchy_Table)
DECLARE @Col_Idx_PHT_Start_Date         INT = (SELECT Column_Idx FROM BIML.Dim_Definition_Columns WHERE Column_Code = 'Start_Date'         AND Definition_Idx = @Def_Idx_Product_Hierarchy_Table)
DECLARE @Col_Idx_PHT_End_Date           INT = (SELECT Column_Idx FROM BIML.Dim_Definition_Columns WHERE Column_Code = 'End_Date'           AND Definition_Idx = @Def_Idx_Product_Hierarchy_Table)

/*
  Link the Source/Dest columns together!
*/
INSERT  BIML.Fact_Package_Definition_Mapping  
        (Package_Idx, Source_Definition_Idx, Source_Column_Idx, Target_Definition_Idx, Target_Column_Idx)
VALUES  (@Package_Idx_For_EX01  ,@Def_Idx_Product_Hierarchy_File ,  @Col_Idx_PHF_Segment_c             ,@Def_Idx_Product_Hierarchy_Table , @Col_Idx_PHT_Segment_Desc     )
      , (@Package_Idx_For_EX01  ,@Def_Idx_Product_Hierarchy_File ,  @Col_Idx_PHF_Brand_Family_c        ,@Def_Idx_Product_Hierarchy_Table , @Col_Idx_PHT_Brand_Family_Desc)
      , (@Package_Idx_For_EX01  ,@Def_Idx_Product_Hierarchy_File ,  @Col_Idx_PHF_Brand_c               ,@Def_Idx_Product_Hierarchy_Table , @Col_Idx_PHT_Brand_Desc       )
      , (@Package_Idx_For_EX01  ,@Def_Idx_Product_Hierarchy_File ,  @Col_Idx_PHF_Container_Size_c      ,@Def_Idx_Product_Hierarchy_Table , @Col_Idx_PHT_Container_Size   )
      , (@Package_Idx_For_EX01  ,@Def_Idx_Product_Hierarchy_File ,  @Col_Idx_PHF_Case_UPC_c            ,@Def_Idx_Product_Hierarchy_Table , @Col_Idx_PHT_Case_UPC         )
      , (@Package_Idx_For_EX01  ,@Def_Idx_Product_Hierarchy_File ,  @Col_Idx_PHF_Name                  ,@Def_Idx_Product_Hierarchy_Table , @Col_Idx_PHT_Item_Name        )
      , (@Package_Idx_For_EX01  ,@Def_Idx_Product_Hierarchy_File ,  @Col_Idx_PHF_AN_Item_Number_c      ,@Def_Idx_Product_Hierarchy_Table , @Col_Idx_PHT_Item_Number      )
      , (@Package_Idx_For_EX01  ,@Def_Idx_Product_Hierarchy_File ,  @Col_Idx_PHF_Form_c                ,@Def_Idx_Product_Hierarchy_Table , @Col_Idx_PHT_Form             )
      , (@Package_Idx_For_EX01  ,@Def_Idx_Product_Hierarchy_File ,  @Col_Idx_PHF_Package_Size_c        ,@Def_Idx_Product_Hierarchy_Table , @Col_Idx_PHT_Pack_Size        )
      , (@Package_Idx_For_EX01  ,@Def_Idx_Product_Hierarchy_File ,  @Col_Idx_PHF_Unit_UPC_c            ,@Def_Idx_Product_Hierarchy_Table , @Col_Idx_PHT_Unit_UPC         )
      , (@Package_Idx_For_EX01  ,@Def_Idx_Product_Hierarchy_File ,  @Col_Idx_PHF_Carton_UPC_c          ,@Def_Idx_Product_Hierarchy_Table , @Col_Idx_PHT_Carton_UPC       )
      , (@Package_Idx_For_EX01  ,@Def_Idx_Product_Hierarchy_File ,  @Col_Idx_PHF_Units_Per_Carton_c    ,@Def_Idx_Product_Hierarchy_Table , @Col_Idx_PHT_Units_Per_Carton )
      , (@Package_Idx_For_EX01  ,@Def_Idx_Product_Hierarchy_File ,  @Col_Idx_PHF_Cartons_Per_Case_c    ,@Def_Idx_Product_Hierarchy_Table , @Col_Idx_PHT_Cartons_Per_Case )
      , (@Package_Idx_For_EX01  ,@Def_Idx_Product_Hierarchy_File ,  @Col_Idx_PHF_Units_Per_Case_c      ,@Def_Idx_Product_Hierarchy_Table , @Col_Idx_PHT_Units_Per_Case   )
      , (@Package_Idx_For_EX01  ,@Def_Idx_Product_Hierarchy_File ,  @Col_Idx_PHF_Flavor_c              ,@Def_Idx_Product_Hierarchy_Table , @Col_Idx_PHT_Flavor           )
      , (@Package_Idx_For_EX01  ,@Def_Idx_Product_Hierarchy_File ,  @Col_Idx_PHF_Truckload_Cost_c      ,@Def_Idx_Product_Hierarchy_Table , @Col_Idx_PHT_Truckload_Cost   )
      , (@Package_Idx_For_EX01  ,@Def_Idx_Product_Hierarchy_File ,  @Col_Idx_PHF_First_Ship_Date_c     ,@Def_Idx_Product_Hierarchy_Table , @Col_Idx_PHT_Start_Date       )
      , (@Package_Idx_For_EX01  ,@Def_Idx_Product_Hierarchy_File ,  @Col_Idx_PHF_Discontinue_Date_c    ,@Def_Idx_Product_Hierarchy_Table , @Col_Idx_PHT_End_Date         )

/*
  Run this. Copy the XML in to your SSIS project.
*/
EXEC BIML.Generate_BIML
</code></pre>
</p>