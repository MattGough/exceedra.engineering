
---
layout: post
title:  'Promo-Wizard-Review-Canvas-report-tab'
author: 'jakub.siuda@exceedra.com'
exerpt: >
  How to show a tab with a canvas report control on the Promo Wizard Review screen. 

---

  <p><strong>1. What is the Canvas report tab for?</strong></p>
<p>
<br />
This tab can be used to show a canvas report from the Standard Reports screen. No filtering can be applied but the report can be tailored for the selected promotion.</p>
<p>In order to check how canvas works check "3. Canvas area"&nbsp;<a href="https://wiki.exceedra-sp.com:10111/my/readarticle.aspx?articleid=2E3003EA-4559-48C3-A95F-49BF4EE86998&amp;artsection=0">here</a>.<br />
<br />
<strong>2. How to show the tab</strong><br />
<br />
In order to make the canvas report tab visible we need to provide the following configuration in "app.Procast_SP_LOGIN_GetSysConfig":</p>
<pre>&lt;ConfigItem&gt;
&nbsp; &lt;Section&gt;Configuration&lt;/Section&gt;
&nbsp; &lt;Key&gt;<strong>IsPromoCanvasReportTabVisible</strong>&lt;/Key&gt;
&nbsp; &lt;Value&gt;1&lt;/Value&gt;
&lt;/ConfigItem&gt;</pre>
<p><strong>3. Loading the report</strong><br />
<br />
When entering the review screen the app will now call "app.Procast_SP_CANVAS_GetGridItems" to get the metadata for the canvas control with the following xml in:<br />
<br />
</p>
<pre>&lt;GetInsightGrid&gt;
&nbsp; &lt;User_Idx&gt;1&lt;/User_Idx&gt;
&nbsp; &lt;SalesOrg_Idx&gt;1&lt;/SalesOrg_Idx&gt;
<strong>&nbsp; &lt;MenuItem_Idx&gt;&lt;/MenuItem_Idx&gt;</strong>
&nbsp; &lt;Screen_Code&gt;PROMOTION&lt;/Screen_Code&gt;
&lt;/GetInsightGrid&gt;</pre>
<br />
"MenuItem_Idx" is the id of a canvas report that we want to load from the Standard Reports screen. As we can see the MenuItem_Idx doesn't have any value. In order to provide this value we need to specify another configuration in "app.Procast_SP_LOGIN_GetSysConfig" as follows:<br />
<br />
<pre>&lt;ConfigItem&gt;
&nbsp; &lt;Section&gt;Configuration&lt;/Section&gt;
&nbsp; &lt;Key&gt;<strong>DefaultPromo_CanvasReportId</strong>&lt;/Key&gt;
<strong>&nbsp; &lt;Value&gt;x&lt;/Value&gt;</strong>
&lt;/ConfigItem&gt;</pre>
<br />
where "x" is the id of a canvas report to load.<br />
<br />
Now, the call "app.Procast_SP_CANVAS_GetGridItems" looks like this:<br />
<br />
<pre>&lt;GetInsightGrid&gt;
&nbsp; &lt;User_Idx&gt;12&lt;/User_Idx&gt;
&nbsp; &lt;SalesOrg_Idx&gt;1&lt;/SalesOrg_Idx&gt;
<strong>&nbsp; &lt;MenuItem_Idx&gt;defaultpromo_canvasreportid (x)&lt;/MenuItem_Idx&gt;</strong>
&nbsp; &lt;Screen_Code&gt;PROMOTION&lt;/Screen_Code&gt;
&lt;/GetInsightGrid&gt;</pre>
<br />
<strong>4. Tailoring the report for the selected promotion</strong><br />
<br />
The way in which the report is tailored for the selected promotion is by sending additional information about the promo id when loading the data for the canvas area. This way the database can distinct if the request comes from the Standard Reports or the Promotion Wizard screen. An example xml-in for the call could look like this:<br />
<br />
<pre>&lt;GetCanvasElement&gt;
&nbsp; &lt;User_Idx&gt;1&lt;/User_Idx&gt;
&nbsp; &lt;SalesOrg_Idx&gt;1&lt;/SalesOrg_Idx&gt;
&nbsp; &lt;MenuItem_Idx&gt;defaultpromo_canvasreportid (x)&lt;/MenuItem_Idx&gt;
&nbsp; &lt;Canvas_Element_Idx&gt;the_id_of_the_control_on_the_canvas_area&lt;/Canvas_Element_Idx&gt;
<strong>&nbsp; &lt;Promo_Idx&gt;the_id_of_the_promotion&lt;/Promo_Idx&gt;</strong>
&lt;/GetCanvasElement&gt;</pre>
<p>&nbsp;</p>