<h1 style="font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; color: #333333;"><span style="line-height: 1.42857;">Forecasting</span></h1>
<p><span style="line-height: 1.42857;">The Forecasting screen lets the user view and edit forecast volumes ..TODO</span></p>
<h2><span style="line-height: 1.42857;"></span><span style="line-height: 1.1; font-size: 24px;">User Training</span></h2>
<p>TODO: how to use</p>
<h3 style="font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; color: #333333;">Application</h3>
<p>TODO:any relevant application code / comments</p>
<h3 style="font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; color: #333333;">Database</h3>
<h4 style="font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; color: #333333;">Brief Description</h4>
<h5 style="font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; color: #333333;"><strong>Filters</strong></h5>
<p>The filter section of this screen follows the format used elsewhere application, and thus most stored procedures called here are SHARED ones.</p>
<p>The vertical grid, however, will only work if data is inserted into its underlying tables for a given screen. Additionally, the SHARED customer and product filter procedures are not called. Instead, the application calls&nbsp;Procast_SP_DEMAND_GetCustSku because listings need to be filtered by selections in the vertical grid. This procedure returns all available customers and products for a selected trial forecast, i.e., from&nbsp;Fact_Demand_Forecast_Customers and&nbsp;Fact_Demand_Forecast_Products.</p>
<ul>
    <li>Dim_GridFilters</li>
    <li>Fact_Screen_GridFilters</li>
    <li>Procast_SP_DEMAND_GetCustSku</li>
    <li>Procast_SP_SHARED_GetFiltersGrid</li>
    <li>Procast_SP_SHARED_GetFiltersGrid_PopulateDropdowns</li>
    <li>Procast_SP_SHARED_SaveDefaults</li>
</ul>
<h5><span style="line-height: 1.42857;"><strong>Loading and Saving Forecasts</strong></span></h5>
<p>Forecast, baseline and actual values are populated by&nbsp;Procast_SP_DEMAND_GetVolumesTreeGrid, which in turn calls a shared procedure that gathers the relevant data. Note that the database returns Actuals and Forecast data as different rows in the XML, however, the app combines them into one line in the grid to reduce rendering time. Additionally, when saving the app sends the forecast with row code "NEW_FORECAST", otherwise values would not get saved.</p>
<p>The application also loads Model and Seasonal data whenever a product (at any hierarchy) is selected in the grid, and a procedure to return seasonal profile values for each seasonal used. Note that seasonal profiles and models are saved at Cust Sku level, but because the app needs to be able to calculate forecasts at higher levels, we assume a uniform seasonal for hierarchy products.</p>
<p>Also note that any actuals values flagged as outliers will be ingored by the application when calculating a forecast.</p>
<p>&nbsp;</p>
<p><span style="line-height: 1.1; font-size: 18px;">Key Tables / SPs to Review</span></p>
<ul>
    <li>Dim_GridFilters</li>
    <li>Fact_Screen_GridFilters</li>
    <li>Procast_SP_DEMAND_GetCustSku</li>
    <li>Procast_SP_SHARED_GetFiltersGrid</li>
    <li>Procast_SP_SHARED_GetFiltersGrid_PopulateDropdowns</li>
    <li><span style="line-height: 1.42857;">Procast_SP_SHARED_SaveDefaults</span><br />
    <br />
    </li>
    <li><span style="line-height: 1.42857;">Dim_Demand_Model</span></li>
    <li><span style="line-height: 1.42857;">Dim_Demand_Model_Parameter</span></li>
    <li><span style="line-height: 1.42857;">Fact_Demand_Forecast_Model_CustSku</span></li>
    <li><span style="line-height: 1.42857;">Fact_Demand_Forecast_Model_Parameter_CustSku</span></li>
    <li><span style="line-height: 1.42857;">Fact_Demand_Forecast_CustSkuDay</span></li>
    <li><span style="line-height: 1.42857;">Fact_Demand_Forecast_Outlier_Override</span></li>
    <li><span style="line-height: 1.42857;">Procast_SP_DEMAND_GetVolumesTreeGrid</span></li>
    <li>Procast_SP_DEMAND_GetData_Model</li>
    <li>Procast_SP_SHARED_GetDemandAndSeasonals</li>
    <li>Procast_SP_DEMAND_GetSeasonal</li>
    <li>Procast_SP_DEMAND_SaveForecast</li>
</ul>
<p><span style="line-height: 1.42857;"></span></p>