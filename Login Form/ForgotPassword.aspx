<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="ForgotPassword.aspx.cs" Inherits="Login_Form.ForgotPassword" %>

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
            <asp:Label ID="lblEmail" runat="server" CssClass="lbl">Email Id</asp:Label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="txt"></asp:TextBox>
        </div>
        <div class="marginTop20">
            <asp:Button ID="btnSubmit" CssClass="btn btnLogin" runat="server" Text="Submit" 
                onclick="btnSubmit_Click"/>
        </div>
        <div class="forgotPass">
            <a href="Login.aspx" style="color:#000000;text-decoration:none;">Back to Login</a> 
        </div>
        <div class="successMsg">
            <asp:Label ID="lblSuccessMsg" runat="server"></asp:Label>
        </div>
    </div>
</asp:Content>