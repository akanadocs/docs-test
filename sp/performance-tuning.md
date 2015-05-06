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

#### <a name="iinstall-features-on-separate-containers"></a>Install Features on separate containers
API traffic processing should be handled separately from Web traffic and Admin traffic. To this end, the Network Director should not be installed on the same container as Community Manager, or Policy Manager features:

![Admin Console](images/hardening-admin-console.png "Admin Console")

#### <a name="separating-policy-manager-features"></a>Separating Policy Manager Services, Scheduled Jobs and Security Services

There are two components to this:

*The 'SOA Software Policy Manager Services' feature is comprised of three seperate sub-ordinate features:
**SOA Software Managed Services - Installs the Policy Manager system services
**SOA Software Security Services - Installs Policy Manager security-related services
**SOA Software Scheduled Jobs - Installs a series of system background jobs that are executed by the Policy Manager job scheduler


### <a name="config-setting"></a>Configuration Settings

This section covers settings and tuning parameters in the product related to hardening.

#### <a name="jre-unlimited-strength"></a>Add the unlimited strength policy to the JDK

To support long passwords when importing PKI from Java Keystores, you will need to install the Java Cryptography Extension (JCE) Unlimited Strength Jurisdiction Policy Files. This is dependent on the JRE version being used and is available from Oracle. To install, copy the US_export_policy.jar and local_policy.jar files to the /lib/security directory for the JRE. 

**Scope**: All Containers

#### <a name="ignore-cookies"></a>Configure the product to ignore downstream cookies

This prevents the product from automatically storing and forwarding any cookies retrieved from the downstream APIs and Services.

**Scope**: All Containers

In the admin console, configure the following:

```
com.soa.http.client.core ->
http.client.params.cookiePolicy=ignoreCookies
```

#### <a name="secure-cookies"></a>Configure secure cookies

This sets the product to only use secure cookies. 

**Scope**: All Containers

In the admin console, configure the following:

```
com.soa.transport.jetty ->
session.manager.factory.secureCookies=true
```

#### <a name="restrict-cipher-suites"></a>Restrict the cipher suites used

Use only stronger cipher suites for SSL

**Scope**: All Containers

In the admin console, configure the following:

```
com.soa.transport.jetty ->
http.incoming.transport.config.cipherSuites=SSL_RSA_WITH_RC4_128_MD5,SSL_RSA_WITH_RC4_128_SHA,TLS_RSA_WITH_AES_128_CBC_SHA,TLS_DHE_DSS_WITH_AES_128_CBC_SHA,SSL_RSA_WITH_3DES_EDE_CBC_SHA,SSL_DHE_DSS_WITH_3DES_EDE_CBC_SHA
```

#### <a name="nd-header-propagation"></a>Header Propagation in Network Director

Prevent the automatic propagation of certain HTTP headers through the Network Director and also configure a translation of the X-Forwarded-Host header. 

**Scope**: Network Director Containers

In the admin console, configure the following:

```
com.soa.http.client.core ->
block.headers.interceptor.blocked=content-type,content-length,content-range,content-md5,host,expect,keep-alive,connection,transfer-encoding,atmo-forward-to,atmo-forwarded-from

header.formatter.interceptor.templates=replace=X-Forwarded-Host:{host}
```

#### <a name="cm-header-propagation"></a>Header Propagation in Community Manager Subsystem

Prevent the automatic propagation of certain HTTP headers through the Network Director and also configure a NULL (none) translation of the X-Forwarded-Host header. 

**Scope**: Community Manager Containers

In the admin console, configure the following:

```
com.soa.http.client.core ->
block.headers.interceptor.blocked=content-type,content-length,content-range,content-md5,host,expect,keep-alive,connection,transfer-encoding

header.formatter.interceptor.templates=
```

#### <a name="credential-cache"></a>Tune the API Security Credential Cache

You can configure the expiration period and refresh time for the security cache for API calls.

**Scope**: Network Director Containers

In the admin console, optionally configure the following:

```
com.soa.api.security ->
com.soa.api.security.cache.expirationPeriod=3600000
com.soa.api.security.cache.refreshTime=300000
```