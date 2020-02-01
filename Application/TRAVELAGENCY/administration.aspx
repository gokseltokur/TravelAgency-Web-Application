<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="administration.aspx.cs" Inherits="TRAVELAGENCY.administration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br /><br />

    <p>
                
            </p>
            <p>
                <a class="btn btn-default" href="/bookingstatus.aspx">Click to change status or outcome of the bookings &raquo;</a>
            </p>

    <br />


    <p>Current Revenue of Each Agency</p>
    <asp:Repeater id="Repeater2" runat="server">
          <HeaderTemplate>
             <table border="0" style="width:100%; height:30px" >
                <tr>
                    <td style="border-bottom: 1px solid #ddd;"><b>Travel Agency ID</b></td>
                    <td style="border-bottom: 1px solid #ddd;"><b>Travel Agency Name</b></td>
                   <td style="border-bottom: 1px solid #ddd;"><b>Total Revenue</b></td>
                </tr>
          </HeaderTemplate>
             
          <ItemTemplate>
             <tr>
                 <td style="border-bottom: 1px solid #ddd;"> <%# DataBinder.Eval(Container.DataItem, "travel_agency_id") %> </td>
                 <td style="border-bottom: 1px solid #ddd;"> <%# DataBinder.Eval(Container.DataItem, "travel_agency_name") %> </td>
                 <td style="border-bottom: 1px solid #ddd;"> <%# DataBinder.Eval(Container.DataItem, "TotalAmount") %> </td>
             </tr>
          </ItemTemplate>
             
          <FooterTemplate>
             </table>
          </FooterTemplate>
             
       </asp:Repeater>
       <br />

    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Get All Bookings" />
       <br />
         
       <asp:Repeater id="Repeater1" runat="server">
          <HeaderTemplate>
             <table border="0" style="width:100%; height:30px">
                <tr>
                    <td style="border-bottom: 1px solid #ddd;"><b>Customer Name</b></td>
                   <td style="border-bottom: 1px solid #ddd;"><b>Customer Surname</b></td>
                   <td style="border-bottom: 1px solid #ddd;"><b>Booking ID</b></td>
                   <td style="border-bottom: 1px solid #ddd;"><b>Date of Booking</b></td>
                    <td style="border-bottom: 1px solid #ddd;"><b>Payment Amount</b></td>
                    <td style="border-bottom: 1px solid #ddd;"><b>Payment Details</b></td>
                </tr>
          </HeaderTemplate>
             
          <ItemTemplate>
             <tr>
                 <td style="border-bottom: 1px solid #ddd;"> <%# DataBinder.Eval(Container.DataItem, "customer_name") %> </td>
                 <td style="border-bottom: 1px solid #ddd;"> <%# DataBinder.Eval(Container.DataItem, "customer_surname") %> </td>
                 <td style="border-bottom: 1px solid #ddd;"> <%# DataBinder.Eval(Container.DataItem, "booking_id") %> </td>
                 <td style="border-bottom: 1px solid #ddd;"> <%# DataBinder.Eval(Container.DataItem, "date_of_booking") %> </td>
                 <td style="border-bottom: 1px solid #ddd;"> <%# DataBinder.Eval(Container.DataItem, "payment_amount") %> </td>
                 <td style="border-bottom: 1px solid #ddd;"> <%# DataBinder.Eval(Container.DataItem, "other_details") %> </td>
             </tr>
          </ItemTemplate>
             
          <FooterTemplate>
             </table>
          </FooterTemplate>
             
       </asp:Repeater>
       <br />

    <br />



    <p>
        Bookings Above <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox> number of days. 
    </p>
    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Get" />
       <br />

    <asp:Repeater id="Repeater3" runat="server">
          <HeaderTemplate>
             <table border="0" style="width:100%; height:30px" >
                <tr>
                    <td style="border-bottom: 1px solid #ddd;"><b>Booking ID</b></td>
                    <td style="border-bottom: 1px solid #ddd;"><b>Number Of Days</b></td>
                   <td style="border-bottom: 1px solid #ddd;"><b>Booking Start Date</b></td>
                   <td style="border-bottom: 1px solid #ddd;"><b>Booking End Date</b></td>
                </tr>
          </HeaderTemplate>
             
          <ItemTemplate>
             <tr>
                 <td style="border-bottom: 1px solid #ddd;"> <%# DataBinder.Eval(Container.DataItem, "booking_id") %> </td>
                 <td style="border-bottom: 1px solid #ddd;"> <%# DataBinder.Eval(Container.DataItem, "number_of_days") %> </td>
                 <td style="border-bottom: 1px solid #ddd;"> <%# DataBinder.Eval(Container.DataItem, "booking_start_date") %> </td>
                 <td style="border-bottom: 1px solid #ddd;"> <%# DataBinder.Eval(Container.DataItem, "booking_end_date") %> </td>
             </tr>
          </ItemTemplate>
             
          <FooterTemplate>
             </table>
          </FooterTemplate>
             
       </asp:Repeater>
     <br /> <br />
    <p>
       Get payments that is greater than <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox> . 
    </p>
    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Get" />
       <br />

    <asp:Repeater id="Repeater4" runat="server">
          <HeaderTemplate>
             <table border="0" style="width:100%; height:30px" >
                <tr>
                    <td style="border-bottom: 1px solid #ddd;"><b>Payment ID</b></td>
                    <td style="border-bottom: 1px solid #ddd;"><b>Booking ID</b></td>
                   <td style="border-bottom: 1px solid #ddd;"><b>Payment Amount</b></td>
                   <td style="border-bottom: 1px solid #ddd;"><b>Payment Date</b></td>
                </tr>
          </HeaderTemplate>
             
          <ItemTemplate>
             <tr>
                 <td style="border-bottom: 1px solid #ddd;"> <%# DataBinder.Eval(Container.DataItem, "payment_id") %> </td>
                 <td style="border-bottom: 1px solid #ddd;"> <%# DataBinder.Eval(Container.DataItem, "booking_id") %> </td>
                 <td style="border-bottom: 1px solid #ddd;"> <%# DataBinder.Eval(Container.DataItem, "payment_amount") %> </td>
                 <td style="border-bottom: 1px solid #ddd;"> <%# DataBinder.Eval(Container.DataItem, "payment_date") %> </td>
             </tr>
          </ItemTemplate>
             
          <FooterTemplate>
             </table>
          </FooterTemplate>
             
       </asp:Repeater>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>


