window.MYAPP = {
  "tag1" : {
    "general" : {
      "showItText" : "Pet API",
      "hideItText" : "Pet API",
      "summary" : "Swagger Documentation for Pet API."
    },
    "target" : {
    }
  },
  "findPetByIdSlimVersion" : {
    "general" : {
      "showItText" : "Find pet by ID - slim version",
      "hideItText" : "Find pet by ID - slim version",
      "summary" : "Find pet by ID - slim version of Test Client."
    },
    "target" : {
      "environment" : {
        "display" : false,
        "defaultValue" : "Production"
      },
      "operation" : {
        "display" : false,
        "defaultValue" : "getPetById"
      },
      "endpoint" : {
        "display" : false,
        "defaultValue" : "uddi:1ff7627f-5520-11e7-a574-b157a66b2e65"
      },
      "headers" : {
        "display" : false,

        "Content-Type" : "None",
        "Accept" : "application/json",

        "items" : [{
          "name" : "header1",
          "value" : "value1"
        }]
      },
      "parameters" : {
        "display" : false,
        "items" : [{
          "name" : "petId",
          "value" : "1434747602017",
          "nameIsChangeable" : false,
          "type" : "path"
        }, {
          "name" : "name1",
          "value" : "value1",
          "nameIsChangeable" : true,
          "type" : "query"
        }]
      }
    }
  },
  "findPetByIdSemiSlimVersion" : {
    "general" : {
      "showItText" : "Find pet by ID - semi-slim version",
      "hideItText" : "Find pet by ID - semi-slim version",
      "summary" : "Find pet by ID - semi-slim version of Test Client."
    },
    "target" : {
      "environment" : {
        "display" : true,
        "defaultValue" : "Production"
      },
      "operation" : {
        "display" : true,
        "defaultValue" : "getPetById"
      },
      "endpoint" : {
        "display" : true,
        "defaultValue" : "uddi:1ff7627f-5520-11e7-a574-b157a66b2e65"
      },
      "headers" : {
        "display" : false,

        "Content-Type" : "None",
        "Accept" : "application/json",

        "items" : [{
          "name" : "header1",
          "value" : "value1"
        }]
      },
      "parameters" : {
        "display" : false,
        "items" : [{
          "name" : "petId",
          "value" : "1434747602017",
          "nameIsChangeable" : false,
          "type" : "path"
        }, {
          "name" : "name1",
          "value" : "value1",
          "nameIsChangeable" : true,
          "type" : "query"
        }]
      }
    }
  },
  "findPetByStatusSemiSlimVersion" : {
    "general" : {
      "showItText" : "Find pets by status - semi-slim version",
      "hideItText" : "Find pets by status - semi-slim version",
      "summary" : "Find pets by status - semi-slim version of Test Client."
    },
    "target" : {
      "environment" : {
        "display" : false,
        "defaultValue" : "Production"
      },
      "operation" : {
        "display" : false,
        "defaultValue" : "findPetsByStatus"
      },
      "endpoint" : {
        "display" : false,
        "defaultValue" : "uddi:1ff7627f-5520-11e7-a574-b157a66b2e65"
      },
      "headers" : {
        "display" : true,

        "Content-Type" : "None",
        "Accept" : "application/json",

        "items" : [{
          "name" : "header1",
          "value" : "value1"
        }]
      },
      "parameters" : {
        "display" : true,

        "items" : [{
          "name" : "status",
          "value" : "sold",
          "nameIsChangeable" : false,
          "type" : "query"
        }]
      }
    }
  },
  "addNewPetSemiSlimVersion" : {
    "general" : {
      "showItText" : "Add a new pet - semi-slim version",
      "hideItText" : "Add a new pet - semi-slim version",
      "summary" : "Add a new pet to the store - semi-slim version of Test Client."
    },
    "target" : {
      "environment" : {
        "display" : false,
        "defaultValue" : "Production"
      },
      "operation" : {
        "display" : false,
        "defaultValue" : "addPet"
      },
      "endpoint" : {
        "display" : false,
        "defaultValue" : "uddi:1ff7627f-5520-11e7-a574-b157a66b2e65"
      },
      "headers" : {
        "display" : false,

        "Content-Type" : "application/json",
        "Accept" : "application/json",

        "items" : [{
          "name" : "header1",
          "value" : "value1"
        }]
      },
      "parameters" : {
        "display" : true,

        "items" : [{
          "name" : "Body",
          "value" : {
            "category" : {
              "id" : 100,
              "name" : "Dinosaur"
            },
            "name" : "Tyrannosaurus",
            "photoUrls" : ["http://en.wikipedia.org/wiki/Tyrannosaurus#/media/File:Tyrannosaurus_rex_mmartyniuk.png"],
            "tags" : [{
              "id" : 100,
              "name" : "reptile"
            }, {
              "id" : 101,
              "name" : "dinosaur"
            }],
            "status" : "available"
          },
          "type" : "entity"
        }, {
          "name" : "name1",
          "value" : "value1",
          "nameIsChangeable" : true,
          "type" : "query"
        }]
      }
    }
  },
  "updateAnExistingPetSemiSlimVersion" : {
    "general" : {
      "showItText" : "Update an existing pet - semi-slim version",
      "hideItText" : "Update an existing pet - semi-slim version",
      "summary" : "Update an existing pet - semi-slim version of Test Client."
    },
    "target" : {
      "environment" : {
        "display" : false,
        "defaultValue" : "Production"
      },
      "operation" : {
        "display" : false,
        "defaultValue" : "updatePet"
      },
      "endpoint" : {
        "display" : false,
        "defaultValue" : "uddi:1ff7627f-5520-11e7-a574-b157a66b2e65"
      },
      "headers" : {
        "display" : false,

        "Content-Type" : "application/json",
        "Accept" : "application/json",

        "items" : [{
          "name" : "header1",
          "value" : "value1"
        }]
      },
      "parameters" : {
        "display" : true,
        "items" : [{
          "name" : "Body",
          "value" : '\
            {\
              "id" : "999997987981318",\n\
              "category" : {\n\
                "id" : 100,\n\
                "name" : "Dinosaur - Updated"\n\
              },\n\
              "name" : "Tyrannosaurus",\n\
              "photoUrls" : ["http://en.wikipedia.org/wiki/Tyrannosaurus#/media/File:Tyrannosaurus_rex_mmartyniuk.png"],\n\
              "tags" : [{\n\
                "id" : 100,\n\
                "name" : "reptile"\n\
              }, {\n\
                "id" : 101,\n\
                "name" : "dinosaur"\n\
              }],\n\
              "status" : "sold"\n\
            }\
          ',
          "type" : "entity"
        }, {
          "name" : "name1",
          "value" : "value1",
          "nameIsChangeable" : true,
          "type" : "query"
        }]
      }
    }
  },
  "updateAnExistingPetSemiSlimVersionXML" : {
    "general" : {
      "showItText" : "Update an existing pet with XML as payload - semi-slim version of Test Client",
      "hideItText" : "Update an existing pet with XML as payload - semi-slim version of Test Client",
      "summary" : "Update an existing pet with XML as payload - semi-slim version of Test Client."
    },
    "target" : {
      "environment" : {
        "display" : false,
        "defaultValue" : "Production"
      },
      "operation" : {
        "display" : false,
        "defaultValue" : "updatePet"
      },
      "endpoint" : {
        "display" : false,
        "defaultValue" : "uddi:1ff7627f-5520-11e7-a574-b157a66b2e65"
      },
      "headers" : {
        "display" : false,

        "Content-Type" : "application/xml",
        "Accept" : "application/xml",

        "items" : [{
          "name" : "header1",
          "value" : "value1"
        }]
      },
      "parameters" : {
        "display" : true,
        "items" : [{
          "name" : "Body",
          "value" : '<Pet>\n\
              <category>\n\
                <id>10</id>\n\
                <name>Rover</name>\n\
              </category>\n\
              <id>10</id>\n\
              <name>doggie</name>\n\
              <photoUrls>\n\
                <photoUrl>string</photoUrl>\n\
              </photoUrls>\n\
              <status>available</status>\n\
              <tags>\n\
                <tag>\n\
                  <id>10</id>\n\
                  <name>beagle</name>\n\
                </tag>\n\
              </tags>\n\
            </Pet>',
          "type" : "entity"
        }, {
          "name" : "name1",
          "value" : "value1",
          "nameIsChangeable" : true,
          "type" : "query"
        }]
      }
    }
  },
  "deletePetSemiSlimVersion" : {
    "general" : {
      "showItText" : "Delete a pet - semi-slim version",
      "hideItText" : "Delete a pet - semi-slim version",
      "summary" : "Delete a pet - slim version of Test Client."
    },
    "target" : {
      "environment" : {
        "display" : false,
        "defaultValue" : "Production"
      },
      "operation" : {
        "display" : false,
        "defaultValue" : "deletePet"
      },
      "endpoint" : {
        "display" : false,
        "defaultValue" : "uddi:1ff7627f-5520-11e7-a574-b157a66b2e65"
      },
      "headers" : {
        "display" : true,

        "Content-Type" : "None",
        "Accept" : "application/json",
      },
      "parameters" : {
        "display" : true,
        "items" : [{
          "name" : "petId",
          "value" : "1",
          "nameIsChangeable" : false,
          "type" : "path"
        }]
      }
    }
  },
  "updateAnExistingPetWithFormParamsSemiSlimVersion" : {
    "general" : {
      "showItText" : "Update an existing pet with form params - semi-slim version",
      "hideItText" : "Update an existing pet with form params - semi-slim version",
      "summary" : "Update an existing pet with form params - semi-slim version of Test Client."
    },
    "target" : {
      "environment" : {
        "display" : false,
        "defaultValue" : "Production"
      },
      "operation" : {
        "display" : false,
        "defaultValue" : "updatePetWithForm"
      },
      "endpoint" : {
        "display" : false,
        "defaultValue" : "uddi:1ff7627f-5520-11e7-a574-b157a66b2e65"
      },
      "headers" : {
        "display" : true,

        "Content-Type" : "application/x-www-form-urlencoded",
        "Accept" : "application/json",

        "items" : []
      },
      "parameters" : {
        "display" : true,
        "items" : [{
          "name" : "petId",
          "value" : "1",
          "nameIsChangeable" : false,
          "type" : "path"
        }, {
          "name" : "name",
          "value" : "Velociraptor",
          "nameIsChangeable" : false,
          "type" : "form"
        }, {
          "name" : "status",
          "value" : "available",
          "nameIsChangeable" : false,
          "type" : "form"
        }]
      }
    }
  },
  "findPetByIdSlimVersionWithPolicyConfigs" : {
    "general" : {
      "showItText" : "Find pet by ID - slim version with atmosecurity, oauth configs set and list of Test Apps configured.",
      "hideItText" : "Find pet by ID - slim version with atmosecurity, oauth configs set and list of Test Apps configured.",
      "summary" : "Find pet by ID - slim version with atmosecurity, oauth configs set and list of Test Apps configured."
    },
    "target" : {
      "environment" : {
        "display" : false,
        "defaultValue" : "Production"
      },
      "operation" : {
        "display" : false,
        "defaultValue" : "getPetById"
      },
      "endpoint" : {
        "display" : false,
        "defaultValue" : "uddi:1ff7627f-5520-11e7-a574-b157a66b2e65"
      },
      "headers" : {
        "display" : false,

        "Content-Type" : "None",
        "Accept" : "application/json",

        "items" : [{
          "name" : "header1",
          "value" : "value1"
        }]
      },
      "parameters" : {
        "display" : false,
        "items" : [{
          "name" : "petId",
          "value" : "1434747602017",
          "nameIsChangeable" : false,
          "type" : "path"
        }, {
          "name" : "name1",
          "value" : "value1",
          "nameIsChangeable" : true,
          "type" : "query"
        }]
      },
      "securityPolicies" : {
        "AtmosphereApplicationSecurityPolicy" : {
          "tokenAlgorithm" : "HmacSHA1",
          "tokenLocation" : "Header"
        },
        "OAuth" : {
          "oAuthVersion": "OAuth 2.0",
          "grantType": "authorization_code",
          "authMethod": "SharedSecret"
        }
      },
      "connectedAppsList": [
        {
          "label": "TestApp01 - 1",
          "value": "5e0Ph0FwBlsbzoiMfaF41mMQKvGakwHT0l3QN8Do.open"
        }
      ]
    }
  }
};
