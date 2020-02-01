<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="carrental.aspx.cs" Inherits="TRAVELAGENCY.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <p>
        <br />
        <br />
        Welcome, please select model and type of the car<br />
    </p>
    <asp:DropDownList ID="DropDownList1" runat="server">
    </asp:DropDownList>
    </br>
    </br>
    <p>
        Pick-up Date
        <asp:TextBox ID="TextBox8" TextMode="Date" runat="server"></asp:TextBox>
        Drop-off Date
        <asp:TextBox ID="TextBox9" TextMode="Date" runat="server"></asp:TextBox>
    </p>


    <asp:Label ID="Label1" runat="server" Text="Customer Information"></asp:Label>



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

    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Rent & Pay" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
