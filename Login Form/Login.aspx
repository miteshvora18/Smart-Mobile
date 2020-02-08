<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="Login.aspx.cs" Inherits="Login_Form.Login" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolderLogin" runat="server">
    <style type="text/css">
    .footer,.header,.content,.pageContent
    {
        display:none;
    }
    </style>
    <div class="login">
        <div class="errorMsg">
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </div>
        <div class="marginBotttom10">
            <asp:Label ID="lblUsername" runat="server" Text="Username"></asp:Label><br />
            <asp:TextBox ID="txtUsername" CssClass="txt" runat="server"></asp:TextBox>
        </div>
        <div class="marginBotttom10">
            <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label><br />
            <asp:TextBox ID="txtPassword" CssClass="txt" runat="server" TextMode="Password"></asp:TextBox>
        </div>
        <div class="marginTop20">
            <asp:Button ID="btnSubmit" CssClass="btn btnLogin" runat="server" Text="Submit" 
                onclick="btnSubmit_Click"/>
        </div>
        <div class="forgotPass">
            <a href="ForgotPassword.aspx" style="color:#000000;text-decoration:none;">Forgot Password?</a> 
        </div>
    </div>
</asp:Content>
