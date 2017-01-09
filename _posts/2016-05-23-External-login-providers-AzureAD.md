
---
layout: post
title:  'External-login-providers-AzureAD'
author: 'chillfire'
exerpt: >
  We now support AzureAD as a valid security login provier 

---

  <p>To turn this feature on/off you will need to change the client.config file on the server.<br />
(We cannot get this data from tee DB as it may mean pushing secure endpoints/data around before user has been validated.)</p>
<p>&nbsp;</p>
<p>The client.config will need a new XML section called "AzureAD", something like:</p>
<p>&nbsp;</p>
<p>&nbsp;<span style="color: #92d050;">&lt;!-- Only needed is installation client is going to use AzureAD <br />
&nbsp; <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Please note this data is NOT stored in the DB as it should not be transported across the net in anyway.<br />
&nbsp; &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The Client ID is used by the application to uniquely identify itself to Azure AD.<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The Tenant is the name of the Azure AD tenant in which this application is registered.<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The AAD Instance is the instance of Azure, for example public Azure or Azure China.<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The Redirect URI is the URI where Azure AD will return OAuth responses.<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The Authority is the sign-in URL of the tenant.<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IsActive is so it can be turned off seperately<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --&gt;</span></p>
<p>&nbsp; &lt;AzureAD&nbsp; Tenant="xxxxxxxxxxxx.onmicrosoft.xxx" &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ClientId="b5dc6a2d-17d5-4977-ba3e-exfc9a3c88cx"<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RedirectUri="http://ToDoListApp" &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ResourceId="https://xxxxxxxxxxxx.onmicrosoft.xxx/TodoListService"<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AADInstance="https://login.microsoftonline.com/{0}"<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IsActive="1" /&gt;</p>
<p>&nbsp;</p>
<p>To turn off simply change IsActive="0"</p>
<p>&nbsp;</p>