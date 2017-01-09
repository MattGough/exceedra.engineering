
---
layout: post
title:  'DG-hyperlinks'
author: 'jakub.siuda@exceedra.com'
exerpt: >
  On this page I will demonstrate how to create a column with hyperlinks that navigate us into one of the app's editors. 

---

  <p><strong style="font-size: medium; line-height: 1.42857;">1. Before we start</strong></p>
<p>
Let's say we have the following dynamic grid layout:<br />
<br />
</p>
<pre>&lt;Results&gt;
&nbsp; &lt;RootItem&gt;
&nbsp; &nbsp; &lt;Attributes&gt;
&nbsp; &nbsp; &nbsp; &lt;Attribute&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;ColumnCode&gt;Name&lt;/ColumnCode&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;HeaderText&gt;Name&lt;/HeaderText&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;Value&gt;First item&lt;/Value&gt;
&nbsp; &nbsp; &nbsp; &lt;/Attribute&gt;
&nbsp; &nbsp; &lt;/Attributes&gt;
&nbsp; &lt;/RootItem&gt;
&lt;/Results&gt;
</pre>
<br />
This xml generates a dynamic grid with one label column called Name and one row with the value of "First item".<br />
The column shows data as labels because we didn't specify its control type and by default it's "Label".
<p>&nbsp;</p>
<p><img alt="" src="data:image/png;base64,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" /></p>
<p><span style="font-size: 16px;"><strong>2. Creating a hyperlink column</strong></span><br />
<br />
The first thing I'm going to do is to change the control type of our column from "Label" to "Hyperlink":<br />
<br />
</p>
<pre>&lt;Results&gt;
&nbsp; &lt;RootItem&gt;
&nbsp; &nbsp; &lt;Attributes&gt;
&nbsp; &nbsp; &nbsp; &lt;Attribute&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;ColumnCode&gt;Name&lt;/ColumnCode&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;HeaderText&gt;Name&lt;/HeaderText&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;Value&gt;First item&lt;/Value&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<strong>&lt;ControlType&gt;Hyperlink&lt;/ControlType&gt;</strong>
&nbsp; &nbsp; &nbsp; &lt;/Attribute&gt;
&nbsp; &nbsp; &lt;/Attributes&gt;
&nbsp; &lt;/RootItem&gt;
&lt;/Results&gt;
</pre>
<br />
As you can see below, now our column shows data as hyperlinks.
<p>&nbsp;</p>
<p>
<img alt="" src="data:image/png;base64,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" /></p>
<p>&nbsp;</p>
<p><span style="font-size: 16px;"><strong>3. Specifying the details of the navigation</strong></span></p>
<p>
Now, I need to tell the dynamic grid where it should move a user to when the hyperlink is clicked.<br />
I do that by specifying the item's type. For the sake of our example, let's consider our item to be a promotion.<br />
<br />
</p>
<pre>&lt;Results&gt;
&nbsp; &lt;RootItem&gt;
&nbsp; &nbsp; <strong>&lt;Item_Type&gt;Promotion&lt;/Item_Type&gt;</strong>
&nbsp; &nbsp; &lt;Attributes&gt;
&nbsp; &nbsp; &nbsp; &lt;Attribute&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;ColumnCode&gt;Name&lt;/ColumnCode&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;HeaderText&gt;Name&lt;/HeaderText&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;Value&gt;First item&lt;/Value&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;ControlType&gt;Hyperlink&lt;/ControlType&gt;
&nbsp; &nbsp; &nbsp; &lt;/Attribute&gt;
&nbsp; &nbsp; &lt;/Attributes&gt;
&nbsp; &lt;/RootItem&gt;
&lt;/Results&gt;
</pre>
<p><strong><span style="color: #ff0000;">NOTE: For allowed item types check point 5.&nbsp;</span></strong><span style="font-weight: 700; font-size: 14px; line-height: 22.8571px;"><strong><span style="color: #ff0000;">Allowed item types</span></strong></span><br />
<br />
The last step I need to take is to let the dynamic grid know what promotion it is exactly. I have to create an additional column which will store my promotion idx.<br />
This isn't anything my user needs to see so that I'll make this column invisible.<br />
<br />
</p>
<pre>&lt;Results&gt;
&nbsp; &lt;RootItem&gt;
&nbsp; &nbsp; &lt;Item_Type&gt;Promotion&lt;/Item_Type&gt;
&nbsp; &nbsp; &lt;Attributes&gt;
<strong>&nbsp; &nbsp; &nbsp; &nbsp;&lt;Attribute&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;ColumnCode&gt;Promotion_Idx&lt;/ColumnCode&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;Value&gt;100&lt;/Value&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;IsDisplayed&gt;0&lt;/IsDisplayed&gt;
&nbsp; &nbsp; &nbsp; &lt;/Attribute&gt;</strong>
&nbsp; &nbsp; &nbsp; &lt;Attribute&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;ColumnCode&gt;Name&lt;/ColumnCode&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;HeaderText&gt;Name&lt;/HeaderText&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;Value&gt;First item&lt;/Value&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;ControlType&gt;Hyperlink&lt;/ControlType&gt;
&nbsp; &nbsp; &nbsp; &lt;/Attribute&gt;
&nbsp; &nbsp; &lt;/Attributes&gt;
&nbsp; &lt;/RootItem&gt;
&lt;/Results&gt;
</pre>
<br />
<strong><span style="color: #ff0000;">NOTE: The idx column must be the first or the second node of attributes AND its column code must end with "_Idx".</span></strong><br />
<br />
Click on the hyperlink now and you'll see that it'll successfully navigate you to the Promotion Editor in order to edit the promotion of id 100.
<p>&nbsp;</p>
<p>
<span style="font-weight: 700; font-size: medium; line-height: 1.42857;"><img alt="" src="https://wiki.exceedra-sp.com:10111/media/DynamicGrid/DgLinks1.png" /></span></p>
<p><span style="font-weight: 700; font-size: medium; line-height: 1.42857;">&nbsp;</span></p>
<p><strong><span style="font-size: 16px;">4. Navigation behind the scenes</span></strong></p>
<p><span style="font-size: 14px;">In fact, the dynamic grid above will only send a navigation request to the screen that contains it. It's up to this screen to handle this request properly. For now, each screen can handle navigation requests in its on way.<br />
Some screens may replace itself with the content of the page a user wants to navigate to, whilst others would show the new page's content in a popup. There isn't a possibility for the database to control this behaviour.<br />
<br />
We're planning to standardise the dynamic grid's navigation feature in future releases of the app.</span></p>
<p><span style="font-size: 14px;">&nbsp;</span></p>
<p><span style="font-size: 16px;"><strong>5. Allowed item types</strong></span></p>
<table style="width: 590px; height: 185px;">
    <tbody>
        <tr>
            <td style="text-align: center;">&nbsp;<strong>Item type</strong></td>
            <td style="text-align: center;">&nbsp;<strong>Editor to navigate to</strong></td>
        </tr>
        <tr>
            <td style="text-align: center;">"Condition"</td>
            <td style="text-align: center;">Conditions</td>
        </tr>
        <tr>
            <td style="text-align: center;">&nbsp;"Scenario"</td>
            <td style="text-align: center;">Scenarios</td>
        </tr>
        <tr>
            <td style="text-align: center;">&nbsp;"Fund", "Funds", "Child_Funds"</td>
            <td style="text-align: center;">Funds</td>
        </tr>
        <tr>
            <td style="text-align: center;">"ParentFund"</td>
            <td style="text-align: center;">Parent Funds</td>
        </tr>
        <tr>
            <td style="text-align: center;">"Npd", "NpdList"</td>
            <td style="text-align: center;">Npds</td>
        </tr>
        <tr>
            <td style="text-align: center;">&nbsp;"Rob", "RobGrid"</td>
            <td style="text-align: center;">Robs</td>
        </tr>
        <tr>
            <td style="text-align: center;">"RobGroup"</td>
            <td style="text-align: center;">Material Robs</td>
        </tr>
        <tr>
            <td style="text-align: center;">&nbsp;"RobGroupCreator"</td>
            <td style="text-align: center;">Rob Groups Creator</td>
        </tr>
        <tr>
            <td style="text-align: center;">&nbsp;"Contract", "ContractGrid"</td>
            <td style="text-align: center;">Rob Contracts</td>
        </tr>
        <tr>
            <td style="text-align: center;">&nbsp;"Promotion"</td>
            <td style="text-align: center;">Promotion<span style="line-height: 1.42857; text-align: left; background-color: transparent;">s</span></td>
        </tr>
        <tr>
            <td style="text-align: center;"><span style="text-align: center;">"Template"</span>&nbsp;</td>
            <td style="text-align: center;"><span style="text-align: center;">Promotion templates</span></td>
        </tr>
        <tr>
            <td style="text-align: center;">&nbsp;"Claim"</td>
            <td style="text-align: center;">Claims</td>
        </tr>
        <tr>
            <td style="text-align: center;">"Event"</td>
            <td style="text-align: center;">Events</td>
        </tr>
        <tr>
            <td style="text-align: center;">&nbsp;"FcMgmt", "Forecasts"</td>
            <td style="text-align: center;">Forecasts Management</td>
        </tr>
    </tbody>
</table>
<p>&nbsp;</p>
<p>&nbsp;</p>