<%@ Assembly Name="Microsoft.SharePoint, Version=12.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Assembly Name="Account, Version=1.0.0.0, Culture=neutral, PublicKeyToken=d123d34e3b9c32c8" %>

<%@ Page Language="C#" MasterPageFile="~/_layouts/application.master" 
         Inherits="Account.ResetPassword"
         EnableViewState="false" EnableViewStateMac="false" %>

<asp:Content ID="Main" contentplaceholderid="PlaceHolderMain" runat="server">
   
  <label>Enter your old password:</label><asp:TextBox ID="txtOldPw" runat="server"></asp:TextBox>
  <br />
  <label>Enter your new password:</label><asp:TextBox ID="txtNewPw" runat="server"></asp:TextBox>
  <br />
  <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="Submit_Click" />
  <br />
  <asp:Label Font-Bold="true" Font-Size="X-Large" ID="lblMessage" runat="server" Text=""></asp:Label>
</asp:Content>

<asp:Content ID="PageTitle" runat="server"
             contentplaceholderid="PlaceHolderPageTitle" >
	Reset Password
</asp:Content>

<asp:Content ID="PageTitleInTitleArea" runat="server"
             contentplaceholderid="PlaceHolderPageTitleInTitleArea" >
	Reset Password
</asp:Content>