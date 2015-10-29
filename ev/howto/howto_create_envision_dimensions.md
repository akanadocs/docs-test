---
layout: page
title: How do I Create and Manage Envision Dimensions
description: Learn how to create and/or manage Envision Dimensions.
product: ev
category: learn
sub-nav-class: How To
weight:	7
type: page
nav-title: How do I Create and Manage Envision Dimensions
---

## How do I Create and Manage Envision Dimensions
Learn how to create and/or manage Envision Dimensions.

<a href="../howto/envision_console_toc.html" class="button secondary">How To (Home)</a> <a href="../howto/howto_create_envision_datasets.html" class="button secondary">How Do I Create and Manage Envision Datasets</a> <br><br> <a href="../howto/howto_create_envision_metrics.html" class="button secondary">How Do I Create and Manage Envision Metrics</a> <a href="../howto/using_envision_dataset_settings.html" class="button secondary">How Do I Manage Envision Dataset Settings</a> <br><br> <a href="../howto/howto_create_envision_charts.html" class="button secondary">How do I Create and Manage Envision Charts</a> <a href="../howto/howto_create_envision_dashboards.html" class="button secondary">How do I Create and Manage Envision Dashboards</a>

<h5 class="stamp">Supported Platforms: 7.0 and greater.</h5>
### Table of Contents
<div id="toc-marker"></div>
* [Introduction](#introduction) 
* [Configuration Options](#configuration-options)
* [Configuration](#configuration)  


##Introduction

Dimensions are the properties of a Dataset you use to query or organize metrics by. They provide the basis for how many combinations of aggregations will be made.

**Notes**:  

* *At least one Dimension must be defined per Dataset.*
* *Each data set is created initially with a single default dimension, "timestamp."*
* *The "timestamp" Dimension will group all metrics collected with a timestamp within the same collection time interval.*
* *The "timestamp" Dimension can be deleted if you are not interested in time based aggregations but there must be at least one Date dimension for aggregation over time for the Dataset to function properly.*

<a href="#top">back to top</a> 

##Configuration Options

###Dataset Dimension Details

To view Dimension Details:

1. Click on the **Datasets** tab.
2. Click on a Dataset list (e.g. *Shared*).  
3. For the Dataset you wish to view Dataset Dimensions for, click on the **Dataset Name** at the top of the corresponding card.  
4. On the *Dataset Details* Menu displayed on the left side of the screen, click on **Dimensions**.  
All Dimensions for the currently displayed Dataset are shown.

###Dimension Types

  * The **ID-Name** type is a dual valued property with both an ID and a name. For example, if integrating with Policy Manager, a dimension may be an organization.  
    * An organization in Policy Manager has an ID and a descriptive name.
    * The engine will group metrics using the organization’s ID. But when displaying choices of organizations in the Envision UI, the organization names will be displayed to the user (since they won’t likely know the IDs).
  * The **Location** type is a property that can reference a city, state, zip code, country, or geolocation (latitude/longitude).

###Dimension Defaults
  * If a "Default" is designated for a Dimension, then any data set row that does not have the dimension will have the dimension added with that default value.
  * The default value must be of the same type as the dimension.

###"Required" Dimensions
If the dimension is classified as "Required," any collector of data *must* include the dimension or the data will not aggregate correctly and charts will likely not work well.

<a href="#top">back to top</a> 

##Configuration

###Add A New Dimension

1. Click on the **Datasets** tab.
2. Click on a Dataset list (e.g. *Shared*).  
3. For the Dataset you wish to view Dataset Dimensions for, click on the **Dataset Name** at the top of the corresponding card.  
4. On the *Dataset Details* Menu displayed on the left side of the screen, click on **Dimensions**.  
All Dimensions for the currently displayed Dataset are shown.
5. Click the **New Dimension** button in the upper right corner of the screen.  
6. Enter a **Name** and  **Description** for the new Dimension.
7. Use the **Type** drop-down menu to assign a type to the new Dimension.
8. (Optional) Specify a **Default**.
9. (Optional) Click the **Mark as Required** checkbox.
10. Click **Save**.  
The new Dimension is saved and a corresponding row will be appended to the Dimensions list on the *Details* page for this Dataset.
11. (Optional) Click **Cancel** to exit without saving. 

###Modify Dimension

1. Click on the **Datasets** tab.
2. Click on a Dataset list (e.g. *Shared*).  
3. For the Dataset you wish to view Dataset Dimensions for, click on the **Dataset Name** at the top of the corresponding card.  
4. On the *Dataset Details* Menu displayed on the left side of the screen, click on **Dimensions**.  
All Dimensions for the currently displayed Dataset are shown.
5. For the Dimension you wish to modify, click the **Functions** pull-down menu, located at the far right of the corresponding row in the Dimensions list on the *Details* page for the Dataset.
6. (Optional) Select **Edit**.  
The *Edit Dimension* pop up window is displayed where you can modify the Dimension's Description, Type, Group, Default and whether or not the Dimension is marked as "Required."
7. (Optional) Select **Delete**.  
The Dimension is removed from the system.

<a href="#top">back to top</a> 