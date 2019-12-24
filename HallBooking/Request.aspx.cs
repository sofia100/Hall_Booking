using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Data;

namespace HallBooking
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        String username;
        String hall;
        DateTime date;

        protected void Page_Load(object sender, EventArgs e)
        {
             username = Session["username"].ToString();
            Response.Write("Welcome " + username);

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            /*check avalability
        
             check in database if hall,date and sttaus match
             
             */
             string connectionString;
		SqlConnection cnn;
             //	connetionString = @"Data Source=WIN-50GP30FGO75;Initial Catalog=HallBooking ";
            connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\HallBook.mdf;Integrated Security=True";

        cnn = new SqlConnection(connectionString);
			
		cnn.Open();

            SqlCommand command;
            SqlDataReader sqlDataReader;
            String sql, output;
            sql = " select * from HallBooking";
            command = new SqlCommand(sql, cnn);

             hall=hall_id.SelectedItem.Value.ToString();
             date = DateTime.Parse(txtsdate.Text);
            String tb_hall, tb_date, tb_status;
            int flag = 0;
            int dd, mm, yy;
            dd = date.Day;
            mm = date.Month;
            yy = date.Year;


            sqlDataReader = command.ExecuteReader();
            while(sqlDataReader.Read())
            {
                DateTime dt = (DateTime)sqlDataReader.GetValue(2);
                int d, m, y;
                d = dt.Day;
                m = dt.Month;
                y = dt.Year;
                bool b = d == dd && m == mm && y == yy;

               // tb_date = dt.ToString("ddmmyyyy");
                tb_status =(string) sqlDataReader.GetValue(5);
                tb_hall = (string)sqlDataReader.GetValue(4);

                if ((tb_hall.Equals(hall))
                   // &&(tb_date.Equals(date)
                   && (b
                    &&     tb_status.Equals("approved"))
                    )
                    {
                    Response.Write("NOT AVAILABLE");
                    flag++;
                    break;

                }
                     

               /* output = tb_hall + "\t"+(hall) + "\n"
                        + tb_date + "\t" + (date) + "\n"
                        + tb_status + "\t" + ("approved") + "\n";
                Response.Write(output);
                Response.Write("\n");*/

            }
            if (flag == 0)
            {
                //send email button create and send email
                Response.Write("MAY BE AVAILABLE");

                Button2.Visible = true;

      
        }

            //Response.Write("Connection MAde");    
            cnn.Close();  


        }
        protected void DynamicButton_Click(object sender, EventArgs e)
        {
           String  url = "https://mail.google.com/mail/u/0/?tab=rm&ogbl" ;
            Control control = this;
            ScriptManager.RegisterStartupScript(control, control.GetType(), "Open", "window.open('" + url + "');", true);
            string connectionString;
            SqlConnection cnn;
            connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\HallBook.mdf;Integrated Security=True";

            cnn = new SqlConnection(connectionString);

            cnn.Open();
            DateTime present = DateTime.Now;
            SqlCommand command;
            String sql;
          
             sql = "insert into HallBooking(BookedDate, EmployeeId, Hall, BookStatus, EntryBy, Requesteddate, LastUpdatedOn) " +
                "values (  CONVERT(datetime,'"+date+"'),'" + username + "' , '" + hall + "', 'asked' , 'XYZDB'," +
                " CONVERT(datetime,'" + present + "'), CONVERT(datetime,'" + present + "'))";
            command = new SqlCommand(sql, cnn);

  
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.InsertCommand = new SqlCommand(sql, cnn);
            adapter.InsertCommand.ExecuteNonQuery();
            command.Dispose();
            cnn.Close();


        }


      
    }
}