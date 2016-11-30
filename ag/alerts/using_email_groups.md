---
layout: page
title: Using Email Groups
description: Learn how to define and manage Email Groups used to facilitate Alert Management and Administration.
product: ag
category: learn
sub-nav-class: Alerts
weight: 112
type: page
nav-title: Using Email Groups
---

## Using Email Groups
Learn how to define and manage Email Groups used to facilitate Alert Management and Administration.

<a href="../alerts/alerts_toc.html" class="button secondary">Alerts (Home)</a> <a href="../alerts/using_alerts_summary.html" class="button secondary">Using Alerts Summary</a>  <a href="../alerts/using_alert_monitoring.html" class="button secondary">Using Alert Monitoring</a> <a href="../alerts/using_alert_codes.html" class="button secondary">Using Alert Codes</a> <a href="../alerts/using_management_scripts.html" class="button secondary">Using Management Scripts</a><br><br><a href="../alerts/using_snmp_hosts.html" class="button secondary">Using SNMP Hosts</a> 

<h5 class="stamp">Supported Platforms: 7.0 and greater.</h5>

### Table of Contents
<div id="toc-marker"></div>
* [Introduction](#introduction)
* [Add Email Group](#add-email-group)
* [Modify Email Group](#modify-email-group)
* [Delete Email Group](#delete-email-group)

## Introduction

An Email Group is an alert notification distribution list that is configured to facilitate the alert administration process. An Email Group definition contains:  

* Email addresses of individuals that belong to a specific alert distribution list.
* Associated host information.
* Authentication username and password.
* Time intervals that the Email Group will be active to receive alert notifications.

The composition of an Email Group typically reflects the name of an organization or business function designated to manage the administration of alerts. After defining Email Groups that address your alert management requirements, you then associate the relevant Alert Codes with the Email Group that should receive the alert notifications. Refer to [Using Alert Codes](../alerts/using_alert_codes.html) for more information on this process.

Location: *Alerts > Email Groups* section of the *Policy Manager Management Console*.

<a href="#top">back to top</a>

## Add Email Group

1. Go to **Alerts > Email Groups**.
2. Click **Add Email Group**.
3. In the *Add Email Group* screen, enter the following information under **Details**:   
  * **Name** - Should reflect the name of an organization or business function designated to manage the administration of alerts.
  * **Description**
  * **Emails** - Email addresses of the members of the group. An Email Group definition must contain at least one email address. Multiple email address entries must be separated by a comma. 
4. In the *Add Email Group* screen, define the **Email Host**:
    * **Host Name or IP** - Host Name or IP address of the email server via which Policy Manager sends email messages. This is the mail server to which Policy Manager has access, rather than the mail server(s) of the group members.
    * **Port** - Port number via which Policy Manager connects to the mail server.
    * **Authenticated** - Select this check-box if the mail server requires  Policy Manager to authenticate itself in order to send messages.
    * **Username** - Enter a valid Username.
    * **Password** - Enter a valid Password.
5. In the *Add Email Group* screen, define the **Active Interval**. This feature is used to manage the alert administration and support process by defining multiple Email Groups based on the Hour and Day of Week:
    * **Hour** - Specify the "Hour" range the email group should receive email notification of alerts.
    * **Day of the Week** - Click the appropriate check-boxes to specify the days of week the Email Group should receive email notification of alerts.  
**Notes:**  
      * *If the Active Interval fields are left blank, alert notification will occur based on a 24-hour clock.*
      * *For both* ***Hour*** *and* ***Day of the Week***, configure up to three active intervals.
      * *If you assign an Email Group to an Alert Code, but do not specify a time range during when a group should receive notifications, the Email Group receives notification for all alerts generated based upon that Alert Code.*
6. Click **Verify Connection**. The Alert Manager sends a test email to the addresses defined for the email group.
  * If the configuration is valid, the recipients receive the test email.
  * If the configuration fails, you receive an error message, and are prompted to change the values.
7. Click **Apply**. The Email Group can now be assigned to alert codes. 

<a href="#top">back to top</a>

## Modify Email Group

1. Go to **Alerts > Email Groups**.
2. Select the Email Group line item you would like to modify, and click **Modify Email Group**.
3. Follow steps 3-7 in [Add Email Group](#add-email-group).

<a href="#top">back to top</a>

## Delete Email Group

1. Go to **Alerts > Email Groups**.
2. Select the Email Group line item you would like to delete.
3. Click **Delete Email Group** and confirm deletion. The system permanently removes the Email Group definition from the system.
5. To cancel the delete operation, click **Cancel**.
 
<a href="#top">back to top</a>