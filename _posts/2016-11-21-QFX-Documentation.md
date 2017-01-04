---
layout: post
title:  "QFX Documentation"
author: "cosima calder"
exerpt: >
  QFX is Exceedra's custom algorithm for predicting the best statistical model to be used on a data set. The complete QFX package uses algorithms and statistical analysis to accurately forecast sales and finances.
---


### QFX Documentation
## Posted by:  on  Monday, 21 Nov 2016 Views: xxx &nbsp;

#How QFX works and why forecasts look how they do. 

**Overview **

QFX is Exceedra's custom algorithm for predicting the best statistical model to be used on a data set. The complete QFX package uses algorithms and statistical analysis to accurately forecast sales and finances.

QFX runs overnight creating a (base volume) forecast for each listing, QFX can also be run through the app manually by the user. The forecasting screen shows which pattern, model and parameters QFX has selected for existing (saved) forecasts. You can also check this while forecasting by clicking calibrate once you have calculated the forecast with QFX.

From a high level QFX consists of two big steps:

·&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; When given a set of historic data points, QFX will analyse the data to determine which Pattern the data follows. 

·&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Combining the Pattern with further data analysis, QFX will then determine which Statistical model will best forecast the data. 

The current data Patterns we analyse for are: Dormant, Seasonal, Burst, Patchy, Sparse, Launch or Regular.

The current seasonal models we analyse for are: Moving Average, Full-Year Moving Average, Single Exponential smoothing, Holt-Winters Growth and Same As Last Year.

We also allow users to generate a Basic Forecast (which requires a starting value and a % growth per year) but this can only be used by a user in the App, QFX will not use this model in its automated run.

We expose a configuration file to each client. This allows them (us) to change which models are chosen for certain data patterns, or the boundaries for which data patterns will be selected. For example, the config item NumberOfRegularPoints is an integer that dictates how many points of data are required for data to be considered Regular. By default this value is 39 but if a client desired it can be changed. It is unlikely that most of the config ever needs to or should be changed.

The 'number of weeks per year' (npy) default is set to 52. If the clients business year has a more common npy, for example 53, this value should be entered into the client config. The most appropriate value for npy is the most common number of weeks per year, however if it is unclear what this is, the upper limit is preferable. If the config npy is set to 52 (lower limit), all years with 53 weeks (upper limit), will _currently _show 0 in the 53rd week.

The horizon is another config value that will often be changed for a client - this represents how far in the future QFX will forecast.

&nbsp;

&nbsp;**Patterns**

The first step in determining the forecast of a dataset is studying the pattern of the actuals, to deduce the 'type' of data being forecasted. 

Types of patterns searched for are; Dormant, Seasonal, Burst, Patchy, Sparse, Launch or Regular. 

Dormant and seasonal patterns are the most simple data patterns and checked for first. They are defined as follows;

-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **Dormant: **If all last year data is zero.

-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **Seasonal:**

o&nbsp;&nbsp; If there is more than 52 weeks of data **and**** **the data has been defined as seasonal.

o&nbsp;&nbsp; A series of checks are run on the data to test whether it is a seasonal pattern, for example; 

-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Seasonal 'match' greater than defined min. 

-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Number of data points real data points less than defined max.

-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; These defined values are set in the configuration file on setup. Default example; min seasonal match = 77%, max seasonal actives = 39 (out of 52).

The remaining patterns require more complex analysis. Looking at data characteristics such as periods of no data (when, duration, frequency), start and end week data, and so on. Constants stated in the configuration set the limits of the defining characteristics.

-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **Burst**: There is only one 'block' of data in the last year but it has not been classed as seasonal.

-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **Patchy: **There is more than a year of data overall but lots of sporadic periods of no data.

-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **Sparse: **There is very little non zero data in the data history.

-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **Launch:** First week data is zero and one data non-seasonal data 'block'.

-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **Regular: **if data has not been characterized as any of the above and has the more than the minimum number of regular point (as again defined in the configuration), the pattern is set as regular.** **

For each listing QFX takes the pattern and, using this and other variables, selects the most accurate model for forecasting.

&nbsp;

## **&nbsp;****Models**

All of our models exclude seasonality components as QFX adds the 'seasonal profile' to the output forecast. Identified seasonality in the data is removed before modelling and seasonal components are re-introduced at a later stage in the calculation using a multiplicative method.

To determine the best model QFX uses minimizes error between actual data and the forecast of that data. For error detection QFX uses the root mean square value (RMS) and the mean absolute percentage error (MAPE), both are measures of prediction accuracy of a forecasting method in statistics. Once models are chosen the parameters used are calibrated again to refine and achieve highest accuracy.

-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **Moving Average, Full-Year Moving Average: **Both of these models follow a similar method and algorithm, one studying full year. The parameters for these models are the number of terms.

o&nbsp;&nbsp; Associated pattern/s: seasonal, launch.

-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **Single Exponential Smoothing (SES): **SES is used as a basic smoothing model and has no trend component (neither multiplicative nor additive). SES uses a refined smoothing component, alpha, to most accurately forecast.

o&nbsp;&nbsp; Associated pattern/s: regular.

-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **Holt-Winters Growth: **The Holts exponential smoothing model we use has an additive trend component, a smoothing parameter and a trend parameter are used to refine the model.

o&nbsp;&nbsp; Associated pattern/s: regular.

-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **Same As Last Year: **data is replicated a year (or time period) into the future.

o&nbsp;&nbsp; Associated pattern/s: sparse.

&nbsp;

### **Seasonal Profile**

Seasonality is the last phase of forecasting and applied onto the forecast (created by the best fit model). The seasonal profile is found from historic data and multiplicatively applied to the forecast.

&nbsp;

**Outliers**

QFX handles outliers defined by the database (data points during promotional periods are flagged as outliers) internally for calculations;

·&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; These are used during pattern matching and used/ignored in various circumstances during model selection and when applying seasonality.

You can manually add outliers on the forecasting screen without changing sales history.

When forecasting QFX replaces outlier values with an interpolation value of the surrounding points, this gives are more accurate representation of the true value before, for example, a promotion, hence producing a more accurate baseline forecast.

**&nbsp;**

**Forecast Visual Analysis**

**&nbsp;****Forecast questions answered:**

* **Why do some forecasts start at different points?**

Different models forecast data in different ways. Depending on the model chosen by QFX, the forecast will start at different distances from the first actual. Moving average models will start forecasting 'x' number of weeks after the first week of actuals as this is enough data for it to start forecasting. Same as last year models, however, will start the forecast at the current date, as before the seasonal profile is applied this model is effectively copying the last year of data forward until the horizon.

Data in the past baseline forecast cells can be used as an accuracy measure for the client, to compare the actuals to what was forcasted for that week/month by QFX, and will help the future forecast be as accurate as possible.

&nbsp;

* **Why are some forecasts flat?**

In the absence/uniformity of a seasonal profile some QFX models (eg. moving average) will forecast a flat baseline. This can happen, for example,&nbsp;in&nbsp;new 'LAUNCH' products where there is less data than the seasonal profile limit allows (less than ¾ year of data), so a uniform profile is applied hence a flat weekly baseline. 

This limit is set in the config and can be 'reduced' but would lead to issues such as;

-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The missing data weeks from the past year would be forecasted as zeros – this is not an accurate forecast as it's a new product not sparse.

-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The whole forecast would be have a lower total base than truly expected as the forecast has added zeros where there shouldn't be/won't be in the future.

&nbsp;

If the forecast is flat, this is the most accurate forecast QFX can provide with the given data. The forecast will continue to improve as more actuals become available and a seasonal profile can be created and a more complex model can be applied.

© cosima calder, 2016 

 | 

  