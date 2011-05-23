﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.IO;
using System.Xml;
namespace vwar.service.host
{
    [ServiceContract]

   
    public interface I3DRAPI_Json
    {
        [WebGet(UriTemplate = "/Search/{terms}", ResponseFormat = WebMessageFormat.Json)]
        [OperationContract]
        
        List<SearchResult> Search(string terms);

        [WebGet(UriTemplate = "/{pid}/Model/{format}/{options}", ResponseFormat = WebMessageFormat.Json)]
        [OperationContract]
        Stream GetModel(string pid, string format, string options);

        [WebGet(UriTemplate = "/{pid}/Format/{format}", ResponseFormat = WebMessageFormat.Json)]
        [OperationContract]
        Stream GetModelSimple(string pid, string format);

        [WebGet(UriTemplate = "/{pid}/Reviews", ResponseFormat = WebMessageFormat.Json)]
        [OperationContract]
        List<Review> GetReviews(string pid);

        [WebGet(UriTemplate = "/{pid}/Screenshot", ResponseFormat = WebMessageFormat.Json)]
        [OperationContract]
        Stream GetScreenshot(string pid);

        [WebGet(UriTemplate = "/{pid}/DeveloperLogo", ResponseFormat = WebMessageFormat.Json)]
        [OperationContract]
        Stream GetDeveloperLogo(string pid);

        [WebGet(UriTemplate = "/{pid}/SponsorLogo", ResponseFormat = WebMessageFormat.Json)]
        [OperationContract]
        Stream GetSponsorLogo(string pid);

        [WebGet(UriTemplate = "/{pid}/Metadata", ResponseFormat = WebMessageFormat.Json)]
        [OperationContract]
        Metadata GetMetadata(string pid);

        [WebGet(UriTemplate = "/{pid}/SupportingFiles/{filename}", ResponseFormat = WebMessageFormat.Json)]
        [OperationContract]
        Stream GetSupportingFile(string pid, string filename);

        [WebGet(UriTemplate = "/{pid}/Textures/{filename}", ResponseFormat = WebMessageFormat.Json)]
        [OperationContract]
        Stream GetTextureFile(string pid, string filename);

    }
}