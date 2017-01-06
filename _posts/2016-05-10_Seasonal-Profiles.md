<h1 style="font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; color: #333333;"><span style="line-height: 1.42857;">Seasonal Profiles</span></h1>
<p><span style="line-height: 1.42857;">The Forecast Strategies screen lets the user create and save seasonal profiles..TODO</span></p>
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
<h5><span style="line-height: 1.42857;"><strong>Loading and Saving Seasonal Profiles</strong></span></h5>
<p>Seasonal profile periods and values are returned by a dynamic grid, which allows the users to make changes to existing profiles or to create new profiles -&nbsp;<span style="line-height: 1.42857;">the user can save a seasonal as an internal or a global profile.&nbsp;</span></p>
<p><span style="line-height: 1.42857;">When editing an existing profile, creating a new one or choosing to use a profile as&nbsp;</span><span style="line-height: 20px;">currency</span><span style="line-height: 1.42857;">, i.e., assigning it to the current trial forecast, customer and product selections, the same save procedure is used. This is controlled by different flags sent by the application to when calling the stored procedure, which can be seen in the expected XML in in the procedure.</span></p>
<ul>
    <li><span style="line-height: 1.42857;">&nbsp;</span><span style="line-height: 1.42857;">Procast_SP_SEASONALS_GetSeasonals</span></li>
    <li>Procast_SP_DEMAND_SaveSeasonalProfile<br />
    <br />
    </li>
</ul>
<h5><span style="line-height: 1.1; color: #000000;"><strong>Viewing and Setting Profiles to Trial Forecasts</strong></span></h5>
<p>For a selected trial forecast and listings a tree of products is shown, which allows the user to quickly change their seasonal profiles.</p>
<ul>
    <li>Procast_SP_SEASONALS_GetSeasonals</li>
    <li>Procast_SP_SEASONALS_SaveSeasonals</li>
</ul>
<div>&nbsp;</div>
<h4 style="font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; color: #333333;">Key Tables / SPs to Review</h4>
<ul>
    <li>Dim_GridFilters</li>
    <li>Fact_Screen_GridFilters</li>
    <li>Procast_SP_DEMAND_GetCustSku</li>
    <li>Procast_SP_SHARED_GetFiltersGrid</li>
    <li>Procast_SP_SHARED_GetFiltersGrid_PopulateDropdowns</li>
    <li><span style="line-height: 1.42857;">Procast_SP_SHARED_SaveDefaults</span></li>
    <li><span style="line-height: 1.42857;">&nbsp;</span><span style="line-height: 1.42857;">Procast_SP_SEASONALS_GetSeasonals</span></li>
    <li>Procast_SP_DEMAND_SaveSeasonalProfile</li>
    <li>Procast_SP_SEASONALS_GetSeasonals</li>
    <li>Procast_SP_SEASONALS_SaveSeasonals</li>
</ul>