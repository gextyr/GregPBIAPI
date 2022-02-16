// This file contains your Data Connector logic
section GregPBIAPI;


[DataSource.Kind="GregPBIAPI", Publish="GregPBIAPI.Publish"]
shared GregPBIAPI.GetContent = () =>
let
	source = Json.Document(Web.Contents("https://api.powerbi.com/v1.0/myorg/reports"))[value]
in
    source;

GregPBIAPI = [
    TestConnection = (dataSourcePath) =>  { "GregPBIAPI.Navigation"},
    Authentication = [
        Aad = [AuthorizationUri = "https://login.windows.net/common/oauth2/authorize",
            Resource = "https://analysis.windows.net/powerbi/api"
        ]
    ],
    Label = Extension.LoadString("DataSourceLabel")
];

// Data Source UI publishing description
GregPBIAPI.Publish = [
    Beta = true,
    Category = "Power Platform",
    ButtonText = { Extension.LoadString("ButtonTitle"), Extension.LoadString("ButtonHelp") },
    LearnMoreUrl = "https://powerbi.microsoft.com/",
    SourceImage = GregPBIAPI.Icons,
    SourceTypeImage = GregPBIAPI.Icons
];

GregPBIAPI.Icons = [
    Icon16 = { Extension.Contents("GregPBIAPI16.png"), Extension.Contents("GregPBIAPI20.png"), Extension.Contents("GregPBIAPI24.png"), Extension.Contents("GregPBIAPI32.png") },
    Icon32 = { Extension.Contents("GregPBIAPI32.png"), Extension.Contents("GregPBIAPI40.png"), Extension.Contents("GregPBIAPI48.png"), Extension.Contents("GregPBIAPI64.png") }
];
