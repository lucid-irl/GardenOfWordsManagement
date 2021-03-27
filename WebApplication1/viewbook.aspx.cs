using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace WebApplication1
{
    public partial class viewbook : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton13_Click(object sender, EventArgs e)
        {
            
            LinkButton bnt = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)bnt.NamingContainer;
            String book_id = (String) gvr.Cells[0].Text;
            //Response.Write("<script>alert('Đã thêm sách có ID:"+book_id+"'vào giỏ hàng!);</script>");
            addBookToCartItem(book_id);
        }

        void addBookToCartItem(String book_id)
        {
            try
            {

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO cart_items_tbl (cart_id, book_id, quantity) values (@cart_id, @book_id, @quantity)", con);

                cmd.Parameters.AddWithValue("@cart_id", Session["cart_id"]);
                cmd.Parameters.AddWithValue("@book_id", book_id);
                cmd.Parameters.AddWithValue("@quantity", "1");

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Thêm sách thành công!');</script>");
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
    }
}