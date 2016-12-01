---
layout: page
title: Using Alert Monitoring
description: Learn how to view and manage alerts that are raised in your Policy Manager deployment.
product: ag
category: learn
sub-nav-class: Alerts
weight: 05
type: page
nav-title: Using Alert Monitoring
---

## Using Alert Monitoring
Learn how to view and manage alerts that are raised in your Policy Manager deployment.

<a href="../alerts/alerts_toc.html" class="button secondary">Alerts (Home)</a> <a href="../alerts/using_alerts_summary.html" class="button secondary">Using Alerts Summary</a>  <a href="../alerts/using_alert_codes.html" class="button secondary">Using Alert Codes</a> <a href="../alerts/using_management_scripts.html" class="button secondary">Using Management Scripts</a> <a href="../alerts/using_snmp_hosts.html" class="button secondary">Using SNMP Hosts</a><br><br><a href="../alerts/using_email_groups.html" class="button secondary">Using Email Groups</a> 

<h5 class="stamp">Supported Platforms: 7.0 and greater.</h5>

### Table of Contents
<div id="toc-marker"></div>
* [Introduction](#introduction)
* [Filter Alerts](#filter-alerts)
* [View Alerts](#view-alerts)
* [Add Comments to Alerts](#add-comments-to-alerts)
* [Observe Alerts](#observe-alerts)
* [Resolve Alerts](#resolve-alerts)
* [View Alert Codes for Alerts](#view-alert-codes-for-alerts)
* [Print Alerts](#print-alerts)
* [Export Alerts](#export-alerts)
* [Delete Alerts](#delete-alerts)
* [Alert Monitoring Search Criteria](#alert-monitoring-search-criteria)

## Introduction

### About Alert Monitoring

Alerts are raised when a system condition matches an active Alert Code. Each alert is associated with functionality that occurs in Policy Manager subsystems. Alerts also include:

* A Severity identifier
* The Alert Code representing the Policy Manager functional area
* The Container that is managing the web service operations

Use this information to review the alert condition and determine the appropriate method of response (an alert response is configured using state filters).

Alert data can also be exported to an XML file to facilitate additional analysis or reporting requirements.

### About Alert States

When a new alert is raised, the state filter is set to **Unobserved**. During the decision-support process, an alert state is typically changed to **Observed** while the problem is being investigated. When an alert resolution is found, comments are then added to the alert record and the state filter is changed to **Resolved**.

Location: *Alerts > Alert Monitoring* section of the *Policy Manager Management Console*.

<a href="#top">back to top</a>

## Filter Alerts

Use search criteria to filter what Alerts are displayed. Refer to [Alert Monitoring Search Criteria](#alert-monitoring-search-criteria) for a description of each filter option.

1. Go to **Alerts > Alert Monitoring**.
2. Configure the following search criteria:  
  * **ID Filter** - Enter the Alert ID, or Alert Code ID to view alerts generated from a single alert code,  .
  * **Time-Range Filter** - Specify a time period to view alerts logged within a specific time frame.
  * **Severity Filter** - To see only alerts of a given severity level select one or more check-boxes.
  * **State Filter** - To see only alerts that have been observed or resolved, Select any combination from the State Filter drop-down. 
  * **Source Filter** - To see alerts associated with a specific Policy Manager subsystem, select "All" for all systems.

3. Click **Filter**. The alert listing updates and presents data based on your defined search criteria.

<a href="#top">back to top</a>

## View Alerts

View summary details associated with a raised alert including:  

* **Details** - Provides Alert ID generated when the alert was raised and associated Alert Code information including Alert Code ID, Severity, and Description associated with the current alert.
* **Component** - Provides details pertaining to Component and Subsystem where the alert was raised.
* **State** - Provides information on the state of management associated with the current alert, including the name of the user who initially viewed (Observed By) the alert, the date and time stamp when the alert was observed (Observed On), the name of the user who resolved the alert (Resolved By), and the date and time stamp of when the alert was resolved (Resolved On). You can update the Observe attribute.
* **Comments** - Annotate the alert record with status or reference information related to the alert resolution's progress.

There are a variety of alert management options available via the function buttons at the bottom of the *View Alert* screen including Comment, Observe, Resolve, Delete, View Alert Code, and cancel
* Cancel

1. Go to **Alerts > Alert Monitoring**.
2. Perform the [Filter Alerts](#filter-alerts) procedure.
3. Select the alert you would like to view and click **View Alert**.

<a href="#top">back to top</a>

## Add Comments to Alerts

Record the steps that have been taken to resolve the alert, or, record tips and suggestions about resolving similar alerts in the future.

* Adding a comment to an alert appends the comment to the Policy Manager database of the current alert record.
* Comment information is entered as free-form text.
* Comment text can be added via the Alerts screen or the View Alert screen.

1. Go to **Alerts > Alert Monitoring**.
2. Select the alert you would like to view, and click **View Alert**.
3. Click **Add Comment**.
4. Enter the text of your comment, and click **Apply**.

**Note**: *To add a comment from the* Alerts *screen, select an alert record and click* ***Add Comment***, *and follow the same update procedure.*

<a href="#top">back to top</a>

## Observe Alerts

When an alert is generated, it is considered to be unseen or *unobserved*, implying that no one is aware that the alert has been logged, and consequently no one is taking steps to correct whatever problem the alert reports.   

When you mark an alert as *observed*, you indicate that the alert has been seen and that steps are being taken to analyze and resolve the issue. The **Observed** state can be configured via the *Alerts* screen or the *View Alert* screen.

1. Go to **Alerts > Alert Monitoring**.
2. Select the alert you would like to view, and click **View Alert**.
3. Click **Observe**.  

You are returned to the *Alert Monitoring Summary* screen. The "Obs" column displays with a check-mark and is grayed-out indicating that the state of the alert has been changed to **Observed**.    

**Note**: *To change the observe status from the* Alerts *screen, click the check-box in the* ***Obs*** *column, and click* ***Apply***.  

4. To view the change to the Observe status in the alert record, on the *Alerts* screen, select the alert record and click **View Alert**.  
**Notes**:  
    * ***Alert State*** *is changed to* ***Observed***
    * ***Observed By*** *contains the name of the user that updated the status*
    * ***Observed On*** *displays the date/time stamp that the observed status was updated*
5. Review the **Observed (not Resolved)** column of the *Alert Monitoring Summary* screen to view the number of alert records that are configured with an **Observed** state.

<a href="#top">back to top</a>

## Resolve Alerts

When an alert is generated, by default it is unresolved, meaning that whatever condition caused the alert to be generated has not yet been addressed or fully corrected.

Whether you ignore an alert or, due to its importance, immediately address it, eventually no further action will be required. At this point, you mark an alert as resolved, indicating that the alert is no longer an open or outstanding issue.

1. Go to **Alerts > Alert Monitoring**.
2. Select the alert you would like to view, and click **View Alert**.
3. Click **Resolve**.  
You are returned to the *Alert Summary* screen. The Alert you have resolved is grayed out and a check appears in the *Res* column.  
**Notes:**
    * *To change the resolve status from the Alerts screen, click the* ***check-box*** *in the* Res *column, and click* ***Apply***.
    * *If Resolution proves premature, you can reopen or "unresolve" the alert.*
    * *A Resolved Alert is marked as "observed" and remains so even if it is later "unresolved."* 
4. To view the change to the Resolved status in the alert record, on the Alerts screen, select the alert record and click **View Alert**.  
**Notes:**
    * ***Alert State*** *is changed to* ***Resolved***
    * ***Resolved By*** contains the name of the user that updated the status
    * ***Resolved On*** displays the date/time stamp that the resolved status was updated
5. Review the *Resolved* column of the *Alert Monitoring Summary* screen to view the number of alert records that are configured with a **Resolved** state.

<a href="#top">back to top</a>

## View Alert Codes For Alerts

When addressing an alert, particularly if it is of a type that seldom occurs, it is useful to look at the details of the alert code upon which the alert is based.

1. Select the alert you would like to view, and click **View Alert**.
2. Click **View Alert Codes**.  

<a href="#top">back to top</a>

## Print Alerts

Print the contents of the *Alert Monitoring Summary* screen, excluding the Header and Button bars.

1. Go to **Alerts > Alert Monitoring**.
2. Click **Print**.  
The contents of the screen (i.e., the displayed list of alerts) are sent to the printer.

<a href="#top">back to top</a>

## Export Alerts

Archive alerts that are no longer active or migrate alert data to another application.

1. Go to **Alerts > Alert Monitoring**.
2. Filter the alerts view to display the alerts you would like to export (Refer to [Filter Alerts](#filter-alerts) for more information).
3. Click **Export Alerts**.
4. Customize the Export:
    * **Export Name** (required) - Enter the file name that the Alert data will be saved to into the "Export Name" field display. Export data is saved to the Policy Manager database.
    * **Database Format** - Use the **radio button** to select between .XML and .CSV formats.
    * **Delete Exported Alerts** - Click the **Delete Exported Alerts** check-box if you want to remove the exported alerts from the Policy Manager database. If this option is not selected, the alert selection will remain in the Policy Manager database.
5. Click **Finish**.  
The *Export Alert Wizard* closes, the export job begins, and is added to the *Pending* or *Completed* sections of the *Manage Exports* pop-up.
6. Click **Manage Exports** to review the progress of your export job and perform additional export management activities.

<a href="#top">back to top</a>

## Delete Alerts

Permanently remove the an alertt record from the Policy Manager database. 

If maintaining a record of alerts is a business reporting requirement, it is recommended that you export alerts prior to deleting them from the Policy Manager database. See [Export Alerts](#export-alerts).

1. Go to **Alerts > Alert Monitoring**.
2. Select one or more alerts you would like to delete by clicking the check-box next to each alert line item.
3. Click **Apply** and confirm deletion. The system permanently removes the Alert from the database.
5. To cancel the delete operation, click **Cancel**.

<a href="#top">back to top</a>

## Alert Monitoring Search Criteria

The alert monitoring capability allows you to use flexible search criteria options to find and retrieve alerts that have been raised during the operation of your Policy Manager production site. You can focus the scope of a search to target:

* A specific alert or alert code ID
* A time increment
* A date range or time range
* An alert severity
* A state filter

The following table provides a list of alert monitoring search criteria options and their descriptions.

| Search Criteria Option| Description        |
|:----------------------|:---------------------------|
|ID Filter| Allows you to filter alerts based on the actual alert ID generated when the alert was, or by the Alert Code associated with the alert.
| ID | A text box that allows you to enter the ID of an alert that was generated by the Policy Manager.
| Alert Code | A text box that allows you to enter an Alert Code category ID that is associated with an alert generated by the Policy Manager.
| Time Range Filter | Provides two time-focused filter types: Start Date or Period.
| Start Date (Option) | A selection of date and time field displays that allow you to specify a date and time range including Start Date, End Date, Start Time, and End Time. The **Start Date** option is accessed by clicking the Start Date radio button.
| Start Date | This field has two uses: A **radio button** that allows you to select the Start Date option and a **date field** that accesses a pop-up and allows you to specify a Start Date. Date can be selected by using the arrow keys to navigate the week, month and year. To select a date, click the date number (highlighted in red). The field display is automatically populated.
| End Date | End Date can be selected by using the arrow keys to navigate the week, month and year. To select a date, click the date number (highlighted in red). The field display is automatically populated.
| Start Time | Time is entered using a 24-hour clock.
| End Time | Time is entered using a 24-hour clock.
| Period (Option) | Select from Last Hour, Last 24 Hours, Last Week, Last Month, or Last 3 Months. Accessed by clicking the **Period** radio button.
| Period | Select a time period for gathering report data.
| Severity Filter | Select to filter which alerts are displayed and perform alerts management based on the severity level of the alert. Select from: Critical, Major, Minor, Normal, and Clear.
| Critical | Select a Critical Alerts severity level meaning there has been a complete loss of functionality and the system entity is being monitored.
| Major | Select a Major Alerts severity level meaning that the functionality of the system entity being monitoring has been significantly impacted.
| Minor | Select a Minor Alerts severity level meaning that the functionality of the system entity being monitored has been minimally impacted.
| Normal | Select a Normal Alerts severity level meaning that the system entity being monitored is operating as designed.
| Clear | Select a Clear Alerts severity level.
| State Filter |Select to filter which alerts are displayed and perform alerts management based on the review "state" of the alert. There are three severity levels: All Unobserved, Observed By, and Resolved By. **Note:** *The All Observed state does not include a drop-down list box option.*
| All Unobserved | Select all alerts that have not yet been reviewed.
| Observed By | Select all alerts that have been Observed, and the username of the Observer. Select **All** to view all Observed alerts.
| Resolved By | Select all alerts that have been Resolved, and the username of the user who resolved the alert. Select **All** to view all Resolved alerts.
| Source Filter | Displays the name of the affected component
| Component | Filter alerts based on the associated Policy Manager process. Select **All** to view alerts for all Policy Manager processes.
| Search Button | Execute a search using the current search criteria and update the results of the alert listing.

<a href="#top">back to top</a>
