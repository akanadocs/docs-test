---
layout: page
title: Using Alert Auditing
description: Learn how to monitor system activity using alert notifications.
product: ag
category: learn
sub-nav-class: Auditing
weight:	7
type: page
nav-title: Using Alert Auditing
---

## Using Alert Auditing
Learn how to monitor system activity using alert notifications.

<a href="auditing_toc.html" class="button secondary">Auditing (Home)</a> <a href="../auditing/about_auditing.html" class="button secondary">About Auditing</a>  <a href="../auditing/using_security_auditing.html" class="button secondary">Using Security Auditing</a> <a href="../auditing/auditing_reference.html" class="button secondary">Auditing Reference</a>
<h5 class="stamp">Supported Platforms: 7.0 and greater.</h5>
### Table of Contents
<div id="toc-marker"></div>
* [Introduction](#introduction)
* [Activate Alert Auditing](#activate-alert-auditing)
* [Alert Audit Trail Functions](#alert-audit-trail-functions)
	* [Perform Alert Audit Trail Search](#perform-alert-audit-trail-search)
	* [Configure Alert Audit Trail Status](#configure-alert-audit-trail-status)
	* [View Alert Audit Trail Details](#view-alert-audit-trail-details)
	* [Export Alert Audit Trail](#export-alert-audit-trail)
	* [Schedule an Alert Audit Trail Job](#schedule-an-alert-audit-trail-job)

## Introduction
This topic describes alert auditing functions and tools that allow you to monitor system activity based on alert notifications.

Location: *Auditing > Alert Audit Trails* section of the *Policy Manger Management Console*.

## Activate Alert Auditing

To capture alert data, the alert auditing feature must be activated for each alert code definition you would like to monitor. To do this: 

1. Go to *Alerts > Alert Codes*.
2. Select **Add Alert Code** (for new alert code definitions), or **Modify Alert Code** (for existing alert code definitions). 
3. Enable (checked) or Disable (unchecked) the **Log Alert** option, and **Apply** to save your changes. 

<a href="#top">back to top</a>

## Alert Audit Trail Functions

### Perform Alert Audit Trail Search

1. Go to **Auditing > Alert Audit Trails**. Note that the initial search results display presents a listing of all audit trail data associated with the currently logged on user.
2. Enter the following search sriteria and click **Filter**. See [Audit Trail Search Criteria](../auditing/auditing_reference.html#audit-trail-search-criteria) for a description of each option.
  * **Enter Date Range** - Click **Start Date** or **End Date** to invoke a Calendar pop-up.
  * **Enter Time Range** - Manually enter times into the **Start** and **End** time fields using the 24-hour clock format (e.g., 20\:00\:01).
  * **Enter Action** - Refers to Add, Modify and Delete actions.
  * **Enter User** - The Username you want to audit.
  * **Audit Status** - Filter your search by Audit Trails that have been Observed, Unobserved or Both.

<a href="#top">back to top</a>

### Configure Alert Audit Trail Status 

Configure a system object to observe system activity and create a log (i.e., audit trail).

***Note***: You can configure an Unobserved system object to be Observed. Once a system object is configured as "Observed" the operation cannot be reversed.

1. Go to **Auditing > Alert Audit Trails**.
2. Perform an [Alert Audit Trail Search](#perform-alert-audit-trail-search). Each line item in search results corresponds to a system object.
2. Select the desired system object line item, and click the **Observed** checkbox.
3. Click **Apply**.

<a href="#top">back to top</a>

### View Alert Audit Trail

Configure a system object to observe system activity and create a log (i.e., audit trail).

Use the **Audit Trails Export Wizard** to export Audit Trail data to an XML file so that it can be archived or utilized in third-party statistical tools. Customize the data you are exporting to align with your business needs by running an Alert Audit Trail Search.

1. Perform an [Alert Audit Trail Search](#perform-alert-audit-trail-search). Each line item in search results corresponds to a system object.
2. Select the desired system object line item, and click the **Observed** check-box.
3. Click **Apply**.

<a href="#top">back to top</a>

### View Alert Audit Trail Details

To assist in configuring of your audit data, you can view a profile of a policy object using the **View Audit Trail** feature via the *Alert Audit Trails Summary* screen.

1. Go to **Auditing > Alert Audit Trails**.
2. Perform an [Alert Audit Trail Search](#perform-alert-audit-trail-search).
3. Select the desired system object line item, and click **View Audit Trail**. 
4. Refer to [Audit Trail Field Descriptions](../auditing/auditing_reference.html#audit-trail-field-descriptions) for descriptions of the displayed policy object information.
4. Click **Close**.

<a href="#top">back to top</a>

### Export Alert Audit Trail

Use the **Audit Trails Export Wizard** to export Audit Trail data to an XML file so that it can be archived or utilized in third-party statistical tools. Customize the data you are exporting to align with your business needs by running an Alert Audit Trail Search.

1. Go to **Auditing > Alert Audit Trails**.
2. Perform an [Alert Audit Trail Search](#perform-alert-audit-trail-search)
3. Click **Audit Trails Export Wizard**.
4. Enter a **Filename**. 
  ***Note***: *Exported files are always saved to the export directory of the current Policy Manager installation directory.*
5. (Optional) Check to **Append Date to Filename** (Date=current system date).
6. (Optional) Check **Overwrite File** if you want to overwrite an existing Audit Trail data file (if present).
7. (Optional) Check **Delete Exported Audit Trails** to remove gathered Audit Trail data from the Policy Manager system.
8. Click **Finish**, the **Close**. 

<a href="#top">back to top</a>

### Schedule an Alert Audit Trail Job

In addition to the [Export Alert Audit Trail](#export-alert-audit-trail) option, you can create a scheduled job that invokes a batch script that exports alert audit trail data.

Functionality is equivalent to the **Export** button in the *Monitoring > Audit Trails > Alert Audit Trails* section of the *Management Console*, except that it allows you to run the export program as a batch script synchronously. Export results are achieved when the program exits.

Filtering is optional. If any of the filtering criteria is not specified, the following is used:

* -filterStartDate - today's date
* -filterStartTime - 00\:00\:00
* -filterEndDate - today's date
* -filterEndTime - 23\:59\:59  

***Note***: *In case of error during export, a partially exported file does* ***not*** *get deleted.*

See [Schedule an Alert Audit Trail Job Usage Options](../auditing/auditing_reference.html#schedule-an-alert-audit-trail-job-usage-options) for a list of usage options.

<a href="#top">back to top</a>