
---
layout: post
title:  'Canvas-PivotGrid-calculated-fields-&-equations;-pt-II'
author: 'jakub.siuda@exceedra.com'
exerpt: >
  How to add a calculated field to an existing pivot 

---

  <p>So now we have a problem with our pivot grid showing quite deceiving information.<br />
<br />
What we can do about it is to introduce another property called "Count" which will equal to "1" for every field.<br />
<strong><span style="color: #00b050;">The property doesn't really make sense to a user so we'd like to hide it by prefixing it's name with "Hidden_".</span></strong><br />
Then, we can modify our equation to divide the result by "Count", like below:<br />
<br />
<pre>&lt;Results&gt;<br />&nbsp; &lt;FieldProperties&gt;<br />&nbsp; &nbsp; &lt;Property Code="SEASON" &nbsp; &nbsp; &nbsp; &nbsp; Name="Season" &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;PivotType="Column" /&gt;<br />&nbsp; &nbsp; &lt;Property Code="TEAM" &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Name="Team name" &nbsp; &nbsp; &nbsp; &nbsp; PivotType="Row" /&gt;<br />&nbsp; &nbsp; &lt;Property Code="POINTS" &nbsp; &nbsp; &nbsp; &nbsp; Name="Points" &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;PivotType="Value" &nbsp; Type="INT" &nbsp; Format="N0" &nbsp; AggregationType="AVG" /&gt;<br />&nbsp; &nbsp; &lt;Property Code="GOALS_FOR" &nbsp; &nbsp; &nbsp;Name="Goals for" &nbsp; &nbsp; &nbsp; &nbsp; PivotType="Value" &nbsp; Type="INT" &nbsp; Format="N0" &nbsp; AggregationType="AVG" /&gt;<br />&nbsp; &nbsp; &lt;Property Code="GOALS_AGAINST" &nbsp;Name="Goals against" &nbsp; &nbsp; PivotType="Value" &nbsp; Type="INT" &nbsp; Format="N0" &nbsp; AggregationType="AVG" /&gt;<br />&nbsp; &nbsp; &lt;Property Code="GOAL_DIFF" &nbsp; &nbsp; &nbsp;Name="Goal difference" &nbsp; PivotType="CalculatedField" &nbsp; &nbsp; &nbsp;Format="N0" &nbsp; <strong>Equation="(GOALS_FOR - GOALS_AGAINST) / COUNT"</strong> /&gt;<br /><strong>&nbsp; &nbsp; &lt;Property Code="COUNT" &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Name="Hidden_Count" &nbsp; &nbsp; &nbsp;PivotType="Value" &nbsp; Type="INT" /&gt;</strong><br />&nbsp; &lt;/FieldProperties&gt;<br />&nbsp; &lt;Fields&gt;<br />&nbsp; &nbsp; &lt;Field &nbsp; SEASON="13/14" &nbsp; TEAM="Arsenal" &nbsp; &nbsp; POINTS="79" &nbsp; GOALS_FOR="68" &nbsp; GOALS_AGAINST="41" &nbsp; <strong>COUNT="1"</strong> /&gt;<br />&nbsp; &nbsp; &lt;Field &nbsp; SEASON="14/15" &nbsp; TEAM="Arsenal" &nbsp; &nbsp; POINTS="75" &nbsp; GOALS_FOR="71" &nbsp; GOALS_AGAINST="36" &nbsp; <strong>COUNT="1"</strong> /&gt;<br />&nbsp; &nbsp; &lt;Field &nbsp; SEASON="15/16" &nbsp; TEAM="Arsenal" &nbsp; &nbsp; POINTS="71" &nbsp; GOALS_FOR="65" &nbsp; GOALS_AGAINST="36" &nbsp; <strong>COUNT="1"</strong> /&gt;<br />&nbsp; &lt;/Fields&gt;<br />&lt;/Results&gt;</pre>
<img alt="" src="/media/Canvas/CanvasCalculatedFields4.png" /><br />
<br />
<strong><span style="color: #ff0000;">NOTE: unfortunately, at the moment we are not able to hide the tiny blank "Count" row, added after this change</span></strong></p>
<p><strong><span style="color: #ff0000;">&nbsp;</span></strong></p>
<p><strong><span style="color: #ff0000;">&nbsp;</span></strong></p>