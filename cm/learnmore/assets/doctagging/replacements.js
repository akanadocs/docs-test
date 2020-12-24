// only 2 levels for replacement processing like
// siteAdminCommaBusinessAdmin: "{MYAPP.siteAdmin}, {MYAPP.businessAdmin}" are supported.
// recommended to create a name space like MYAPP
window.MYAPP = {
	"mySampleAPIVersionId" : "changeMe(apiVersionId)",
	"siteAdmin" : "SiteAdmin",
	"businessAdmin" : "BusinessAdmin",
	"siteAdminCommaBusinessAdmin" : "{MYAPP.siteAdmin}, {MYAPP.businessAdmin}",
	"admin" : "Admin",
	"publicScope1" : "public-scope-1",
	"publicScope2" : "public-scope-1",
	"publicScope1CommaPublicScope2" : "public-scope-1, public-scope-1",
	"privateScope1" : "private-scope-1",
	"privateScope2" : "private-scope-2",
	"privateScope1CommaprivateScope2" : "private-scope-1, private-scope-2",
	"publicLicense1" : "public-license-1",
	"privateLicense1" : "private-license-1",
	"operationTargeted" : "operation-targeted"
}
