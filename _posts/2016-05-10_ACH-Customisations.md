<h2><a name="Customisations"></a>Customisations</h2>
<h3><a name="Broker-Access"></a>Broker Access</h3>
<p>Certain users must not have access to COGS information within the system. These users will be defined by their Broker Role. Throughout the stored procedures, there are checks against the table <em>clnt.Fact_Broker_Role</em> which will define a list of any standard roles from <em>app.Dim_Roles</em> that are broker roles.</p>
<p>This functionality is based on blacklisting principles. All users can see COGS as normal, unless they're assigned as a broker.</p>
<h4><a name="Affected-Procedures"></a>Affected Procedures</h4>
<pre><code>APP_Procast_SP_PROMO_Wizard_Review_GetPandLGrid_Third APP_Procast_SP_PROMO_Wizard_Products_GetProductPrices </code></pre>