# Thirdparty Customer Portal API Doc Integration
This sample demonstrates the integration of Swagger API documentation, OpenAPI documentation, and API Test Client into an external portal.

## Domain requirement
### Same Domain 
- The Third-party Customer Portal and the Community Manager developer portal must run in the same domain. This is required because the Third-party Customer Portal needs to share cookies set by pre-authentication ajax API calls to the 
Community Manager developer portal by the main window in which API Documentation iframe is embedded. The browser will not allow making those calls unless they are in the same domain.
- CORS is not enabled by default on Community Manager APIs. 

```
Example: 
See in below example both have the same domain soa.com.
	Third-party Customer Portal: http://thirdparty.soa.com:8080/thirdparty_customer_portal/thirdparty_customer_portal_with_api_doc.html
	Community Manager Developer Portal: http://open.soa.com:7900/atmosphere/
```

### Different Domain 
- The Third-party Customer Portal and the Community Manager developer portal can be on a different domain but needs a few more configurations.
- CORS policy should be added to Community Manager APIs if API calls are made from the main window in which API Documentation iframe is embedded to Community Manager APIs like `/ssoLogin`, `/renewToken` and `endsession`. If only `ssoLogin` call is made and if it is using the browser redirection option then adding CORS policy is not required.
- Navigate to Admin > Settings > Security > select `None` for Authentication and CSRF Token Cookie Attribute - SameSite and save.
- Configure `https` for nginx as `None` for Authentication and CSRF Token Cookie Attribute - SameSite works only with `https`
- Update Tenant theme `Console Address` to `https:`

```
Example: 
See in below example each is on a different domain.
	Third-party Customer Portal: https://thirdparty.acme.com:8080/thirdparty_customer_portal/thirdparty_customer_portal_with_api_doc.html
	Community Manager Developer Portal: https://open.soa.com:7900/atmosphere/
```

## Prerequisite
Refer to the [Prerequisites](../../readme.md) section in the main page.

### thirdparty_customer_portal_with_api_doc.html
In this page we load Swagger, Open API and API Test Client inside an iframe. Embedded iframe API documentation can be loaded in different ways and each way is mutually exclusive. Please read and understand inline documentation for each way. Don't try to load Embedded iframe API documentation in more than one way at the same time.

### thirdparty_customer_portal_pre_auth.html
In this page you make /oauth2/authorize call to OpenID Connect to get the id_token and set the `window.location.href` to `CommunityManagerDeveloperPortal-URL/api/login/ssoLogin/YOUR_AKANA_OIDCRP_DOMAIN_NAME/finalUrl=YOUR_FINAL_URL&id_token=ID_TOKEN_VALUE`.

After Community Manager Developer Portal sucessfully authenticates and authorizes it will redirect to finalUrl and all the cookies required for Community Manager Developer Portal are set.
		
### thirdparty_customer_portal.html
This is Thirdparty Customer Portal page and if user does not visit Thirdparty Customer Portal with API Documentation page before the inital token expires which you got during login then user will see 401 error for private APIs. Hence we use hidden iframe to renew token in background.



## Setup
Refer to [Setup](../readme.md).

- Add OpenID Relying Party Domain in Akana Developer Portal for Third Party Customer Portal OIDC.
- Attach CORSAllowAll Policy to the LoginAPIService API in the Akana Policy Manager Console.
- Register User which is used to login to Third Party Customer Portal OIDC is registered in Akana Developer Portal as OpenID Relying Party Domain user. 
- Add hostname used in the finalUrl query parameter to the Site -> Themes -> Virtual Hosts. If this is not configured, an http 500 error will be returned when `/api/login/ssoLogin` call is invoked.
- Install nginx or any webserver.
- Configure both `http` and `https` on nginx. Refer HTTPS section in attached `nginx.conf` file for sample config. You can create new certificate or use `./certificates/selfsigned05/selfsigned05.cer` and `./selfsigned05/selfsigned05.key`
- Configure `https` listener for Comminity Manager Portal. You can create new certificate or use `./certificates/selfsigned01/selfsigned01.cer` and `./selfsigned01/selfsigned01.key`.
- Install all certificates as Trusted Certificates. This is required as these are self-signed certificates and chrome will not allow self-signed certificates unless they are added as Trusted Certificates.
	- Mac: https://support.apple.com/guide/keychain-access/change-the-trust-settings-of-a-certificate-kyca11871/mac
	- Windows: https://docs.microsoft.com/en-us/skype-sdk/sdn/articles/installing-the-trusted-root-certificate
- Make sure the Comminity Manager Portal is accessible on both `http` and `https`.
- Add 2 hostnames for nginx server
	- Different domain than Community Manager Portal: `thirdparty.acme.com`
	- Same domain as Community Manager Portal: `thirdparty.soa.com`
- Make sure nginx is accessible on both `http` and `https` for all hostnames.
- Navigate to Admin > Settings > Security > select `None` for Authentication and CSRF Token Cookie Attribute - SameSite and save.
- Update Tenant Theme `Console Address` to `https:`
- Make necessary changes to all the HTML pages and read the inline documentation provided to understand the purpose of each page.
- Embedded iframe API documentation can be loaded in different ways and each way is mutually exclusive. Please read and understand inline documentation for each way.
- Don't try to load Embedded iframe API documentation in more than one way at the same time.
- Deploy all HTML pages to nginx or any webserver.
- To directly test integration, you can simulate pre-authentication calls by logging into the Community Manager developer portal in another tab where cookies are set and those are shared when html pages are accessed via nginx.
- Access `thirdparty_customer_portal_with_api_doc.html`. Swagger documentation, OpenAPI documentation, and API Test Client all get loaded. 

### Sample URLs for testing
```
// https
// Community Manager Portal
https://opencloud.soa.com:7903/atmosphere/
// Thirdparty Customer Portal on different domain
https://thirdparty.acme.com:4430/thirdparty_customer_portal/thirdparty_customer_portal_with_api_doc.html
// Thirdparty Customer Portal on same domain
https://thirdparty.soa.com:4430/thirdparty_customer_portal/thirdparty_customer_portal_with_api_doc.html

// http
same as above but with http://
```
