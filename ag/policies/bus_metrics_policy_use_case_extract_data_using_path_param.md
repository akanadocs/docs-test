---
layout: page
title: Business Metrics Policy Use Case - How Do I Extract Business Information from Service Usage Data Using Path Parameters?
description: Learn how to Extract Business information from service usage data from path parameters.   
product: ag
category: learn
weight:	9
sub-nav-class: Operational Policies
type: page
nav-title: Business Metrics Policy Use Case - How Do I Extract Business Information from Service Usage Data Using Path Parameters?
---

## How Do I Extract Business Information from Service Usage Data Using Path Parameters?

The following use case illustrates how to use the Business Metrics Policy to extract business information from service usage data from path parameters.

## Configuration

1. Launch the *Envision Console*, select **New Dataset** and define a dataset with sharing as **Public**.   
![](images/bus_metrics_pol_usecase2a.jpg)
2. In the new dataset, select **New Dimension** and define a dimension with the **TEXT** type.  
![](images/bus_metrics_pol_usecase2b.jpg)
3. Select **New Metric** in the same dataset and define a metric with the the **COUNT** type and all aggregations.   
![](images/bus_metrics_pol_usecase2c.jpg)
4. Save aggregation settings for the selected dataset.  
![](images/bus_metrics_pol_usecase2d.jpg)
5. Select **New Chart**, and create a chart using this dataset with the following configuration:  
![](images/bus_metrics_pol_usecase2e.jpg)
![](images/bus_metrics_pol_usecase2f.jpg)
![](images/bus_metrics_pol_usecase2g.jpg)
6. Select **New Dashboard** and create a dashboard with the newly defined chart:   
![](images/bus_metrics_pol_usecase2h.jpg)
![](images/bus_metrics_pol_usecase2i.jpg)
![](images/bus_metrics_pol_usecase2j.jpg)
7. Launch the *Policy Manager Management Console* and create a service with [http://www.ebi.ac.uk/Tools/services/rest/censor?wadl](http://www.ebi.ac.uk/Tools/services/rest/censor?wadl)
(help for this service:  [http://www.ebi.ac.uk/Tools/webservices/services/so/censor_rest](http://www.ebi.ac.uk/Tools/webservices/services/so/censor_rest)
8. Virtualize the service on Network Director.
9. Navigate to *Policies > Operational* and create a *Business Metrics Policy* using **Add Policy**. 
10. Configure the policy and select the dataset defined above.   
![](images/bus_metrics_pol_usecase2k.jpg)
11. Provide Extract/Derive Configuration for each of the dimensions and metrics using the example illustrated below:  
  * Dimension using Extract – To obtain a value in path parameters.
  * Metric using Derive – To obtain usage count.  
![](images/bus_metrics_pol_usecase2l.jpg)
![](images/bus_metrics_pol_usecase2m.jpg)
12. Attach the policy to the service.  
![](images/bus_metrics_pol_usecase2n.jpg)
![](images/bus_metrics_pol_usecase2o.jpg)
13. Send multiple requests to generate data for various cases.  
![](images/bus_metrics_pol_usecase2p.jpg)
![](images/bus_metrics_pol_usecase2q.jpg)
![](images/bus_metrics_pol_usecase2r.jpg)
![](images/bus_metrics_pol_usecase2s.jpg)
14. Check the data to be recorded in MongoDB and Dataset. The data should be appropriate per the requests sent.
15. The chart should record information based on the data generated in the datasets from above requests. 

<a href="#top">back to top</a>