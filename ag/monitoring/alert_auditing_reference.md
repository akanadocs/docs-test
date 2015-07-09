---
layout: page
title: Alert Audit Trail Reference
description: Detailed search criteria as well as field and usage case descriptions for alert auditing functionalities.
product: ag
category: learn
sub-nav-class: Auditing
weight:	6
type: page
nav-title: Alert Audit Trail Reference
---

## Alert Audit Trail - Detailed Functionality Reference
#### Supported Platforms: 7.0 and greater.

[Using Alert Auditing](../auditing/using_alert_auditing.md)

### Table of Contents
1. [About Audit Trails](#about-audit-trails)
2. [Audit Trail Search Criteria](#audit-trail-search-criteria)
3. [Audit Trail Field Descriptions](#audit-trail-field-descriptions)
4. [Schedule Alert Audit Trail Job - Usage Options](#schedule-alert-audit-trail-job)


## About Audit Trails
The *Audit Trails* section of Policy Manager's *Auditing* tab allows you to monitor system activity based on alert notifications or security policy-related actions, users, and date and time range. This system activity is saved in an "Audit Trail" which is a log of add, modify, and delete operations performed on all objects in the system. Selected "Audit Trail" records can be exported to an XML file and used for reporting purposes. This data can be used to measure system performance and manage the security of web services. 

**Alert Audit Trails** - Provides the ability to filter, view, and export data that is logged when an alert is *raised*. To activate the alert audit feature, select the **Log Alert** checkbox in the *Alert Code Definition* table found under the *Alert Codes* tab of the *Alerts* section of the Policy Manager.


<a href="#top">back to top</a>

## Audit Trail Search Criteria
The audit trail capability in the Policy Manager *Monitor* section allows you to select search criteria and retrieve data about add, modify, and delete actions that occur in the system activity using flexible search criteria options. You can focus the scope of a search to target a specific system action, username, object status, and date range or time range, and then browse search results.

Performing a search involves entering optional search criteria, receiving search results, and then performing a specific operation (if applicable) on audit data. The initial display of the *Audit Trail Summary* screen presents a list of all observed and unobserved objects associated with the current logged on user.



| Search Criteria Option| Screen Element | Description |
|:----------------------|:---------------|:---------------------------|
| Sart Date End Date    |  ![](images/reference_audit_trail_search_criteria_calendar.png)| Start and End date fields that access a Calendar Pop-up. Date can be selected by using the arrow keys to navigate the Week, Month and Year. To select a date, click the date number (highlighted in red). The field display is automatically populated.                                   
| Start Time End Time| ![](images/reference_audit_trail_search_criteria_start_time.png)           | Field displays that allows you to enter a Start and End Times. Time is entered using a 24-hour clock.           |
| Action      | ![](images/reference_audit_trail_search_criteria_action.png)|A text box that allows you to enter a specific action associated with **add**, **modify**, or **delete** operations performed in the system.           |
| User |![](images/reference_audit_trail_search_criteria_user.png)      | A text box that allows you to filter audit trail search results based on a username identifier.           
|Observed|![](images/reference_audit_trail_search_criteria_observed.png)|A Radio button that allows you to filter audit trail search results based on whether an audit item is configured with an **Observed** status.
|Unobserved|![](images/reference_audit_trail_search_criteria_unobserved.png)|A Radio button that allows you to filter audit trail search results based on whether an audit item is configured with an **Unobserved** status.
|Both|![](images/reference_audit_trail_search_criteria_both.png)| A Radio button that allows you to filter audit trail search results based on whether an audit item is configured with an **Observed** and **Unobserved** status.
|Filter|![](images/reference_audit_trail_search_criteria_filter.png)| A button that commits the specified search criteria and executes the Audit Trail Search.

<a href="#top">back to top</a>

## Audit Trail Field Descriptions
The following table provides descriptions of the policy object information presented on the *Audit Trail Details* screen.


| Field Name| Description|
|:----------------------|:---------------|
| Date | Displays the date that the system object was created.
| Username | Displays the name of the user who will be using the Policy Manager application the system object is associated with.
| Name | Displays the name of the Policy Manager component that the system object is associated with.
| Action | Displays the system action associated with the specific system object.
| Cascade List| Displays the cascading routes associated with usage of the current system object.
| Observed Date| Displays the name of the user who will be using the Policy Manager application the system object is associated with.
| Observed Username | Displays the username of the individual who that viewed at the Audit Trail.
| Observed Name | Displays the name of the individual who that viewed at the Audit Trail.
| Client Application| Displays the name of the client application that was used when the Audit Trail was created.
| Description | Displays a detailed explanation of the reason the Audit Trail was created.

<a href="#top">back to top</a>

## Schedule Alert Audit Trail Job - Usage Options

* Minimum Required Options:  
  -outfile &lt;outfile&gt;
* Sample Program Call  
exportAlertAuditTrail -deleteFilteredData -outfile alaudit1_ -appendDateToFileName -filterStartDate 01-01-2000 -filterEndDate 04-24-2006

| Option| Description|
|:----------------------|:---------------|
|-appendDateToFileName|Append Date to Filename
|-deleteFilteredData|Delete Exported Data. (Deletes filtered alert audit trails only.)
|-filterStartDate (MM-dd-yyyy)|Export data filter start date
|-filterStartTime (HH:mm:ss)|Export data filter start date
|-filterEndDate (MM-dd-yyyy)|Export data filter end date
|-filterEndTime (HH:mm:ss)|Export data filter end time
|-outfile &lt;outfile&gt;| This file will be exported to: [SOA_PM_HOME]\pm60\export. This option is required.
|-overrideExistingFile|Overwrite Existing File

<a href="#top">back to top</a>

