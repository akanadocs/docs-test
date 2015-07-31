---
layout: page
title: Using Management Scripts
description: Learn how to create and manage a Management Script that will execute one or more workflows as a response to specific alert conditions.
product: ag
category: learn
sub-nav-class: Alerts
weight:	10
type: page
nav-title: Using Management Scripts
---

## Using Management Scripts

Learn how to create and manage a Management Script that will execute one or more workflows as a response to specific alert conditions.

<a href="../alerts/Alerts_toc.html" class="button secondary">Alerts (Home)</a> <a href="../alerts/using_alerts_summary.html" class="button secondary">Using Alerts Summary</a>  <a href="../alerts/using_alert_monitoring.html" class="button secondary">Using Alert Monitoring</a> <a href="../alerts/using_alert_codes.html" class="button secondary">Using Alert Codes</a> <a href="../alerts/using_snmp_hosts.html" class="button secondary">Using SNMP Hosts</a> <br><br><a href="../alerts/using_email_groups.html" class="button secondary">Using Email Groups</a> 

<h5 class="stamp">Supported Platforms: 7.0 and greater.</h5>

### Table of Contents
<div id="toc-marker"></div>
* [Introduction](#introduction)
* [Add Management Script](#add-management-script)
* [Modify Management Script](#modify-management-script)
* [Delete Management Script](#delete-management-script)
* [Management Script Parameters](#management-script-parameters)

## Introduction

A Management Script is an executable file that is launched by the Alert Manager when an alert it is assigned to is raised. Management Scripts are generally used to execute workflows as a response to specific alert conditions (e.g., generating an automated page or phone call in the event of a critical error). You can design your Management Scripts to execute any desired workflow.

Configuration requirements for a Management Script include the ability to execute from the Policy Manager host, and the successful registration of the Management Script in the Policy Manager prior to assigning it to an Alert Code.

**Notes:**

* *Management scripts can be stored at any location, but must be copied to all Policy Manager machines and at the same path.*
* *A Management Script definition should include the full, absolute path.*
* *A script should not assume any current working directory.*

Location: *Alerts > Management Scripts* section of the *Policy Manager Management Console*.

<a href="#top">back to top</a>

## Add Management Script

1. Go to **Alerts > Management Scripts**.
2. Click **Add Management Script**.
3. Define a Management Script by entering the following information:  
  * **Name** - Enter the Script Name. The script name displays on the Management Script Summary screen and is the reference name that you will be assigning to Alert Codes.
  * **Description** - Enter the Management Script description (e.g., the workflow that will be executed by the script).
  * **Script Filename** - Enter the script filename.
  * **Parameters** - Select a parameter category that you would like append to the Management Script. See [Management Script Parameters](#management-script-parameters).
  * **Parameter List** - Displays a list of entries selected from the Parameter drop-down list box (e.g., $AlertSeverity).
  * **Final Script** - Displays an example of the final script combining the "Script Filename" plus the selected "Parameters," (e.g., "alertworkflow.bat" $AlertCode).
  * **Example Script** - Displays an example of a sample Management Script that is configured with one script filename and three parameter selections.
4. Click **Apply**.

**Notes:**

* *You can use parameters to determine the behavior of the script.*
* *You can choose multiple parameters from the drop-down list.*
* *Each parameter you select is automatically added to both the Parameters List field and the Final Script field.*
* *If you add static parameters to the parameter list, they are passed to the script.*
* *Parameters that include multiple characters separated by spaces must be enclosed in quotes.*

<a href="#top">back to top</a>

## Modify Management Script

1. Go to **Alerts > Management Scripts**.
2. Click **Modify Management Script**.
3. In the *Modify Management Script* screen, update the following information in the *Details* section:  
  * **Name** - The script name displays on the Management Script Summary screen and is the reference name that you will be assigning to Alert Codes.
  * **Description** - The Management Script description (e.g., the workflow that will be executed by the script).
  * **Script Filename**
  * **Parameters** - Parameter category that you would like append to the Management Script. See [Management Script Parameters](#management-script-parameters). 
  * **Parameter List** - Displays a list of entries selected from the Parameter drop-down list box (e.g., $AlertSeverity).
  * **Final Script** - Displays an example of the final script combining the "Script Filename" plus the selected "Parameters," (e.g., "alertworkflow.bat" $AlertCode).
  * **Example Script** - Displays an example of a sample Management Script that is configured with one script filename and three parameter selections.
4. Click **Apply**.

**Notes:**

* *You can use parameters to determine the behavior of the script.*
* *You can choose multiple parameters from the drop-down list.*
* *Each parameter you select is automatically added to both the Parameters List field and the Final Script field.*
* *If you add static parameters to the parameter list, they are passed to the script.*
* *Parameters that include multiple characters separated by spaces must be enclosed in quotes.*

<a href="#top">back to top</a>

## Delete Management Script

1. Go to **Alerts > Management Scripts**.
2. Select the Management Script definition line item you would like to delete.
3. Click **Delete Management Script** and confirm the deletion. The system permanently removes the Management Script and associated alert code references from the database.
5. To cancel the delete operation, click **Cancel**.
 
<a href="#top">back to top</a>

## Management Script Parameters

The following list shows the available options in the Management Script Parameter drop-down menu.

| Parameter|
|:----------------------|
|Alert Id
|Alert Code
|Alert Severity
|Alert Description
|Alert Type
|Alert Source Type
|Component
|Alert Source Component Name
|Subsystem
|Alert Source Subsystem Name
|Contract Key
|Contract Name
|Alert Sent Timestamp
|Alert Received Timestamp
|Alert Code Description
|Alert Code Component
|Alert Code Subsystem
|Alert Code Additional Info
|SLA Policy Name
|SLA Rule Metric Name
|SLA Rule Operator
|SLA Rule Value
|SLA Rule Value Unit
|SLA Rule Interval
|SLA Evaluation Measured Value
|SLA Evaluation Interval Start Date
|SLA Evaluation Interval End Date

<a href="#top">back to top</a>