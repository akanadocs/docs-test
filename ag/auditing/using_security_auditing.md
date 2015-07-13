---
layout: page
title: Using Security Auditing 
description: Learn how to use auditing functions and tools to monitor system activity based on security policy-related notifications.
product: ag
category: learn
sub-nav-class: Auditing
weight:	8
type: page
nav-title: Using Security Auditing
---

## Using Security Auditing
Learn how to use auditing functions and tools to monitor system activity based on security policy-related notifications.

<a href="auditing_toc.html" class="button secondary">Auditing (Home)</a> <a href="../auditing/about_auditing.html" class="button secondary">About Auditing</a>  <a href="../auditing/auditing_reference.html" class="button secondary">Auditing Reference</a>  <a href="../auditing/using_alert_auditing.html" class="button secondary">Using Alert Auditing</a>
<h5 class="stamp">Supported Platforms: 7.0 and greater.</h5>
### Table of Contents
<div id="toc-marker"></div>
* [Introduction](#introduction)
* [Enable Security Auditing](#enable-security-auditing)
* [Security Audit Trail Functions](#security-audit-trail-functions)
	* [Perform Security Audit Trail Search](#perform-security-audit-trail-search)
	* [Configure Security Audit Trail Status](#configure-security-audit-trail-status)
	* [View Security Audit Trail Details](#view-security-audit-trail-details)
	* [Export Security Audit Trail](#export-security-audit-trail)
	* [Schedule a Security Audit Trail Job](#schedule-a-security-audit-trail-job)


## Introduction
This topic describes security auditing functions and tools to monitor system activity based on security policy-related notifications. 

Location: *Auditing > Security Audit Trails* section of the *Policy Manger Management Console*.

<a href="#top">back to top</a>

### Enable Security Auditing
The availability of security audit trail data is based on a combination of standard system actions that are automatically logged and whether you configured specific security operations to audit activity (e.g., security policy component). 

This is accomplished by enabling **Log Alert** in an Alert Code (for Alert Audit Trails), and enabling **Generate Audit Data** options in the Policy Manager security policy types (i.e., Authentication, Authorization, etc.).

<a href="#top">back to top</a>

### Perform Security Audit Trail Search

1. Go to **Auditing > Security Audit Trails**  
***Note***: *The initial search results display presents a listing of all audit trail data associated with the currently logged on user.*
  
2. Enter the following Search Criteria and then click **Filter**. (see [Audit Trail Search Criteria](../auditing/auditing_reference.html#audit_trail_search_criteria) for details).
  * **Enter Date Range** - Click **Start Date** or **End Date** to invoke a Calendar pop-up.
  * **Enter Time Range** - Manually enter times into the **Start** and **End** time fields using the 24-hour clock format, e.g. 20\:00\:01.
  * **Enter Action** - Refers to Add, Modify and Delete actions.
  * **Enter User** - The Username you want to audit.
  * **Audit Status** - Filter your search by Audit Trails that have been Observed, Unobserved or Both.

<a href="#top">back to top</a>

### Configure Security Audit Trail Status

Configure a system object to observe system activity and create a log (i.e., audit trail).

***Note***: You can configure an Unobserved system object to be Observed. Once a system object is configured as "Observed" the operation cannot be reversed.

1. Go to **Auditing > Security Audit Trails**
2. Perform a [Security Audit Trail Search](#perform-security-audit-trail-search) to obtain a list of search results.
3. Select a desired system object line item, and click the **Observed** check-box.
4. Click **Apply**.

<a href="#top">back to top</a>

### View Security Audit Trail Details

1. Go to **Auditing > Security Audit Trails**.
2. Perform a [Security Audit Trail Search](#perform-security-audit-trail-search) to obtain a list of search results.
3. Select a desired system object line item, and click **View Audit Trail**. The *View Audit Trail* pop-up displays. Refer to [Audit Trail Field Descriptions](../auditing/auditing_reference.html#audit-trail-field-descriptions) for more information. 
4. Click **Close**.

<a href="#top">back to top</a>

### Export Security Audit Trail

Use the **Audit Trails Export Wizard** to export Audit Trail data to an XML file so that it can be archived or utilized in third-party statistical tools. Customize the data you are exporting to align with your business needs by running an Security Audit Trail Search.

1. Go to **Auditing > Security Audit Trails**
2. Perform a [Security Audit Trail Search](#perform-security-audit-trail-search) to obtain a list of search results.
3. Click **Audit Trails Export Wizard**.
4. Enter a **Filename**.  
  ***Note***: *Exported files are always saved to the export directory of the current Policy Manager installation.*
5. (Optional) Check to **Append Date to Filename** (Date=current system date).
6. (Optional) Check **Overwrite File** if you want to overwrite an existing Audit Trail data file (if present).
7. (Optional) Check **Delete Exported Audit Trails** to remove gathered Audit Trail data from the Policy Manager system.
8. Click **Finish**, the **Close**.

<a href="#top">back to top</a>

### Schedule a Security Audit Trail Job
In addition to the [Export Security Audit Trail](#export-security-audit-trail) option, you can create a scheduled job that invokes a batch script that exports alert audit trail data.

Functionality is equivalent to the **Export** button in the **Monitoring > Security Trails > Security Audit Trails** section, except that it allows you to run the export program as a batch script synchronously. Export results are achieved when the program exits.

Filtering is optional. If any of the filtering criteria is not specified, the following is used:

* -filterStartDate - today's date
* -filterStartTime - 00\:00\:00
* -filterEndDate - today's date
* -filterEndTime - 23\:59\:59  

***Note***: *In case of error during export, a partially exported file does* ***not*** *get deleted.*

See the [Schedule Security Audit Trail Job Usage Options](#../auditing/auditing_reference.html#schedule_security_audit_trail_job_usage_options) for more information.