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
        protected void Page_Load(object sender, EventArgs e)
        {
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
                data.Columns.Add("Tên sách");
                
                data.Columns.Add("Số lượng");
                data.Columns.Add("Giá");
                int total = 0;
                foreach(String book_id in books)
                {
                    cmd = new SqlCommand("SELECT book_name, cost from book_master_tbl where book_id = " + book_id, con);
                    SqlDataReader ndr = cmd.ExecuteReader();
                    var row = data.NewRow();
                    while (ndr.Read())
                    {
                        row["Tên sách"] = (String)ndr["book_name"];
                        
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
                Label1.Text = "Tổng tiền: " + total.ToString();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }
        
    }
}