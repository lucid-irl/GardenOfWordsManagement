using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication1
{
    public partial class usersignup : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // sign up button click event
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (checkMemberExist())
            {
                Response.Write("<script>alert('Tên đăng nhập đã tồn tại!');</script>");
                

            }

            else
            {
                signUpNewMember();
            }

        }

        bool checkPassword()
        {
            return TextBox8.Text.Equals(TextBox9.Text);
        }



        // kiểm tra tên đăng nhập có tồn tại chưa
        bool checkMemberExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from member_master_tbl where member_id='"+TextBox7.Text.Trim()+"'", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);

                DataTable dt = new DataTable();

                da.Fill(dt);

                if(dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }

                con.Close();
                Response.Write("<script>alert('Đăng kí thành công! Vào lại trang login để đăng nhập!');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }


        // đăng kí thành viên mới
        void signUpNewMember()
        {
            //Response.Write("<script>alert('Testing');</script>");
            // Generate a random number  
            Random random = new Random();
            // Any random integer   
            int num = random.Next(10000);
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                
                    
                SqlCommand cmd = new SqlCommand("INSERT INTO member_master_tbl (full_name,dob,phone,email,city,state,sex,address,member_id,password,account_status,cart_id) values (@full_name,@dob,@phone,@email,@city,@state,@sex,@address,@member_id,@password,@account_status,@cart_id)", con);
                cmd.Parameters.AddWithValue("@full_name", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@phone", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@email", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@city", DropDownList2.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@state", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@sex", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@address", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@member_id", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@password", TextBox8.Text.Trim());
                cmd.Parameters.AddWithValue("@account_status", "pending");
                cmd.Parameters.AddWithValue("@cart_id", num);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Đăng kí thành công! Vào lại trang login để đăng nhập!');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //void addUserToCart()
        //{
        //    try
        //    {
        //        SqlConnection con = new SqlConnection(strcon);
        //        if (con.State == ConnectionState.Closed)
        //        {
        //            con.Open();
        //        }


        //        SqlCommand cmd = new SqlCommand("INSERT INTO cart_tbl (cart_id, member_id) values (@cart_id, @member_id)", con);
        //        cmd.Parameters.AddWithValue("@cart_id", TextBox1.Text.Trim());
                
        //        cmd.Parameters.AddWithValue("@member_id", TextBox7.Text.Trim());
                
        //        cmd.Parameters.AddWithValue("@cart_id", num);

        //        cmd.ExecuteNonQuery();
        //        con.Close();
                

        //    }
        //    catch (Exception ex)
        //    {
        //        Response.Write("<script>alert('" + ex.Message + "');</script>");
        //    }
        //}

    }
}