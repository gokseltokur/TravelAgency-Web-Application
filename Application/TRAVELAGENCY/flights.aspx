<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="flights.aspx.cs" Inherits="TRAVELAGENCY.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <p>
        <br />
        <br />
        Welcome,<br />
    </p>
    <asp:DropDownList ID="DropDownList1" runat="server">
    </asp:DropDownList>
    </br>
    </br>
    <p>
        From
        <asp:DropDownList ID="DropDownList2" runat="server"></asp:DropDownList>
        To
        <asp:DropDownList ID="DropDownList3" runat="server"></asp:DropDownList>
        Departure Date
        <asp:TextBox ID="TextBox8" TextMode="Date" runat="server"></asp:TextBox>
        Return
        <asp:TextBox ID="TextBox9" TextMode="Date" runat="server"></asp:TextBox>
    </p>


    <asp:Label ID="Label1" runat="server" Text="Passenger Information"></asp:Label>



    <p>
        Customer Name
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        Customer Surname
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    </p>

    <p>
        Phone Number
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
    </p>

    <p>
        Address Line 1
        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        Address Line 2
        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
        Date From
        <asp:TextBox ID="TextBox6" TextMode="Date" runat="server"></asp:TextBox>
        Date To
        <asp:TextBox ID="TextBox7" TextMode="Date" runat="server"></asp:TextBox>
    </p>

    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Book & Pay" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
