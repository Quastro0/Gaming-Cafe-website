<%@ Page Title="Login / Register" Language="C#" MasterPageFile="~/MainTemplate.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Gaming_Cafe.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .form-container {
            display: flex; 
            justify-content: center; 
            align-items: center; 
            height: 80vh; 
            background-color: #0d0d0d; 
            color: white;
        }
        .form-box {
            display: flex; 
            width: 80%; 
            max-width: 900px; 
            background-color: #1a1a1a; 
            padding: 40px; 
            border-radius: 10px; 
            box-shadow: 0px 0px 20px #00ffcc;
        }
        .login, .register {
            flex: 1; 
            text-align: center; 
            padding: 20px;
        }
        .login {
            border-right: 2px solid #00ffcc;
        }
        .input-field {
            width: 80%; 
            padding: 10px; 
            margin: 10px; 
            border-radius: 5px; 
            background-color: #111; 
            color: white; 
            border: 1px solid cyan;
        }
        .btn {
            background-color: #00ffcc; 
            color: black; 
            padding: 12px 25px; 
            border: none; 
            cursor: pointer; 
            border-radius: 5px; 
            font-size: 18px; 
            font-weight: bold; 
            transition: 0.3s; 
            text-shadow: 0px 0px 5px black;
        }
        .btn:hover {
            background-color: #00cc99;
        }
        .error-message {
            color: red;
            font-size: 14px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-container">
        <div class="form-box">
            <!-- Login Section -->
            <div class="login">
                <h2 style="color: #00ffcc;">Login</h2>

                <asp:TextBox ID="txtLoginEmail" runat="server" Placeholder="Email" CssClass="input-field" /><br />
                <asp:Label ID="lblLoginEmailError" runat="server" CssClass="error-message" Visible="false"></asp:Label><br />

                <asp:TextBox ID="txtLoginPassword" runat="server" Placeholder="Password" TextMode="Password" CssClass="input-field" /><br />
                <asp:Label ID="lblLoginPasswordError" runat="server" CssClass="error-message" Visible="false"></asp:Label><br />

                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn" OnClick="btnLogin_Click" />
            </div>

            <!-- Register Section -->
            <div class="register">
                <h2 style="color: #00ffcc;">Register</h2>

                <asp:TextBox ID="txtRegisterName" runat="server" Placeholder="Full Name" CssClass="input-field" /><br />
                <asp:Label ID="lblRegisterNameError" runat="server" CssClass="error-message" Visible="false"></asp:Label><br />

                <asp:TextBox ID="txtRegisterEmail" runat="server" Placeholder="Email" CssClass="input-field" /><br />
                <asp:Label ID="lblRegisterEmailError" runat="server" CssClass="error-message" Visible="false"></asp:Label><br />

                <asp:TextBox ID="txtRegisterPassword" runat="server" Placeholder="Password" TextMode="Password" CssClass="input-field" /><br />
                <asp:Label ID="lblRegisterPasswordError" runat="server" CssClass="error-message" Visible="false"></asp:Label><br />

                <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn" OnClick="btnRegister_Click" />
            </div>
        </div>
    </div>
    <div style="text-align: center; margin-top: 20px;">
    <asp:Label ID="lblAdminRedirect" runat="server" ForeColor="Red" Font-Size="16px"
        Text="Are you an Admin? "></asp:Label>
    <asp:HyperLink ID="hlAdminLogin" runat="server" NavigateUrl="AdminLogin.aspx" 
        ForeColor="Red" Font-Bold="true" Text="Click here to login"></asp:HyperLink>
</div>

</asp:Content>
