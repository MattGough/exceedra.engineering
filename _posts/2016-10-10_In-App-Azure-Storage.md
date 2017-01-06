<p>Setup:</p>
<p>Client.config needs to include:</p>
<p>&nbsp;</p>
<p>&nbsp;&lt;StorageData<br />
&nbsp;&nbsp;&nbsp; Provider="AzureProvider.AzureUploadProvider"<br />
&nbsp;&nbsp;&nbsp; Key="[key from azure portal]"<br />
&nbsp;&nbsp;&nbsp; Account="[account name&nbsp;from azure portal]"<br />
&nbsp;&nbsp;&nbsp; Container="[container from azure portal]"<br />
&nbsp;&nbsp;&nbsp; MaxFileSizeMb="10" &lt;!-- integer Mb max size per file&nbsp;--&gt; <br />
&nbsp;&nbsp;&nbsp; Path=""<br />
&nbsp;&nbsp;&nbsp; /&gt;</p>
<p>&nbsp;</p>
<p>The above will allow files to be uploaded from the app and stored in secure&nbsp;Azure blob storage.<br />
The App will also need a configuration flag set on each list screen for each editor. in the funds screen xml you could turn on the storage control for funds and off for parent funds, the example below has them both visible, removing the UploadFilesTab node or setting it to 0 will hide the control..</p>
<p><img alt="" src="/media/storage/upload_8_2_2016_at_12_01_09_PM.png" /></p>
<p>This means the visibility of the control can be controlled at a user and editor screen level.</p>
<p>&nbsp;</p>
<h3><strong>SysConfig:</strong></h3>
<p><strong>If its to be used across the app then </strong></p>
<p>Configuration&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UseAzureStorage&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1</p>
<p><strong>Or Per screen it will be set like so as a list of ActiveFeature:</strong></p>
<p>ActiveFeature&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EnableFileStorage_[ScreenKey]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1</p>
<p>&nbsp;</p>
<p>Each time the control is loaded the app will fire a generic proc and pass through the current screen name and the ID of the entity being edited&nbsp;to get a list of files from the DB that is valid. The DB only stores the file name not the azure storage path, meaning access tot he DB does not grant access to the file. Access is only available via the app.</p>
<p>Each view of a file is charged to the account owner as is the cost to transfer the file to the user.<br />
A full sample costing is available on <a href="https://exceedra.sharepoint.com/_layouts/15/WopiFrame.aspx?sourcedoc={5BC91793-B989-4DF5-8BF6-1FD03D521EF2}&amp;file=azure%20costs.xlsx&amp;action=default">sharepoint</a></p>
<p>It is possible for the client to own the azure storage, we just need the values for the configuration above to set it up.<br />
<br />
</p>
<p><span style="color: rgb(255, 0, 0);"><strong>IMPORTANT</strong>: if the storage account is changed, existing files MUST be copied to the new account otherwise they will not be viewable from the application.</span></p>
<p>&nbsp;</p>