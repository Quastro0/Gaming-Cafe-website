<%@ Page Title="User Data" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminUserData.aspx.cs" Inherits="Gaming_Cafe.AdminUserData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .styled-table {
            width: 90%;
            margin: auto;
            border-collapse: collapse;
            font-size: 18px;
            text-align: center;
        }
        .styled-table th, .styled-table td {
            padding: 12px;
            border: 1px solid white;
        }
        .styled-table th {
            background-color: yellow;
            color: black;
            font-weight: bold;
        }
        .styled-table tr:nth-child(even) {
            background-color: #333;
        }
        .styled-table tr:nth-child(odd) {
            background-color: #444;
        }
        .styled-table tr:hover {
            background-color: #555;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align: center; padding: 30px; background-color: #181818; color: white; border-radius: 10px;">
        <h1 style="font-size: 40px; color: yellow;">User Data</h1>
        <p style="font-size: 18px;">Here are all registered users.</p>
    </div>

    <div style="margin: 20px auto; width: 90%; text-align: center;">
        <h2 style="color: yellow;">Registered Users</h2>
        <!-- Insert User Form -->
    <div>
        <asp:TextBox ID="txtFullName" runat="server" Placeholder="Full Name"></asp:TextBox>
        <asp:TextBox ID="txtEmail" runat="server" Placeholder="Email"></asp:TextBox>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Placeholder="Password"></asp:TextBox>
        <asp:Button ID="btnAddUser" runat="server" Text="Add User" OnClick="btnAddUser_Click" />
    </div>
       <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" CssClass="styled-table" GridLines="None"
    AllowPaging="True" PageSize="10" OnPageIndexChanging="gvUsers_PageIndexChanging"
    OnRowEditing="gvUsers_RowEditing" OnRowUpdating="gvUsers_RowUpdating" 
    OnRowCancelingEdit="gvUsers_RowCancelingEdit" OnRowDeleting="gvUsers_RowDeleting"
    DataKeyNames="Id">
    <Columns>
        <asp:BoundField DataField="Id" HeaderText="User ID" ReadOnly="True" />
        <asp:BoundField DataField="Full_Name" HeaderText="Full Name" />
        <asp:BoundField DataField="Email" HeaderText="Email" />
        <asp:BoundField DataField="Password" HeaderText="Password" />
        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
    </Columns>
    <PagerStyle CssClass="pagination" />
</asp:GridView>

    </div>
</asp:Content>
