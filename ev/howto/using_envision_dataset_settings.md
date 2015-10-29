---
layout: page
title: How Do I Manage Envision Dataset Settings
description: Learn how to manage aggregation and storage interval settings for a dataset.
product: ev
category: learn
sub-nav-class: How To
weight:	9
type: page
nav-title: How Do I Manage Envision Dataset Settings
---

## How Do I Manage Envision Dataset Settings
Learn how to manage aggregation and storage interval settings for a dataset.

<a href="../howto/envision_console_toc.html" class="button secondary">How To (Home)</a> <a href="../howto/howto_create_envision_datasets.html" class="button secondary">How Do I Create and Manage Envision Datasets</a> <br><br> <a href="../howto/howto_create_envision_dimensions.html" class="button secondary">How Do I Create and Manage Envision Dimensions</a> <a href="../howto/howto_create_envision_metrics.html" class="button secondary">How Do I Create and Manage Envision Metrics</a> <br><br> <a href="../howto/howto_create_envision_charts.html" class="button secondary">How do I Create and Manage Envision Charts</a> <a href="../howto/howto_create_envision_dashboards.html" class="button secondary">How do I Create and Manage Envision Dashboards</a>

<h5 class="stamp">Supported Platforms: 7.0 and greater.</h5>
### Table of Contents
<div id="toc-marker"></div>
* [Introduction](#introduction)  

##Introduction

The Settings section of a Dataset's *Details* page lists all the aggregation and storage intervals for the Dataset.

It is important to think about how these intervals will limit the ability to make charts. It is not possible to create a chart with data points more granular than the aggregations calculated. Thus, in the example pictured below, you could not create a chart that shows metrics for shoe orders per minute or day.

![](images/DatasetSettings.jpg)

**Notes**: 

* *Envision supports aggregating metrics every minute, hour, day, week, month, and/or year.*
* *For each of these aggregation sets you can also specify how long the results should be held in the data store, done by selecting the a unit of time (minutes, hours, days, weeks, months, years) and a number of units.*
  * *In the example pictured above, the metrics will be aggregated on a weekly and monthly basis.*
  * *The weekly results will be held in the data store for 1 year and the monthly results will be held in the data store for 5 years.*

<a href="#top">back to top</a> 

