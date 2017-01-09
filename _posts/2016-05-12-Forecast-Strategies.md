
---
layout: post
title:  'Forecast-Strategies'
author: 'cristina.mousika@exceedra.com'
exerpt: >
  Used to create forecast templates 

---

  <h1 style="font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; color: #333333;"><span style="line-height: 1.42857;">Forecast Strategies</span></h1>
<p><span style="line-height: 1.42857;">The Forecast Strategies screen allows the user to create a template that can be used to generate forecast volumes and seasonal profiles... TODO</span></p>
<h2><span style="line-height: 1.42857;"></span><span style="font-size: 30px; line-height: 1.1; color: #000000;" face="inherit">List Screen</span></h2>
<p>TODO: Summary of what is shown here&nbsp;</p>
<h3 style="font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; color: #333333;">User Training</h3>
<p>TODO: how to use</p>
<h3 style="font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; color: #333333;">Application</h3>
<p>TODO:any relevant application code / comments</p>
<h3 style="font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; color: #333333;">Database</h3>
<h4 style="font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; color: #333333;">Brief Description</h4>
<p>This screen follows the format used elsewhere application, and thus most stored procedures called here are SHARED ones.</p>
<p>The vertical grid, however, will only work if data is inserted into its underlying tables for a given screen.</p>
<p>The publish and copy procedures are executed asynchronously.</p>
<p>&nbsp;</p>
<h4 style="font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; color: #333333;">Key Tables / SPs to Review</h4>
<ul>
    <li>Dim_GridFilters</li>
    <li>Fact_Screen_GridFilters</li>
    <li>Procast_SP_SHARED_GetFilterCustomers</li>
    <li>Procast_SP_SHARED_GetFilterProducts</li>
    <li>Procast_SP_SHARED_GetFiltersGrid</li>
    <li>Procast_SP_SHARED_GetFiltersGrid_PopulateDropdowns</li>
    <li>Procast_SP_FCMGMT_GetForecasts</li>
    <li>Procast_SP_SHARED_SaveDefaults</li>
    <li>Procast_SP_FCMGMT_CopyForecast</li>
    <li>Procast_SP_FCMGMT_DeleteForecast</li>
    <li>Procast_SP_FCMGMT_GetScenarios</li>
    <li>Procast_SP_FCMGMT_PublishForecast</li>
    <li>Procast_SP_SHARED_Helper_PublishForecast</li>
</ul>
<h2><span style="font-size: 30px; line-height: 1.1; color: #000000;" face="inherit">Editor Screen</span></h2>
<p>Summary of what is shown here&nbsp;</p>
<h3 style="font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; color: #333333;">User Training</h3>
<p>TODO: how to use</p>
<h3 style="font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; color: #333333;">Application</h3>
<p>TODO:any relevant application code / comments</p>
<h3 style="font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; color: #333333;">Database</h3>
<h4 style="font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; color: #333333;">Brief Description</h4>
<p>Here, we save Header data, Customers, Products, Data Feed, and user permissions.</p>
<p>The customers and products saved here, will determine the set of available customer and products that can be used in the Forecasting and Seasonal Profile screens.</p>
<p>&nbsp;<span style="line-height: 1.42857;">&nbsp;</span></p>
<h4 style="font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; color: #333333;">Key Tables / SPs to Review</h4>
<ul>
    <li>Dim_Demand_Forecast</li>
    <li>Fact_Audit_Demand_Forecast</li>
    <li>Fact_Demand_Forecast_Customers</li>
    <li>Fact_Audit_Demand_Forecast_Customers</li>
    <li>Fact_Demand_Forecast_Products</li>
    <li>Fact_Audit_Demand_Forecast_Products</li>
    <li>Fact_Demand_Forecast_DataFeed</li>
    <li>Fact_User_Demand_Forecast</li>
    <li>Procast_SP_FCMGMT_GetDesignGrid</li>
    <li>Procast_SP_FCMGMT_GetDesignGrid_PopulateDropdowns</li>
    <li>Procast_SP_FCMGMT_GetCustSku</li>
    <li>Procast_SP_FCMGMT_SaveForecast</li>
    <li>Procast_SP_FCMGMT_GetHistory</li>
    <li>Procast_SP_FCMGMT_GetComments</li>
    <li>Procast_SP_FCMGMT_AddComment</li>
    <li>Procast_SP_FCMGMT_GetUsers</li>
    <li>fn_Procast_SP_GetNextUserEventID</li>
</ul>