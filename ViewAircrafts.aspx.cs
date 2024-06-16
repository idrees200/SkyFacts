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
    public partial class ViewAircrafts : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }
        //add
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (checkmemberexists())
            {
                Response.Write("<script>alert('AirCraft already exists ! You cannot add another Airport with same name.');</script>");
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
                Response.Write("<script>alert('Aircraft doesnot exists !');</script>");
            }
        }
        //del
        protected void Button4_Click(object sender, EventArgs e)
        {

            if (checkmemberexists())
            {
                deletecountry();
            }
            else
            {
                Response.Write("<script>alert('Aircraft doesnot exists !');</script>");
            }
        }
        //go
        protected void Button1_Click(object sender, EventArgs e)
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

                SqlCommand cmd = new SqlCommand("DELETE from AircraftModels WHERE AM_ID='" + TextBox1.Text.Trim() + "'", con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Aircraft Deleted Successfully');</script>");
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

                SqlCommand cmd = new SqlCommand("UPDATE AircraftModels SET Model=@model,Manufacturer=@mani,ManufacturedDate=@md,Capacity=@capac,HousesBusiness=@hb WHERE AM_ID='" + TextBox1.Text.Trim() + "'", con);

                cmd.Parameters.AddWithValue("@model", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@mani", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@md", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@capac", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@hb", DropDownList1.SelectedItem.Value);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Aircraft Successfully');</script>");

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

                SqlCommand cmd = new SqlCommand("INSERT INTO AircraftModels ( Model,Manufacturer,ManufacturedDate,Capacity,HousesBusiness)  values ( @model,@mani,@md,@capac,@hb )", con);

                cmd.Parameters.AddWithValue("@model", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@mani", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@md", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@capac", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@hb", DropDownList1.SelectedItem.Value);





                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('AirCraft added succesfully');</script>");
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

                SqlCommand cmd = new SqlCommand("Select * from AircraftModels where AM_ID = '" + TextBox1.Text.Trim() + "'", con);
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
                Response.Write("<script>alert('AirCraft added successfully');</script>");

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

                SqlCommand cmd = new SqlCommand("Select * from AircraftModels where Model = '" + TextBox2.Text.Trim() + "'", con);
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
                Response.Write("<script>alert('Aircraft Added successfully');</script>");

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

                SqlCommand cmd = new SqlCommand("Select * from AircraftModels where AM_ID = '" + TextBox1.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    TextBox2.Text = dt.Rows[0][1].ToString();
                    TextBox6.Text = dt.Rows[0][2].ToString();
                    TextBox3.Text = dt.Rows[0][3].ToString();
                    TextBox4.Text = dt.Rows[0][4].ToString();

                }
                else
                {
                    Response.Write("<script>alert('Invalid AirCraft');</script>");
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
    }

}
