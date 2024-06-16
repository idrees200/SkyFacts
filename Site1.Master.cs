using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace skyfacts
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"]=="user")
                {//adminlinks
                    LinkButton6.Visible = true;
                    LinkButton15.Visible = false;
                    LinkButton12.Visible = false;
                    LinkButton11.Visible = false;
                    LinkButton16.Visible = false;
                    LinkButton14.Visible = false;
                    LinkButton9.Visible = false;
                    LinkButton5.Visible = false;
                    LinkButton8.Visible = false;
                    LinkButton10.Visible = false;
                    LinkButton18.Visible = false;

                    //userlinks
                    LinkButton1.Visible = false;
                    LinkButton2.Visible = false;

                    LinkButton4.Visible = true;
                    LinkButton17.Visible = true;

                    LinkButton13.Visible = true;
                    LinkButton3.Visible = true;
                    LinkButton7.Visible = true;
                    LinkButton7.Text = "Hello " + Session["firstname"].ToString();

                }
                else if (Session["role"]=="admin")
                {//adminlinks
                    LinkButton6.Visible = false;
                    LinkButton15.Visible = true;
                    LinkButton12.Visible = true;
                    LinkButton11.Visible = true;
                    LinkButton16.Visible = true;
                    LinkButton14.Visible = true;
                    LinkButton9.Visible = true;
                    LinkButton5.Visible = true;
                    LinkButton8.Visible = true;
                    LinkButton10.Visible = true;
                    LinkButton18.Visible = true;

                    //userlinks
                    LinkButton1.Visible = true;
                    LinkButton2.Visible = true;

                    LinkButton4.Visible = false;
                    LinkButton17.Visible = false;

                    LinkButton13.Visible = false;
                    LinkButton3.Visible = true;
                    LinkButton7.Visible = true;
                    LinkButton7.Text = "Hello Admin";

                }
                else
                {
                    LinkButton1.Visible = true;
                    LinkButton2.Visible = true;

                    LinkButton4.Visible = false;
                    LinkButton17.Visible =false;

                    LinkButton13.Visible = false;
                    LinkButton3.Visible = false;
                    LinkButton7.Visible = false;


                    //adminlinks
                    LinkButton6.Visible = true;
                    LinkButton15.Visible = false;
                    LinkButton12.Visible = false;
                    LinkButton18.Visible = false;
                    LinkButton11.Visible = false;
                    LinkButton16.Visible = false;
                    LinkButton14.Visible = false;
                    LinkButton9.Visible = false;
                    LinkButton5.Visible = false;
                    LinkButton8.Visible = false;
                    LinkButton10.Visible = false;
                } 
                

            }
            catch(Exception ex) 
            { 
            
            }


        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminlogin.aspx");
        }

        protected void LinkButton15_Click(object sender, EventArgs e)
        {
            Response.Redirect("countries.aspx");
        }

        protected void LinkButton12_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewAirlines.aspx");

        }

        protected void LinkButton11_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewAircrafts.aspx");
        }

        protected void LinkButton16_Click(object sender, EventArgs e)
        {
            Response.Redirect("routesmangement.aspx");
        }

        protected void LinkButton14_Click(object sender, EventArgs e)
        {
            Response.Redirect("flights.aspx");
        }

        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            Response.Redirect("flightratings.aspx");
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("airlineoffices.aspx");
        }

        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            Response.Redirect("Useradminbookings.aspx");
        }

        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminmember.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("flightsavailiable.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("userlogin.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("usersignup.aspx");
        }
        protected void LinkButton17_Click(object sender, EventArgs e)
        {
            Response.Redirect("userprofile.aspx");
        }

        protected void LinkButton13_Click(object sender, EventArgs e)
        {
            Response.Redirect("Deals.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            
            Session["username"] = "";
            Session["firstname"] = "";
            Session["lastname"] = "";
            Session["role"] = "";
            Session["status"] = "";

            LinkButton1.Visible = true;
            LinkButton2.Visible = true;

            LinkButton4.Visible = false;
            LinkButton17.Visible = false;

            LinkButton13.Visible = false;
            LinkButton3.Visible = false;
            LinkButton7.Visible = false;


            //adminlinks
            LinkButton6.Visible = true;
            LinkButton15.Visible = false;
            LinkButton18.Visible = false;
            LinkButton12.Visible = false;
            LinkButton11.Visible = false;
            LinkButton16.Visible = false;
            LinkButton14.Visible = false;
            LinkButton9.Visible = false;
            LinkButton5.Visible = false;
            LinkButton8.Visible = false;
            LinkButton10.Visible = false;
            Response.Redirect("homepage.aspx");
        }

        protected void LinkButton18_Click(object sender, EventArgs e)
        {
            Response.Redirect("airports.aspx");

        }
    }
}