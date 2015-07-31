---
layout: page
title: Using SNMP Hosts
description: Learn how to add, modify and delete SNMP Hosts that are assigned to Alert Codes as part of implementation of remote alert monitoring.
product: ag
category: learn
sub-nav-class: Alerts
weight:	11
type: page
nav-title: Using SNMP Hosts
---

## Using SNMP Hosts

Learn how to add, modify and delete SNMP Hosts that are assigned to Alert Codes as part of implementation of remote alert monitoring.

<a href="../alerts/Alerts_toc.html" class="button secondary">Alerts (Home)</a> <a href="../alerts/using_alerts_summary.html" class="button secondary">Using Alerts Summary</a>  <a href="../alerts/using_alert_monitoring.html" class="button secondary">Using Alert Monitoring</a> <a href="../alerts/using_alert_codes.html" class="button secondary">Using Alert Codes</a> <a href="../alerts/using_management_scripts.html" class="button secondary">Using Management Scripts</a><br><br><a href="../alerts/using_email_groups.html" class="button secondary">Using Email Groups</a> 

<h5 class="stamp">Supported Platforms: 7.0 and greater.</h5>

### Table of Contents
<div id="toc-marker"></div>
* [Introduction](#introduction)
* [Add SNMP Host](#add-snmp-host)
* [Modify SNMP Host](#modify-snmp-host)
* [Delete SNMP Host](#delete-snmp-host)

## Introduction

SNMP Hosts are remote servers that are accessible from your Policy Manager host via Simple Network Management Protocol (SNMP). If you define an SNMP host within Policy Manager, you can assign that SNMP host to one or more alert codes. When an event matching that Alert Code occurs, Alert Manager automatically transmits an SNMP alert to all SNMP hosts defined in Alert Manager. This can be useful if you are using external devices to also track web service events.

Location: *Alerts > SNMP Hosts* section of the *Policy Manager Management Console*.

<a href="#top">back to top</a>

## Add SNMP Host

1. Go to **Alerts > SNMP Hosts**.
2. Click **Add SNMP Host**.
3. In the *Add SNMP Host* screen, enter the following information under **Details**:   
  * **SNMP Host** - Host IP address or host name of the server on which your NMS (network management system) resides. Host name can be up to 128 characters in length.
  * **Port** - Port by which Policy Manager can communicate with the remote server.
  * **Community String** - The string necessary for authentication.
  * **Community String Confirmation** - Re-enter the Community String.  
4. In the *Add SNMP Host* screen, define the **Active Interval** (i.e., the days of the week and the hours of the day during which Policy Manager may communicate with remote SNMP hosts):
    * **Hour** - Specify the "hour" range that Policy Manager can communicate with remote SNMP Hosts. You can configure up to three active intervals.
    * **Day of Week** - Click the relevant check-boxes to specify the day(s) of the week that Policy Manager can communicate with the remote SNMP Host. You can configure up to three active intervals.
5. Click **Apply**.

<a href="#top">back to top</a>

## Modify SNMP Host

1. Go to **Alerts > SNMP Hosts**.
2. Select the SNMP Host line item you would like to modify, and click **Modify SNMP Host**.
3. Follow steps 3-5 in [Add SNMP Host](#add-snmp-host).

<a href="#top">back to top</a>

## Delete SNMP Host

1. Go to **Alerts > SNMP Hosts**.
2. Select the SNMP Host definition line item you would like to delete.
3. Click **Delete SNMP Host** and confirm deletion. The system permanently removes the SNMP Host definition from the system.
5. To cancel the delete operation, click **Cancel**.
 
<a href="#top">back to top</a>