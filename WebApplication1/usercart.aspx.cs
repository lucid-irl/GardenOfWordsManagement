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
    public partial class usercart : System.Web.UI.Page
    {
        String strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillAuthorPublisherValues();
            }
            String cart_id = (String) Session["cart_id"];
            String strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT book_id from cart_items_tbl where cart_id = " + cart_id, con);

                SqlDataReader dr = cmd.ExecuteReader();
                List<String> books = new List<string>();
                while (dr.Read())
                {
                    books.Add((String) dr["book_id"]);
                }
                dr.Close();
                DataTable data = new DataTable();
                data.Columns.Add("ID");
                data.Columns.Add("Tên sách");
                data.Columns.Add("Tác giả");
                data.Columns.Add("Nhà phát hành");
                data.Columns.Add("Số lượng");
                data.Columns.Add("Giá");

                int total = 0;

                foreach(String book_id in books)
                {
                    cmd = new SqlCommand("SELECT book_id, book_name, author_name, publisher_name, cost from book_master_tbl where book_id = " + book_id, con);
                    SqlDataReader ndr = cmd.ExecuteReader();
                    var row = data.NewRow();
                    while (ndr.Read())
                    {
                        row["ID"] = (String)ndr["book_id"];
                        row["Tên sách"] = (String)ndr["book_name"];
                        row["Tác giả"] = (String)ndr["author_name"];
                        row["Nhà phát hành"] = (String)ndr["publisher_name"];
                        row["Số lượng"] = "1";
                        row["Giá"] = (String)ndr["cost"];
                        total += int.Parse((String) row["Giá"]);
                        data.Rows.Add(row);
                    }
                    ndr.Close();
                }
                con.Close();
                GridView1.DataSource = data;
                GridView1.DataBind();
                Label1.Text = total.ToString() + "VND";
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        // find book
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            getBookByID();
        }

        // update cart
        protected void Button1_Click(object sender, EventArgs e)
        {
            updateBookByID();
        }
        // delete cart
        protected void Button2_Click(object sender, EventArgs e)
        {

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

                

                if (dt.Rows.Count >= 1)
                {
                    SqlCommand ncmd = new SqlCommand("Select quantity from cart_items_tbl where book_id='" + TextBox7.Text.Trim() + "'; ", con);
                    SqlDataAdapter nda = new SqlDataAdapter(ncmd);
                    DataTable ndt = new DataTable();
                    nda.Fill(ndt);
                    TextBox1.Text = ndt.Rows[0]["quantity"].ToString();

                    TextBox8.Text = dt.Rows[0]["book_name"].ToString();
                    TextBox4.Text = dt.Rows[0]["publisher_date"].ToString();
                    TextBox3.Text = dt.Rows[0]["edition"].ToString();
                    TextBox6.Text = dt.Rows[0]["cost"].ToString().Trim();
                    TextBox9.Text = dt.Rows[0]["pages"].ToString().Trim();
                    

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

                }
                else
                {
                    Response.Write("<script>alert('Sách không tồn tại trong giỏ hàng!');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
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
            catch (Exception ex)
            {

            }
        }

        // update
        void updateBookByID()
        {
            String cart_id = (String)Session["cart_id"];
            if (checkBookExits())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("Select * from cart_items_tbl where book_id='" + TextBox7.Text.Trim() + "'; ", con);

                    SqlDataReader dr = cmd.ExecuteReader();
                    int nq = 0;
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            nq = int.Parse((String)dr["quantity"]) + int.Parse(TextBox1.Text);
                        }
                        dr.Close();
                        SqlCommand command = new SqlCommand("Update cart_items_tbl set quantity =" + nq + "where book_id = " + TextBox7.Text.Trim() + " and cart_id=" + cart_id, con);
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
            }
            else
            {
                Response.Write("<script>alert('Sách không tồn tại!');</script>");
            }
        }
    }
}