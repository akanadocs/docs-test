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
		<li><a href="#install-features-on-separate-containers">Installing features on separate containers</a></li>
		<li><a href="#separating-policy-manager-features">Splitting features into smaller, subordinate features</a></li>
		<li><a href="#data-archiving">Data archiving</a></li>
	</ol>
	<li><a href="#config-setting">Configuration Settings</a></li>
	<ol>
		<li><a href="#os-file-handles">Configuring OS File Handles</a></li>
		<li><a href="#jre-memory">Configuring the JVM memory settings</a></li>
		<li><a href="#listener-connection-pool">Configuring the container listeners</a></li>
		<li><a href="#client-connection-pool">Configuring the client connection pool</a></li>
	</ol>
	<li><a href="#other-settings">Other Settings</a></li>
	<ol>
		<li><a href="#gif-metrics">Calculating GIF metrics</a></li>
		<li><a href="#auto-search">Disabling auto-search</a></li>
		<li><a href="#require-metrics-policy">Internal service metrics calculations</a></li>
		<li><a href="#usage-writer">Configuring the Usage Writer</a></li>
		<li><a href="#preloading">Preloading invoked services</a></li>
		<li><a href="#contract-policy-cache">Contract policy cache</a></li>
		<li><a href="#endpoint-cache">Endpoint cache</a></li>
	</ol>
</ol>

### <a name="introduction"></a>Introduction

Akana is a recognized leader in API Management and SOA Governance Automation solutions.  Our platform-independent solution set includes the API Gateway, which is further broken down into Policy Manager, the centralized administration console, and Network Director, an intermediary that integrates with Policy Manager to provide high-performance, scalable API security and management capabilities. The solution also includes Community Manager, which provides a branded developer portal for the consumption of API by the developer.

This document describes the performance tuning parameters for Akana’s API Gateway and Community Manager products. 

### <a name="deployment-architecture"></a>Deployment Architecture
There are several optional deployment choices that can improve the performance of the product.

#### <a name="install-features-on-separate-containers"></a>Installing features on separate containers
API traffic and Internal and External Web traffic should be handled on separate containers to facilitate the independent scaling of these capabilities. To this end, the 'SOA Software Network Director', 'SOA Software Community Manager' and 'SOA Software Policy Manager Console' features should be installed on different containers. 

You may also want to dedicate containers for the 'SOA Software Policy Manager Services' feature. This feature provides the backend APIs to support the Network Directors and is often installed in the same containers as the 'SOA Software Policy Manager Console' and/or 'SOA Software Community Manager' features. The decision to install it on its own container can be driven by security requirements (e.g. network topology) or the minimization of load on the Web traffic containers. 

![Admin Console](images/hardening-admin-console.png "Admin Console")

#### <a name="separating-policy-manager-features"></a>Splitting features into smaller, subordinate features

Akana has further provided the ability to split certain features that would typically be installed on a single container into sub-ordinate features that can be installed on separate containers.

There are currently two features that can be split up this way:

* The 'SOA Software Policy Manager Services' feature is comprised of three separate sub-ordinate features:
  * SOA Software Managed Services - Installs the Policy Manager system services
  * SOA Software Security Services - Installs Policy Manager security-related services
  * SOA Software Scheduled Jobs - Installs a series of system background jobs that are executed by the Policy Manager job scheduler
* The 'SOA Software Community Manager' feature is comprised of two separate sub-ordinate features:
  * SOA Software Community Manager Scheduled Jobs - This feature enables Community Manager scheduled jobs on the container
  * SOA Software Community Manager APIs - This feature deploys Community Manager APIs in the container

**Notes:**

1. All Schedule jobs features should be in the same container. This means that 'SOA Software Scheduled Jobs' and 'SOA Software Community Manager Scheduled Jobs' must be installed together into containers. Installing any one scheduled job feature will start the Quartz scheduler and could cause it to run all schedule jobs resulting in failures.
2. The Community Manager theme features (e.g. 'SOA Software Community Manager Simple Developer Theme' and 'SOA Software Community Manager Default Theme') must be installed together with the 'SOA Software Community Manager APIs' feature into containers. 

#### <a name="data-archiving"></a>Data archiving

Over time, the data stored by the Policy Manager will need to be archived to prevent the database from growing to an unmanageable size. This is a critically important maintenance task that can be performed is three different ways:

1. Exporting usage data from the user interface or via an API call
2. Configuring the deleting of data in the admin console's 'com.soa.rollup.delete.old' category
3. Utilizing CRON or similar scheduling framework to delete data directly in the database.

The recommended approach is #3 above and more information can be provided by our support organization at support@akana.com


### <a name="config-setting"></a>Configuration Settings

This section covers settings in the product related to performance tuning.

#### <a name="os-file-handles"></a>Configuring OS File Handles

On *nix operating systems, every inbound and outbound connection is assigned a file handle (descriptor). By default, some systems have a small number of file handles assigned (e.g. 1024) which is insufficient. We recommend setting the number of file handles to a minimum of 100000. Configuring this differs between operating systems so you should consult with your SysAdmin. The following steps are for RedHat systems:

To get the maximum open files count allowed for the entire system:

```
cat /proc/sys/fs/file-max
```

This value must be significantly higher than 100000 (if not, consult the OS documentation) so that there are plenty of file handles available for the Container user account. You can check to see how many file handles are currently being used by checking:

```
$ cat /proc/sys/fs/file-nr
1154    133     8192
```

The first column gives you an idea how much file handles are currently used.

After checking the system limits, you need to set the limits for the container user account [SOAUSERACCOUNT]. To get the maximum open files count allowed for the user, log in as the container user account and:

```
$ ulimit -n
1024
```

To change this limit, edit the /etc/security/limits.conf file and make the following changes or add the following lines, respectively: 

```
[SOAUSERACCOUNT]           soft    nofile          100000
[SOAUSERACCOUNT]           hard    nofile          100000
```

After changing the limits.conf file, you will need to re-login for the setting to tale effect. Use ulimit -n to ensure that the value has changed.

**Scope**: All Containers

#### <a name="jre-memory"></a>Configuring the JVM memory settings

Generally we do not advise changing the JVM memory settings. A better approach is to install more containers and load-balance across them. This is due to the overhead incurred in managing the increased memory. The container ships with the following defaults:

* For 32 bit machines: -Xmx1024M -XX:MaxPermSize=192M
* For 64 bit machines: -Xmx2048M -XX:MaxPermSize=256M

These settings are defined in the startup batch or shell scripts in the /bin directory.

If you decide to increase the JVM memory settings anyway, always increase the MaxPermSize in proportion to the memory allocated and do not exceed 4096M. e.g. -Xmx4096M -XX:MaxPermSize=512M

**Scope**: All Containers

#### <a name="listener-connection-pool"></a>Configuring the container listeners

The listener thread pool size dictates the number of concurrent inbound connections that the container can handle.

**Scope**: All Containers

In the Policy Manager Console, navigate to the appropriate container and select 'Modify Container Listener' from within the 'Inbound Listeners' section. You will be presented with configure the following:

![Modify Container Listener](images/modify-container-listener.png "Modify Container Listener")

The only parameter that is typically modified is 'Maximum' It should be set to a value high enough to support the number of concurrent connections. This is different depending on the features installed in each container:

* SOA Software Network Director - this value is typically the same as the maxTotal value set in the client connection pool. This is because the Network Director is a proxy and the ratio of inbound to outbound connections is typically 1:1.
* SOA Software Community Manager (specifically the 'SOA Software Community Manager APIs' feature) - this value should be set based on the number of hits per second. If the 'SOA Software Community Manager OAuth Provider' feature is installed, the number of hits to the OAuth server should also be accounted for. **A general rule of thumb is to assume a minimum of 1 thread for every 10 concurrent users.**
* SOA Software Policy Manager Console - this value should be set to the number of concurrent active users of the Policy Manager user interface.
* SOA Software Policy Manager Services (specifically the 'SOA Software Managed Services' feature) - this value should only be changed on rare occasions where there are a very large number of Network Directors in the environment. **A good rule of thumb is 10 threads per Network Director.**

#### <a name="client-connection-pool"></a>Configuring the client connection pool

The client connection pool controls the number of simultaneous outbound connections from the container. It typically only requires tuning in the Network Director.

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

### <a name="other-settings"></a>Other settings

This section covers tuning parameters that are used less often. The default settings will work in the majority of environments.

#### <a name="gif-metrics"></a>GIF metrics

GIF (Governance Interoperability Framework) is a legacy UDDI standard for publishing metrics. By default this value is set to 'false' and the Policy Manager does not calculate these metrics, but this can be configured:

**Scope**: Containers running the 'SOA Software Managed Services' feature, which is subordinate to the 'SOA Software Policy Manager Services' feature.

In the admin console, configure the following:

```
com.soa.service.category -> 
service.category.manager.transactional.loadGifMetrics = false
```

#### <a name="auto-search"></a>Disabling auto-search

This property controls the behavior of the Policy Manager Console (Workbench Tab) when its loaded. By default this value is set to true and a search is executed to display all the APIs/Services in the system. If there are a large number of services this default search can take a while and should be disabled.

**Scope**: Containers running the 'SOA Software Policy Manager Console' feature.

In the admin console, configure the following:

```
com.soa.console -> 
workbench.search.PerformAutoSearch=true
```

#### <a name="require-metrics-policy"></a>Internal service metrics calculations

By default, the Policy Manager records performance metrics for its own internal services. This will add volumes of data to the database if not cleaned out regularly. If these metrics are not important, you can disable the default metrics collection (thereby requiring the explicit assignment of the metric policy) by setting the config parameter to 'true'. This setting is slightly counter-intuitive.

**Scope**: Containers running the 'SOA Software Managed Services' feature, which is subordinate to the 'SOA Software Policy Manager Services' feature.

In the admin console, configure the following:

```
com.soa.metrics -> 
metrics.rollup.reporter.requireMetricsPolicy=true
```

#### <a name="usage-writer"></a>Configuring the Usage Writer

The Usage Writer is an in-memory queue and batch writing mechanism to store usage data, recorded messages and metrics in the database. 

**Scope**: 

1. Network Director Containers that are writing usage to the database. (```com.soa.monitor.usage -> usage.database.writer.enabled=true```)
2. In the case that the Remote Usage Writer is used by the Network Director (```com.soa.monitor.usage -> usage.remote.writer.enabled=true```), you would configure the Usage Writer on containers running the 'SOA Software Managed Services' feature, which is subordinate to the 'SOA Software Policy Manager Services' feature.

The most important parameters controlling the Usage Writer are:

```
com.soa.monitor.usage ->
usage.queue.capacity=10000

com.soa.monitor.usage ->
usage.batch.writer.usageBatchSize=50

com.soa.monitor.usage ->
usage.batch.writer.writeInterval
``` 

The 'com.soa.monitor.usage' property is the one that in most cases causes issues with high volumes of traffic. If the Usage Writer cannot write to the database quickly enough, the usage queue will fill up over time. If each record has two recorded messages of 5kB each, the queue will occupy 100MB of memory. To avoid the queue from filling up the following actions can be taken:

1. Improving database write performance
2. Adding additional Network Directors (if the Network Director is connecting to the database directly (default)) or additional Policy Manager instances (if the remote usage writer is being used).
2. Increasing the usageBatchSize by small increments 
3. Decreasing the writeInterval by small decrements

#### <a name="preloading"></a>Preloading invoked services

During normal Network Director operation, the downstream API/service endpoints are loaded only upon first invocation. This is done to save memory and lower startup time, but incurs an overhead in the first invocation of an API. If the number of APIs/Services is less than 100, you can preload all the downstream endpoint on startup.

**Scope**: Network Director Containers

In the admin console, configure the following:

```
com.soa.vs.engine -> 
vs.capability.metadata.preloadInvokedServices=true
```

#### <a name="contract-policy-cache"></a>Contract policy cache

The Network Director caches the policies associated with the contract. This cache expires to save memory, but incurs an overhead in the first invocation of an API when the cache is reloaded.

**Scope**: Network Director Containers

In the admin console, configure the following:

```
com.soa.contract.enforcement -> 
contract.handler.framework.idleExpiration=259200
```
Amount of seconds a contract that has not been authorized against will remain cached. The default value is 300, but it can be extended to something like 259200 (3 days)

```
com.soa.contract.enforcement -> 
contract.handler.framework.maxRefreshInterval=900
```

Amount of seconds a contract should remain in the cache before requiring a refesh. The default value is 120, but can be extended to something like 900 (15 minutes) as long as the time taken to propagate contract policies is not a security or operational concern.

#### <a name="endpoint-cache"></a>Endpoint cache

The Network Director caches the endpoints associated with downstream APIs/Service. This cache expires to save memory, but incurs an overhead in the first invocation of an API when the cache is reloaded.

**Scope**: Network Director Containers

In the admin console, configure the following:

```
com.soa.jbi -> 
lbha.endpoint.refresh.task.allowRemoval=false
```
If true, removes endpoints from the ache when inactive. The default value is true, but if there are not large numbers of inactive APIs/Services being managed, this value can be set to false.


```
com.soa.jbi -> 
lbha.endpoint.refresh.task.expirationInterval=3600000
```
The time in milliseconds and endpoint can be inactive (not called) before it is removed from the router cache. The default value is 300000, but can be set to 3600000 (one hour). 

```
com.soa.jbi -> 
lbha.endpoint.refresh.task.maxrefreshInterval=900000
```
The maximum amount of time in milliseconds before the refresh of endpoints. The default value is 60000, but can be extended to 900000 (15 minutes) as long as the time to propagate downstream endpoint changes is not a security or operational concern.


