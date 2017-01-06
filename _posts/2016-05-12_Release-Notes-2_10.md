<h1>Release Notes 2.10</h1>
<h2>1. Shared Filters</h2>
<h3><span style="line-height: 1.1; font-family: inherit; font-size: 24px; color: #000000;">Design Intent</span></h3>
Refactoring code to avoid having multiple procedures and tables that ultimately accomplish the same thing
<h3>Brief Technical Description</h3>
<p>a) Every screen that has a listings control calls procedures Procast_SP_SHARED_GetFilterCustomers and Procast_SP_SHARED_GetFilterProducts<br />
b) Newer screens also use shared procedures to populate their "statuses" trees and vertical grid filters using Procast_SP_SHARED_GetFilterStatusesAndTypes and Procast_SP_SHARED_GetFiltersGrid respectively<br />
c) All screens call Procast_SP_SHARED_SaveDefaults, with older screens having calls within it that call their original save procedures. Please note that customer and product defaults for every screen are saved to the same tables.<br />
<br />
Note: customer and product defaults are saved not only per screen, but also per Listing Group. Please see below for more information.</p>
<p><span style="line-height: 1.1; font-family: inherit; font-size: 24px; color: inherit;"></span></p>
<h3><span style="line-height: 1.1; font-family: inherit; font-size: 24px; color: #000000;">Key Tables / SPs To Review</span></h3>
<p><span class="Apple-tab-span" style="white-space: pre;">	</span><br />
Fact_UserPref_Screen_Customers<br />
Fact_UserPref_Screen_Products<br />
Fact_UserPref_Screen_StatusesAndTypes<br />
Fact_UserPref_Screen_GridFilters_Single<br />
Fact_UserPref_Screen_GridFilters_Multi<span class="Apple-tab-span" style="white-space: pre;">	</span><br />
<span class="Apple-tab-span" style="white-space: pre;">	</span><br />
Procast_SP_SHARED_GetFilterCustomers<br />
Procast_SP_SHARED_GetFilterProducts<br />
Procast_SP_SHARED_GetFilterStatusesAndTypes<br />
Procast_SP_SHARED_GetFiltersGrid<br />
Procast_SP_SHARED_SaveDefaults<span class="Apple-tab-span" style="white-space: pre;">		</span></p>
<h2>2. Listings Groups</h2>
<p><span class="Apple-tab-span" style="white-space: pre; line-height: 26.4px; font-size: 24px;">Design Intent</span></p>
<p>To allow users to only show a subset of their listings in different screens to improve app performance.<br />
<span style="line-height: 1.1; font-size: 24px;"></span></p>
<p><span style="line-height: 1.1; font-size: 24px;">Brief Technical Description</span></p>
- Listings groups can be created in the Settings screen and selected in different screens
- Each screen can have a different listing group saved as a default<br />
<p>&nbsp;<span style="line-height: 1.42857;">&nbsp;</span></p>
<p><span style="line-height: 1.1; font-family: inherit; font-size: 24px; color: inherit;"></span></p>
<h3><span style="line-height: 1.1; font-family: inherit; font-size: 24px; color: #000000;">Key Tables / SPs To Review</span></h3>
Dim_ListingsGroups<br />
Fact_Audit_ListingsGroups<br />
Fact_ListingsGroup_Customers<br />
Fact_Audit_ListingsGroup_Customers<br />
Fact_ListingsGroup_Products<br />
Fact_Audit_ListingsGroup_Products<br />
Fact_User_ListingsGroup<br />
Fact_Audit_User_ListingsGroup<br />
Fact_UserPref_Screen_ListingsGroup<br />
Fact_UserPref_Screen_Customers<br />
Fact_UserPref_Screen_Products<span class="Apple-tab-span" style="white-space: pre;">	</span><br />
<span class="Apple-tab-span" style="white-space: pre;">	</span><br />
Dim_Admin_MenuItems<br />
Procast_SP_ADMIN_ApplySelectionGetList<br />
Procast_SP_ADMIN_SaveListMatches<span class="Apple-tab-span" style="white-space: pre;">	</span><br />
fn_Procast_SP_GetNextUserEventID<br />
Procast_SP_SETTINGS_SaveListingsGroup<br />
Procast_SP_SHARED_GetListingsGroup<br />
Procast_SP_SHARED_GetListingsGroupsDropdown<br />
Procast_SP_SETTINGS_DeleteListingsGroup<br />
Procast_SP_SHARED_SaveDefaults<br />
Procast_SP_SHARED_Helper_LoadDefaultSelections<br />
<span class="Apple-tab-span" style="white-space: pre;">	</span><br />
<h2>3. Demand Plannner</h2>
<a href="https://wiki.exceedra-sp.com:10111/my/readarticle.aspx?articleid=E4680F01-2B8D-4B24-A588-0421F677A905&amp;artsection=2" target="_blank" id="link_1463046683903">Demand Planner</a><br />
<h2>4. Planning Screen</h2>
<a href="https://wiki.exceedra-sp.com:10111/my/readarticle.aspx?articleid=2EA685D0-CB51-48E7-9020-837B2A8F824F&amp;artsection=2" target="_blank" id="link_1463046710551">Planning Screen</a><br />
<h2>5. Listings Management Screen</h2>
<br />
TODO:DY<br />
<h2>6. Currency Table Changes</h2>
<p><span class="Apple-tab-span" style="white-space: pre; line-height: 26.4px; font-size: 24px;">Design Intent</span></p>
<p>Reducing data duplication between Dim_Currency_Exchange_Options and Fact_Currency_Exchange_Rate and allowing the user to change their values.<br />
<span class="Apple-tab-span" style="white-space: pre;"></span></p>
<h3><span style="line-height: 1.1; font-family: inherit; font-size: 24px; color: #000000;">Key Tables / SPs To Review</span></h3>
Dim_Currency_Exchange_Options<br />
Fact_Currency_Exchange_Rate<br />
vw_Fact_Currency_Exchange_Options<br />
Procast_SP_ADMIN_GetGrid<br />
Procast_SP_ADMIN_GetList<br />
Procast_SP_ADMIN_SaveGrid
<h2>7. Load from Defaults Refactoring</h2>
<p><span class="Apple-tab-span" style="white-space: pre; line-height: 26.4px; font-size: 24px;">Design Intent</span><br />
<span class="Apple-tab-span" style="white-space: pre;"></span></p>
<p><span class="Apple-tab-span" style="white-space: pre;">&nbsp;</span><span style="line-height: 1.42857;">In 2.9 get procedures were changed to use saved user defaults if provided with a flag from the application instead of waiting for filter selections to be passed, but a lot of the code was repeated throughout the different procedures.</span></p>
<p>In 2.10 some of this code has been refactored to reduce duplication, and therefore reducing the points of failure.<br />
<span class="Apple-tab-span" style="white-space: pre;">	</span><br />
Note that not all of the code has been refactored and there is still room for improvement.</p>
<h3><span style="line-height: 1.1; font-family: inherit; font-size: 24px; color: #000000;">Key Tables / SPs To Review</span></h3>
<p>Procast_SP_SHARED_Helper_LoadDefaultSelections<br />
Procast_SP_CLAIM_GetClaims<br />
Procast_SP_CLAIM_GetEvents<br />
Procast_SP_COND_GetConditions<br />
Procast_SP_FUND_GetFundList<br />
Procast_SP_FUND_GetParentFundsList<br />
Procast_SP_PROMO_GetPromotion_Graph<br />
Procast_SP_ROB_GetContracts<br />
Procast_SP_ROB_GetROBs<br />
Procast_SP_ROB_GetSKUs<br />
Procast_SP_SCEN_GetScenarios<br />
Procast_SP_TEMPLATE_GetTemplates</p>
<h2>8. Application Shows List of Procedures Called</h2>
<p><span class="Apple-tab-span" style="white-space: pre; line-height: 26.4px; font-size: 24px;">Design Intent</span></p>
<p>To allow devs to troubleshoot the application more easily.&nbsp;<br />
<span style="line-height: 1.1; font-size: 24px;"></span></p>
<p><span style="line-height: 1.1; font-size: 24px;">Brief Technical Description</span></p>
<p>The database returns the list of existing procedures and a flag specifying if a client version exists. The application then displays all the procedures from that list that are called by it and shows and procedures it calls that do not exist in the database.<br />
For this screen to be shown, the following app.SYS_Config entry has to be set to 1:&nbsp;ActiveFeatures<span class="Apple-tab-span" style="white-space: pre;">	</span>IsSettingsAppDetailsVisible<br />
<span class="Apple-tab-span" style="white-space: pre;">	</span><br />
<span class="Apple-tab-span" style="white-space: pre; line-height: 26.4px; font-size: 24px;">Key Tables / SPs To Review</span></p>
<p>SYS_Config<br />
Procast_SP_APPINFO_GetProcedures</p>
<h2>9. Bug Fixes and Miscellaneous Changes</h2>
Procast_SP_CANVAS_Element_P05_DataTable<br />
Procast_SP_CLAIM_ClaimEditor_SaveClaim<br />
Procast_SP_CLAIM_ClaimEditor_ValidateClaim<br />
Procast_SP_CLAIM_SaveManualEntryGrid<br />
Procast_SP_COND_GetConditionScenarios<br />
Procast_SP_COND_GetConditionStatuses<br />
Procast_SP_FUND_GetWorkflowStatuses<br />
Procast_SP_LOGIN_ForgottenPassword_SavePassword<br />
Procast_SP_NPD_GetNPDList<br />
Procast_SP_NPD_GetNPDUsers<br />
Procast_SP_PROMO_Wizard_GetPromotion<br />
Procast_SP_PROMO_Wizard_Volumes_GetProductVolumes<br />
Procast_SP_ROB_GetContractTerms<br />
Procast_SP_ROB_SaveRob<br />
Procast_SP_SaveUserPrefs_Planning<br />
Procast_SP_Settings_ChangePassword<br />
Procast_SP_Settings_GetScreenList<br />
Procast_SP_Settings_GetScreenList<br />
Procast_SP_SHARED_GetFilterCustomers<br />
Procast_SP_SHARED_GetFilterProducts