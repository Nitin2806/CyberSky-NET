<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" Title="Log out" CodeBehind="Logout.aspx.cs"  Inherits="CyberSky.Logout" %>


<asp:content id="bodycontent" contentplaceholderid="MainContent" runat="server">
    <h1>We are logging you out!</h1>
    <h3>See you next time or next Semester</h3>
    <asp:Button ID="logout" runat="server" Text="Logout" onClick="logout_button"/>
</asp:Content>
