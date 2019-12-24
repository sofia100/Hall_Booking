using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HallBooking
{
    public partial class request : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {


        }
        protected void LoginUser(object sender, FormViewPageEventArgs e)
        {
            Response.Redirect("Login.aspx");
            Session["username"] = "Text1" ;

        }

        protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {

        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            Session["username"] =userid.Text;
            Response.Redirect("Request.aspx");


        }


        protected void Unnamed_Click2(object sender, EventArgs e)
        {
            Session["username"] = userid.Text;
            Response.Redirect("Approve.aspx");


        }
    }
}