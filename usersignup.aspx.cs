using System;
using System.Collections.Generic;
using System.Linq;
using System.Configuration;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace skyfacts
{
    public partial class usersignup : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (checkmemberexists())
            {
                Response.Write("<script>alert('User Already Exist with this UserName, try other UserName');</script>");
            }
            else
            {
                signupnewuser();
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

                SqlCommand cmd = new SqlCommand("Select * from Users where Username = '"+TextBox8.Text.Trim()+"'", con);
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
                Response.Write("<script>alert('Sign Up Successful. Go to User Login to Login');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }


            
        }

        void signupnewuser()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                SqlCommand cmdl = new SqlCommand("CREATE PROCEDURE InsertUser    @Username nvarchar(20),    @Password nvarchar(50),    @FirstName nvarchar(50),    @LastName nvarchar(50),    @Age nvarchar(25),    @Gender nvarchar(50),    @Nationality nvarchar(25),    @PermAddress nvarchar(50), @Email nvarchar(25),    @PhoneNum nvarchar(25),    @SkyFactMembership nvarchar(50),    @VIPExclusive nvarchar(50) AS BEGIN     SET NOCOUNT ON;                INSERT INTO Users(Username, Password, FirstName, LastName, Age, Gender, Nationality, PermAddress, Email, PhoneNum, SkyFactMembership, VIPExclusive)    VALUES(@Username, @Password, @FirstName, @LastName, @Age, @Gender, @Nationality, @PermAddress, @Email, @PhoneNum, @SkyFactMembership, @VIPExclusive);                 END", con);
                SqlCommand cmd = new SqlCommand("INSERT INTO Users (Username,Password,FirstName,LastName,Age,Gender,Nationality,PermAddress,Email,PhoneNum,SkyFactMembership,VIPExclusive)  values (@Username,@Password,@FirstName,@LastName,@Age,@Gender,@Nationality,@PremAddress,@Email,@PhoneNu,@SkyFactMembership,@VIPExclusive)", con);

                cmd.Parameters.AddWithValue("@Username", TextBox8.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", TextBox9.Text.Trim());
                cmd.Parameters.AddWithValue("@FirstName", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@LastName", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@Age", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@Gender", DropDownList2.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Nationality", DropDownList3.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@PremAddress", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@PhoneNu", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@SkyFactMembership", DropDownList4.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@VIPExclusive", DropDownList1.SelectedItem.Value);





                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Sign Up Successful. Go to User Login to Login');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}