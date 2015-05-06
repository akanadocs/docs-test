---
layout: page
title: Performance Tuning
description: A guide on how to tune the performance of the platform to support high load
product: sp
category: ref
sub-nav-class: 
weight: 4
type: page
nav-title: Performance Tuning
---

Akana Performance Tuning Guide
-------------------------------------

<h3 style="color: grey;">Table of Contents</h3>
<ol class="table_of_contents">
	<li><a href="#introduction">Introduction</a></li>
	<li><a href="#deployment-architecture">Deployment Architecture</a></li>
	<ol>
		<li><a href="#install-features-on-separate-containers">Install Features on separate containers</a></li>
		<li><a href="#separating-policy-manager-features">Separating Policy Manager Services, Scheduled Jobs and Security Services </a></li>
	</ol>
	<li><a href="#config-setting">Configuration Settings</a></li>
	<ol>
		<li><a href="#os-file-handles">Configuring OS File Handles</a></li>
		<li><a href="#jre-memory">Configuring the JRE memory settings</a></li>
		<li><a href="#listener-connection-pool">Configuring the container listeners</a></li>
		<li><a href="#client-connection-pool">Configuring the client connection pool</a></li>
	</ol>
</ol>

### <a name="introduction"></a>Introduction

Akana is a recognized leader in API Management and SOA Governance Automation solutions.  Our platform-independent solution set includes the API Gateway, which is further broken down into Policy Manager, the centralized administration console, and Network Director, an intermediary that integrates with Policy Manager to provide high-performance, scalable API security and management capabilities. The solution also includes Community Manager, which provides a branded developer portal for the consumption of API by the developer.

This document describes the performance tuning parameters for Akana’s API Gateway and Community Manager products. 

### <a name="deployment-architecture"></a>Deployment Architecture
There are several optional deployment choices that can improve the performance of the product.

#### <a name="install-features-on-separate-containers"></a>Install Features on separate containers
API traffic processing should be handled separately from Web traffic and Admin traffic. To this end, the Network Director should not be installed on the same container as Community Manager, or Policy Manager features:

![Admin Console](images/hardening-admin-console.png "Admin Console")

#### <a name="separating-policy-manager-features"></a>Separating Policy Manager Services, Scheduled Jobs and Security Services

Akana has provided the ability to split certain features that would typically be installed on a single container into sub-ordinate features that can be installed on separate containers.

There are currently teo features that can be split up this way:

* The 'SOA Software Policy Manager Services' feature is comprised of three seperate sub-ordinate features:
  * SOA Software Managed Services - Installs the Policy Manager system services
  * SOA Software Security Services - Installs Policy Manager security-related services
  * SOA Software Scheduled Jobs - Installs a series of system background jobs that are executed by the Policy Manager job scheduler
* The 'SOA Software Community Manager' feature is comprised of two seperate sub-ordinate features:
  * SOA Software Community Manager Scheduled Jobs - This feature enables Community Manager scheduled jobs on the container
  * SOA Software Community Manager APIs - This feature deploys Community Manager APIs in the container



### <a name="config-setting"></a>Configuration Settings

This section covers settings in the product related to performance tuning.

#### <a name="os-file-handles"></a>Configuring OS File Handles

On *nix operating systems, every inbound and outbound connection is assigned a file handle. By default, some systems have a small number of file handles assigned (e.g. 1024) which is insufficient. We recommend setting the number of file handles to a minimum of 100000. Configuring this differs between operating systems so you should consult with your SysAdmin. The following steps are for RedHat systems:

To get the maximum open files count allowed:

```
cat /proc/sys/fs/file-max
```

To set the maximum open files count allowed:

```
echo 100000 > /proc/sys/fs/file-max
```

To make the change permanent, add or change the following line in the file /etc/sysctl.conf. This file is used during the boot process.

```
echo "fs.file-max= 100000" >> /etc/sysctl.conf
```

**Scope**: All Containers

#### <a name="jre-memory"></a>Configuring the JRE memory settings

To support long passwords when importing PKI from Java Keystores, you will need to install the Java Cryptography Extension (JCE) Unlimited Strength Jurisdiction Policy Files. This is dependent on the JRE version being used and is available from Oracle. To install, copy the US_export_policy.jar and local_policy.jar files to the /lib/security directory for the JRE. 

**Scope**: All Containers

#### <a name="listener-connection-pool"></a>Configuring the container listeners

The listener thread pool size dictates the number of concurrent inbound connections that the container can handle.

**Scope**: All Containers

In the Policy Manager Console, navigate to the appropriate container and select 'Modify Container Listener' from within the 'Inbound Listeners' section. You will be presented with configure the following:

![Modify Container Listener](images/modify-container-listener.png "Modify Container Listener")

The only parameter that is typically modified is 'Maximum' It should be set to a value high enough to support the number of concurrent connections. This is different depending on the features installed in each container:

* SOA Software Network Director - this value is typically the same as the maxTotal value set in the client connection pool. This is because the Network Director is a proxy and the ratio of inbound to outbound conenctions is typically 1:1.
* SOA Software Community Manager (specifically the 'SOA Software Community Manager APIs' feature) - this value should be set based on the number of hits per second. **A general rule of thumb is to assume a minimum of 1 thread for every 10 concurrent users.**
* SOA Software Policy Manager Console - this value should be set to the number of concurrent active users of the Policy Manager user interface.
* SOA Software Policy Manager Services (specifically the 'SOA Software Managed Services' feature) - this value should only be changed on rare occasions where there are a very large number of Network Directors in the environment. **A good rule of thumb is 10 threads per Network Director.**

#### <a name="client-connection-pool"></a>Configuring the client connection pool

The client connection pool controls the number of simulataneous outbound connections from the container. It typically only requires tuning in the Network Director.

The maximum number of connections required in the pool is determined by two factors:

* Latency of the downstream API/Service
* Number of transactions per second

For example, if you are expecting 200tps for a single API/Service that has a downstream latency of 3 seconds, you will need to increase maxConnectionsPerHost to 600 to handle the load. Adding up all the traffic across all routes will determine the maxTotal value.

**Scope**: Network Director Containers

In the admin console, configure the following (values shown as an example):

```
com.soa.http.client.core -> 
http.connection.manager.maxTotal = 2000

com.soa.http.client.core -> 
http.connection.manager.defaultMaxPerRoute = 1500
```
