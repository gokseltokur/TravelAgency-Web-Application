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
    public partial class administration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string sqlStr;
            sqlStr = "SELECT * FROM Revenue_of_Each_Agency AS V, Travel_Agency AS T WHERE V.travel_agency_id = T.travel_agency_id";

            DBConnection dbcon = new DBConnection();
            DataSet ds = new DataSet();
            ds = dbcon.getSelect(sqlStr);

            Repeater2.DataSource = ds.Tables[0];

            Repeater2.DataBind();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string sqlStr;
            sqlStr = "SELECT * FROM Booking AS B, Payment AS P, Customer AS C WHERE B.booking_id = P.booking_id AND B.customer_id = C.customer_id";

            DBConnection dbcon = new DBConnection();
            DataSet ds = new DataSet();
            ds = dbcon.getSelect(sqlStr);

            Repeater1.DataSource = ds.Tables[0];

            Repeater1.DataBind();

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string sqlStr;
            sqlStr = "exec BookingsAboveSpecificNumberOfDays " + TextBox1.Text;

            DBConnection dbcon = new DBConnection();
            DataSet ds = new DataSet();
            ds = dbcon.getSelect(sqlStr);

            Repeater3.DataSource = ds.Tables[0];

            Repeater3.DataBind();

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string sqlStr;
            sqlStr = "exec GetGreaterPayments " + TextBox2.Text;

            DBConnection dbcon = new DBConnection();
            DataSet ds = new DataSet();
            ds = dbcon.getSelect(sqlStr);

            Repeater4.DataSource = ds.Tables[0];

            Repeater4.DataBind();

        }
    }
}