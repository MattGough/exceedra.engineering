---
layout: post
title:  "What xml do we send back to the DB"
author: "jakub siuda"
exerpt: >
 XML sent to DB from app for vertical grids
---


### Data in

{% highlight xml %}
<Results>                   <!-- Standard DB wrapper-->
    <RootItem>              <!-- Root of vertical grid data -->
        <Item_Idx />        <!-- Unique Item ID-->
        <Item_Type />       <!-- Item type-->
        <Attributes>        <!-- Rows of horizontal data -->
           <Attribute>      <!-- Column inside a row-->
            <ColumnCode/>   <!-- Unique column code -->
            <Value />       <!-- Single value/selected item -->
            <Values>        
                <Value />   <!-- Multiple values/selected items -->
            </Values>
            <IsTooltipVisible></IsTooltipVisible>   <!-- Allowed values: 0 or 1. Toggles tooltips for multi-selectable drodpowns that show the number of selected items, total items and lists all the selected items -->
        </Attributes>   
    </RootItem>         
</Results>     
{% endhighlight %}           
