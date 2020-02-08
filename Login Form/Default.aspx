<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" MasterPageFile="~/Main.Master" Inherits="Login_Form._Default" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<link rel="Stylesheet" href="Includes/General.css" />
    Welcome to website<br /><br />
    
    <asp:HyperLink ID="hyMobile" runat="server" NavigateUrl="~/ProductListing.aspx?Id=1">Mobile</asp:HyperLink>
    
</asp:Content>

