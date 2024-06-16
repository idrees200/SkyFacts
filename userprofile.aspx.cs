using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Data;
namespace skyfacts
{
    public partial class userprofile : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try {
               if(Session["username"]==""|| Session["username"] == null)
                {
                    Response.Write("<script>alert('Session Expired! Login Again');</script>");
                    Response.Redirect("userlogin.aspx");
                }
                else
                {
                    checkmemberexists();
                    if (!Page.IsPostBack)
                    {
                        chekin();
                    }
                }

                
            }

            catch (Exception ex)
            {
                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("userlogin.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["userid"] == "" || Session["userid"] == null)
            {
                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("userlogin.aspx");
            }
            else
            {
                updateUserPersonalDetails();

            } 
        }
        void updateUserPersonalDetails()
        {
            string password = "";
            if (TextBox9.Text.Trim() == "")
            {
                password = TextBox7.Text.Trim();
            }
            else
            {
                password = TextBox9.Text.Trim();
            }
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }


                SqlCommand cmd = new SqlCommand("update Users set   Password=@pw, FirstName=@fname, LastName=@Lname, Age=@age, Gender=@gen, Nationality=@nty, PermAddress=@pa, Email=@email,PhoneNum=@phone,SkyFactMembership=@sky,VIPExclusive=@vip WHERE UserID='" + Session["userid"].ToString().Trim() + "'", con);

                cmd.Parameters.AddWithValue("@fname", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@Lname", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@phone", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@email", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@vip", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@gen", DropDownList2.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@nty", DropDownList3.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@sky", DropDownList4.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@age", TextBox6.Text.Trim());
                
                cmd.Parameters.AddWithValue("@pa", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@pw", password);
               

                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result > 0)
                {

                    Response.Write("<script>alert('Your Details Updated Successfully');</script>");
                    chekin();
                    checkmemberexists();
                }
                else
                {
                    Response.Write("<script>alert('Invaid entry');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void chekin()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }

                SqlCommand cmd = new SqlCommand("Select * from Users where UserID = '" + Session["userid"].ToString().Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                TextBox1.Text = dt.Rows[0]["FirstName"].ToString();
                TextBox2.Text = dt.Rows[0]["LastName"].ToString();
                TextBox3.Text = dt.Rows[0]["PhoneNum"].ToString();
                TextBox4.Text = dt.Rows[0]["Email"].ToString();
                DropDownList1.SelectedValue = dt.Rows[0]["VIPExclusive"].ToString().Trim();
                DropDownList2.SelectedValue = dt.Rows[0]["Gender"].ToString().Trim();
                DropDownList3.SelectedValue = dt.Rows[0]["Nationality"].ToString().Trim();
                TextBox6.Text = dt.Rows[0]["Age"].ToString();
                DropDownList4.SelectedValue = dt.Rows[0]["SkyFactMembership"].ToString().Trim();
                TextBox5.Text = dt.Rows[0]["PermAddress"].ToString();
                TextBox8.Text = dt.Rows[0]["Username"].ToString();
                TextBox7.Text = dt.Rows[0]["Password"].ToString();
               



            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
        void checkmemberexists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }

                SqlCommand cmd = new SqlCommand("Select * from Bookings where UserID = '" + Session["userid"].ToString().Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
                con.Close();
               
              

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
               
            }



        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE from Bookings WHERE TicketID='" + TextBox10.Text.Trim() + "'", con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Ticket cancelled Successfully');</script>");
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }
    }
}