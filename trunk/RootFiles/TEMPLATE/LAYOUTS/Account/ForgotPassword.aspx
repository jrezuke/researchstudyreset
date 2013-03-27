<%@ Assembly Name="Microsoft.SharePoint.ApplicationPages, Version=12.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Assembly Name="Microsoft.SharePoint, Version=12.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Assembly Name="Account, Version=1.0.0.0, Culture=neutral, PublicKeyToken=d123d34e3b9c32c8" %>

<%@ Page Language="C#" MasterPageFile="~/_layouts/simple.master" 
         Inherits="Account.ForgotPassword"
         EnableViewState="true" EnableViewStateMac="false" %>

<asp:Content ID="Main" contentplaceholderid="PlaceHolderMain" runat="server">
   
  <label>Enter your email:</label><asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
  <br />
  
  <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="Submit_Click" />
  <br />
  <asp:Label ID="lblMessage" Font-Bold="true" runat="server" Text=""></asp:Label>
</asp:Content>

<asp:Content ID="PageTitle" runat="server"
             contentplaceholderid="PlaceHolderPageTitle" >
	Forgot Password
</asp:Content>

<asp:Content ID="PageTitleInTitleArea" runat="server"
             contentplaceholderid="PlaceHolderPageTitleInTitleArea" >
	Forgot Password
</asp:Content>