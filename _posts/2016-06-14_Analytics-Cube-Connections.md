<p>There are a number of settings that can be set form the DB to change the connection string that we use in the app to connect to a cube.</p>
<p>&nbsp;</p>
<p>In the app we create teh connection string like this:</p>
<p>&nbsp;var temp = String.Format(<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "Provider=MSOLAP.5;Persist Security Info=True;Data Source={0};Initial Catalog={1};Timeout=300;CustomData={2};Roles={3};{4}",<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <em>url</em>, <em>database</em>, User.CurrentUser.ID, <em>App.Configuration.AnalyticsRole</em>, <em>App.Configuration.AnalyticsLogin</em>);</p>
<p>&nbsp;</p>
<p>where:</p>
<p><em>url</em> = link to the pump<br />
<em>database</em> = is the selected cube catalog.<br />
<em>App.Configuration.AnalyticsRole</em> = loaded from SysConfig and is a relevant role that is used in the cube to segregate data (for example), this can be comma delimited if you need multiple roles passed through.<br />
<em>App.Configuration.AnalyticsLogin</em> = loaded from SysConfig and allows the connection to teh cube to be secured using username/password.</p>
<p>&nbsp;</p>
<p>For example from SysConfig we might get:</p>
<p>&nbsp; &lt;ConfigItem&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;Section&gt;Analytics&lt;/Section&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;Key&gt;AnalyticsURL&lt;/Key&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;Value&gt;https://cube.endpoint/olap/msmdpump.dll&lt;/Value&gt;<br />
&nbsp; &lt;/ConfigItem&gt;</p>
<p>&nbsp;&nbsp;&lt;ConfigItem&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;Section&gt;Configuration&lt;/Section&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;Key&gt;AnalyticsRole&lt;/Key&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;Value&gt;BKR_BDM&lt;/Value&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/ConfigItem&gt;</p>
<p>&nbsp; &lt;ConfigItem&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;Section&gt;Configuration&lt;/Section&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;Key&gt;AnalyticsLogin&lt;/Key&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;Value&gt;User ID=domain\username; Password=Z5tP9IjklJb6!2!!!2;&lt;/Value&gt;<br />
&lt;/ConfigItem&gt;</p>
<p>&nbsp;</p>
<p>Which would give us a connection string a bit like:</p>
<p>"Provider=MSOLAP.5;Persist Security Info=True;<br />
&nbsp;Data Source=<em>https://cube.endpoint/olap/msmdpump.dll</em>;<br />
&nbsp;Initial Catalog=<em>TheSelectedOne</em>;<br />
&nbsp;Timeout=300;<br />
&nbsp;CustomData=<em>11</em>;<br />
&nbsp;Roles=<em>BKR_BDM</em>;<br />
&nbsp;<em>User ID=domain\username; <br />
&nbsp;Password=Z5tP9IjklJb6!2!!!2</em>;"</p>
<p>&nbsp;</p>
<p>Also note that the <em>App.Configuration.AnalyticsLogin</em> field can be used to pass through multiple fields, so you can taylor the connection string to fit the the customer installation. Ie you could add <em>encrypt=true; to the AnalyticsLogin</em> field after the login details if needed.</p>
<p>&nbsp;</p>
<p>&nbsp;</p>