---
layout: page
title: Using Alert Codes
description: Learn how to configure and manage the Alert Codes that comprise your event management system.
product: ag
category: learn
sub-nav-class: Alerts
weight:	8
type: page
nav-title: Using Alert Codes
---

## Using Alert Codes

Learn how to configure and manage the Alert Codes that comprise your event management system.

<a href="../alerts/Alerts_toc.html" class="button secondary">Alerts (Home)</a> <a href="../alerts/using_alerts_summary.html" class="button secondary">Using Alerts Summary</a>  <a href="../alerts/using_alert_monitoring.html" class="button secondary">Using Alert Monitoring</a> <a href="../alerts/using_management_scripts.html" class="button secondary">Using Management Scripts</a> <a href="../alerts/using_snmp_hosts.html" class="button secondary">Using SNMP Hosts</a><br><br><a href="../alerts/using_email_groups.html" class="button secondary">Using Email Groups</a> 

<h5 class="stamp">Supported Platforms: 7.0 and greater.</h5>

### Table of Contents
<div id="toc-marker"></div>
* [Introduction](#introduction)
* [Filter Alert Codes](#filter-alert-codes)
* [Add Alert Codes](#add-alert-codes)
* [Modify Alert Codes](#modify-alert-codes)
* [Print Alert Codes](#print-alert-codes)
* [Set Alert Code Logging](#set-alert-code-logging)
* [Set SNMP Messaging for Alert Codes](#set-snmp-messaging-for-alert-codes)
* [Delete Alert Codes](#delete-alert-codes)
* [Alert Codes Search Criteria](#alert-codes-search-criteria)

## Introduction

Alert Codes identify and define the types of events for which Policy Manager generates alerts. In addition, alert codes can be configured to automatically respond in the event of an alert. These predetermined responses can range from ignoring the event to executing a script. Once an alert code has been configured, any event that matches that alert code triggers the response defined in the alert code. There are multiple tasks associated with managing of alert codes including:

* An Alert Code defines a specific type of event (e.g., failure, unexpected result, etc.) and issues a notification based on the defined notification parameters.
* Each Alert Code has an ID that specifies precisely what event causes Policy Manager to generate an alert.
* The definition of an Alert Code includes what actions Policy Manager should automatically take when an event matching the alert code occurs including:
    * Sending a notification email to one or more predetermined recipients.
    * Sending an SNMP message to one or more predetermined hosts.
    * Executing a predefined script.

Location: *Alerts > Alert Codes* section of the *Policy Manager Management Console*.

<a href="#top">back to top</a>

## Filter Alert Codes

Filter what Alert Codes are displayed to facilitate efficient viewing and management. Refer to [Alert Codes Search Criteria](#alert-codes-search-criteria) for a description of each filter option.

1. Go to **Alerts > Alert Monitoring**.
2. You can view alert codes by specifying the following search criteria:  
  * **Alert Code** - Enter the Alert Code ID.
  * **Component** - Select an alert code related to a specific component. 
  * **Log** - Select values from the *Log* drop-down to view alert codes that either **do** or **do not** generate logged alerts.
  * **SNMP** - Select a setting from the *SNMP* drop-down to view alert codes based on whether or not their alerts generate SNMP messages.
  * **Email** - Select a setting from the *Email* drop-down to view alert codes based on whether or not their alerts generate email messages.
  * **Script** - Select a setting from the *Script* drop-down to view alert codes based on the specific management script they launch.
  * **Type** - Select a setting from the *Type* drop-down to view alert codes of a specified type.
3. Click **Filter** to apply the search criteria and update the alert codes listing.

<a href="#top">back to top</a>

## Add Alert Codes

Developers can integrate user-defined events into Alert Manager as Custom Alert Codes for the purposes of monitoring and updating using the *Add Alert Code* function.

**Note:** *Operations defined for a custom alert code are only executed when logging is enabled for that alert.*

**Note:** *Steps 4 through 12 are optional, except where noted.* 

1. Go to **Alerts > Alert Codes**.
2. Click **Add Alert Code**.
3. Enter the **Alert Code number**.  
  * Alert Codes are numeric-only.
  * Alert Code is a required field. If the specified alert code number is not available, the system will display a recommended number range.
  * **Note:** *Custom alert code numbers must be 1000000 or higher*  
4. Enter the **Component name** associated with the custom event for this Alert Code.
  * In most cases, this will be the name of the component that you intend to develop.
  * Component is a required field.
5. Enter the **Subsystem name** associated with the custom event for this Alert Code (Required).
6. Enter a **Description** for the Alert Code.
7. Add **additional informational** text.
8. Select the **Severity**.
9. Choose a **Management Script** to assign to the Alert Code.  
  **Note:** *You can only assign a Management Script to an Alert Code if you have already created the script and defined it in Policy Manager.*
10. Use the **Alert** Check-box to define whether or not events matching this Alert Code will spawn alerts.
11. Define whether or not events matching this Alert Code will generate **SNMP messages**.
12. Add the name(s) of one or more email groups to be notified when an event matching this alert code occurs.  
**Note:** *You can only assign email groups that you have already defined in Policy Manager.*
13. Click **Apply**.

<a href="#top">back to top</a>

## Modify Alert Codes

Policy Manager provides an extensive collection of predefined Alert Codes that you can modify to suit your needs. For example: 

* Based on your business requirements you may need to configure the Alert Codes to respond to events as needed in your enterprise. 
* Some Alert Codes will relate to events that have little or no significance to you, and you may wish to set these codes so that these events are not logged as alerts at all. 
* In other cases, the predefined severity of the Alert Codes may not match the severity you ascribe to their associated events, and you will have to adjust the severity. 
* In still other cases, you may want to specify that the Alert Codes send email notifications, SNMP messages, or launch scripts in response to events. 

**Note:** *Operations defined for an alert code are only executed when logging is enabled for that alert.*

1. Go to **Alerts > Alert Codes**.
2. **Select an Alert Code** by moving the mouse pointer over the entry and clicking once to select it (selected entries appear as highlighted).
3. Click **Modify Alert Code**.
4. Change the definition of the Alert Code as needed. You can:  
   * Edit the description.
   * Add additional information text.
   * Change the severity.
   * Choose a Management Script to assign to the alert code.    
**Note:** *You can only assign a Management Script to an Alert Code if you have already created the script and defined it in Policy Manager.*
   * Use the **Log Alerts** check-box to define whether or not events matching this Alert Code will spawn alerts.
   * Define whether or not events matching this alert code will generate SNMP messages.
   * Add one or more email groups to be notified when an event matching this alert code occurs.  
**Note:** *You can only assign email groups that you have already defined in Policy Manager.*
5. Click **Apply**.

<a href="#top">back to top</a>

## Print Alert Codes

Print the contents of the **Alert Codes Summary** screen, excluding the Header and Button bars using the *Print* function.

**Note:** *Because this operation prints only the Alert Codes displayed on the screen, you may want to [Filter Alert Codes](#filter-alert-codes) before you print.*

1. Go to **Alerts > Alert Codes**.
2. Click **Print**. The Alert Code listing is sent to the printer.

<a href="#top">back to top</a>

## Set Alert Code Logging

Defining logging for an Alert Code determines whether or not Policy Manager logs the events that match the Alert Code as alerts. Depending on whether the type of event identified by the alert code is relevant or not relevant to your enterprise, set the alert code respectively to log or not to log.

Setting the Alert Code log parameter is performed during the [Add Alert Codes](#add-alert-codes) or [Modify Alert Codes](#modify-alert-codes) process. You can also set or reset logging for one or more Alert Codes directly from the Alert Codes screen.

1. Go to **Alerts > Alert Codes**.
2. Check the **Log** check-box by each alert code for which you wish to see alerts; un-check the check boxes for those you don't wish to see.  
**Note:** *You may find it useful to filter the Alert Codes by component or severity before checking the boxes.*
3. Click **Apply**.

<a href="#top">back to top</a>

## Set SNMP Messaging for Alert Codes

Set an Alert Code to pass an SNMP alert message to a remote host when its associated event occurs.
 
**Notes:**
  
* *This operation is only executed if the Alert Code has logging enabled.*
* *In order for Policy Manager to send an SNMP message to a remote host, the SNMP host must be defined within the Policy Manager.*

The most common way to set SNMP messaging for an Alert Code is during the process of configuring or modifying the Alert Code where SNMP is an available parameter. However, you can *also* set or reset SNMP messaging for one or more alert codes directly from the *Alert Codes Summary* screen.

1. Go to **Alerts > Alert Codes**.
2. Check the **SNMP** check-box by each alert code you want the system to send SNMP messages to; un-check the check boxes for those you don't.
3. Click **Apply**.

<a href="#top">back to top</a>

## Delete Alert Codes

Permanently remove an Alert Code definition from the Policy Manager database. Only Custom Alert Codes can be deleted since Application Alert Codes that are part of the Policy Manager default installation are read-only and cannot be deleted.

1. Go to **Alerts > Alert Codes**.
2. Select the custom alert code you would like to delete by clicking the corresponding line item.
3. Click **Delete Alert Code**.
4. Click **OK** on the confirmation pop-up window.

<a href="#top">back to top</a>

## Alert Codes Search Criteria

The following table displays the available search criteria options for filtering alert codes that comprise your alert management system. 

| Search Criteria Option| Description        |
|:----------------------|:---------------------------|
| Component | Filtering by Component displays only those alert codes that are defined to monitor activity that occurs in the selected component.
| Severity | Filtering by a Severity displays alert codes based on the "Severity" configuration setting (All, Critical, Major, Minor, Normal, or Clear).
| Log | Filtering by Log displays alert codes based on the "Log Alert" configuration setting (Enable, Disable, or Both).
| SNMP | Filtering by SNMP displays alert codes based on the "Send SNMP Message" configuration setting (Enable, Disable, or Both).
| Alert Code | Filtering by Alert Code identification number performs an exact match search for the specified number. If a match is found, the Alert Code displays. If a match is not found, the system displays all alert codes that are currently defined.
| Email | Filtering by Email displays alert codes based on the "Email" configuration setting (Enable, Disable, or Both.
| Script | Filtering by Script displays alert codes based on the "Management Script" configuration (Enable, Disable, or Both).
| Type | Filtering by Type displays alert codes based on their origin of definition. Options include Application (default Alert Codes), User-defined (custom Alert Codes), or both.
| Filter | A button that executes a search using the current search criteria and updates the results of the alert listing.

<a href="#top">back to top</a>




