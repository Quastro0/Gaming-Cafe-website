<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/MainTemplate.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="Gaming_Cafe.ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Contact Us Header -->
    <div style="text-align: center; padding: 60px; background-color: #181818; color: white; border-radius: 10px;">
        <h1 style="font-size: 50px; color: yellow;">Contact Us</h1>
        <p style="font-size: 20px; max-width: 800px; margin: auto;">Got questions? Reach out to us and we'll be happy to help!</p>
    </div>

    <!-- Contact Form -->
    <div style="padding: 50px; text-align: center; background-color: #222; border-radius: 10px; max-width: 600px; margin: auto;">
        <h2 style="color: yellow;">Send Us a Message</h2>

        <asp:TextBox ID="txtName" runat="server" Placeholder="Your Name" 
            Style="width: 90%; padding: 10px; margin: 10px; border-radius: 5px;" /><br />

        <asp:TextBox ID="txtEmail" runat="server" Placeholder="Your Email" 
            Style="width: 90%; padding: 10px; margin: 10px; border-radius: 5px;" /><br />

        <asp:TextBox ID="txtMessage" runat="server" Placeholder="Your Message" TextMode="MultiLine" 
            Style="width: 90%; padding: 10px; margin: 10px; height: 100px; border-radius: 5px;" /><br />

        <asp:Button ID="btnSubmit" runat="server" Text="Send Message" OnClick="btnSubmit_Click"
            Style="background-color: yellow; color: black; padding: 10px 20px; border: none; 
            cursor: pointer; border-radius: 5px; font-size: 18px;" />

        <!-- ✅ Label for Success/Error Messages -->
        <br />
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Font-Size="16px" Style="display:block; margin-top:10px;"></asp:Label>
    </div>

    <!-- Contact Information and Map -->
    <div style="display: flex; justify-content: center; align-items: center; padding: 50px;">
        <!-- Left Side - Contact Info -->
        <div style="flex: 1; text-align: left; padding-right: 20px;">
            <h2 style="color: yellow;">Our Location</h2>
            <p style="font-size: 18px;">F-9, Nahur, Bhandup West, Mumbai, Maharashtra 400078</p>
            <h2 style="color: yellow;">Call Us</h2>
            <p style="font-size: 18px;">📞 +91 234567890</p>
            <h2 style="color: yellow;">Email Us</h2>
            <p style="font-size: 18px;">📧 support@gamingcafe.com</p>
        </div>
        
        <!-- Right Side - Google Maps -->
        <div style="flex: 1; text-align: right;">
            <iframe 
                width="100%" 
                height="250" 
                frameborder="0" 
                style="border:0; border-radius: 10px;" 
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3768.786562898473!2d72.944268!3d19.1608179!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3be7b927075e0005%3A0xaae90a718cb45c6c!2sConsole%20-%20Playstation%20Gaming!5e0!3m2!1sen!2sin!4v1742750207021!5m2!1sen!2sin" 
                allowfullscreen>
            </iframe>
        </div>
    </div>
</asp:Content>
