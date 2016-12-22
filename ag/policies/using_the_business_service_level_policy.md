---
layout: page
title: Using the Business Service Level Policy
description: Learn how to calculate service performance levels based on metrics in an Envision data set. 
product: ag
category: learn
sub-nav-class: Policies - Integration
weight: 05
type: page
nav-title: Using the Business Service Level Policy
---

## Using the Business Service Level Policy
Learn how to calculate service performance levels based on metrics in an Envision data set.

<a href="policy_management.htm" class="button secondary">Managing Policies</a>  <a href="bus_service_level_policy_use_case_config_bus_metrics_pol_to_set_SLA_for_service.html" class="button secondary">Business Service Level Policy Use Case</a>  <a href="using_the_business_metrics_policy.html" class="button secondary">Using the Business Metrics Policy</a> <br> <a href="policies_use_case_toc.html" class="button secondary">Business Metrics Policy Use Cases</a> 

<h5 class="stamp">Supported Platforms: 8.0 and greater.</h5>

### Table of Contents
<div id="toc-marker"></div>
* [Introduction](#introduction)
* [Business Service Level Policy Options](#business-service-level-policy-options)
* [Use Case](#use-case)


### Introduction

The "Business Service Level Policy" is a QoS policy is used to calculate service performance levels based on metrics in an Envision data set.

* A policy is defined by selecting a dataset, dimension filters, and defining policy "Rules" and "Access Intervals."
* The policy is uses data collected by a Business Metrics Policy. 
* This policy works in conjunction with the Akana Envision product. 

<a href="#top">back to top</a>

### Business Service Level Policy Options

When you add a Business Service Level Policy you configure the service measurement and reporting configuration that will be referenced by services. The attributes you will configure include:

* Business Service Level Policy Name and Description
* Data set
* Dimension Filter
* Business Service Level Policy Rules
* Business Service Level Policy Access Intervals

### Configuration Options

#### Policy Name and Description

The name and description you assign to the Business Service Level Policy.

#### Select Data Set 

* Used to select a data set that consists of Metrics and Dimensions the policy can report statistics for. 

#### Select Dimensions

* Allows you to define service level performance rules by configuring filters for Dimensions of the selected data set. 

* For example, if you have a Shoe Sales data set and would like to capture service level performance on a specific "merchant" you would select the "Merchant" dimension, and specify the merchant name as the "filter." 
* You can specify multiple Filters by separating each entry with a comma.

#### Modify Business Service Level Rules

* Allows you to define conditions to measure service level performance. When a Policy Manager system condition matches a defined rule, an alert is raised.

A "Rule" is composed of "Rule Elements" (i.e., Alert Code, Metric, Operator, Value, Aggregation, and Interval) that are configured to meet your service monitoring requirements. The list of available Metrics is based on the selected data set. At least one rule must be defined per policy.

A rule is composed of the following elements:

Rule Element  | Description
------------- | -------------
Alert Code  | An identification number that represents the alert you would like to send when the defined condition is met. This value is manually entered into a text box.
Metric  | A measurable function (such as a Response Time) that is used in the rule calculation. **Note**: *The "Total" metric options add up the combined size of all the message payload over the time period.*
Operator  | A symbol that represents a mathematical function (<=, >=, etc.) used to limit or expand your search to qualify the metric.  
Value  | A numerical value that establishes the threshold of the metric.  This value is manually entered into a text box.
Aggregation  | A Unit is the unit measure by which the value is counted.
Interval  | Time interval over which the rule is measured. 

#### Modify Business Service Level Policy Access Time

Allows you to define one or more "Access Days" (Sunday through Saturday). Each "Access Day" is configured with an "Access Time" that can represent one complete day (All Day) or a date range (Range) that is specified using a 24-hour clock format (HH:MM).

**Notes:** 

* *Available SLA Custom Alert Codes are selectable from the drop-down list box on the Alert Code field.*
* *You can also enter a new SLA Custom Alert Code directly into the Service Level Policy Rule line item.*
* *Refer to [Alert Codes](http://docs.akana.com/ag/alerts/using_alert_codes.html) for more information on adding a new alert code.*

### Use Case

Refer to the following Business Service Level Policy use case for a walk-through tutorial on adding and configuring a Business Service Level Policy. 

* [Configure Business Metrics Policy to Set SLA for Service](bus_service_level_policy_use_case_config_bus_metrics_pol_to_set_SLA_for_service.html) 


<a href="#top">back to top</a>