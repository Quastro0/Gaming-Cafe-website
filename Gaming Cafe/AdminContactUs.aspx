<%@ Page Title="Contact Us Data" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminContactUs.aspx.cs" Inherits="Gaming_Cafe.AdminContactUs" %>

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
        <h1 style="font-size: 40px; color: yellow;">Contact Us Messages</h1>
        <p style="font-size: 18px;">View all messages submitted by users.</p>
    </div>

    <div style="margin: 20px auto; width: 90%; text-align: center;">
        <h2 style="color: yellow;">All Messages</h2>

        <asp:GridView ID="gvContactUs" runat="server" AutoGenerateColumns="False" CssClass="styled-table" GridLines="None"
            AllowPaging="True" PageSize="10" OnPageIndexChanging="gvContactUs_PageIndexChanging">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="ID" />
                <asp:BoundField DataField="Name" HeaderText="Full Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:BoundField DataField="Message" HeaderText="Message" />
            </Columns>
            <PagerStyle CssClass="pagination" />
        </asp:GridView>
    </div>
</asp:Content>
