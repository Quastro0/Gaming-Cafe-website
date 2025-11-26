<%@ Page Title="" Language="C#" MasterPageFile="~/MainTemplate.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Gaming_Cafe.HomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Hero Section with Ad Rotator -->
    <div style="text-align: center; position: relative; width: 100%; height: 500px; overflow: hidden;">
        <asp:AdRotator ID="AdRotator1" runat="server" AdvertisementFile="~/ads.xml" 
            Style="width: 100%; height: 100%; object-fit: cover;" />
        <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); text-align: center; background: rgba(0, 0, 0, 0.5); padding: 20px; border-radius: 10px; width: 80%;">
            <h1 style="font-size: 50px; margin-bottom: 10px; text-shadow: 2px 2px 10px black; color: white;">Welcome to Gaming Cafe</h1>
            <p style="font-size: 20px; max-width: 600px; margin: auto; text-shadow: 1px 1px 5px black; color: white;">Experience the ultimate gaming zone with high-end PCs, consoles, and an immersive environment.</p>
            <asp:HyperLink NavigateUrl="~/BookNow.aspx" Text="Book Now" runat="server" 
                Style="display: inline-block; padding: 15px 25px; background-color: yellow; color: black; font-weight: bold; text-decoration: none; border-radius: 5px; margin-top: 15px; font-size: 18px;" />
        </div>
    </div>

    <!-- About Section -->
    <div style="padding: 50px; text-align: center; background-color: #181818; border-radius: 10px; margin-top: 20px;">
        <h2 style="color: yellow;">About Our Gaming Cafe</h2>
        <p style="font-size: 18px; max-width: 800px; margin: auto;">We provide high-performance gaming setups, a relaxed environment, and competitive tournaments for all gaming enthusiasts.</p>
    </div>

    <!-- Popular Games Section -->
    <div style="padding: 50px; text-align: center;">
        <h2 style="color: yellow;">Popular Games</h2>
        <p style="font-size: 18px; max-width: 800px; margin: auto;">We offer top-rated games like Call of Duty, Valorant, FIFA, and more.</p>
    </div>

    <!-- Why Choose Us Section -->
    <div style="padding: 50px; text-align: center; background-color: #222; border-radius: 10px; margin-top: 20px;">
        <h2 style="color: yellow;">Why Choose Us?</h2>
        <ul style="list-style: none; padding: 0; font-size: 18px;">
            <li>🔥 High-end gaming PCs & consoles</li>
            <li>🎧 Immersive sound experience</li>
            <li>🥤 Snacks & Drinks available</li>
            <li>🏆 Weekly tournaments & prizes</li>
        </ul>
    </div>

    <!-- Customer Reviews -->
    <div style="padding: 50px; text-align: center; background-color: #181818; border-radius: 10px; margin-top: 20px;">
        <h2 style="color: yellow;">What Gamers Say</h2>
        <p style="font-size: 18px; max-width: 800px; margin: auto;">"The best gaming experience ever! Amazing PCs and great atmosphere!" - Alex</p>
        <p style="font-size: 18px; max-width: 800px; margin: auto;">"Superb service and awesome gaming setups!" - Jordan</p>
    </div>

    <!-- Location & Timings -->
    <div style="padding: 50px; text-align: center; background-color: #222; border-radius: 10px; margin-top: 20px;">
        <h2 style="color: yellow;">Find Us</h2>
        <p style="font-size: 18px;">📍 F-9, Nahur, Bhandup West</p>
        <p style="font-size: 18px;">🕒 Open: 10 AM - 12 AM | Mon - Sun</p>
    </div>
</asp:Content>
