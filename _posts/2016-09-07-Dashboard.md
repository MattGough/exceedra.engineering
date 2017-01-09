
---
layout: post
title:  'Dashboard'
author: 'jakub.siuda@exceedra.com'
exerpt: >
  The Dashboard screen is a canvas report 

---

  <p><strong>1. What is the Dashboard screen</strong><br />
<br />
The Dashboard screen is the home screen for a user - it shows general data about the system, informations that may need his attention and links or shortcuts to other screens.<br />
It consists entirely of the canvas control that stretches out on the whole screen. Can be personalised per user and must be a canvas report obtained by the result of a query without any filters.<br />
<br />
<strong>2. Showing the Dashboard screen and setting it as the default screen</strong><br />
<br />
To show the Dashboard screen the following code must be included in the result of the app.Procast_SP_LOGIN_GetSysConfig proc, in the Screens section:<br />
<span class="Apple-tab-span" style="white-space: pre;">
<pre><code>&nbsp;&lt;Screen&gt;
&nbsp; &nbsp; &lt;Key&gt;DASHBOARD&lt;/Key&gt;
&nbsp; &nbsp; &lt;LabelKey&gt;MENU_DASHBOARD&lt;/LabelKey&gt;
&nbsp; &nbsp; &lt;ParentScreen_Key&gt;REPORTS&lt;/ParentScreen_Key&gt;
&nbsp; &nbsp; &lt;Icon&gt;bullhorn&lt;/Icon&gt;
&nbsp; &nbsp; <strong>&lt;IsDefault&gt;1&lt;/IsDefault&gt;</strong><span class="Apple-tab-span" style="white-space: pre;">							</span>&lt;-- this sets Dashboard as the default screen
&nbsp; &nbsp; &lt;UseKeyToLoadData&gt;0&lt;/UseKeyToLoadData&gt;
&nbsp; &nbsp; &lt;SortOrder&gt;10&lt;/SortOrder&gt;
&nbsp; &nbsp; &lt;Tabs&gt;
&nbsp; &nbsp; &nbsp; &lt;Tab&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;Key&gt;DASHBOARD&lt;/Key&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;LabelKey&gt;TAB_DASHBOARD&lt;/LabelKey&gt;
&nbsp; &nbsp; &nbsp; &lt;/Tab&gt;
&nbsp; &nbsp; &lt;/Tabs&gt;
&nbsp; &lt;/Screen&gt;</code></pre>
</span></p>
<p><span class="Apple-tab-span" style="white-space: pre;">
In order to make Dashboard the default screen the &lt;IsDefault&gt; node's value must be set to 1.<br />
</span></p>
<p><span class="Apple-tab-span" style="white-space: pre;"><span style="color: #ff0000;">NOTE: You should never set more than one default screen in the sys config. In such case the app will set the default screen to the first screen with IsDefault set to 1, in the order of appearance in the sys config.</span><br />
<br />
<strong>3. Configuration - loading data on the Dashboard screen</strong><br />
The content of the Dashboard screen must be one of the canvas reports from the Canvas screen. Additionally, we won't be able to pass in any filters.</span></p>
<p><span class="Apple-tab-span" style="white-space: pre;">In order to tell Dashboard which canvas report we want to load on the screen we need to add the following configuration to the sys config:</span></p>
<p><span class="Apple-tab-span" style="white-space: pre;"><span class="Apple-tab-span" style="white-space: pre;">	</span>
<pre><code> &nbsp;&lt;ConfigItem&gt;
&nbsp; &nbsp; &lt;Section&gt;Configuration&lt;/Section&gt;
&nbsp; &nbsp; &lt;Key&gt;DefaultDashboard_CanvasId&lt;/Key&gt;
&nbsp; &nbsp; &lt;Value&gt;1&lt;/Value&gt;<span class="Apple-tab-span" style="white-space: pre;">									</span>&lt;-- the canvas report of this idx will be loaded in Dashboard
&nbsp; &lt;/ConfigItem&gt;</code></pre>
</span></p>
<p><span class="Apple-tab-span" style="white-space: pre;">
The Value node defines the idx of a canvas report that will be loaded in Dashboard.<br />
After setting the above, when entering the Dashboard screen the application calls "app.Procast_SP_CANVAS_GetGridItems"
with the following xml in:
</span></p>
<p><span class="Apple-tab-span" style="white-space: pre;">
<pre><code>
&lt;GetInsightGrid&gt;
&nbsp; &lt;User_Idx&gt;1&lt;/User_Idx&gt;
&nbsp; &lt;SalesOrg_Idx&gt;1&lt;/SalesOrg_Idx&gt;
&nbsp; &lt;MenuItem_Idx&gt;1&lt;/MenuItem_Idx&gt;<span class="Apple-tab-span" style="white-space: pre;">							</span>&lt;-- the idx of the canvas report (the value of DefaultDashboard_CanvasId)
&nbsp; &lt;Screen_Code&gt;DASHBOARD&lt;/Screen_Code&gt;<span class="Apple-tab-span" style="white-space: pre;">						</span>&lt;-- the indicator for the db to inform that the report is requested for Dashboard and not for Canvas
&lt;/GetInsightGrid&gt;</code></pre>
</span></p>
<p><span class="Apple-tab-span" style="white-space: pre;">
and the following response is expected:</span></p>
<p><span class="Apple-tab-span" style="white-space: pre;">
<pre><code>
&lt;Results&gt;
&nbsp; &lt;Number_Of_Horizontal_Cells&gt;10&lt;/Number_Of_Horizontal_Cells&gt;
&nbsp; &lt;Number_Of_Vertical_Cells&gt;10&lt;/Number_Of_Vertical_Cells&gt;
&nbsp; &lt;GridControl&gt;
&nbsp; &nbsp; &lt;Canvas_Element_Idx&gt;1&lt;/Canvas_Element_Idx&gt;
&nbsp; &nbsp; &lt;Canvas_Element_Code&gt;ELEMENT_CODE&lt;/Canvas_Element_Code&gt;
&nbsp; &nbsp; &lt;Canvas_Element_Name&gt;ELEMENT_NAME&lt;/Canvas_Element_Name&gt;
&nbsp; &nbsp; &lt;ControlType&gt;TYPE_OF_CONTROL&lt;/ControlType&gt;
&nbsp; &nbsp; &lt;DataSource&gt;PROC_TO_CALL_FOR_DATA&lt;/DataSource&gt;
&nbsp; &nbsp; &lt;DataSourceInput /&gt;
&nbsp; &nbsp; &lt;ColumnIndex&gt;0&lt;/ColumnIndex&gt;
&nbsp; &nbsp; &lt;ColumnSpan&gt;10&lt;/ColumnSpan&gt;
&nbsp; &nbsp; &lt;RowIndex&gt;0&lt;/RowIndex&gt;
&nbsp; &nbsp; &lt;RowSpan&gt;10&lt;/RowSpan&gt;
&nbsp; &lt;/GridControl&gt;
&lt;/Results&gt;
</code></pre>
</span></p>
<p><span class="Apple-tab-span" style="white-space: pre;">&nbsp;</span></p>
<p><span class="Apple-tab-span" style="white-space: pre;"><span style="color: #ff0000;">NOTE: you can return multiple controls</span><br />
After this call the app will call each control's DataSource proc (PROC_TO_CALL_FOR_DATA) in order to fill these controls with data.
The xml in for all of these calls will be:<br />
<pre><code>
&lt;GetCanvasElement&gt;
&nbsp; &lt;User_Idx&gt;1&lt;/User_Idx&gt;
&nbsp; &lt;SalesOrg_Idx&gt;1&lt;/SalesOrg_Idx&gt;
&nbsp; &lt;MenuItem_Idx&gt;dashboard&lt;/MenuItem_Idx&gt;
&nbsp; <strong>&lt;Canvas_Element_Idx&gt;1&lt;/Canvas_Element_Idx&gt;</strong><span class="Apple-tab-span" style="white-space: pre;">			</span>&lt;- the value of Canvas_Element_Idx received from app.Procast_SP_CANVAS_GetGridItems
&lt;/GetCanvasElement&gt;
</code></pre>
</span></p>
<p><span class="Apple-tab-span" style="white-space: pre;">&nbsp;</span></p>
<p><span class="Apple-tab-span" style="white-space: pre;">&nbsp;</span></p>