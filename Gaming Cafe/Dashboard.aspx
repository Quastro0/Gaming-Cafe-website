<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/MainTemplate.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Gaming_Cafe.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align: center; padding: 50px; color: white; background-color: #0d0d0d;">
       <asp:Label ID="lblWelcome" runat="server" ForeColor="#00ffcc" Font-Size="24px" Font-Bold="true"></asp:Label>
<br /><br />

        
        <h1 style="color: #00ffcc;">This is Your Dashboard</h1>
        <p>Here you can view your booked sessions.</p>

        <!-- Label to show when there are no bookings -->
        <asp:Label ID="lblNoBookings" runat="server" Text="No bookings found." ForeColor="Red" 
            Font-Size="16px" Visible="false"></asp:Label>

        <!-- ✅ Centered GridView inside a div -->
        <div style="display: flex; justify-content: center; margin-top: 20px;">
            <asp:GridView ID="gvBookings" runat="server" AutoGenerateColumns="False" CssClass="table" 
                HeaderStyle-BackColor="#00ffcc" HeaderStyle-ForeColor="black">
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Name" /> 
                    <asp:BoundField DataField="GamingType" HeaderText="Gaming Type" />

                   
                    <asp:TemplateField HeaderText="Date">
                        <ItemTemplate>
                            <%# Convert.ToDateTime(Eval("Date")).ToString("dd-MM-yyyy") %>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="BookingTime" HeaderText="Time" />
                    <asp:BoundField DataField="Hours" HeaderText="Hours" />
                    <asp:BoundField DataField="Players" HeaderText="Players" />
                </Columns>
            </asp:GridView>
        </div>

        <br />
        <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" 
            Style="background-color: red; color: white; padding: 12px 25px; border: none; 
            cursor: pointer; border-radius: 5px; font-size: 18px; font-weight: bold;" />
    </div>
</asp:Content>
