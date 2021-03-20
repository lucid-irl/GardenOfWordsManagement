using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"] is null)
                {
                    LinkButton1.Visible = true;  // user login
                    LinkButton2.Visible = true;  // user sign up

                    LinkButton3.Visible = false;  // log out
                    LinkButton7.Visible = false;  // hello

                    LinkButton6.Visible = true;  // admin login
                    LinkButton11.Visible = false;  // author manager
                    LinkButton12.Visible = false;  // publisher manager
                    LinkButton8.Visible = false;  // book invent
                    LinkButton5.Visible = false;  // order manager
                    LinkButton10.Visible = false;  // member manager
                }
                
                else if (Session["role"].Equals("user"))
                {
                    LinkButton1.Visible = false;  // user login
                    LinkButton2.Visible = false;  // user sign up

                    LinkButton3.Visible = true;  // log out
                    LinkButton7.Visible = true;  // hello
                    LinkButton7.Text = "Xin chào " + Session["username"].ToString();

                    LinkButton6.Visible = true;  // admin login
                    LinkButton11.Visible = false;  // author manager
                    LinkButton12.Visible = false;  // publisher manager
                    LinkButton8.Visible = false;  // book invent
                    LinkButton5.Visible = false;  // order manager
                    LinkButton10.Visible = false;  // member manager
                }

                else if (Session["role"].Equals("admin"))
                {
                    LinkButton1.Visible = false;  // user login
                    LinkButton2.Visible = false;  // user sign up

                    LinkButton3.Visible = true;  // log out
                    LinkButton7.Visible = true;  // hello
                    LinkButton7.Text = "Xin chào Admin " + Session["username"].ToString();

                    LinkButton6.Visible = false;  // admin login
                    LinkButton11.Visible = true;  // author manager
                    LinkButton12.Visible = true;  // publisher manager
                    LinkButton8.Visible = true;  // book invent
                    LinkButton5.Visible = true;  // order manager
                    LinkButton10.Visible = true;  // member manager
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

        protected void LinkButton11_Click(object sender, EventArgs e)
        {
            Response.Redirect("authormanager.aspx");
        }

        protected void LinkButton12_Click(object sender, EventArgs e)
        {
            Response.Redirect("publishermanager.aspx");
        }

        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            Response.Redirect("bookinventory.aspx");
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("ordermanager.aspx");
        }

        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            Response.Redirect("membermanager.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewbook.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("userlogin.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("usersignup.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Session["username"] = null;
            Session["fullname"] = null;
            Session["role"] = null;
            Session["status"] = null;

            LinkButton1.Visible = true;  // user login
            LinkButton2.Visible = true;  // user sign up

            LinkButton3.Visible = false;  // log out
            LinkButton7.Visible = false;  // hello

            LinkButton6.Visible = true;  // admin login
            LinkButton11.Visible = false;  // author manager
            LinkButton12.Visible = false;  // publisher manager
            LinkButton8.Visible = false;  // book invent
            LinkButton5.Visible = false;  // order manager
            LinkButton10.Visible = false;  // member manager
            Response.Redirect("homepage.aspx");
        }
    }
}