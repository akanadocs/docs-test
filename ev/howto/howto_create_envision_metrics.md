---
layout: page
title: How do I Create and Manage Envision Metrics
description: Learn how to create and/or manage Envision Metrics.
product: ev
category: learn
sub-nav-class: How To
weight:	8
type: page
nav-title: How do I Create and Manage Envision Metrics
---

## How do I Create and Manage Envision Metrics
Learn how to create and/or manage Envision Metrics.

<a href="../howto/envision_console_toc.html" class="button secondary">How To (Home)</a> <a href="../howto/howto_create_envision_datasets.html" class="button secondary">How Do I Create and Manage Envision Datasets</a> <br><br> <a href="../howto/howto_create_envision_dimensions.html" class="button secondary">How Do I Create and Manage Envision Dimensions</a> <a href="../howto/using_envision_dataset_settings.html" class="button secondary">How Do I Manage Envision Dataset Settings</a> <br><br> <a href="../howto/howto_create_envision_charts.html" class="button secondary">How do I Create and Manage Envision Charts</a> <a href="../howto/howto_create_envision_dashboards.html" class="button secondary">How do I Create and Manage Envision Dashboards</a>

<h5 class="stamp">Supported Platforms: 7.0 and greater.</h5>
### Table of Contents
<div id="toc-marker"></div>
* [Introduction](#introduction) 
* [Configuration Options](#configuration-options)
* [Configuration](#configuration)  


##Introduction

Metrics are the properties of a data set that can be measured, aggregated, and compared.

**Notes**:  

* *Each data set is created initially with a single default metric, "RequestCount."*
* *The "RequestCount" metric is the measure for the number of transactions, or orders in this example.*
* *The "RequestCount" metric can be deleted.*

<a href="#top">back to top</a> 

##Configuration Options

###Dataset Metric Details

To view Metric Details:

1. Click on the **Datasets** tab.
2. Click on a Dataset list (e.g. *Shared*).  
3. For the Dataset you wish to view Dataset Metrics for, click on the **Dataset Name** at the top of the corresponding card.  
4. On the *Dataset Details* Menu displayed on the left side of the screen, click on **Metrics**.  
All Metrics for the currently displayed Dataset are shown.

###Metric Types

  * Count
  * Time
  * Size
  * Number
  * Currency

###Metric Aggregations

* Average
* Sum
* Minimum
* Maximum
* First
* Last

<a href="#top">back to top</a> 

##Configuration

###Add A New Dimension

1. Click on the **Datasets** tab.
2. Click on a Dataset list (e.g. *Shared*).  
3. For the Dataset you wish to view Dataset Metrics for, click on the **Dataset Name** at the top of the corresponding card.  
4. On the *Dataset Details* Menu displayed on the left side of the screen, click on **Metrics**.  
All Metrics for the currently displayed Dataset are shown.
5. Click the **New Metric** button in the upper right corner of the screen.  
6. Enter a **Name** and  **Description** for the new Metric.
7. Use the **Type** drop-down menu to assign a type to the new Metric.
8. Click on the **Aggregations** pull-down menu button to reveal a list of possible aggregation types to assign to the new Metric.  Multiple selections are possible.
8. (Optional) Specify a **Default**.
9. (Optional) Click the **Mark as Required** checkbox.
10. Click **Save**.  
The new Metric is saved and a corresponding row will be appended to the Metrics list on the *Details* page for this Dataset.
11. (Optional) Click **Cancel** to exit without saving. 

###Modify Metric

1. Click on the **Datasets** tab.
2. Click on a Dataset list (e.g. *Shared*).  
3. For the Dataset you wish to view Dataset Metric for, click on the **Dataset Name** at the top of the corresponding card.  
4. On the *Dataset Details* Menu displayed on the left side of the screen, click on **Metrics**.  
All Metrics for the currently displayed Dataset are shown.
5. For the Metric you wish to modify, click the **Functions** pull-down menu, located at the far right of the corresponding row in the Dimensions list on the *Details* page for the Dataset.
6. (Optional) Select **Edit**.  
The *Edit Metric* pop up window is displayed where you can modify the Metric's Description, Type, Group, and assigned Aggregations.
7. (Optional) Select **Delete**.  
The Metric is removed from the system.

<a href="#top">back to top</a> 