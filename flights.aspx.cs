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
using System.IO;
namespace skyfacts
{
    public partial class flights : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        private string global_filepath;

        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }
        //add
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (checkmemberexists())
            {
                Response.Write("<script>alert('Flight Id ! You cannot add another Flight with same Id.');</script>");
            }
            else
            {
                addnewcountry();
            }
        }
        //update
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (checkmemberexistspart())
            {
                updateair();
            }
            else
            {
                Response.Write("<script>alert('Flight Id doesnot exists !');</script>");
            }
        }
        //del
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (checkmemberexists())
            {
                deletecountry();
            }
            else
            {
                Response.Write("<script>alert('Flight Id doesnot exists !');</script>");
            }
        }
        //go
        protected void Button4_Click(object sender, EventArgs e)
        {
            getcountryByID();
        }

        void deletecountry()
        {

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE from Flights WHERE FlightID='" + TextBox1.Text.Trim() + "'", con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert(Flight Deleted Successfully');</script>");
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }
        void updateair()
        {
            try
            {
                string filepath = "~/imgs";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                if (filename == "" || filename == null)
                {
                    filepath = global_filepath;

                }
                else
                {
                    FileUpload1.SaveAs(Server.MapPath("imgs/" + filename));
                    filepath = "~/imgs/" + filename;
                }
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("UPDATE Flights SET Airline=@air,AircraftModel=@am,DepartingDate=@dd,DepartingTime=@dt,ArrivalDate=@ad,ArrivalTime=@at,FareEconomy=@fe,FareBusiness=@fb,Currency=@cur,imglink=@im WHERE FlightID='" + TextBox1.Text.Trim() + "'", con);
               
                cmd.Parameters.AddWithValue("@air", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@am", TextBox8.Text.Trim());
                cmd.Parameters.AddWithValue("@dd", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@dt", TextBox14.Text.Trim());
                cmd.Parameters.AddWithValue("@ad", TextBox13.Text.Trim());
                cmd.Parameters.AddWithValue("@at", TextBox15.Text.Trim());
                cmd.Parameters.AddWithValue("@fe", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@fb", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@cur", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@im", filepath);
                cmd.ExecuteNonQuery();
               
                con.Close();
                Response.Write("<script>alert('Flight Updated Successfully');</script>");

                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void addnewcountry()
        {
            try
            {
                string filepath = "~/imgs/dt.png";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("imgs/" + filename));
                filepath = "~/imgs/" + filename;
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }

                SqlCommand cmd = new SqlCommand("INSERT INTO Flights (RouteID,Airline,AircraftModel,DepartingDate,DepartingTime,ArrivalDate,ArrivalTime,FareEconomy,FareBusiness,Currency,imglink)  values (@rid,@air,@am,@dd,@dt,@ad,@at,@fe,@fb,@cur,@im)", con);
                cmd.Parameters.AddWithValue("@rid", TextBox12.Text.Trim());
                cmd.Parameters.AddWithValue("@air", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@am", TextBox8.Text.Trim());
                cmd.Parameters.AddWithValue("@dd", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@dt", TextBox14.Text.Trim());
                cmd.Parameters.AddWithValue("@ad", TextBox13.Text.Trim());
                cmd.Parameters.AddWithValue("@at", TextBox15.Text.Trim());
                cmd.Parameters.AddWithValue("@fe", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@fb", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@cur", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@im", filepath);


                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Flight added succesfully');</script>");
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        bool checkmemberexistspart()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }

                SqlCommand cmd = new SqlCommand("Select * from Flights where FlightID = '" + TextBox1.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
                con.Close();
                Response.Write("<script>alert('Flight added successfully');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }



        }
        bool checkmemberexists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }

                SqlCommand cmd = new SqlCommand("Select * from Flights where FlightID= '" + TextBox1.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
                con.Close();
                Response.Write("<script>alert('Flight Added successfully');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }



        }
        void getcountryByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("Select * from Flights where FlightID= '" + TextBox1.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    TextBox2.Text = dt.Rows[0][2].ToString();
                    TextBox8.Text = dt.Rows[0][3].ToString();
                    TextBox12.Text = dt.Rows[0][1].ToString();
                    TextBox3.Text = dt.Rows[0][4].ToString();
                    TextBox13.Text = dt.Rows[0][6].ToString();
                    TextBox14.Text = dt.Rows[0][5].ToString();
                    TextBox15.Text = dt.Rows[0][7].ToString();
                    TextBox4.Text = dt.Rows[0][8].ToString();
                    TextBox5.Text = dt.Rows[0][9].ToString();
                    TextBox7.Text = dt.Rows[0][10].ToString();


                }
                else
                {
                    Response.Write("<script>alert('Invalid Flight Id');</script>");
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }


    }
}