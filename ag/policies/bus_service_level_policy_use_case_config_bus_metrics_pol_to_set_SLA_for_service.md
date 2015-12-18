---
layout: page
title: Business Service Level Policy Use Case - How Do I Configure a Business Metrics policy to set SLA for a service?
description: Learn how to configure a Business Metrics policy to set SLA for a service.   
product: ag
category: learn
weight:	9
sub-nav-class: Integration Policies
type: page
nav-title: Business Service Level Policy Use Case - How Do I Configure a Business Metrics policy to set SLA for a service?
---

## Business Service Level Policy Use Case - How Do I Configure a Business Metrics policy to set SLA for a service?

The following use case illustrates how to configure a Business Metrics policy to set SLA for a service.

<h5 class="stamp">Supported Platforms: 8.0 and greater.</h5>

<div id="toc-marker"></div>

### Configuration

1. Create a physical service.
2. Virtualize the physical service.
![](images/bus_service_level_polic_usecase1a.jpg)
3. In the *Policies > Operational* section, use **Add Policy** to configure a Business Metrics Policy:  
 * a. Select any dataset.  
 ![](images/bus_service_level_polic_usecase1b.jpg)
 * b. Provide dimensions and metrics configuration.  
 ![](images/bus_service_level_polic_usecase1c.jpg)  
 ![](images/bus_service_level_polic_usecase1d.jpg)
 * c. Activate the policy.  
  ![](images/bus_service_level_polic_usecase1e.jpg)
4. In the *Policies > QoS* section, use **Add Policy** to configure a Business Service Level Policy:  
  * a. Select the same dataset as above.  
  ![](images/bus_service_level_polic_usecase1f.jpg)
  * b. Select Filters (by dimensions).  
  ![](images/bus_service_level_polic_usecase1g.jpg)
  * c. Select desired condition based on the metrics in the dataset (data is loaded into the metrics as per the configuration in Business Metrics Policy).  
  ![](images/bus_service_level_polic_usecase1h.jpg)
  * d. Select alert code.
  * e. Select the Days and Durations for which the alert will be triggered.  
  ![](images/bus_service_level_polic_usecase1i.jpg)
  * f. Activate the policy.  
  ![](images/bus_service_level_polic_usecase1j.jpg)
5. Attach Business Metrics Policy in *Operational Policies* section.
6. Attach Business Service Level Policy in *QoS Policies* section.  
![](images/bus_service_level_polic_usecase1k.jpg)
7. Send several requests to the virtual service so that the condition described in the Business Service Level Policy is crossed.
8. See alerts at the service level.
9. See SLA cleared alerts at the service level (Similar to the illustration below).
![](images/bus_service_level_polic_usecase1l.jpg)<a href="#top">back to top</a>