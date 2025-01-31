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



<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Login.ascx.cs" Inherits="Controls_Login" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<%@ Register Assembly="OrbitOne.OpenId.Controls" Namespace="OrbitOne.OpenId.Controls"
    TagPrefix="cc1" %>
<style type="text/css">
    .style2
    {
        width: 190px;
    }
    .style3
    {
        width: 184px;
    }
    .style4
    {
        width: 259px;
    }
    
</style>

<asp:Panel ID="errorLink" style="text-align: center;font-size:12px;margin-bottom:15px;color:Red;" runat="server">

    <asp:Literal ID="corruptedText" runat="server">You have successfully changed your password. You may log in below.</asp:Literal>
</asp:Panel>

<asp:Login ID="Login1" runat="server" 
    FailureText="Invalid credentials. Try again." BorderStyle="None" 
    HelpPageText="Help" onloggingin="Login_LoggingIn" onloggedin="Login1_LoggedIn" 
    style="margin-bottom: 2px" Width="606px" >
    <LayoutTemplate>
        <div class="ListTitle" style="width: 400px; text-align: left; margin-bottom: 5px;">
            OpenID Login</div>
        <cc1:OpenIdLogin runat="server" CssClass="OpenIdLogin" ID="openIdLogin" DestinationPageUrl="~/default.aspx" MembershipProvider="OpenIDMembershipProvider"></cc1:OpenIdLogin>
        <br />
        <div class="ListTitle" style="width: 400px; text-align: center;">
            Member Login</div>
        <div class="LoginFailureTextStyle" style="margin-left: 30px; margin-right: auto; width: 300px">
            <asp:Image ID="ErrorIconImage" runat="server" Visible="false" 
                ImageUrl="~/styles/images/Icons/delete2.gif" AlternateText="Error Icon" />
            <asp:Literal runat="server" ID="FailureText" EnableViewState="False"></asp:Literal>
        </div>
        <table id="LoginTable" class="NormalLogin">
        </tr>
        
        <tr>
        <td align="right">
            E-mail:</td>
        <td class="style2">
        <asp:TextBox runat="server" Width="205px" ID="UserName"
                AccessKey="u" ToolTip="Email" />
        </td>
        <td class="style4">
        <asp:RequiredFieldValidator runat="server" ID="UserNameRequired" 
                ControlToValidate="UserName" ValidationGroup="Login1" 
                ErrorMessage="'Email' is required." ToolTip="User Name	is required." 
                SetFocusOnError="true" />
               <%--<ajax:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" HighlightCssClass="ValidatorCallOutStyle" Width="150px" TargetControlID="PasswordRequired" />--%>  
        </td>
            <tr>
                <td align="right">
                    Password:
                </td>
                <td class="style2">
                    <asp:TextBox ID="Password" runat="server" AccessKey="p" CssClass="NormalLogin" 
                        TextMode="Password" ToolTip="Password" Width="205px" />
                </td>
                <td class="style4">
                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                        ControlToValidate="Password" ErrorMessage="'Password' is required." 
                        SetFocusOnError="true" ToolTip="'Password' is required." 
                        ValidationGroup="Login1" />
                    <%--<ajax:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" HighlightCssClass="ValidatorCallOutStyle" Width="150px" TargetControlID="PasswordRequired" />--%>
                </td>
            </tr>
            <tr>
                <%-- <caption>--%><%--<caption> --%>
                <caption>
                    <br />
                    <tr>
                        <td />
                        <td class="style2">
                            <asp:Button ID="LoginButton" runat="server" CommandName="Login" Style="float: left;
                                    margin-right: 8px; margin-bottom: 1px;" Text="Login" ToolTip="Login" 
                                ValidationGroup="Login1" />
                            <span style="float: right; width: 120px;">
                            <asp:HyperLink ID="ForgotPasswordHyperLink" runat="server" 
                                CssClass="LoginHyperlink" NavigateUrl="~/Public/ChangePassword.aspx" 
                                title="Forgot Password?">Forgot Password?</asp:HyperLink>
                            <asp:HyperLink ID="RegisterHyperLink" runat="server" CssClass="LoginHyperlink" 
                                NavigateUrl="~/Public/Register.aspx" title="Create an Account">Create an Account</asp:HyperLink>
                            </span>
                        </td>
                    </tr>
                    <%--  </caption> --%>
                </caption>
            </tr>
        </tr>
        </table>
    </LayoutTemplate>
</asp:Login>
