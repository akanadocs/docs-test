---
layout: page
title: How Do I Create and Manage Envision Dashboards
description: Learn how create and manage Envision Dashboards as well as how to view them in Live Mode.
product: ev
category: learn
sub-nav-class: How To
weight:	11
type: page
nav-title: How Do I Create and Manage Envision Dashboards
---

## How Do I Create and Manage Envision Dashboards
Learn how create and manage Envision Dashboards as well as how to view them in Live Mode.

<a href="../howto/envision_console_toc.html" class="button secondary">How To (Home)</a> <a href="../howto/howto_create_envision_datasets.html" class="button secondary">How Do I Create and Manage Envision Datasets</a> <br><br> <a href="../howto/howto_create_envision_dimensions.html" class="button secondary">How Do I Create and Manage Envision Dimensions</a> <a href="../howto/howto_create_envision_metrics.html" class="button secondary">How Do I Create and Manage Envision Metrics</a> <br><br> <a href="../howto/using_envision_dataset_settings.html" class="button secondary">How Do I Manage Envision Dataset Settings</a> <a href="../howto/howto_create_envision_charts.html" class="button secondary">How do I Create and Manage Envision Charts</a> 


<h5 class="stamp">Supported Platforms: 7.0 and greater.</h5>
### Table of Contents
<div id="toc-marker"></div>
* [Introduction](#introduction) 
* [Configuration Options](#configuration-options)
* [Configuration](#configuration)  


##Introduction

Working charts are collected and organized for presentation to Envision users in **Dashboards**. 

* A Dashboard is simply a web page that will display 0 or more functional Charts.
* A Dashboard is **not for editing** Charts, but rather for **displaying** their **results**.

**Note**:

* If a Chart includes interactive Filters, those filters will be functional from within the Dashboard.

<a href="#top">back to top</a> 


##Configuration Options

This section provides summary descriptions of all elements included in the various screens included under the Envision Console's *Dashboards* tab.

###The Dashboards Tab Initial Screen
When you click on the *Dashboards* tab, you are presented with:

* A drop-down menu presenting all Dashboard marked as "Favorites" available for selection.  Selecting a Dashboard here will display that Dashboard in *Live Mode*. 
* A **Configure** button which, when clicked, takes you to the *Dashboards Configuration* screen. 

###Dashboards in Live Mode
A Dashboard accessed via the drop-down (i.e. "Favorites") menu that's displayed upon initial access of the *Dashbaords* tab is presented in *Live Mode* where: 
 
  * Charts cannot be re-positioned or resized. 
  * If a chart was configured to display filters to users, the magnifying glass icon in the upper right corner of the chart can be selected to access those filters.
  * Changes to values and filters can be reflected in the display by clicking the **Update** button.

###The Dashboards Configuration Screen
The *Dashboards Configuration* screen, accessed by clicking on the **Configure** button displayed upon initial access of the *Dashboards* tab, contains the following elements:  

* Three Dashboards **Folders**:  
  * **My** - Dashboards that the currently logged in user has created.
  * **Shared** - Dashboards that others have created and made available to the user.
  * **Favorites** -  Dashboards (**created by** either the currently logged in user or other users) collected by the current user into a single list. Favorite Dashboards are included in the drop-down menu displayed upon initial access of the *Dashboard* tab.   
* A *Filter By* section where you can enter a **Search** term by which to filter (i.e. limit) the dashboards that are displayed in the currently selected folder.   
* The list of currently configured Dashboards, as prescribed by the folder you have selected and the filter you have applied (if any), represented as **Dashboard Cards**.  
* The **New Dashboard** button which, when clicked, launches a *New Dashboard* pop up window.

###Dashboard Cards on the Dashboards Configuration Screen
Each Dashboard listing displayed on the *Configure Dashboards* Screen is represented by a "Dashboard card."  Each card includes the following elements:

* **Dashboard Name** which is also a link that, when clicked on, takes you to that Dashboard (non-live mode).
* **Dashboard Owner** and **Sharing Status** (i.e. public or private)
* **Dashboard Functions Drop-Down menu** (edit, copy, (un)favorite and delete)

###Dashboards Accessed from the Dashboards Configuration Screen
When you access a Dashboard by clicking on a **Dashboard Name** on a *Dashboard Card* in the *Configure Dashboards* section of the *Dashboards* tab, the following actions are available:

* **Resize** charts on the Dashboard
* **Position** charts on the Dashboard
* **Filter** and **Update** charts on the Dashboard
* **Export** a chart to either the printer or as a file (as a png, jpg, pdf or svg vector image)

<a href="#top">back to top</a> 


##Configuration

###Create a New Dashboard

1. Click the **Dashboards** tab.
2. Click **Configure**.  
3. On the *Configure Dashboards* Screen, click **New Dashboard**.
4. On the *New Dashboard* pop-up, enter a **Name** and **Description** for the Dashboard.
5. From the **Sharing** drop-down menu select what type of sharing to assign to the Dashboard.  
**Note**: *When a dashboard is shared users who are not the author can view the* ***chart*** *and place them on dashboards but* ***not change the dashboard itself***. 
6. (Optional) Click the **Marked as Favorite** checkbox to designate this as a "Favorite" Dashboard.
7. Click **Save**.  
The Chart is saved and card for it will now appear in the *My* folder under Charts.
8. (Optional) Click **Cancel** to exit without saving.


###Add a Chart to a Dashboard

1. Click the **Dashboards** tab.
2. Click **Configure**.  
3. On the *Configure Dashboards* Screen, click on the **Dashboard Name** on the **Dashboard Card** for the Dashboard to which you want to add a chart.
4. On the **Dashboard Configuration** Screen, click **Add Chart**.  
You are taken to a list of charts (organized into three categories: My, Favorites and Shared), each of which is represented by a "Chart Card."
5. (Optional) Preview a chart to confirm whether its the one you want to add to your dashboard by clicking on the **Preview** button on the corresponding Chart Card.  
**Note**: *You can add a chart to your Dashboard from the preview screen by clicking the* ***Add to Dashboard*** *button in the upper right.*
6. Click the **Add** button on the Chart Card(s) for the chart(s) you wish to add to your dashboard.
7. When finished adding charts to your dashboard, click the **left-pointing arrow** to the left of the Dashboard name in the upper left of the Screen.

###Resize and Re-Position Charts added to a Dashboard

1. Follow steps 1 through 7 of the previous section, "Add a Chart to a Dashboard."
2. (Optional) Once returned to the Dashboard Screen, resize a chart by grabbing its bottom right corner and dragging it to the desired size.
3. (Optional) Re-position a chart by grabbing its title bar and dragging-and-dropping it to the desired position on the Dashboard.
4. Click **Save**.

###Add Multiple Instances of the Same Chart to a Dashboard (But with Different Filters Applied)

Create, for example, a chart that displays a single merchant’s number of orders over time but for different merchants on a single dashboard.

1. Follow steps 1 through 7 of the previous section, "Add a Chart to a Dashboard."
2. Repeat the steps again so that there are now two instances of the same chart included in your Dashboard.
3. On the *Configure Dashboards* Screen, click on the **Dashboard Name** on the **Dashboard Card** for the Dashboard you want to configure multiple instance of the same chart for.
4. On the **Dashboard Configuration** Screen, click the **actions menu** in the upper right of the chart(s) you want to apply filters to, and select **Filter**.
5. Apply your desired filter and click **Save** and then **Update**. 

<a href="#top">back to top</a> 

