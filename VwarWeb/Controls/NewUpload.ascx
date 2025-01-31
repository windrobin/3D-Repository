<%--
Copyright 2011 U.S. Department of Defense

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
--%>



<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NewUpload.ascx.cs" Inherits="Controls_NewUpload" %>
<%@ Register TagPrefix="VwarWeb" TagName="Viewer3D" Src="~/Controls/Viewer3D.ascx" %>
<%@ Register TagPrefix="VwarWeb" TagName="PermissionsManagementWidget" Src="~/Controls/PermissionsManagementWidget.ascx" %>
<script language="javascript" type="text/javascript">
// <![CDATA[

    function formatDetectIcon_onclick() {

    }

// ]]>
</script>


<div id="SubmittingModalWindow" style='display: none;' >
    <span style="text-align:center">
        <h3>Adding Content to The Repository...</h3>
        <img src="../styles/images/Icons/loadingThumbnail.gif" alt="Please Wait" style="display: block; margin: 0 auto;"/>
        <h3>(please be patient!)</h3>
    </span>
    
</div>
<div id="FormatsModal" style='display: none;'>
    <b>Recognized Model Formats:</b>
    <ul>
        <li>Collada (.dae)</li>
        <li>Google Sketchup (.skp)</li>
        <li>Wavefront Object (.obj)</li>
        <li>3D Studio files (.3ds)</li>
        <li>Google Earth Placemark (.kmz)</li>
        <li>Autodesk FBX (.fbx)</li>
    </ul>
</div>
<div id="UnclassifiedWarningModal" style="display:none;">
    <div style="background: url('../styles/images/Unclassified_Stamp_watermark.png') no-repeat center;
        min-height: 172px; width: 400px; margin: 0 auto">
    </div>
    <strong>THIS IS AN UNCLASSIFIED SYSTEM.</strong> By agreeing to the conditions listed here, you are
    acknowledging that the material you are sharing is <strong>NOT</strong>:
    <ul>
        <li>Classified, FOUO, or sensitive materials</li>
        <li>Copyrighted works for which you do not have express written authority to distribute</li>
    </ul>
    You are also acknowledging that the material you share is publicly available. Therefore,
    ADL and other organizations that use the 3DR have full access and rights to any
    material you provide.
    <br />
    <br />
    There is the potential for legal consequences if you fail to meet the conditions
    outlined above.
</div>
<div style="width: 900px; margin: 0 auto">
    <h1>
        Upload a 3D Model</h1>
    <div id="UploadControl" style="text-align: left;">
        <h3 class="disabled">
            <a href="#" class="disabled">1. Upload Model</a></h3>
        <div id="Step1Panel">
            <div class="PanelLayoutContainer" style="height: 155px">
                <div class="LRPanelLayout" style="width: 30%;">
                    <div>
                        <div id="ChooseModelContainer"  style="display: inline; position: relative;
                             z-index: 2">
                            <noscript>
                                Please enable JavaScript to use the file uploader!
                            </noscript>
                            <div id="ModelUploadButton" class="qq-upload-button"></div>
                        </div>
                    </div>
                </div>
                <div class="LRPanelLayout" style="text-align: center; padding-top: 5px; left: 30%;
                     width: 70%">
                    <span style="font-size: large; font-weight: bold; text-align: center; margin: 0 0">Choose
                        Either:</span>
                    <div>
                        <ul style="text-align: left;margin-bottom:0px;padding-bottom:0px;" id="options">
                            <li>A .zip file containing the following:</li>
                            <li style="list-style: none; text-align: center; font-weight: bold; font-size: large;">
                                OR</li>
                            <li>An .skp (Google SketchUp) file</li>
                        </ul>
                        <ul style="text-align:left; padding-left:12%; margin-top:0px; padding-top:0px; list-style-type:circle;">
                            <li>A <a href="#" class="FormatsLink">recognized model format</a></li>
                            <li>Referenced texture files</li>
                        </ul>
                        
                    </div>
                    <span style="text-align: left">Having trouble? Try using our <a href="Edit.aspx">classic uploader</a> instead.</span>
                </div>
            </div>
            <div id="DetailsAndStatusPanel" class="PanelLayoutContainer" style="height: 315px;
                border: 1px solid  #AAAAAA;">
                <div class="LRPanelLayout" style="width: 300px">
                    <a href='#' id="CancelButton" style="position: absolute;
                        right: 15px; top: 50px; z-index: 1">Cancel</a>
                    <div id="UploadStatusArea">
                        <table>
                            <col width="16" valign="top" />
                            <col width="250" />
                            <col width="16" valign="top" />
                            <tr id="modelUpload">
                                <td>
                                    1.
                                </td>
                                <td>
                                    <div id="modelUploadProgress" class="progress">
                                    </div>
                                    <div id="modelUploadStatus">
                                    </div>
                                </td>
                                <td>
                                    <img id="modelUploadIcon" alt="Model upload Icon" />
                                </td>
                            </tr>
                            <tr class="resettable upload">
                                <td />
                                <td>
                                    <div id="modelUploadMessage" class="resettable upload message">
                                    </div>
                                </td>
                                <td />
                            </tr>
                            <tr id="formatDetect" style="display: none;" class="resettable upload">
                                <td>
                                    2.
                                </td>
                                <td>
                                    <div id="formatDetectStatus">
                                    </div>
                                </td>
                                <td>
                                    <img id="formatDetectIcon" onclick="return formatDetectIcon_onclick()" 
                                        alt="Format Detect Icon" />
                                </td>
                            </tr>
                            <tr>
                                <td />
                                <td>
                                    <div id="formatDetectMessage" class="resettable upload message">
                                    </div>
                                </td>
                                <td />
                            </tr>
                            <tr id="conversionStep" style="display: none;" class="resettable upload ">
                                <td>
                                    3.
                                </td>
                                <td>
                                    <div id="conversionStatus">
                                    </div>
                                </td>
                                <td>
                                    <img id="conversionIcon" alt="Conversion Icon" />
                                </td>
                            </tr>
                            <tr>
                                <td />
                                <td>
                                    <div id="conversionMessage" class="resettable upload message">
                                    </div>
                                </td>
                                <td />
                            </tr>
                            <tr>
                                <td />
                                <td>
                                    <br />
                                    <br />
                                    <br />
                                </td>
                                <td />
                            </tr>
                        </table>
                    </div>
                    <a class="NextButton resettable upload" id="nextbutton_upload" style="position: relative;
                        top: 30px; left: 85px; display: none;" href="#">
                    </a>
                </div>
                <div class="LRPanelLayout" style="width: 60%; left: 40%;">
                    <div id="BasicInfoHeader" style="margin-left: 78px">
                        <h2 style="margin-bottom: 3px">
                            While You're Waiting...</h2>
                        Please fill out the following info:
                        <br />
                    </div>
                    <table style="margin: 0 auto;">
                        <tr>
                            <td align="right">
                                <asp:Label ID="TitleLabel" runat="server" Text="Title (Required)" />
                            </td>
                            <td align="left">
                                <asp:TextBox ID="TitleInput" CssClass="Step1Input" runat="server"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td />
                            <td width="325" align="left">
                                <span id="TitleValidationMessage" class="ValidationError">
                                Title is required and cannot contain invalid characters<br />
                                </span>
                            </td>
                            <td />
                        </tr>
                        <tr>
                            <td align="right" valign="top">
                                <asp:Label ID="DescriptionLabel" runat="server" Text="Description" />
                            </td>
                            <td align="left">
                                <asp:TextBox ID="DescriptionInput" CssClass="Step1Input" runat="server" TextMode="MultiLine"
                                    Rows="4"></asp:TextBox>
                            </td>
                            <td />
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="TagsLabel" runat="server" Text="Tags" />
                                <p style="font-size:10px; margin-top: 2px;">Each tag must be delimited by a comma</p>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="TagsInput" runat="server" CssClass="Step1Input"></asp:TextBox>
                                
                            </td>
                        </tr>
                        <tr>
                            <td align="right" valign="top">
                                <asp:Label ID="PrivacySettingsLabel" runat="server" Text="Privacy Settings" />
                            </td>
                            <td align="left">
                                <span id="PrivacyValueLabel">Default</span> 
                                (<a id="PermissionsLink">Change</a>)
                            </td>
                        </tr>
                    </table>
                    
                </div>
            </div>
        </div>
        <h3 class="disabled">
            <a href="#" class="disabled">2. Axis, Scale, Thumbnail</a></h3>
        <div id="Step2Panel">
            <div class="PanelLayoutContainer" id="ViewableView" style="height: 730px">
                <div class="LRPanelLayout" style="width: 550px; z-index: 1; left: -20px; top: -14px;text-align: left;">
                    <span style="text-align: center"><VwarWeb:Viewer3D ID="ModelViewer" runat="server" /></span>
                    <div style="width: 500px; margin: 0 auto;">
                        <div id="ViewerStatus" style="position: relative; margin: 10px 0;"></div>
                        <a id="backbutton_step2" class="BackButton" style="float: left" href="#">
                        </a><a id="nextbutton_step2" class="NextButton" style="float: right" href="#">
                        </a>
                    </div>
                </div>
                <div class="LRPanelLayout" style="width: 320px; left: 528px; text-align: left">
                    <div id="ViewerAdjustmentAccordion" style="padding-top: 10px;">
                        <h3>
                            <a id="SetScaleHeader" href='#'>Set Scale</a></h3>
                        <div>
                            <div id="ScaleAdjustmentArea" style="position: relative; top: 10px">
                                <p style="text-align: left; padding-right: 25px;">
                                    Next, we need a little bit of context for your model. Using the slider, adjust the
                                    scale of the model. If necessary, change the unit type.
                                </p>
                                <h3>
                                    Unit Scale:
                                </h3>
                                <span id="scaleText" style="position: relative; bottom: 5px;"></span>
                                <div id="scaleSlider" style="width: 200px;">
                                </div>
                                <select id="unitType" style="left: 210px; position: relative; top: -17px;">
                                    <option value="0.01">cm</option>
                                    <option value="1" selected="selected">m</option>
                                    <option value="0.0254">in</option>
                                    <option value="0.3048">ft</option>
                                </select>
                            </div>
                        </div>
                        <h3>
                            <a id="SetAxisHeader" href='#'>Set Axis</a></h3>
                        <div>
                            <p style="text-align: left; padding-right: 25px;">
                                Now, please specify the up axis so that your model displays correctly in our viewer:
                            </p>
                            <input type="radio" name="UpAxis" value="Y" />Y<br />
                            <input type="radio" name="UpAxis" value="Z" />Z<br />
                            <br />
                        </div>
                        <h3>
                            <a id="SetThumbnailHeader" href='#'>Set Thumbnail</a></h3>
                        <div>
                            <p style="text-align: left; padding-right: 25px; margin-top: -17px">
                                Now we need a thumbnail of your model so everyone can preview your work. To zoom
                                in and out, use the scroll wheel on your mouse. When you are ready to take your
                                snapshot, click the button below:
                            </p>
                            <center>
                                <a id="ViewableSnapshotButton" href="#" class="SnapshotButton">
                                </a>
                                <span class="ThumbnailButtonText">Take Snapshot</span>
                                <h3 style="margin: 5px 0;">
                                    OR</h3>
                            </center>
                            <div id="ThumbnailViewableWidget" style="text-align: center;">
                                <span id="ScreenshotUploadButton_Viewable" class="rr-upload-button" style="margin: 0 auto; position:relative; left: -20px;">
                                </span>
                                <span class="ThumbnailButtonText">Choose File</span>
                                <div class="progressbarContainer">
                                </div>
                                <div style="margin: 5px 0 10px 0;">
                                    <span class="statusText"></span>
                                    <img class="statusIcon" style="display:none;"/><a href='#' class='cancel' style="display: none;">Cancel</a><br />
                                </div>
                                <span class="errorMessage"></span>
                                <h3 style="margin-right: 130px; margin-top: 0px;">
                                    Preview:</h3>
                                <div id="ThumbnailPreviewContainer" class="PreviewImageContainer" style="width: 200px; min-height: 200px; border: 1px solid black;
                                    margin: 0 auto;">
                                    <img id="ThumbnailPreview_Viewable" class="previewImage" style="height:200px" 
                                        src="../styles/images/nopreview_icon.png" alt="Thumbnail" />
                                    <div id="TP_LoadingImgContainer" class="LoadingImageContainer"></div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="PanelLayoutContainer" id="RecognizedView" style="display: none; height: 475px">
                <div class="LRPanelLayout" style="width: 50%; left: 25%">
                    <p style="text-align: center;">
                        Now we need a thumbnail of your model so everyone can see a preview of your work.
                        Choose a JPEG, PNG, or GIF file:
                    </p>
                    <div id="ThumbnailRecognizedWidget" style="text-align: center; margin-bottom: 10px;">
                        <div id="ScreenshotUploadButton_Recognized" class="rr-upload-button" style="margin: 0 auto;">
                        </div>
                        <br />
                        <div class="progressbarContainer">
                        </div>
                        <span class="statusText"></span>
                        <img class="statusIcon" style="display: none;" /><a href='#' class='cancel' style="display: none;">Cancel</a><br />
                        <span class="errorMessage"></span>
                        <h3 style="margin-right: 122px">
                            Preview:</h3>
                        <div id="ThumbnailRecognizedPreviewContainer" style="width: 200px; min-height: 200px;
                            border: 1px solid black; margin: 0 auto;">
                            <img id="ThumbnailPreview_Recognized" class="previewImage" src="../styles/images/nopreview_icon.png" />
                            <div class="LoadingImageContainer"></div>
                        </div>
                    </div>
                    <a class="BackButton" style="float: left" href="#" >
                    </a><a class="NextButton" style="float: right" href="#" >
                    </a>
                </div>
            </div>
        </div>
        <h3 class="disabled">
            <a href="#" class="disabled">3. Add Details</a></h3>
        <div id="Step3Panel">
            <div class="PanelLayoutContainer" style="min-height: 420px; border: none; width: 666px;
                margin: 0 auto; overflow: hidden;">
                <p style="text-align: center">
                    You're almost done! Please take the time to fill out additional information about
                    your model. Let people know where your model came from and who created it. Make
                    sure to give credit where it's deserved! You can also set the license type so that
                    no one uses your assets in an illicit way.
                </p>
                <div id="DetailsTabs" class="tabs-bottom">
                    <ul>
                        <li><a id="DevInfoTab" href="#tabs-1">Developer Info</a></li>
                        <li><a id="SponsorInfoTab" href="#tabs-2">Sponsor Info</a></li>
                        <li><a id="LicenseTypeTab" href="#tabs-3">License Type</a></li>
                    </ul>
                    <div id="tabs-1">
                        <div class="formLayout" id="Tab1Content">
                            <div class="Step3Input" style="display:inline-block;">
                                <label>
                                    Developer Name</label>
                                <input id="DeveloperName" /><br />
                                <label>
                                    Artist Name</label>
                                <input id="ArtistName" /><br />
                                <label>
                                    URL</label>
                                <input id="DeveloperUrl" /><br />
                                <label>
                                    Developer Logo</label>
                            </div>
                            <div id="DevLogoUploadWidget">

                                <div class="Step3Input" style="display:inline-block">
                                    <div id="DevLogoUploadButton" class="rr-upload-button" style="position: relative; left: 140px; top: -25px;"></div>
                                    <table class="Step3UploadStatus" style="top: -80px;" >
                                        <col width="150" />
                                        <col width="16" />
                                        <tr>
                                            <td>
                                                <div style="float: right;">
                                                    <a href='#' class='cancel' style="display: none;">Cancel</a>
                                                </div>
                                                <div class="progressbarContainer">
                                                </div>
                                                <div class="statusText">
                                                </div>
                                            </td>
                                            <td>
                                                <img class="statusIcon" style="display:none;" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span class="errorMessage"></span>
                                            </td>
                                            <td />
                                        </tr>
                                    </table>
                                </div>
                                <div class="ImagePreviewArea">
                                    <h3 style="margin-right: 130px">
                                        Preview:</h3>
                                    <div id="DevLogoPreviewContainer" style="width: 200px; min-height: 200px; border: 1px solid black;
                                        margin: 0 auto;">
                                        <img id="DevLogoImage" class="previewImage" 
                                            src="../styles/images/nopreview_icon.png" alt="Developer Logo" />
                                        <div class="LoadingImageContainer" style="display: none;"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="tabs-2">
                        <div class="formLayout" style="display: none;" id="Tab2Content">
                            <div class="Step3Input">
                                <label>
                                    Sponsor Name</label>
                                <input id="SponsorName" /><br />
                                <label>
                                    Sponsor Logo</label>
                            </div>
                            <div id="SponsorLogoUploadWidget" >
                                <div class="Step3Input">
                                    <div id="SponsorLogoUploadButton" class="rr-upload-button" >
                                    </div>
                                    <table class="Step3UploadStatus" style="top: -40px;">
                                        <col width="150" />
                                        <col width="16" />
                                        <tr>
                                            <td>
                                                <div style="float: right;">
                                                    <a href='#' class='cancel' style="display: none;">Cancel</a>
                                                </div>
                                                <div class="progressbarContainer">
                                                </div>
                                                <div class="statusText">
                                                </div>
                                            </td>
                                            <td>
                                                <img class="statusIcon" style="display:none;" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span class="errorMessage"></span>
                                            </td>
                                            <td />
                                        </tr>
                                    </table>
                                </div>
                                <div class="ImagePreviewArea">
                                    <h3 style="margin-right: 130px">
                                        Preview:</h3>
                                    <div id="SponsorLogoPreviewContainer" style="width: 200px; min-height: 200px; border: 1px solid black;
                                        margin: 0 auto;">
                                        <img id="SponsorLogoImage" class="previewImage" src="../styles/images/nopreview_icon.png" />
                                        <div class="LoadingImageContainer" style="display: none;"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="tabs-3">
                        <div class="formLayout" style="margin: 30px auto;" id="Tab3Content">
                            <label>
                                License Type</label>
                            <select id="LicenseType">
                                <option value=".publicdomain">Public Domain</option>
                                <option value=".by" >Attribution</option>
                                <option value=".by-sa" selected="selected">Attribution-ShareAlike</option>
                                <option value=".by-nd">Attribution-NoDerivatives</option>
                                <option value=".by-nc">Attribution-NonCommercial</option>
                                <option value=".by-nc-sa">Attribution-NonCommercial-ShareAlike</option>
                                <option value=".by-nc-nd">Attribution-NonCommercial-NoDerivatives</option>
                            </select>
                            <div id="LicenseImageContainer">
                                <a id="LicenseLink" href="http://creativecommons.org/licenses/by-sa/3.0/legalcode"  target="_blank">
                                    <img id="LicenseImage" style="border: none;" src="http://i.creativecommons.org/l/by-sa/3.0/88x31.png" alt="Click to view full license"/>
                                </a>
                            </div>
                            <br />
                            <label>
                                Description</label>
                           
                            <div id="LicenseDescriptionContainer" style="width: 347px; display: inline-block;
                                margin-top: -13px">
                                <p class="cc publicdomain" style="display: none;">
                                    This work is free of known copyright restrictions.
                                </p>
                                <p class="cc by" style="display: none;">
                                    This license lets others distribute, remix, tweak, and build upon your work, even
                                    commercially, as long as they credit you for the original creation. This is the
                                    most accommodating of licenses offered. Recommended for maximum dissemination and
                                    use of licensed materials.
                                </p>
                                <p class="cc by-sa license-selected" >
                                    This license lets others remix, tweak, and build upon your work even for commercial
                                    reasons, as long as they credit you and license their new creations under the identical
                                    terms. This license is often compared to �copyleft� free and open source software
                                    licenses. All new works based on yours will carry the same license, so any derivatives
                                    will also allow commercial use.
                                </p>
                                <p class="cc by-nd" style="display: none;">
                                    This license allows for redistribution, commercial and non-commercial, as long as
                                    it is passed along unchanged and in whole, with credit to you.
                                </p>
                                <p class="cc by-nc" style="display: none;">
                                    This license lets others remix, tweak, and build upon your work non-commercially,
                                    and although their new works must also acknowledge you and be non-commercial, they
                                    don�t have to license their derivative works on the same terms.
                                </p>
                                <p class="cc by-nc-sa" style="display: none;">
                                    This license lets others remix, tweak, and build upon your work non-commercially,
                                    as long as they credit you and license their new creations under the identical terms.
                                </p>
                                <p class="cc by-nc-nd" style="display: none;">
                                    This license is the most restrictive of our six main licenses, only allowing others
                                    to download your works and share them with others as long as they credit you, but
                                    they can�t change them in any way or use them commercially.
                                </p>
                            </div>
                            <br />
                            <label>Special Requirements</label>
                            <div class="cc" style="width: 347px; display: inline-block;">
                                <input type="checkbox" id="RequireResubmitCheckbox" style="margin-right: 10px; width: auto" />
                                Require that any modifications be re-submitted back to the 3D Repository.
                            </div>
                        </div>
                    </div>
                </div>
               
                <span style="display:inline-block; text-align: center">
                 <!--<input type="checkbox" id="CertifiedCheckbox" />
                I hereby certify that this model is approved for public use and does not violate any part of the
                <a href="Legal.aspx#TOS" target="_blank">Terms of Service</a> or <a href='Legal.aspx#EUA' target="_blank">End User Agreement</a>
                <span id="CertificationError" class="ValidationError">You must agree to the above statement in order to upload your model.</span>-->
                <span id="SubmittalError" class="ValidationError">An error occurred when submitting the model. Please try again later.</span>
                </span>
                <a id="backbutton_step3" class="BackButton" style="float: left;" href="#" >
                </a><a id="nextbutton_step3" class="NextButton" style="float: right;" href="#" >
                </a>
            </div>
        </div>
    </div>
</div>
