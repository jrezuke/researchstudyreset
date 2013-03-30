<%@ Assembly Name="Microsoft.SharePoint.ApplicationPages, Version=12.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%> 
<%@ Assembly Name="Account, Version=1.0.0.0, Culture=neutral, PublicKeyToken=d123d34e3b9c32c8" %>
<%@ Page Language="C#" Inherits="Account.Login" MasterPageFile="~/_layouts/Account/simple.master"      %> 
<%@ Import Namespace="Microsoft.SharePoint.ApplicationPages" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=12.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=12.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Import Namespace="Microsoft.SharePoint" %>

<asp:Content ID="PlaceHolderPageTitle" ContentPlaceHolderId="PlaceHolderPageTitle" runat="server">
   Login | CHB Research Study
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderPageTitleInTitleArea" runat="server" >
    <%--<h3>Login</h3>--%>			    
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderMain" runat="server">
<style type="text/css">
#announcement 
{
    background:#EAF5E0 none repeat scroll 0 0;
    border:1px solid #CCCCCC;
    height:250px;
    margin:0 auto;
    width:525px;
}

#announcement h1 {
    background:#DFE9D5 none repeat scroll 0 0;
    border:0 none;
    color:#000000;
    font-size:11px;
    font-weight:bold;
    margin:0;
    padding:6px;
}
#announcement table {
    color:#000000;
    font-size:11px;
    margin:0;
}
    
</style>
<script type="text/javascript" src="/_layouts/jQuery/jquery-1.2.6.js"></script>
<script type="text/javascript">
    $(function() {
        var returnUrl = $("input[id$='returnUrl']").val();
        //var href = "http://childrens01/_layouts/account/ForgotPassword.aspx?ReturnUrl=" + returnUrl;
        var href = "http://researchstudy.tch.harvard.edu/_layouts/account/ForgotPassword.aspx?ReturnUrl=" + returnUrl;
        $('#aForgot').attr("href", href);
    });
</script>
 <asp:login id="login" FailureText="<%$Resources:wss,login_pageFailureText%>" runat=server width="100%">
    <layouttemplate>
        <asp:label id=FailureText class="ms-error" runat=server/>
        <h2>CHB Research Study</h2>
        
        <div><h2>Login</h2></div>
        <table>
          <COLGROUP>
          <COL width=25%>
          <COL WIDTH=75%>
        <tr>
            <td colspan="2">
                <h4>Please login using username and password.</h4>    
            </td>
        </tr>
        <tr>
            <td noWrap><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,login_pageUserName%>" EncodeMethod='HtmlEncode'/></td>
            <td><asp:textbox id=UserName autocomplete="off" runat="server" class="ms-long"/></td>
        </tr>
        <tr>
            <td noWrap><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,login_pagePassword%>" EncodeMethod='HtmlEncode'/></td>
            <td><asp:textbox id="password" TextMode="Password" autocomplete="off" runat="server" class="ms-long"/></td>
        </tr>
        <tr>
            <td colSpan=2 align=right><asp:button id="login" commandname="Login" text="<%$Resources:wss,login_pagetitle%>" runat=server /></td>
        </tr>
        <tr>
            <td colSpan=2><asp:CheckBox Visible="true" id=RememberMe text="<%$SPHtmlEncodedResources:wss,login_pageRememberMe%>" runat=server /></td>
        </tr>        
        </table>
        
    </layouttemplate>
 </asp:login>
 <div>
    <%--<input runat="server" type="hidden" id="returnUrl" />--%>
    <asp:HiddenField id="returnUrl" runat="server" />
    <%--<a href="http://researchstudy.tch.harvard.edu/_layouts/account/ForgotPassword.aspx">I Forgot My Password</a>&nbsp;&nbsp;&nbsp;&nbsp;--%>
    <a id="aForgot"  >I Forgot My Password</a>&nbsp;&nbsp;&nbsp;&nbsp;
</div>
</asp:Content>
