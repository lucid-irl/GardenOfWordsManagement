using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class membermanager : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }
        // search
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            getMemberByID();
        }
        // active
        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            updateMemberStatusByID("active");
        }
        // pending
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            updateMemberStatusByID("pending");
        }
        // deactive
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            updateMemberStatusByID("deactive");
        }
        // delete member
        protected void Button4_Click(object sender, EventArgs e)
        {
            deleteMemberByID();
        }

        void deleteMemberByID()
        {
            if (checkMemberExits())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE FROM member_master_tbl WHERE member_id='" + TextBox7.Text.Trim() + "'", con);


                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Xóa thành viên thành công!');</script>");
                    clearForm();
                    GridView1.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

                Response.Write("<script>alert('Thành viên không tồn tại!');</script>");
            }
            else
            {
                
            }
        }

        // kiểm tra tồn tại chưa
        bool checkMemberExits()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from member_master_tbl where member_id='" + TextBox7.Text.Trim() + "'", con);

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

        // find member
        void getMemberByID()
        {
            if (TextBox7.Text.Trim().Equals(""))
            {
                Response.Write("<script>alert('ID Thành viên không được để trống!');</script>");
            }
            else
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("SELECT * from member_master_tbl where member_id='" + TextBox7.Text.Trim() + "'", con);

                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            TextBox8.Text = dr.GetValue(0).ToString();
                            TextBox4.Text = dr.GetValue(10).ToString();
                            TextBox2.Text = dr.GetValue(1).ToString();
                            TextBox5.Text = dr.GetValue(2).ToString();
                            TextBox1.Text = dr.GetValue(3).ToString();
                            TextBox3.Text = dr.GetValue(4).ToString();
                            TextBox6.Text = dr.GetValue(5).ToString();
                            TextBox9.Text = dr.GetValue(6).ToString();
                            TextBox10.Text = dr.GetValue(7).ToString();

                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Chưa có thành viên này trong hệ thống!');</script>");
                    }

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            
        }

        void updateMemberStatusByID(string status)
        {
            if (checkMemberExits())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("UPDATE member_master_tbl SET account_status='" + status + "' WHERE member_id='" + TextBox7.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView1.DataBind();
                    getMemberByID();
                    Response.Write("<script>alert('Đã cập nhật trạng thái thành viên!');</script>");

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Thành viên không tồn tại!');</script>");
            }
            
        }

        void clearForm()
        {
            TextBox1.Text = null;
            TextBox8.Text = null;
            TextBox4.Text = null;
            TextBox2.Text = null;
            TextBox5.Text = null;
            TextBox1.Text = null;
            TextBox3.Text = null;
            TextBox6.Text = null;
            TextBox9.Text = null;
            TextBox10.Text = null;
        }
    }
}