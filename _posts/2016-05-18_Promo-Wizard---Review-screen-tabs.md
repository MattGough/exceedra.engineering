<p>SysConfig entries are used to turn the Tabs on and each one does different jobs.</p>
<p>IsPromoReportTabVisible will display the report tab that has a dynamic grid control and will call: </p>
<p><span style="color: #1f497d;">app.Procast_SP_PROMO_Wizard_Review_GetReportGrid <br />
</span></p>
<p><span style="color: #1f497d;">&lt;GetPromotionPandLGrid&gt;<br />
&nbsp; &lt;User_Idx&gt;[UserID]&lt;/User_Idx&gt;<br />
&nbsp; &lt;Promo_Idx&gt;[PromoID]&lt;/Promo_Idx&gt;<br />
&lt;/GetPromotionPandLGrid&gt;</span></p>
<p>&nbsp;</p>
<p>IsPromoDocumentTabVisible will display a tab that contains a vertical grid control and will call</p>
<p><span style="color: #1f497d;">app.Procast_SP_PROMO_Wizard_Review_GetDocumentGrid</span></p>
<p><span style="color: #1f497d;">&lt;GetPromotionDocuments&gt;<br />
&nbsp; &lt;User_Idx&gt;[UserID]&lt;/User_Idx&gt;<br />
&nbsp; &lt;Promo_Idx&gt;[PromoID]&lt;/Promo_Idx&gt;<br />
&lt;/GetPromotionDocuments&gt;</span></p>
<p>&nbsp;</p>