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
            if (Session["username"] is null)
            {
                //Response.Write("<script>alert('Bạn chưa đăng nhập!');</script>");
                Response.Redirect("userlogin.aspx");
            }
        }

        protected void LinkButton13_Click(object sender, EventArgs e)
        {
            
            try
            {
                LinkButton bnt = (LinkButton)sender;
                GridViewRow gvr = (GridViewRow)bnt.NamingContainer;
                String book_id = (String)gvr.Cells[0].Text;
                String cart_id = (String)Session["cart_id"];
                if (check_book_exist(book_id, cart_id))
                {
                    update_book_exist(book_id, cart_id);
                } else
                {
                    addBookToCartItem(book_id);
                    Response.Write("<script>alert('Đã thêm sách có ID:" + book_id + "'vào giỏ hàng!');</script>");
                }
                    
                //addBookToCartItem(book_id);

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            
            
        }
        bool check_book_exist(String book_id, String cart_id)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("Select * from cart_items_tbl where book_id =" + book_id + " and cart_id=" + cart_id, con);

                SqlDataReader dr = cmd.ExecuteReader();
                bool res = dr.HasRows;
                con.Close();
                return res;

            } catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            return false;
        }
        protected void update_book_exist(String book_id, String cart_id)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("Select * from cart_items_tbl where book_id =" + book_id + " and cart_id=" + cart_id, con);

                SqlDataReader dr = cmd.ExecuteReader();
                int nq = 0;
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        nq = int.Parse((String)dr["quantity"]) + 1;
                    }
                    dr.Close();
                    SqlCommand command = new SqlCommand("Update cart_items_tbl set quantity =" + nq + "where book_id = " + book_id + " and cart_id=" + cart_id, con);
                    command.ExecuteNonQuery();
                    Response.Write("<script>alert('Đã thêm sách vào giỏ hàng thành công');</script>");
                }
                else
                {
                    Response.Write("<script>alert('Không tìm thấy sách');</script>");
                }
                con.Close();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            //Response.Write("<script>alert('Click');</script>");
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