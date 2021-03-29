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
    public partial class bookinvent : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string global_filepath;
        static int global_actual_stock, global_current_stock, global_issued_books;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillAuthorPublisherValues();
            }
            
            GridView1.DataBind();
        }

        // tìm sách
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            getBookByID();
        }
        // thêm
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (checkBookExits())
            {
                Response.Write("<script>alert('Tên sách hoặc ID sách đã tồn tại!');</script>");
            }
            else
            {
                addNewBook();
            }
        }
        // sửa
        protected void Button1_Click(object sender, EventArgs e)
        {
            updateBookByID();
        }
        // xóa
        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        //my module

        // xóa sách
        void deleteBookByID()
        {
            if (checkBookExits())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE from book_master_tbl WHERE book_id='" + TextBox7.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Xóa sách thành công');</script>");

                    GridView1.DataBind();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Invalid Member ID');</script>");
            }
        }

        // kiểm tra sách tồn tại chưa
        bool checkBookExits()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from book_master_tbl where book_id='" + TextBox7.Text.Trim() + "' OR book_name='" + TextBox8.Text.Trim() + "';", con);
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

        // tìm sách theo ID
        void getBookByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from book_master_tbl WHERE book_id='" + TextBox7.Text.Trim() + "';", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if(dt.Rows.Count >= 1)
                {
                    TextBox8.Text = dt.Rows[0]["book_name"].ToString();
                    TextBox4.Text = dt.Rows[0]["publisher_date"].ToString();
                    TextBox3.Text = dt.Rows[0]["edition"].ToString();
                    TextBox6.Text = dt.Rows[0]["cost"].ToString().Trim();
                    TextBox9.Text = dt.Rows[0]["pages"].ToString().Trim();
                    TextBox1.Text = dt.Rows[0]["actual_stock"].ToString().Trim();
                    TextBox2.Text = dt.Rows[0]["current_stock"].ToString().Trim();
                    
                    TextBox5.Text = "" + (Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString()) - Convert.ToInt32(dt.Rows[0]["current_stock"].ToString()));
                    
                    TextBox10.Text = dt.Rows[0]["book_description"].ToString();

                    DropDownList1.SelectedValue = dt.Rows[0]["language"].ToString().Trim();
                    DropDownList2.SelectedValue = dt.Rows[0]["publisher_name"].ToString().Trim();
                    DropDownList3.SelectedValue = dt.Rows[0]["author_name"].ToString().Trim();

                    ListBox1.ClearSelection();
                    string[] genre = dt.Rows[0]["genre"].ToString().Trim().Split(',');
                    for (int i = 0; i < genre.Length; i++)
                    {
                        for (int j = 0; j < ListBox1.Items.Count; j++)
                        {
                            if (ListBox1.Items[j].ToString() == genre[i])
                            {
                                ListBox1.Items[j].Selected = true;
                            }

                        }
                    }

                    global_actual_stock = Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString().Trim());
                    global_current_stock = Convert.ToInt32(dt.Rows[0]["current_stock"].ToString().Trim());
                    global_issued_books = global_actual_stock - global_current_stock;
                    global_filepath = dt.Rows[0]["book_img_link"].ToString();

                }
                else
                {
                    Response.Write("<script>alert('Mã sách không tồn tại!');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        // update
        void updateBookByID()
        {
            if (checkBookExits())
            {
                try
                {
                    int actual_stock = Convert.ToInt32(TextBox1.Text.Trim());
                    int current_stock = Convert.ToInt32(TextBox2.Text.Trim());

                    if (global_actual_stock == actual_stock)
                    {

                    }
                    else
                    {
                        if (actual_stock < global_issued_books)
                        {
                            Response.Write("<script>alert('Sách đã nhập kho không thể bé hơn sách đã bán');</script>");
                            return;


                        }
                        else
                        {
                            current_stock = actual_stock - global_issued_books;
                            TextBox2.Text = "" + current_stock;
                        }
                    }


                    // genre
                    string genres = "";
                    foreach (int i in ListBox1.GetSelectedIndices())
                    {
                        genres = genres + ListBox1.Items[i] + ",";
                    }
                    genres = genres.Remove(genres.Length - 1);

                    // img
                    string filepath = "~/imgs/bookstore/018-books.png";
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    if (filename == "" || filename == null)
                    {
                        filepath = global_filepath;

                    }
                    else
                    {
                        FileUpload1.SaveAs(Server.MapPath("book_inventory/" + filename));
                        filepath = "~/book_inventory/" + filename;
                    }

                    //update
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("UPDATE book_master_tbl SET book_name=@book_name,genre=@genre,author_name=@author_name,publisher_name=@publisher_name,publisher_date=@publisher_date,language=@language,edition=@edition,cost=@cost,pages=@pages,book_description=@book_description,actual_stock=@actual_stock,current_stock=@current_stock,book_img_link=@book_img_link WHERE book_id='" + TextBox7.Text.Trim() + "'", con);


                    cmd.Parameters.AddWithValue("@book_name", TextBox8.Text.Trim());
                    cmd.Parameters.AddWithValue("@genre", genres);

                    cmd.Parameters.AddWithValue("@author_name", DropDownList3.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@publisher_name", DropDownList2.SelectedItem.Value);


                    cmd.Parameters.AddWithValue("@publisher_date", TextBox4.Text.Trim());
                    cmd.Parameters.AddWithValue("@language", DropDownList1.SelectedItem.Value);

                    cmd.Parameters.AddWithValue("@edition", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@cost", TextBox6.Text.Trim());
                    cmd.Parameters.AddWithValue("@pages", TextBox9.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_description", TextBox10.Text.Trim());
                    cmd.Parameters.AddWithValue("@actual_stock", actual_stock.ToString());
                    cmd.Parameters.AddWithValue("@current_stock", current_stock.ToString());
                    cmd.Parameters.AddWithValue("@book_img_link", filepath);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView1.DataBind();
                    
                    Response.Write("<script>alert('Đã cập nhật thông tin sách!');</script>");

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Sách không tồn tại!');</script>");
            }
        }

        // điền tác giả và nph từ 2 table kia
        void fillAuthorPublisherValues()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT author_name from author_master_tbl;", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                DropDownList3.DataSource = dt;
                DropDownList3.DataValueField = "author_name";
                DropDownList3.DataBind();

                cmd = new SqlCommand("SELECT publisher_name from publisher_master_tbl;", con);

                SqlDataAdapter da2 = new SqlDataAdapter(cmd);
                DataTable dt2 = new DataTable();
                da2.Fill(dt2);
                DropDownList2.DataSource = dt2;
                DropDownList2.DataValueField = "publisher_name";
                DropDownList2.DataBind();

            }
            catch(Exception ex)
            {

            }
        }

        void addNewBook()
        {
            try
            {

                string genres = "";
                foreach (int i in ListBox1.GetSelectedIndices())
                {
                    genres = genres + ListBox1.Items[i] + ",";
                }
                genres = genres.Remove(genres.Length - 1);

                string filepath = "~/imgs/bookstore/018-books.png";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("book_inventory/" + filename));
                filepath = "~/book_inventory/" + filename;

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO book_master_tbl (book_id,book_name,genre,author_name,publisher_name,publisher_date,language,edition,cost,pages,book_description,actual_stock,current_stock,book_img_link) values (@book_id,@book_name,@genre,@author_name,@publisher_name,@publisher_date,@language,@edition,@cost,@pages,@book_description,@actual_stock,@current_stock,@book_img_link)", con);

                cmd.Parameters.AddWithValue("@book_id", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@book_name", TextBox8.Text.Trim());

                cmd.Parameters.AddWithValue("@genre", genres);

                cmd.Parameters.AddWithValue("@author_name", DropDownList3.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publisher_name", DropDownList2.SelectedItem.Value);

                
                cmd.Parameters.AddWithValue("@publisher_date", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@language", DropDownList1.SelectedItem.Value);

                cmd.Parameters.AddWithValue("@edition", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@cost", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@pages", TextBox9.Text.Trim());
                cmd.Parameters.AddWithValue("@book_description", TextBox10.Text.Trim());
                cmd.Parameters.AddWithValue("@actual_stock", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@current_stock", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@book_img_link", filepath);

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