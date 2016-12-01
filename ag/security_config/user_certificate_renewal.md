---
layout: page
title: User Certificate Renewal
description: Learn about custom "Reminder" and "Expiration" email notifications that can be issued when a certificate issued in Policy Manager is nearing its expiration date or has expired.
product: ag
category: learn
sub-nav-class: Security Configuration
weight: 05
type: page
nav-title: User Certificate Renewal
---

## User Certificate Renewal

Learn about custom "Reminder" and "Expiration" email notifications that can be issued when a certificate issued in Policy Manager is nearing its expiration date or has expired.

<a href="../security_config/security_configuration_toc.html" class="button secondary">Security Configuration (Home)</a> <a href="../security_config/policy_manager_domain.html" class="button secondary">Policy Manager Domain </a> <a href="../security_config/certificate_authority.html" class="button secondary">Certificate Authority (CA)</a> <br><br> <a href="../security_config/trusted_ca_certificates.html" class="button secondary">Trusted CA Certificates</a> <a href="../security_config/identity_systems.html" class="button secondary">Identity Systems</a> <a href="../security_config/identity_profiles.html" class="button secondary">Identity Profiles</a> <a href="../security_config/privacy.html" class="button secondary">Privacy</a>

<h5 class="stamp">Supported Platforms: 7.0 and greater.</h5><br>

<div class = "divider1"></div>

### Table of Contents
<div id="toc-marker"></div>
* [View User Certificate Renewal Summary](#view-user-certificate-renewal-summary)
* [Modify Renewal Notification](#modify-renewal-notification)

<div class = "divider1"></div>

## View User Certificate Renewal Summary

1. Go to **Configure > Certificates > user Certificate Renewal**.  
The *User Certificate Renewal Summary* screen displays and presents the configuration of the currently defined "Reminder" and "Expiration" certificate renewal email notifications.

<a href="#top">back to top</a> 

## Modify Renewal Notification

Update the "Reminder Email" and "Expiration Email" configuration for certificates issued in Policy Manager.

* Renewal details (reminder interval, "From" email), and email content are customizable.
* Substitutable variables representing certificate elements can be included in the email content based on your requirements.

1. Go to **Configure > Certificates > user Certificate Renewal**.  
The *User Certificate Renewal Summary* screen displays.
2. Click **Modify Renewal Notification**.  
The *Modify Renewal Notification* screen displays, showing the current renewal notification configuration.
3. (Optional) Modify **Renewal Details**.  
**Note**: *Substitutable variables are supported in the "Subject" and "Body" for both "Reminder" and "Expiration" email types. The variable names are enclosed in* ${}*s. 
Supported variables include:*   
*${expiration.date}—Expiration date of the certificate*  
*${user.fullname}—Fullname attribute of the user*  
*${user.username}—Username attribute of the user*  
*${certificate.subject.dn}—Subject Certificate Name of certificate*  
*${certificate.issuer.dn}—Issuer Name of certificate* 
   * **Remind Users of Expiration** - Use the drop-down to configure the frequency that email reminders will be sent out for both Reminder and Expiration email types.  Select from:  
Never  
Once  
Daily  
Weekly  
  * **Generate email from the following address** - Use this text field to directly enter the number of days prior to a certificates expiration that you would like an email sent.
4. (Optional) Modify the **Reminder Email**.  
  * **Subject** - Enter a custom email subject line.
  * **Body** - Enter the body of the email.
  * **Reset** - Reset the email configuration back to the Policy Manager default email template.
5. (Optional) Modify the **Expiration Email**.  
  * **Subject** - Enter a custom email subject line.
  * **Body** - Enter the body of the email.
  * **Reset** - Reset the email configuration back to the Policy Manager default email template.
6. Click **Apply**.  
Changes are saved and the *User Certificate Renewal Summary* screen displays.

<a href="#top">back to top</a> 