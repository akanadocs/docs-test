---
layout: page
title: How Do I Create and Manage Envision Charts
description: Learn how to create and/or manage Envision Charts.
product: ev
category: learn
sub-nav-class: How To
weight:	10
type: page
nav-title: How Do I Create and Manage Envision Charts
---

## How Do I Create and Manage Envision Charts
Learn how to create and/or manage Envision Charts.

<a href="../howto/envision_console_toc.html" class="button secondary">How To (Home)</a> <a href="../howto/howto_create_envision_datasets.html" class="button secondary">How Do I Create and Manage Envision Datasets</a> <br><br> <a href="../howto/howto_create_envision_dimensions.html" class="button secondary">How Do I Create and Manage Envision Dimensions</a> <a href="../howto/howto_create_envision_metrics.html" class="button secondary">How Do I Create and Manage Envision Metrics</a> <br><br> <a href="../howto/using_envision_dataset_settings.html" class="button secondary">How Do I Manage Envision Dataset Settings</a> <a href="../howto/howto_create_envision_dashboards.html" class="button secondary">How do I Create and Manage Envision Dashboards</a>


<h5 class="stamp">Supported Platforms: 7.0 and greater.</h5>
### Table of Contents
<div id="toc-marker"></div>
* [Introduction](#introduction) 
* [Configuration Options](#configuration-options)
* [Configuration](#configuration)  


##Introduction

Once a dataset has been created, a **Chart** can be created that will display the metrics collected for the data set. 

**Notes**:

* *There are several kinds of Charts that are available in Envision. This page refers to concepts common to all charts.*
* *The options specific to each chart and examples of their use can be found in [Envision Appendix](http://http://docs.akana.com/docs-test/ev/envision_reference/env_appendix.html).*

<a href="#top">back to top</a> 


##Configuration Options

This section provides *summary* descriptions of all elements included in the Envision Console's Charts tab.  For *detailed* descriptions, refer to [Creating a Chart](http://docs.akana.com/docs-test/ev/envision_reference/env_create_chart.html).

###The Charts Tab
When you click on the *Charts* tab, you are presented with following elements:

* Three charts **Folders**: 
  * **My** - Charts that the currently logged in user has created.
  * **Favorites** -  Charts that others have created and made available to the currently logged in user.
  * **Shared** - Chats that have been created by any user and have been designated as "Public."  
* The "**Filter** Displayed Charts By" drop-down menu
* The list of currently configured charts, as prescribed by the folder you have selected and the filter you have applied (if any), represented as **chart cards**.
* The **New Chart** button which, when clicked, launches a *New Chart* pop up window.

###Chart Cards
Each chart listing displayed on the *Charts* tab is represented by a "chart card."  Each card includes the following elements:

* **Chart Name** which is also a link that, when clicked on, takes you to that chart's *Configuration Details* page.
* **Chart Owner** and **Sharing Status** (i.e. public or private)
* **Chart Functions Drop-Down menu** (edit, copy, (un)favorite and delete)
* Chart **Preview** button which, when clicked on, takes you to a page where the chart is rendered reflecting current configuration selections.  From this page you can print the chart as well as download it in a number of formats.

###Chart Configuration Details Page
When you click on a *Chart Name* as it appears in the upper left of a *Chart Card*, you are taken to the *Chart Configuration Details* Screen, which includes the following elements:

* **Tabs** - When a single chart consists of multiple charts overlayed, each constituent chart's configuration appears in its own tab.

* **Datasets**  
  * Select, by scrolling or searching, which **datasets** are included in the chart 
  * Select over what time intervals (aka **aggregation**) the datasets will be rendered on the chart.
  * If the selected data set has more than one dimension, select one or more dimension by which the chart data should be **grouped** (Binding, Container, Contract, etc.).
  * Configure one or more optional **filters** to apply to the selected datasets.
* **Charts**  
  * Select chart **type** (bar, column, line, pie etc.) and **layout** (available selections determined by what type was selected).  The types of charts and their variations are listed in [Envision Appendix](http://docs.akana.com/docs-test/ev/envision_reference/env_appendix.html).
  * Choose whether uses can **drill down** into the constituent data points of this chart, and if so, for which axis' data.  
Used when multiple charts are combined in overlay combinations.
  * Determine whether a user will be able to select a visible area of the chart and **zoom** in on it.
  * **Customize More**, where you can assign select a pre-configured color-scheme to apply to the chart.
* **X-Axis**  
  * From a list of dimensions and metrics included in the selected dataset, choose one whose **values** will be rendered along the X-axis of the chart.
  * Under **Title**, enter a label for the X-axis.
  * If not using a date dimension, an optional **prefix** and **suffix** can be added to each tick mark label on the X-axis.
* **Series** - Define one or more data series that are plotted along the Y-axis of the chart.  
  * Configure one or more optional **filters** to apply to the selected data series.
  * From a list of metrics included in the selected dataset, choose one whose **values** will be rendered along the Y-axis of the chart.
  * From a list of aggregations that were chosen for the metric in the data set definition, choose an **Aggregation** operator (sum, min, max, average etc.).
  * Select how each series included along the Y-axis of the chart will be **Label**ed.
  * Under **Title**, enter a label for the Y-axis.
* **Add Data Series** - Add an additional Series element to the page where you can define an additional data series to be rendered along the Y-axis of the chart.

<a href="#top">back to top</a> 


##Configuration

###Create a Chart Card

1. Click the **Charts** tab.
2. Click **New Chart**.  
3. On the *New Chart* pop-up, enter a **Name** and **Description** for the Chart.
5. From the **Sharing** drop-down menu select what type of sharing to assign to the Chart.  
6. (Optional) Click the **Marked as Favorite** checkbox to designate this as a "Favorite" Chart.
7. Click **Save**.  
The Chart is saved and card for it will now appear in the *My* folder under Charts.
8. (Optional) Click **Cancel** to exit without saving.

###Edit Chart Name, Description and Sharing Designation

1. Click the **Charts** tab.
2. For the chart you wish to edit, click the **Chart Functions** drop-down menu (located in the upper right corner of each Chart Card).  
The *Edit Chart* pop up is displayed.
3. (Optional) Modify the Chart's **Name** and/or **Description**.
4. (Optional) Use the **Sharing** drop-down menu change the designation.  Choose between **Public** or **Private**.
5. Use the check box to toggle or untoggle whether the Chart appears in the **Favorite**s folder.
6. Click **Save**.
7. (Optional) Click **Cancel** to exit the *Edit Chart* pop up without saving.

###Configure a Chart

1. Click on a *Chart Name* as it appears in the upper left of a *Chart Card*.  
The *Chart Configuration Details* Screen is displayed.
2. Select which **Dataset** the chart will be drawn from and over what time intervals said data are rendered as well as how it is grouped and how it is filtered.
3. Select Chart **Type** (in what format the data will be rendered, eg. bar, column, etc.) and layout, and then whether users will be able to drill down into the constituent data (overlaid charts only) or zoom in.
4. Choose which of the selected dataset's dimensions or metrics value will be rendered along the Chart's X-axis and label it.
5. Choose one or more metrics from the currently selected dataset to render along the Chart's Y-axis as well as how said metric will be filtered, aggregated (sum, min, max, etc.) and labeled.
6. (Optional) Add an additional tab to create an additional overlay chart that can be configured following steps 2 through 5 above.
7. (Optional) **Edit the Name** of constituent chart included in an Overlay chart by clicking on the **Pencil Icon** on the corresponding tab.
8. Click **Save**.
9. (Optional) Click **Cancel** to exit the *Chart Configuration Details* Screen without saving any of your entered changes.

<a href="#top">back to top</a> 