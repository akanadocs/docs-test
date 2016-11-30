---
layout: page
title: Auditing Reference
description: Includes search criteria, field descriptions, and audit trail job usage options for configuring Alert and Security Audit Trails. 
product: ag
category: learn
sub-nav-class: Auditing
weight: 109
type: page
nav-title: Auditing Reference
---

## Auditing Reference
Includes search criteria, field descriptions, and audit trail job usage options for configuring Alert and Security Audit Trails.

<a href="auditing_toc.html" class="button secondary">Auditing (Home)</a> <a href="../auditing/about_auditing.html" class="button secondary">About Auditing</a>  <a href="../auditing/using_alert_auditing.html" class="button secondary">Using Alert Auditing</a>  <a href="../auditing/using_security_auditing.html" class="button secondary">Using Security Auditing</a>
<h5 class="stamp">Supported Platforms: 7.0 and greater.</h5>
### Table of Contents
<div id="toc-marker"></div>
* [Introduction](#introduction)
* [Audit Trail Search Criteria](#audit-trail-search-criteria)
* [Audit Trail Field Descriptions](#audit-trail-field-descriptions)
* [Schedule Alert Audit Trail Job Usage Options](#schedule-alert-audit-trail-job-usage-options)
* [Schedule Security Audit Trail Job (Usage Options)](#schedule-security-audit-trail-job-usage-options)

## Introduction
This topic includes search criteria, field descriptions, and audit trail job usage options for configuring Alert and Security Audit Trails.

## Audit Trail Search Criteria
The audit trail capability in the Policy Manager *Monitor* section allows you to select search criteria and retrieve data about add, modify, and delete actions that occur in the system activity using flexible search criteria options. You can focus the scope of a search to target a specific system action, username, object status, and date range or time range, and then browse search results.

Performing a search involves entering optional search criteria, receiving search results, and then performing a specific operation (if applicable) on audit data. The initial display of the *Audit Trail Summary* screen presents a list of all observed and unobserved objects associated with the current logged on user.

| Search Criteria Option| Description        |
|:----------------------|:---------------------------|
| Start Date End Date    | Start and End date fields that access a Calendar Pop-up. Date can be selected by using the arrow keys to navigate the Week, Month and Year. To select a date, click the date number (highlighted in red). The field display is automatically populated.  |                                 
| Start Time End Time| Field displays that allows you to enter a Start and End Times. Time is entered using a 24-hour clock.           |
| Action      | A text box that allows you to enter a specific action associated with **add**, **modify**, or **delete** operations performed in the system.           |
| User | A text box that allows you to filter audit trail search results based on a username identifier.           
|Observed| A Radio button that allows you to filter audit trail search results based on whether an audit item is configured with an **Observed** status.
|Unobserved| A Radio button that allows you to filter audit trail search results based on whether an audit item is configured with an **Unobserved** status.
|Both| A Radio button that allows you to filter audit trail search results based on whether an audit item is configured with an **Observed** and **Unobserved** status.
|Filter| A button that commits the specified search criteria and executes the Audit Trail Search.
<br
<a href="#top">back to top</a>

## Audit Trail Field Descriptions 
The following table provides descriptions of the policy object information presented on the *Audit Trail Details* screen.


| Field Name| Description|
|:----------------------|:---------------|
| Date | Displays the date that the system object was created. |
| Username | Displays the name of the user who will be using the Policy Manager application the system object is associated with. |
| Name | Displays the name of the Policy Manager component that the system object is associated with. |
| Action | Displays the system action associated with the specific system object. |
| Cascade List| Displays the cascading routes associated with usage of the current system object. |
| Observed Date| Displays the name of the user who will be using the Policy Manager application the system object is associated with. |
| Observed Username | Displays the username of the individual who that viewed at the Audit Trail. |
| Observed Name | Displays the name of the individual who that viewed at the Audit Trail. |
| Client Application| Displays the name of the client application that was used when the Audit Trail was created. |
| Description | Displays a detailed explanation of the reason the Audit Trail was created. |
<br>
<a href="#top">back to top</a>

## Schedule Alert Audit Trail Job - Usage Options

* Minimum Required Options:  
  -outfile &lt;outfile&gt;
* Sample Program Call  
exportAlertAuditTrail -deleteFilteredData -outfile alaudit1_ -appendDateToFileName -filterStartDate 01-01-2000 -filterEndDate 04-24-2006

| Option| Description|
|:----------------------|:---------------|
|-appendDateToFileName|Append Date to Filename
|-deleteFilteredData|Delete Exported Data. (Deletes filtered alert audit trails only.)  |
|-filterStartDate (MM-DD-YYYY)|Export data filter start date |
|-filterStartTime (HH\:MM\:SS)|Export data filter start date |
|-filterEndDate (MM-DD-YYYY)|Export data filter end date |
|-filterEndTime (HH\:MM\:SS)|Export data filter end time |
|-outfile &lt;outfile&gt;| This file will be exported to: [PM_HOME] \[ReleaseDirectory]\export. This option is required.  | 
|-overrideExistingFile|Overwrite Existing File  |

<a href="#top">back to top</a>

## Schedule Security Audit Trail Job - Usage Options

* Minimum Required Options:  
  -outfile &lt;outfile&gt;
* Sample Program Call  
exportSecurityAuditTrail -deleteFilteredData -outfile secaudit1_ -appendDateToFileName -filterStartDate 01-01-2000 -filterEndDate 04-24-2006

| Option| Description|
|:----------------------|:---------------|
|-appendDateToFileName|Append Date to Filename
|-deleteFilteredData|Delete Exported Data. (Deletes filtered alert audit trails only.)  |
|-filterStartDate (MM-DD-YYYY)|Export data filter start date |
|-filterStartTime (HH\:MM\:SS)|Export data filter start date |
|-filterEndDate (MM-DD-YYYY)|Export data filter end date |
|-filterEndTime (HH\:MM\:SS)|Export data filter end time |
|-outfile &lt;outfile&gt;| This file will be exported to: [PM_HOME]  \\[ReleaseDirectory]\export. This option is required. |
|-overrideExistingFile|Overwrite Existing File  |
<br>
<a href="#top">back to top</a>

