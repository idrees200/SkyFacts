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
    public partial class routesmangement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }
        //add
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (checkmemberexists())
            {
                Response.Write("<script>alert('Route already exists ! You cannot add another Route with same id.');</script>");
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
                Response.Write("<script>alert('Route doesnot exists !');</script>");
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
                Response.Write("<script>alert('Route doesnot exists !');</script>");
            }
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

                SqlCommand cmd = new SqlCommand("DELETE from Routes WHERE RouteID='" + TextBox1.Text.Trim() + "'", con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Route Deleted Successfully');</script>");
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
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("UPDATE Routes SET From_City=@fc,From_Country=@fcc,To_City=@tc, To_Country=@tcc, DepartureAirport=@da,ArrivalAirport=@aa,NumberOfStops=@nos,FirstStopCity=@fsc,FirstStopCountry=@fscc,SecondStopCity=@ssc,SecondStopCountry=@sscc,ThirdStopCity=@tsc,ThirdStopCountry=@tscc WHERE RouteID='" + TextBox1.Text.Trim() + "'", con);

                cmd.Parameters.AddWithValue("@fc", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@fcc", TextBox8.Text.Trim());
                cmd.Parameters.AddWithValue("@tc", TextBox13.Text.Trim());
                cmd.Parameters.AddWithValue("@tcc", TextBox12.Text.Trim());
                cmd.Parameters.AddWithValue("@da", TextBox11.Text.Trim());
                cmd.Parameters.AddWithValue("@aa", TextBox14.Text.Trim());
                cmd.Parameters.AddWithValue("@nos", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@fsc", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@fscc", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@ssc", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@sscc", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@tsc", TextBox9.Text.Trim());
                cmd.Parameters.AddWithValue("@tscc", TextBox10.Text.Trim());


                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Route Updated Successfully');</script>");

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
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }

                SqlCommand cmd = new SqlCommand("INSERT INTO Routes ( From_City,From_Country,To_City, To_Country, DepartureAirport,ArrivalAirport,NumberOfStops,FirstStopCity,FirstStopCountry,SecondStopCity,SecondStopCountry,ThirdStopCity,ThirdStopCountry)  values (@fc,@fcc,@tc,@tcc,@da,@aa,@nos,@fsc,@fscc,@ssc,@sscc,@tsc,@tscc)", con);

                cmd.Parameters.AddWithValue("@fc", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@fcc", TextBox8.Text.Trim());
                cmd.Parameters.AddWithValue("@tc", TextBox13.Text.Trim());
                cmd.Parameters.AddWithValue("@tcc", TextBox12.Text.Trim());
                cmd.Parameters.AddWithValue("@da", TextBox11.Text.Trim());
                cmd.Parameters.AddWithValue("@aa", TextBox14.Text.Trim());
                cmd.Parameters.AddWithValue("@nos", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@fsc", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@fscc", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@ssc", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@sscc", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@tsc", TextBox9.Text.Trim());
                cmd.Parameters.AddWithValue("@tscc", TextBox10.Text.Trim());




                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Route added succesfully');</script>");
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

                SqlCommand cmd = new SqlCommand("Select * from Routes where RouteID = '" + TextBox1.Text.Trim() + "'", con);
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
                Response.Write("<script>alert('Route added successfully');</script>");

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

                SqlCommand cmd = new SqlCommand("Select * from Routes where RouteID= '" + TextBox1.Text.Trim() + "'", con);
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
                Response.Write("<script>alert('Airlines Office Added successfully');</script>");

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

                SqlCommand cmd = new SqlCommand("Select * from Routes where RouteID = '" + TextBox1.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    TextBox2.Text = dt.Rows[0][7].ToString();
                    TextBox8.Text = dt.Rows[0][2].ToString();
                    TextBox12.Text = dt.Rows[0][4].ToString();
                    TextBox3.Text = dt.Rows[0][1].ToString();
                    TextBox13.Text = dt.Rows[0][3].ToString();
                    TextBox11.Text = dt.Rows[0][5].ToString();
                    TextBox14.Text = dt.Rows[0][6].ToString();
                    TextBox4.Text = dt.Rows[0][8].ToString();
                    TextBox5.Text = dt.Rows[0][9].ToString();
                    TextBox6.Text = dt.Rows[0][10].ToString();
                    TextBox7.Text = dt.Rows[0][11].ToString();
                    TextBox9.Text = dt.Rows[0][12].ToString();
                    TextBox10.Text = dt.Rows[0][13].ToString();


                }
                else
                {
                    Response.Write("<script>alert('Invalid Route');</script>");
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            getcountryByID();
        }
    }
}