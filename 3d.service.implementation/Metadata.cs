﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ServiceModel;

namespace vwar.service.host
{
    [DataContractFormat]
    public class Metadata
    {
        public string PID;// co.PID;
        public string Title;// co.Title;
        public string Keywords;// co.Keywords;
        public string Format;// co.Format;
        public string Downloads;// co.Downloads.ToString();
        public string DeveloperName;// co.DeveloperName;
        public string Description;// co.Description;
        public string ArtistName;// co.ArtistName;
        public string AssetType;// co.AssetType;
        public string NumPolygons;// co.NumPolygons.ToString();
        public string NumTextures;// co.NumTextures.ToString();
        public string SponsorName;// co.SponsorName;
        public string UnitScale;// co.UnitScale;
        public string UpAxis;// co.UpAxis;
        public string UploadedDate;// co.UploadedDate.ToString();
        public string Views;// co.Views.ToString();
        public string License;
        public string Revision;
        public string TotalRevisions;
        public string MoreInformationURL;
        public bool ConversionAvailable;
        public bool AnonymousDownloadAvailable;
        public bool RequiresResubmit;
        public string Distribution_Grade;
        public string Distribution_Regulation;
        public string Distribution_Determination_Date;
        public string Distribution_Contolling_Office;
        public string Distribution_Reason;
        public List<SupportingFile> SupportingFiles;
        public List<Texture> TextureReferences;
        public List<Texture> MissingTextures;
        public string _fbxLink;
        public string _o3dLink;
        public string _jsonLink;
        public string _3dsLink;
        public string _objLink;
        public string _ScreenshotLink;
        public string _ThumbnailLink;
        public string _OriginalUploadLink;
        public string _ReviewsLink;
        
        public Metadata()
        {
              SupportingFiles = new List<SupportingFile>();
             TextureReferences = new List<Texture> ();
             MissingTextures = new List<Texture> ();
        }
    }
}