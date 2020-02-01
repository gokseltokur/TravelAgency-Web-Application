<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="accommodation.aspx.cs" Inherits="TRAVELAGENCY.accommodation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <p>
        <br />
        <br />
        Welcome, please select one of the hotel.<br />
    </p>

    <asp:RadioButtonList ID="HotelSelect" runat="server" RepeatColumns="2"
        RepeatLayout="Table"
        RepeatDirection="Vertical">
        <asp:ListItem Text="<img src='images/1.jpg' width = 95%; height= 95%;/> </br> <center>The Langham</center>282-8351 Tincidunt Ave Sedalia Utah 53700" Value="100"></asp:ListItem>
        <asp:ListItem Text="<img src='images/2.jpg' width = 95%; height= 95%;/> </br> <center>Ace Hotel</center>430-985 Eleifend St. Duluth Washington 92611" Value="90"></asp:ListItem>
        <asp:ListItem Text="<img src='images/3.jpg' width = 95%; height= 95%;/> </br> <center>The Harbor Hotel</center>P.O. Box 399 4275 Amet Street West Allis NC 36734" Value="125"></asp:ListItem>
        <asp:ListItem Text="<img src='images/4.jpg' width = 95%; height= 95%;/> </br> <center>Grand Hotel</center>3415 Lobortis. Avenue Rocky Mount WA 48580" Value="200"></asp:ListItem>
        <asp:ListItem Text="<img src='images/5.jpg' width = 95%; height= 95%;/> </br> <center>Radisson Hotel</center>1293 Tincidunt Street Atwater Pennsylvania 76865" Value="175"></asp:ListItem>
        <asp:ListItem Text="<img src='images/6.jpg' width = 95%; height= 95%;/> </br> <center>Bristol Hotel</center>7709 Justo. Ave Princeton TX 77987" Value="85"></asp:ListItem>
    </asp:RadioButtonList>

   
        <br />
        <br />
       
    
    
    
    <p>
        Check-in
        <asp:TextBox ID="TextBox8" TextMode="Date" runat="server"></asp:TextBox>
        Check-out
        <asp:TextBox ID="TextBox9" TextMode="Date" runat="server"></asp:TextBox>
    </p>

    </br>
    </br>


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

    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Book & Pay" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>


