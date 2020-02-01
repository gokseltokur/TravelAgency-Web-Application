<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="bookingstatus.aspx.cs" Inherits="TRAVELAGENCY.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br /><br />

    <p>
        Change Status of booking: booking id = <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox> Status = <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Update" />
    </p>
    <p>
        Change Outcome of booking: booking id = <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox> Outcome = <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Update" />
    </p>
    
       <br />

    <asp:Repeater id="Repeater1" runat="server">
          <HeaderTemplate>
             <table border="0" style="width:100%; height:30px">
                <tr>
                    <td style="border-bottom: 1px solid #ddd;"><b>Booking ID</b></td>
                   <td style="border-bottom: 1px solid #ddd;"><b>Performed Action</b></td>
                   <td style="border-bottom: 1px solid #ddd;"><b>Action Date</b></td>
                   <td style="border-bottom: 1px solid #ddd;"><b>Status</b></td>
                    <td style="border-bottom: 1px solid #ddd;"><b>Outcome</b></td>
                </tr>
          </HeaderTemplate>
             
          <ItemTemplate>
             <tr>
                 <td style="border-bottom: 1px solid #ddd;"> <%# DataBinder.Eval(Container.DataItem, "booking_id") %> </td>
                 <td style="border-bottom: 1px solid #ddd;"> <%# DataBinder.Eval(Container.DataItem, "performed_action") %> </td>
                 <td style="border-bottom: 1px solid #ddd;"> <%# DataBinder.Eval(Container.DataItem, "action_date") %> </td>
                 <td style="border-bottom: 1px solid #ddd;"> <%# DataBinder.Eval(Container.DataItem, "status_description") %> </td>
                 <td style="border-bottom: 1px solid #ddd;"> <%# DataBinder.Eval(Container.DataItem, "outcome_status") %> </td>
             </tr>
          </ItemTemplate>
             
          <FooterTemplate>
             </table>
          </FooterTemplate>
             
       </asp:Repeater>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
