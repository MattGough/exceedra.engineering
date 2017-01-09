
---
layout: post
title:  'Webservice-for-app-2_9-installation'
author: 'chillfire'
exerpt: >
  What can be controlled during installation 

---

  <p>For a standard 2.9 installation the folder path will look something like:</p>
<p>
\- IIS Root <br />
&nbsp;&nbsp; &nbsp;\- Web<br />
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;\- ????<br />
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;\- Images<br />
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;\- {location of all images used in app}<br />
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;\- Web.config <br />
&nbsp;&nbsp; &nbsp;\- App<br />
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;\- Application Files<br />
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;\- {contains versioned folders of application}<br />
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;\- Config<br />
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;\- Client.config<br />
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;\- WPF.xbap</p>
<p>&nbsp;</p>
<p>There are only 2 files that need to be edited to setup an installation of the app, these are web.config and client.config both control different ends of the platform and should work out of the box for 2.9</p>
<h3>Web.config:</h3>
<p>This file controls applications settings around some DB coded options</p>
<p><span style="color: #c00000;">&nbsp; &lt;appSettings&gt; &lt;!-- For all booleans 0=false &amp; 1=true --&gt;<br />
&nbsp;&nbsp;&nbsp; &lt;add key="Timeout" value="60"/&gt; <span style="color: #00b050;">&lt;!-- timeout for webservice binding --&gt;</span><br />
&nbsp;&nbsp;&nbsp; &lt;add key="UseLocalXML" value="0"/&gt;<span style="color: #00b050;"> &lt;!-- DEV ONLY, PRODUCTION MUST BE SET to "0" --&gt;</span><br />
&nbsp;&nbsp;&nbsp; &lt;add key="SplitEPOS" value="0"/&gt; <span style="color: #00b050;">&lt;!-- split procs calling EPOS schema over a seperate connection string (allows DB splitting) --&gt;</span><br />
&nbsp;&nbsp;&nbsp; &lt;add key="SplitSP" value="1"/&gt; <span style="color: #00b050;">&lt;!-- split the procs over 2 connections, one for PUT (set, insert, save etc) all the rest over the GET DB connection --&gt;</span><br />
&nbsp; &lt;/appSettings&gt;</span></p>
<p><span style="color: #c00000;">&nbsp; &lt;connectionStrings&gt;<br />
<span style="color: #00b050;">&nbsp;&nbsp;&nbsp; &lt;!-- GET --&gt;</span><br />
&nbsp;&nbsp;&nbsp; &lt;add name="ExceedraConn_v2_10" connectionString="data source=exceedracom.cloudapp.net,10315;initial catalog=ESP_Demo_DEV_UK_v2_10;user id=WebApp;password=ExceedraLondon1!;Connection timeout=60" providerName="System.Data.SqlClient" /&gt;<br />
&nbsp;<span style="color: #00b050;">&nbsp;&nbsp; &lt;!-- Put --&gt;</span><br />
&nbsp;&nbsp;&nbsp; &lt;add name="ExceedraConn_v2_10_PUT" connectionString="data source=exceedracom.cloudapp.net,10315;initial catalog=ESP_Demo_DEV_UK_v2_10;user id=WebApp;password=ExceedraLondon1!;Connection timeout=60" providerName="System.Data.SqlClient" /&gt;<br />
</span></p>
<p><span style="color: #c00000;">&nbsp;</span></p>
<p><span style="color: #c00000;">&nbsp;&lt;system.web&gt;<br />
&nbsp;<span style="color: #00b050;">&nbsp;&nbsp; &lt;!-- <br />
&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; PLEASE NOTE: If using Trusted Connection or Integrated Security settings in your connection strings above, you will need to make sure<br />
&nbsp;&nbsp;&nbsp; a) the user account you have bound to your IIS instance for this website has <br />
&nbsp;&nbsp;&nbsp; b) that you add &lt;identity impersonate="true" /&gt; to the&nbsp; &lt;system.web&gt; section of this file<br />
&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp; --&gt;</span></span></p>
<p><span style="color: #c00000;">....</span></p>
<p><span style="color: #c00000;">&lt;/system.web&gt;</span></p>
<p><span style="color: #c00000;"><br />
<span style="color: #000000;">Note that the connections string are versioned in some instances, so you may see&nbsp;<span style="color: #c00000;">ExceedraConn_<strong>v2_10&nbsp;<span style="color: #000000;"></span></strong><span style="color: #000000;">where t</span></span>he next app version may call</span> v2_11 <span style="color: #000000;">etc</span><br />
</span></p>
<h3><span style="color: #000000;">Client.config</span></h3>
<p><span style="color: #000000;">This file controls the endpoint for the webservice and system settings that cannot be stored in the DB.</span></p>
<p><span style="color: #c00000;">&lt;client&gt;<br />
&nbsp; &lt;endpoint address="https://localhost:44302/Webservices/WebService.asmx?v=2_10" binding="basicHttpBinding"<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bindingConfiguration="WebServiceSoap" contract="ServiceReference1.WebServiceSoap" name="WebServiceSoap" /&gt;<br />
<span style="color: #00b050;">&nbsp; &lt;!-- </span></span></p>
<p><span style="color: #00b050;">Your endpoint address above must be on https if the application version you have is built to work w<span style="color: #00b050;">ith </span>https </span><br />
<span style="color: #00b050;">Using a non valid SSL certificate could cause issues</span></p>
<p><span style="color: #000000;"><span style="color: #00b050;">--&gt;<br />
</span><br />
&nbsp;<span style="color: #00b050;"> &lt;!-- <br />
&nbsp; Logging config isActivce only needs to be set to true when you want elmah to be used while developing the app.<br />
&nbsp; When app is deployed live the LogginConfig data needs to go into the Conlfig\Client.config file!<br />
&nbsp; --&gt;</span><br />
<span style="color: #c00000;">&nbsp; &lt;LoggingConfig&nbsp; name="thecompanyname" <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; releaseLevel="Dev10" <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; isactive="0" <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; endpoint="https://exceedraapi.azurewebsites.net/error/log" /&gt;</span><br />
&nbsp;<br />
<span style="color: #00b050;">&nbsp; &lt;!-- name:&nbsp; the name of the client/customer that is running this application --&gt;<br />
&nbsp; &lt;!-- releaseLevel:&nbsp; dev/qa/prod etc, just a label to allow on customer to have multiple versions of the app running in different environments --&gt;<br />
&nbsp; &lt;!-- isactive: 1 = true (data will be sent to logger) 0 = false (it wont)--&gt;<br />
&nbsp; &lt;!-- endpoint: the REST location for the logger --&gt;<br />
</span><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: #00b050;"> &lt;!-- Only needed is installation client is going to use AzureAD <br />
&nbsp; <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Please note this data is NOT stored in the DB as it should not be transported across the net in anyway.<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The Client ID is used by the application to uniquely identify itself to Azure AD.<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The Tenant is the name of the Azure AD tenant in which this application is registered.<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The AAD Instance is the instance of Azure, for example public Azure or Azure China.<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The Redirect URI is the URI where Azure AD will return OAuth responses.<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The Authority is the sign-in URL of the tenant.<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IsActive is so it can be turned off seperately<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --&gt;</span><br />
&nbsp;&nbsp; <br />
<span style="color: #c00000;">&nbsp; &lt;AzureAD&nbsp; Tenant="xxxxxxx.onmicrosoft.com" &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ClientId="b5dc6a2d-17d5-4977-ba3e-ecfc9a3c88cf"<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RedirectUri="http://TheAppApp" &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ResourceId="https://xxxxxxx.onmicrosoft.com/TheService"<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AADInstance="https://login.microsoftonline.com/{0}"<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IsActive="1" /&gt;</span><br />
<br />
<br />
<span style="color: #c00000;">&nbsp; &lt;SiteConfig BaseURL="https://localhost:44302" UserPasswordReset="1" /&gt;</span><br />
<span style="color: #00b050;">&nbsp; &lt;!-- please no trailing '/' on BaseURL </span></span></p>
<p><span style="color: #00b050;">This BaseURL is used in the app to find all images that are used in the app and should point to the main URL that the webservice sits on </span></p>
<p><span style="color: #000000;"><span style="color: #00b050;"> <br />
&nbsp; UserPasswordReset :<br />
&nbsp; 1 = users can use forgotton password system<br />
&nbsp; 0 - no they cant<br />
&nbsp; --&gt;</span><br />
&nbsp; <br />
<span style="color: #c00000;">&lt;/client&gt; </span><br />
</span></p>