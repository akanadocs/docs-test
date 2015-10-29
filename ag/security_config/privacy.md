---
layout: page
title: Privacy
description: Learn about applying additional encryption security to User Name, Full Name and Email fields to make them private (i.e. not searchable in the Policy Manager Management Console).
product: ag
category: learn
sub-nav-class: Security Configuration
weight:	6
type: page
nav-title: Privacy
---

## Privacy
Learn about applying additional encryption security to User Name, Full Name and Email fields to make them private (i.e. not searchable in the Policy Manager Management Console).

<a href="../security_config/security_configuration_toc.html" class="button secondary">Security Configuration (Home)</a> <a href="../security_config/view_and_modify_policy_manager_domain_name_and_description.html" class="button secondary">View and Modify Policy Manager Domain Name and Description</a> <a href="../security_config/certificate_authority.html" class="button secondary">Certificate Authority (CA)</a> <br><br> <a href="../security_config/trusted_ca_certificates.html" class="button secondary">Trusted CA Certificates</a> <a href="../security_config/user_certificate_renewal.html" class="button secondary">User Certificate Renewal</a> <a href="../security_config/managing_identity_systems.html" class="button secondary">Managing Identity Systems</a> <a href="../security_config/identity_profiles.html" class="button secondary">Identity Profiles</a>
<h5 class="stamp">Supported Platforms: 7.0 and greater.</h5>
### Table of Contents
<div id="toc-marker"></div>
* [About Privacy](#about-privacy)
* [Manage Privacy](#manage-privacy)

## About Privacy
In Policy Manager, the *User Name*, *Full Name*, and *Email* personal information fields are searchable / visible (by default) in various areas of the *Policy Manager Management Console*. If you would like to apply additional security to these fields and make them "private" (i.e., not searchable in the Policy Manager Management Console), you can configure them to be encrypted using the *Manage Privacy* function. 

Access the *Privacy Summary* Screen, where you will see a list of personal information fields that are encrypted by going to **Configure > Security > Privacy**.

<a href="#top">back to top</a> 


## Manage Privacy
Encrypt the *User Name*, *Full Name*, and *Email* fields so they are private and not searchable in the *Policy Manager Management Console*.

1. Go to **Configure > Security > Privacy**.    
The *Privacy Summary* Screen is displayed showing a list user information fields that can be selected for encryption. 
2. Click the **checkbox** next to each information field you would like to encrypt in the Policy Manager Management Console.
3. Click **Apply**.  
A confirmation message appears.
4. Click **OK** to accept the confirmation.  
The summary screen will update with your selections.

For the information fields you designated as private in steps 1 - 4 above, when you try to search for them in the various areas of the *Policy Manager Management Console*, you will receive zero search results as the data will not be recognized because the fields are now encrypted. 

**For example**, if you make the *Full Name* information field private, and then try to search for "Full Name" on the *Manage Identities* Screen, you would receive zero results.

<a href="#top">back to top</a> 

