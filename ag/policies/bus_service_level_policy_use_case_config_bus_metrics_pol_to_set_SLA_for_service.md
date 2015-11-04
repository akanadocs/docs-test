---
layout: page
title: Business Service Level Policy Use Case - How Do I Configure a Business Metrics policy to set SLA for a service?
description: Learn how to configure a Business Metrics policy to set SLA for a service.   
product: ag
category: learn
weight:	9
sub-nav-class: Operational Policies
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
3. Configure the Business Metrics Policy:  
 * a. Select any dataset  
 ![](images/bus_service_level_polic_usecase1b.jpg)
 * b. Provide dimensions and metrics configuration  
 ![](images/bus_service_level_polic_usecase1c.jpg)  
 ![](images/bus_service_level_polic_usecase1d.jpg)
 * c. Activate the policy  
  ![](images/bus_service_level_polic_usecase1e.jpg)
4. Configure the Business service level policy:  
  * a. Select tehe same dataset as above  
  ![](images/bus_service_level_polic_usecase1f.jpg)
  * b. Select filters (by dimensions)  
  ![](images/bus_service_level_polic_usecase1g.jpg)
  * c. Select desired condition based on the metrics in the dataset(data is loaded into the metrics as per the configuration in Business metrics policy)  
  ![](images/bus_service_level_polic_usecase1h.jpg)
  * d. Select alert code
  * e. Select the days and durations for which alert to be triggered  
  ![](images/bus_service_level_polic_usecase1i.jpg)
  * f. Activate the policy  
  ![](images/bus_service_level_polic_usecase1j.jpg)
5. Attach Business metrics policy in operational policies
6. Attach Business service level policy in qos policies  
![](images/bus_service_level_polic_usecase1k.jpg)
7. Send few requests to the virtual service so that the condition described in the Business service level policy is crossed.
8. See alerts at service level.
9. See SLA cleared alerts at service level (Similar to the below picture).
![](images/bus_service_level_polic_usecase1l.jpg)<a href="#top">back to top</a>