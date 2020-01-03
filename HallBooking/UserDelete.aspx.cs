using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HallBooking
{
    public partial class UserDelete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           String username = Session["username"].ToString();
            Response.Write("Welcome " + username);


        }
        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}