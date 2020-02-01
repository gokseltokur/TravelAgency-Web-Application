using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace TRAVELAGENCY
{
    public partial class accommodation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //string sqlStr;

            //sqlStr = "select hotel_name, hotel_id from Hotel";

            //using (SqlConnection connection = new SqlConnection())
            //{
            //    connection.ConnectionString = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
            //    using (SqlCommand command = new SqlCommand())
            //    {
            //        command.CommandText = sqlStr;
            //        command.Connection = connection;
            //        connection.Open();
            //        using (SqlDataReader sdr = command.ExecuteReader())
            //        {
            //            while (sdr.Read())
            //            {
            //                ListItem item = new ListItem();
            //                item.Text = sdr["hotel_name"].ToString();
            //                item.Value = sdr["hotel_id"].ToString();
            //                item.Selected = false;
            //                DropDownList1.Items.Add(item);
            //            }
            //        }
            //        connection.Close();
            //    }
            //}

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           
            SqlConnection connection = new SqlConnection();
            SqlCommand command = new SqlCommand();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
            command.Connection = connection;

            String[] seperator = { "<center>", "</center>" };
            String[] hotelNameAddress = (HotelSelect.SelectedItem.Text).Split(seperator, StringSplitOptions.RemoveEmptyEntries);
           


            connection.Open();
            string biggestID = "SELECT MAX(outcome_id) FROM Booking_Outcome";
            command.CommandText = biggestID;
            int outcome_id = Convert.ToInt32(command.ExecuteScalar());
            outcome_id = outcome_id + 1;
            string sqlStr2 = "INSERT INTO Booking_Outcome(outcome_id, outcome_status) VALUES (" + outcome_id.ToString() + ", 'OK' );";
            command.CommandText = sqlStr2;
            command.ExecuteReader();
            connection.Close();

            connection.Open();
            string biggestIDOfBookingStatus = "SELECT MAX(status_id) FROM Booking_Status";
            command.CommandText = biggestIDOfBookingStatus;
            int status_id = Convert.ToInt32(command.ExecuteScalar());
            status_id = status_id + 1;
            string sqlStr3 = "INSERT INTO Booking_Status(status_id, status_description) VALUES (" + status_id.ToString() + ", 'Accepted' );";
            command.CommandText = sqlStr3;
            command.ExecuteReader();
            connection.Close();


            connection.Open();
            //string biggestIDOfCustomer = "SELECT MAX(customer_id) FROM Customer";
            //command.CommandText = biggestIDOfCustomer;
            //int customer_id = Convert.ToInt32(command.ExecuteScalar());
            //customer_id = customer_id + 1;
            string sqlStr4 = "INSERT INTO Customer(customer_name, customer_surname, customer_phone_number) VALUES ('" + TextBox1.Text + "', '"+ TextBox2.Text +"', '"+ TextBox3.Text + "');";
            command.CommandText = sqlStr4;
            command.ExecuteReader();
            connection.Close();
            connection.Open();
            string biggestIDOfCustomer = "SELECT MAX(customer_id) FROM Customer";
            command.CommandText = biggestIDOfCustomer;
            int customer_id = Convert.ToInt32(command.ExecuteScalar());
            connection.Close();


            connection.Open();
            string sqlStr5 = "INSERT Booking(customer_id, outcome_id, status_id, travel_agency_id, date_of_booking, booking_details) VALUES ('" + customer_id.ToString() +"', '" +  outcome_id.ToString() + "','" + status_id.ToString() + "','" + '1' + "','" + DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss") + "',  'Reserved' );";
            command.CommandText = sqlStr5;
            command.ExecuteReader();
            connection.Close();
            connection.Open();
            string biggestIDOfBooking = "SELECT MAX(booking_id) FROM Booking";
            command.CommandText = biggestIDOfBooking;
            int booking_id = Convert.ToInt32(command.ExecuteScalar());
            connection.Close();




            
            connection.Open();
            //string getPriceSql = "SELECT hotel_name, hotel_price FROM Hotel WHERE hotel_name='" + hotelNameAddress[1] + "'";
            //SqlConnection con = new SqlConnection();
            //con.ConnectionString = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
            //SqlCommand cmd = new SqlCommand();
            //cmd.CommandText = getPriceSql;
            //cmd.Connection = con;
            //con.Open();
            //SqlDataReader sdr = cmd.ExecuteReader();
            //sdr.Read();
            //ListItem hotel = new ListItem();
            //hotel.Text = sdr["hotel_name"].ToString();
            //hotel.Value = sdr["hotel_price"].ToString();
            //con.Close();
            string numberOfDays = (DateTime.Parse(TextBox9.Text) - DateTime.Parse(TextBox8.Text)).TotalDays.ToString();
            connection.Close();
            connection.Open();
            string biggestIDOfPayment = "SELECT MAX(payment_id) FROM Payment";
            command.CommandText = biggestIDOfPayment;
            int payment_id = Convert.ToInt32(command.ExecuteScalar());
            payment_id = payment_id + 1;
            string sqlStr6 = "INSERT Payment(payment_id, booking_id, payment_amount, other_details) VALUES ('" + payment_id.ToString() + "','" + booking_id.ToString() + "','" + (Convert.ToInt32(numberOfDays) * Convert.ToDouble(HotelSelect.SelectedItem.Value)).ToString() + "', 'Paid' );";
            command.CommandText = sqlStr6;
            command.ExecuteReader();
            connection.Close();


            connection.Open();
            string biggestIDOfService = "SELECT MAX(service_id) FROM Service";
            command.CommandText = biggestIDOfService;
            int service_id = Convert.ToInt32(command.ExecuteScalar());
            service_id = service_id + 1;
            string sqlStr7 = "INSERT Service(service_id, service_details) VALUES ('"+ service_id + "', NULL);";
            command.CommandText = sqlStr7;
            command.ExecuteReader();
            connection.Close();

            connection.Open();
            string sqlStr8 = "INSERT Service_Booking(service_id, booking_id, booking_start_date, booking_end_date) VALUES ('" + service_id.ToString() +"','"+ booking_id.ToString() + "','" + TextBox8.Text + "','" + TextBox9.Text + "');";
            command.CommandText = sqlStr8;
            int service_booking_id = Convert.ToInt32(service_id.ToString() + booking_id.ToString()) ;
            command.ExecuteReader();
            connection.Close();


            connection.Open();
            string biggestIDOfAddress = "SELECT MAX(address_id) FROM Address";
            command.CommandText = biggestIDOfAddress;
            int address_id = Convert.ToInt32(command.ExecuteScalar());
            address_id = address_id + 1;
            string sqlStr9 = "INSERT Address(address_id, address_details ) VALUES ('" + address_id + "','"+ (TextBox4.Text + TextBox5.Text)  +"' );";
            command.CommandText = sqlStr9;
            command.ExecuteReader();
            connection.Close();


            connection.Open();
            string biggestIDOfCustomerAddress = "SELECT MAX(customer_address_id) FROM Customer_Address";
            command.CommandText = biggestIDOfCustomerAddress;
            int customer_address_id = Convert.ToInt32(command.ExecuteScalar());
            customer_address_id = customer_address_id + 1;
            string sqlStr10 = "INSERT dbo.Customer_Address(customer_address_id, customer_id, address_id, date_from, date_to ) VALUES ('" + customer_address_id + "','" +  customer_id + "','" + address_id + "','"+  TextBox6.Text + "','" + TextBox7.Text + "' );";
            command.CommandText = sqlStr10;
            command.ExecuteReader();
            connection.Close();

            connection.Open();
            int hotel_id = service_id;
            string sqlStr11 = "INSERT dbo.Hotel(hotel_id, hotel_name, hotel_address, hotel_price ) VALUES ('"+ hotel_id.ToString() + "','" + hotelNameAddress[1]  + "','" + hotelNameAddress[2] + "','" +  HotelSelect.SelectedItem.Value  +"')";
            command.CommandText = sqlStr11;
            command.ExecuteReader();
            connection.Close();







        }

    }
}