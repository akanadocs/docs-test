---
layout: page
title: Configure Claims-based Identity System
description: Learn how to configure a Claims-based Identity System.
product: ag
category: learn
sub-nav-class: Security Configuration
weight:	6
type: page
nav-title: Configure Claims-based Identity System
---
<h5 class="stamp">Supported Platforms: 7.0 and greater.</h5>

<a href="../managing_identity_systems.html" class="button secondary">Managing Identity Systems</a>
## Configure Claims-based Identity System
For the Claims-based Identity System, configuration tasks include:

* Selecting the "Identity System Type" from the drop-down list box
* Specifying: 
  * Domain Details
  * Issuer Name
  * Issuer Certificate
  * Identity XPath
  * Namespace Prefixes
  * Claim Name
  * Claim Description
  * Assertion XPaths

**Notes**:

* *After a Claim-based Identity System instance is created and configured, it can be used for authentication and authorization of web service requests.*
* *You can define multiple claims in a single configuration.*

1. Go to **Configure > Security > Identity Systems**.  
The *Identity Systems Summary* screen displays.
2. Click **Add Identity System**.  
The *Add Identity System Wizard* launches and displays the *Identity System Domain Details* screen.
3. Under *Select Identity System*, use the *Identity System Type* **drop-down list box** to select **Claims-based**. 
4. Enter the Domain Details (Name & Description) associated with the Claims-based Identity System Type selected in step 3.  
5. Click **Next**.  
You are taken to the *Claim Configuration* screen.
6. Enter *Issuer Details*:  
  * **Issuer Name** - A URI that uniquely represents a claim issuer. If the claim token is SAML, the issuer identifier must match the issuer URL in the SAML token.
  * **Issuer Certificate** - an X509 Certificate of the issuer. It is used by Policy Manager to verify the signature of the claim token at runtime.
  * Click **Choose File** to upload your certificate.
7. Enter *XPath and Namespace Configuration Details*.  
  *  **Identity XPath** - An XPath string function that will be evaluated against the claim token during runtime. The result of the evaluation will be used as the identifier of the requester and saved as part of the usage data.
  *  **Namespace Prefixes** - User-configured and used to both simplify the specification of XPath expressions ad as the context to evaluate all XPath expressions in the claim configuration.  
  *  Click **Add Namespace** to add multiple Namespace entries. 
8. Add **Claim Configuration Details** to specify the configuration of multiple claims issued by the same authority.  
**Note**: *A requestor may satisfy multiple claims in the same token.*  
  * **Claim Name** - A string that identifies the claim.
  * Click **Add Claim** to add multiple claim entries.
9. Click **Next**.  
The *Assertion XPaths* Screen is displayed where you specify one or more XPath Assertions and Claim Descriptions for each claim.  
**Note**: *An "Assertion XPaths" Screen will be displayed for each claim name you define.*
10. (Optional) Enter a **Claim Description**.
11. Add an **Assertion XPath** which is an XPath string representing an assertion in a claim token.  
  * The XPath expression will be evaluated against a claim token at runtime. 
  * In order for the claim token to be valid, the result of the XPath evaluation must be true. You can specify multiple XPath assertions for a single claim. 
  * In this case, each assertion must be evaluated to true in order for the token to be accepted. 
  * If the evaluation of one or more specified XPath assertions is false at runtime, the claim will be considered invalid and will result in authorization failure.
12. Click **Finish**.  
The system configures your identity system based on your provided configuration parameters and returns to the *Identity System Summary* screen.


<a href="#top">back to top</a> 