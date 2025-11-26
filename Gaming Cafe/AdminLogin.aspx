<%@ Page Title="Admin Login" Language="C#" MasterPageFile="~/MainTemplate.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="Gaming_Cafe.AdminLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align: center; padding: 50px; background-color: #181818; color: white; border-radius: 10px; max-width: 400px; margin: auto;">
        <h1 style="color: yellow;">Admin Login</h1>

        <asp:TextBox ID="txtAdminID" runat="server" Placeholder="Admin ID" CssClass="input-field" Style="width: 90%; padding: 10px; margin: 10px; border-radius: 5px;" /><br />
        <asp:TextBox ID="txtAdminPassword" runat="server" TextMode="Password" Placeholder="Password" CssClass="input-field" Style="width: 90%; padding: 10px; margin: 10px; border-radius: 5px;" /><br />

        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn" Style="background-color: yellow; color: black; padding: 10px 20px; border: none; cursor: pointer; border-radius: 5px; font-size: 18px;" OnClick="btnLogin_Click" /><br />

        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Font-Size="16px"></asp:Label>
    </div>
</asp:Content>
