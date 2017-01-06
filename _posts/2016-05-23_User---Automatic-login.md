<p>When a user sets their login type to be automatic, remember me or are logging in via their local AD the app will store an xml file that is used to quickstart the application into logging them in without them having to type in their details.</p>
<p>The file looks like this:</p>
<p>Remember me:<br />
<span style="color: #c00000;">&lt;?xml version="1.0"?&gt;<br />
&lt;User xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"&gt;<br />
&nbsp; &lt;Session&gt;D0F46945-F9C7-4627-8D92-4B7E7BEF6238&lt;/Session&gt;<br />
&nbsp; &lt;Accent&gt;#FF548ED5&lt;/Accent&gt;<br />
&nbsp; &lt;SalesOrganisationID&gt;1&lt;/SalesOrganisationID&gt;<br />
&nbsp; &lt;ID&gt;10&lt;/ID&gt;<br />
&nbsp; &lt;RememberMe&gt;Name&lt;/RememberMe&gt;<br />
&nbsp; &lt;DisplayName&gt;Hogan, Craig&lt;/DisplayName&gt;<br />
&nbsp; &lt;LanguageCode&gt;en-GB&lt;/LanguageCode&gt;<br />
&nbsp; &lt;Logging&gt;true&lt;/Logging&gt;<br />
&lt;/User&gt;</span></p>
<p><span style="color: #000000;">Automatic:</span></p>
<p><span style="color: #c00000;">&lt;User xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"&gt;<br />
&nbsp; &lt;Session&gt;968C0CED-612F-46C5-8303-3DF1D9925225&lt;/Session&gt;<br />
&nbsp; &lt;Accent&gt;#FF548ED5&lt;/Accent&gt;<br />
&nbsp; &lt;SalesOrganisationID&gt;0&lt;/SalesOrganisationID&gt;<br />
&nbsp; &lt;ID&gt;10&lt;/ID&gt;<br />
&nbsp; &lt;RememberMe&gt;Automatic&lt;/RememberMe&gt;<br />
&nbsp; &lt;Logging&gt;false&lt;/Logging&gt;<br />
&lt;/User&gt;</span></p>
<p>This will only work if the user stays at the same PC, that they dont log in from a different PC, which changes their sessionID in the DB and will stop them from auto logins from other PCs.</p>
<p>The process for auto login is simple, we take the session ID and pass it to the DB to validate that this user is the same user who logged in last time. (much the same way a cookie does in your browser).</p>
<p>&nbsp;</p>
<p><strong>Proc:</strong></p>
<p>app.Procast_SP_LOGIN_User_LoginWithSession</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>