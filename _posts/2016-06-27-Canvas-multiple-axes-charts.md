
---
layout: post
title:  'Canvas-multiple-axes-charts'
author: 'jakub.siuda@exceedra.com'
exerpt: >
  How to create a multiple axes chart 

---

  <p>Let's say we have the following xml to generate a simple linear chart, with two linear axes and two linear series:<br />
<br />
<pre>&lt;Results&gt;
&nbsp; &lt;Title&gt;Multiple axes chart example&lt;/Title&gt;
&nbsp; &lt;ChartType&gt;Linear&lt;/ChartType&gt;
&nbsp; &lt;IsLegendVisible&gt;1&lt;/IsLegendVisible&gt;
&nbsp; &lt;xAxisType&gt;Linear&lt;/xAxisType&gt;
&nbsp; &lt;xAxisTitle&gt;The X Axis&lt;/xAxisTitle&gt;
&nbsp; &lt;xAxisBrush&gt;Black&lt;/xAxisBrush&gt;
&nbsp; &lt;yAxisType&gt;Linear&lt;/yAxisType&gt;
&nbsp; &lt;yAxisTitle&gt;The Y Axis&lt;/yAxisTitle&gt;
&nbsp; &lt;yAxisBrush&gt;Black&lt;/yAxisBrush&gt;
&nbsp; &lt;MultiSeries&gt;
&nbsp; &nbsp; &lt;Series&gt;
&nbsp; &nbsp; &nbsp; &lt;SeriesType&gt;Line&lt;/SeriesType&gt;
&nbsp; &nbsp; &nbsp; &lt;SeriesName&gt;First series - without their own axis&lt;/SeriesName&gt;
&nbsp; &nbsp; &nbsp; &lt;SeriesBrush&gt;Blue&lt;/SeriesBrush&gt;
&nbsp; &nbsp; &nbsp; &lt;Datapoints&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;Datapoint&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Header1&gt;First point a&lt;/Tooltip_Header1&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Header2 /&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Header3 /&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Color /&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;X&gt;0.23&lt;/X&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Y&gt;3.5&lt;/Y&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;/Datapoint&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;Datapoint&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Header1&gt;Second point a&lt;/Tooltip_Header1&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Header2 /&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Header3 /&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Color /&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;X&gt;2.46&lt;/X&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Y&gt;4.25&lt;/Y&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;/Datapoint&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;Datapoint&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Header1&gt;Third point a&lt;/Tooltip_Header1&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Header2 /&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Header3 /&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Color /&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;X&gt;3.42&lt;/X&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Y&gt;7.9&lt;/Y&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;/Datapoint&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;Datapoint&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Header1&gt;Fourth point a&lt;/Tooltip_Header1&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Header2 /&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Header3 /&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Color /&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;X&gt;7.84&lt;/X&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Y&gt;3.7&lt;/Y&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;/Datapoint&gt;
&nbsp; &nbsp; &nbsp; &lt;/Datapoints&gt;
&nbsp; &nbsp; &lt;/Series&gt;
&nbsp; &nbsp; &lt;Series&gt;
&nbsp; &nbsp; &nbsp; &lt;SeriesType&gt;Line&lt;/SeriesType&gt;
&nbsp; &nbsp; &nbsp; &lt;SeriesName&gt;Second series - without their own axis&lt;/SeriesName&gt;
&nbsp; &nbsp; &nbsp; &lt;SeriesBrush&gt;Red&lt;/SeriesBrush&gt;
&nbsp; &nbsp; &nbsp; &lt;Datapoints&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;Datapoint&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Header1&gt;First point&lt;/Tooltip_Header1&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Header2 /&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Header3 /&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Color /&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;X&gt;1.48&lt;/X&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Y&gt;104.5&lt;/Y&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;/Datapoint&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;Datapoint&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Header1&gt;Second point&lt;/Tooltip_Header1&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Header2 /&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Header3 /&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Color /&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;X&gt;4.95&lt;/X&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Y&gt;244.46&lt;/Y&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;/Datapoint&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;Datapoint&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Header1&gt;Third point&lt;/Tooltip_Header1&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Header2 /&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Header3 /&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Color /&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;X&gt;6.64&lt;/X&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Y&gt;211.11&lt;/Y&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;/Datapoint&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;Datapoint&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Header1&gt;Fourth point&lt;/Tooltip_Header1&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Header2 /&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Header3 /&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Color /&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;X&gt;7.46&lt;/X&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Y&gt;157.94&lt;/Y&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;/Datapoint&gt;
&nbsp; &nbsp; &nbsp; &lt;/Datapoints&gt;
&nbsp; &nbsp; &lt;/Series&gt;
&nbsp; &lt;/MultiSeries&gt;
&lt;/Results&gt;
</pre>
</p>
<p>&nbsp;</p>
<p>&nbsp;<img alt="" src="/media/Canvas/CanvasMultipleAxesCharts.png" />
</p>
<p>&nbsp;</p>
<p>As you can see, the values on the y axis for both series are very different in range, which makes this chart quite difficult to read.
In order to make this chart easier to read you may consider adding an individual axis to one of the series, like on the example below:</p>
<p>&nbsp;</p>
<p>
<pre>&lt;Results&gt;
&nbsp; &lt;Title&gt;Multiple axes chart example&lt;/Title&gt;
&nbsp; &lt;ChartType&gt;Linear&lt;/ChartType&gt;
&nbsp; &lt;IsLegendVisible&gt;1&lt;/IsLegendVisible&gt;
&nbsp; &lt;xAxisType&gt;Linear&lt;/xAxisType&gt;
&nbsp; &lt;xAxisTitle&gt;The X Axis&lt;/xAxisTitle&gt;
&nbsp; &lt;xAxisBrush&gt;Black&lt;/xAxisBrush&gt;
&nbsp; &lt;yAxisType&gt;Linear&lt;/yAxisType&gt;
&nbsp; &lt;yAxisTitle&gt;The Y Axis&lt;/yAxisTitle&gt;
&nbsp; &lt;yAxisBrush&gt;Black&lt;/yAxisBrush&gt;
&nbsp; &lt;MultiSeries&gt;
&nbsp; &nbsp; &lt;Series&gt;
&nbsp; &nbsp; &nbsp; &lt;SeriesType&gt;Line&lt;/SeriesType&gt;
&nbsp; &nbsp; &nbsp; &lt;SeriesName&gt;First series - without their own axis&lt;/SeriesName&gt;
&nbsp; &nbsp; &nbsp; &lt;SeriesBrush&gt;Blue&lt;/SeriesBrush&gt;
&nbsp; &nbsp; &nbsp; &lt;Datapoints&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;Datapoint&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Header1&gt;First point a&lt;/Tooltip_Header1&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Header2 /&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Header3 /&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Color /&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;X&gt;0.23&lt;/X&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Y&gt;3.5&lt;/Y&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;/Datapoint&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;Datapoint&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Header1&gt;Second point a&lt;/Tooltip_Header1&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Header2 /&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Header3 /&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Color /&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;X&gt;2.46&lt;/X&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Y&gt;4.25&lt;/Y&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;/Datapoint&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;Datapoint&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Header1&gt;Third point a&lt;/Tooltip_Header1&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Header2 /&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Header3 /&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Color /&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;X&gt;3.42&lt;/X&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Y&gt;7.9&lt;/Y&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;/Datapoint&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;Datapoint&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Header1&gt;Fourth point a&lt;/Tooltip_Header1&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Header2 /&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Header3 /&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Color /&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;X&gt;7.84&lt;/X&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Y&gt;3.7&lt;/Y&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;/Datapoint&gt;
&nbsp; &nbsp; &nbsp; &lt;/Datapoints&gt;
&nbsp; &nbsp; &lt;/Series&gt;
&nbsp; &nbsp; &lt;Series&gt;
&nbsp; &nbsp; &nbsp; &lt;SeriesType&gt;Line&lt;/SeriesType&gt;
&nbsp; &nbsp; &nbsp; &lt;SeriesName&gt;Second series - with their own axis&lt;/SeriesName&gt;
&nbsp; &nbsp; &nbsp; &lt;SeriesBrush&gt;Red&lt;/SeriesBrush&gt;
<strong>&nbsp; &nbsp; &nbsp; &lt;IndividualAxis&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;Position&gt;Right&lt;/Position&gt;
&nbsp; &nbsp; &nbsp; &lt;/IndividualAxis&gt;</strong>
&nbsp; &nbsp; &nbsp; &lt;Datapoints&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;Datapoint&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Header1&gt;First point&lt;/Tooltip_Header1&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Header2 /&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Header3 /&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Color /&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;X&gt;1.48&lt;/X&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Y&gt;104.5&lt;/Y&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;/Datapoint&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;Datapoint&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Header1&gt;Second point&lt;/Tooltip_Header1&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Header2 /&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Header3 /&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Color /&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;X&gt;4.95&lt;/X&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Y&gt;244.46&lt;/Y&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;/Datapoint&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;Datapoint&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Header1&gt;Third point&lt;/Tooltip_Header1&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Header2 /&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Header3 /&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Color /&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;X&gt;6.64&lt;/X&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Y&gt;211.11&lt;/Y&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;/Datapoint&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;Datapoint&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Header1&gt;Fourth point&lt;/Tooltip_Header1&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Header2 /&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Header3 /&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Tooltip_Color /&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;X&gt;7.46&lt;/X&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;Y&gt;157.94&lt;/Y&gt;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;/Datapoint&gt;
&nbsp; &nbsp; &nbsp; &lt;/Datapoints&gt;
&nbsp; &nbsp; &lt;/Series&gt;
&nbsp; &lt;/MultiSeries&gt;
&lt;/Results&gt;
</pre>
</p>
<p>&nbsp;</p>
<p><img alt="" src="/media/Canvas/CanvasMultipleAxesCharts2.png" /></p>
<p>&nbsp;</p>
<p><strong><span style="color: #ff0000;">NOTE: the only possible values for the individual axis position are: "Left" (default) and "Right"</span></strong></p>
<p><strong><span style="color: #ff0000;">NOTE: you may add multiple individual axes, not just one</span></strong></p>
<p>&nbsp;</p>
<p>&nbsp;</p>