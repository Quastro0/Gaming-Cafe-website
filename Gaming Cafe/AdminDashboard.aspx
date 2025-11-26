<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="Gaming_Cafe.AdminDashboard" %>

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
        <h1 style="font-size: 40px; color: yellow;">Admin Dashboard</h1>
        <p style="font-size: 18px;">Welcome, Admin! Here are today's bookings.</p>
    </div>

    <div style="margin: 20px auto; width: 90%; text-align: center;">
        <h2 style="color: yellow;">Today's Bookings</h2>
        
        <asp:GridView ID="gvTodayBookings" runat="server" AutoGenerateColumns="False" CssClass="styled-table" GridLines="None">
            <Columns>
                <asp:BoundField DataField="BookingID" HeaderText="ID" />
                <asp:BoundField DataField="Name" HeaderText="Customer Name" />
                <asp:BoundField DataField="UserEmail" HeaderText="Email" />
                <asp:BoundField DataField="GamingType" HeaderText="Game Type" />
                <asp:BoundField DataField="BookingDate" HeaderText="Date" />
                <asp:BoundField DataField="BookingTime" HeaderText="Time" />
                <asp:BoundField DataField="Hours" HeaderText="Hours" />
                <asp:BoundField DataField="Players" HeaderText="Players" />
            </Columns>
        </asp:GridView>
    </div>

</asp:Content>
