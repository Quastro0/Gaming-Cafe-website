<%@ Page Title="Book Now" Language="C#" MasterPageFile="~/MainTemplate.Master" AutoEventWireup="true" CodeBehind="BookNow.aspx.cs" Inherits="Gaming_Cafe.BookNow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            text-align: center;
            padding: 50px;
            color: white;
            background-color: #0d0d0d;
            border-radius: 10px;
            box-shadow: 0px 0px 20px #00ffcc;
            max-width: 600px;
            margin: auto;
        }
        .form-control {
            width: 90%;
            padding: 10px;
            margin: 10px;
            border-radius: 5px;
            background-color: #111;
            color: white;
            border: 1px solid cyan;
        }
        .btn-style {
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
        .btn-style:hover {
            background-color: #00cc99;
        }
        .calendar-style {
            margin: auto;
            display: block;
            background-color: #222;
            color: white;
            border-radius: 10px;
            padding: 10px;
            box-shadow: 0px 0px 10px cyan;
        }

        /* For Chrome, Edge, and Safari */
input[type="time"]::-webkit-calendar-picker-indicator {
    filter: invert(1); /* Inverts color (makes dark icon white) */
    cursor: pointer;
}

/* For Firefox */
input[type="time"] {
    color: white; /* Ensures text is visible */
    background-color: #111;
}

/* Edge & Other Browsers */
input[type="time"]::-ms-clear,
input[type="time"]::-ms-reveal {
    display: none;
}

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <!-- ✅ ScriptManager Required -->
    <asp:ScriptManager runat="server"></asp:ScriptManager>

    <div class="container">
        <h1 style="color: #00ffcc;">Book Your Gaming Session</h1>

        <!-- Login Check -->
        <asp:Panel ID="pnlLoginPrompt" runat="server" Visible="false">
            <p style="color: red;">You need to log in to book a session.</p>
            <asp:HyperLink NavigateUrl="~/Login.aspx?returnUrl=BookNow.aspx" Text="Click here to Log In" ForeColor="#00ffcc" runat="server" />
        </asp:Panel>

        <!-- Booking Form -->
        <asp:Panel ID="pnlBookingForm" runat="server" Visible="false">
            <table style="margin: auto;">
                <tr>
                    <td><label style="color:white;">Name:</label></td>
                    <td><asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><label style="color:white;">Gaming Type:</label></td>
                    <td>
                        <asp:DropDownList ID="ddlGamingType" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Computer Gaming" Value="Computer Gaming"></asp:ListItem>
                            <asp:ListItem Text="VR Gaming" Value="VR Gaming"></asp:ListItem>
                            <asp:ListItem Text="PS5/Xbox Gaming" Value="PS4/Xbox Gaming"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td><label style="color:white;">Date:</label></td>
                    <td>
                        <asp:UpdatePanel ID="updCalendar" runat="server">
                            <ContentTemplate>
                                <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                <asp:Calendar ID="calDatePicker" runat="server" CssClass="calendar-style" OnSelectionChanged="calDatePicker_SelectionChanged" />
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="calDatePicker" EventName="SelectionChanged" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td><label style="color:white;">Time:</label></td>
                    <td><asp:TextBox ID="txtTime" runat="server" CssClass="form-control" TextMode="Time"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><label style="color:white;">Hours:</label></td>
                    <td>
                        <asp:DropDownList ID="ddlHours" runat="server" CssClass="form-control">
                            <asp:ListItem Text="1 Hour" Value="1"></asp:ListItem>
                            <asp:ListItem Text="2 Hours" Value="2"></asp:ListItem>
                            <asp:ListItem Text="3 Hours" Value="3"></asp:ListItem>
                            <asp:ListItem Text="4 Hours" Value="4"></asp:ListItem>
                            <asp:ListItem Text="5 Hours" Value="5"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td><label style="color:white;">Players:</label></td>
                    <td><asp:TextBox ID="txtPlayers" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox></td>
                </tr>
            </table>

            <br />
            <asp:Button ID="btnBookNow" runat="server" Text="Book Now" CssClass="btn-style" OnClick="btnBookNow_Click" />
        </asp:Panel>
    </div>
</asp:Content>  
