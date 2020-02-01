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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string sqlStr;
            sqlStr = "SELECT * FROM Booking AS B, Booking_Log AS LOG, Booking_Status AS STATUS, Booking_Outcome AS OUTCOME WHERE B.booking_id = LOG.booking_id AND B.status_id = STATUS.status_id AND B.outcome_id = OUTCOME.outcome_id ";

            DBConnection dbcon = new DBConnection();
            DataSet ds = new DataSet();
            ds = dbcon.getSelect(sqlStr);

            Repeater1.DataSource = ds.Tables[0];

            Repeater1.DataBind();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection();
            SqlCommand command = new SqlCommand();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
            command.Connection = connection;

            connection.Open();
            string sqlStr1;
            sqlStr1 = "SELECT status_id FROM Booking AS B WHERE B.booking_id =" + TextBox1.Text;
            command.CommandText = sqlStr1;
            int status_id = Convert.ToInt32(command.ExecuteScalar());
            connection.Close();

            

            string sqlStr2;
            sqlStr2 = "UPDATE Booking_Status SET status_description = '" + TextBox3.Text + "' WHERE status_id = " + status_id.ToString() ;
            connection.Open();
            command.CommandText = sqlStr2;
            command.ExecuteReader();
            connection.Close();


            Response.Redirect("bookingstatus.aspx");

        }


        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection();
            SqlCommand command = new SqlCommand();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
            command.Connection = connection;

            connection.Open();
            string sqlStr1;
            sqlStr1 = "SELECT outcome_id FROM Booking AS B WHERE B.booking_id =" + TextBox2.Text;
            command.CommandText = sqlStr1;
            int outcome_id = Convert.ToInt32(command.ExecuteScalar());
            connection.Close();



            string sqlStr2;
            sqlStr2 = "UPDATE Booking_Outcome SET outcome_status = '" + TextBox4.Text + "' WHERE outcome_id = " + outcome_id.ToString();
            connection.Open();
            command.CommandText = sqlStr2;
            command.ExecuteReader();
            connection.Close();


            Response.Redirect("bookingstatus.aspx");

        }

    }
}