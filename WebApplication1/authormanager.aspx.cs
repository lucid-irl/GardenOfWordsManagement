using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class authormanager : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        // nút tìm
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (checkAuthorExits())
            {
                getAuthorByID();
            }
            else
            {
                Response.Write("<script>alert('ID không tồn tại!');</script>");
            }
            
        }
        // nút thêm
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (checkAuthorExits())
            {
                Response.Write("<script>alert('Trùng ID tác giả! Bạn không thể thêm 2 tác giả có cùng ID!');</script>");
                //Response.Write("<script>alert('No!');</script>");
            }
            else
            {
                addNewAuthor();
            }
        }
        // nút sửa
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (checkAuthorExits())
            {
                updateAuthor();
            }
            else
            {
                Response.Write("<script>alert('ID không tồn tại!');</script>");
            }
        }
        // nút xóa
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (checkAuthorExits())
            {
                deleteAuthor();
            }
            else
            {
                Response.Write("<script>alert('ID không tồn tại!');</script>");
            }
        }
        // kiểm tra tác giả tồn tại chưa
        bool checkAuthorExits()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from author_master_tbl where author_id='" + TextBox7.Text.Trim() + "'", con);

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

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        void getAuthorByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from author_master_tbl where author_id='" + TextBox7.Text.Trim() + "'", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);

                DataTable dt = new DataTable();

                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    TextBox8.Text = dt.Rows[0][1].ToString();
                }
                else
                {
                    Response.Write("<script>alert('ID không tồn tại!');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                
            }
        }

        void deleteAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE FROM author_master_tbl WHERE author_id='" + TextBox7.Text.Trim() + "'", con);

                
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Xóa tác giả thành công!');</script>");
                clearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void updateAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("UPDATE author_master_tbl SET author_name=@author_name where author_id='" + TextBox7.Text.Trim() + "'", con);

                cmd.Parameters.AddWithValue("@author_name", TextBox8.Text.Trim());


                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Sửa tác giả thành công!');</script>");
                clearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void addNewAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO author_master_tbl (author_id,author_name) values (@author_id,@author_name)", con);
                
                cmd.Parameters.AddWithValue("@author_id", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@author_name", TextBox8.Text.Trim());
                

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Thêm tác giả thành công!');</script>");
                clearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void clearForm()
        {
            TextBox7.Text = "";
            TextBox8.Text = "";
        }
    }
}