<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="usercart.aspx.cs" Inherits="WebApplication1.usercart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">

                <div class="card">
                    <div class="card-body">


                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Tùy chỉnh đơn hàng</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img id="imgview" Height="50" src="imgs/bookstore/016-books.png" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                       
                        <div class="row">
                            
                            <div class="col-md-3">
                                <label>ID Book</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox class="form-control" ID="TextBox7" runat="server">
                                        </asp:TextBox>
                                        <asp:LinkButton class="btn btn-primary" ID="LinkButton3" 
                                        runat="server" Text="A" OnClick="LinkButton3_Click"> <i class="fas fa-search"></i></asp:LinkButton>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Tên sách</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox8" runat="server"
                                        placeholder="book name" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <label>Số lượng</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox1" runat="server"
                                        placeholder="quantity"></asp:TextBox>
                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>Language</label>
                                <div class="form-group" aria-readonly="true">
                                   <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
                                       <asp:ListItem Text="Vietnamese" Value="Vietnamese" />
                                       <asp:ListItem Text="English" Value="English" />
                                       <asp:ListItem Text="French" Value="French" />
                                       <asp:ListItem Text="German" Value="German" />
                                       <asp:ListItem Text="Japan" Value="Japan" />
                                   </asp:DropDownList>
                                </div>
                                <label>Publisher Name</label>
                                <div class="form-group">
                                   <asp:DropDownList class="form-control" ID="DropDownList2" runat="server">
                                      <asp:ListItem Text="Publisher 1" Value="Publisher 1" />
                                      <asp:ListItem Text="Publisher 2" Value="Publisher 2" />
                                   </asp:DropDownList>
                                </div>
                             </div>
                             <div class="col-md-4">
                                <label>Author Name</label>
                                <div class="form-group" aria-readonly="true">
                                   <asp:DropDownList class="form-control" ID="DropDownList3" runat="server">
                                      <asp:ListItem Text="A1" Value="A1" />
                                      <asp:ListItem Text="A2" Value="A2" />
                                   </asp:DropDownList>
                                </div>
                                <label>Publish Date</label>
                                <div class="form-group">
                                   <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Date" TextMode="Date" ReadOnly="True"></asp:TextBox>
                                </div>
                             </div>
                             <div class="col-md-4">
                                <label>Genre</label>
                                <div class="form-group" aria-readonly="true">
                                   <asp:ListBox CssClass="form-control" ID="ListBox1" runat="server" SelectionMode="Multiple" Rows="5">
                                      <asp:ListItem Text="Action" Value="Action" />
                                      <asp:ListItem Text="Adventure" Value="Adventure" />
                                      <asp:ListItem Text="Comic Book" Value="Comic Book" />
                                      <asp:ListItem Text="Self Help" Value="Self Help" />
                                      <asp:ListItem Text="Motivation" Value="Motivation" />
                                      <asp:ListItem Text="Healthy Living" Value="Healthy Living" />
                                      <asp:ListItem Text="Crime" Value="Crime" />
                                      <asp:ListItem Text="Drama" Value="Drama" />
                                      <asp:ListItem Text="Fantasy" Value="Fantasy" />
                                      <asp:ListItem Text="Horror" Value="Horror" />
                                      <asp:ListItem Text="Poetry" Value="Poetry" />
                                      <asp:ListItem Text="Romance" Value="Romance" />
                                      <asp:ListItem Text="Science Fiction" Value="Science Fiction" />
                                      <asp:ListItem Text="Suspense" Value="Suspense" />
                                      <asp:ListItem Text="Thriller" Value="Thriller" />
                                      <asp:ListItem Text="Art" Value="Art" />
                                      <asp:ListItem Text="Autobiography" Value="Autobiography" />
                                      <asp:ListItem Text="Health" Value="Health" />
                                      <asp:ListItem Text="History" Value="History" />
                                      <asp:ListItem Text="Math" Value="Math" />
                                      <asp:ListItem Text="Science" Value="Science" />
                                      <asp:ListItem Text="Travel" Value="Travel" />
                                   </asp:ListBox>
                                </div>
                             </div>
                          </div>

                        
                        <div class="row">
                            
                            <div class="col-md-4">
                                <label>Phiên bản</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox3" runat="server"
                                        placeholder="edition" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Số trang</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox9" runat="server"
                                        placeholder="pages" TextMode="Number" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Giá</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox6" runat="server"
                                        placeholder="cost" TextMode="Number" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-12">
                                <label>Mô tả</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox10" runat="server"
                                        placeholder="book description" TextMode="MultiLine" Rows="2">
                                    </asp:TextBox>
                                </div>
                            </div>

                        </div>

                        <div class="row">

                            <div class="col-4">
                                <asp:Button ID="Button1" class="btn btn-lg btn-block btn-primary" 
                                    runat="server" Text="Sửa" OnClick="Button1_Click" />
                            </div>

                            <div class="col-4">
                                <asp:Button ID="Button2" class="btn btn-lg btn-block btn-danger" 
                                    runat="server" Text="Xóa" OnClick="Button2_Click" />
                            </div>

                        </div>
                    </div>
                </div>

                <a href="viewbook.aspx"><< Back to viewbook</a><br /><br />
            </div>

            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Giỏ hàng</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">

                            <div class="col" style="width:auto; height:auto">
                               <center>
                                    <asp:GridView ID="GridView1" runat="server" BorderStyle="Dashed"></asp:GridView>
                                    <div class="row">
                                         <div class="col">
                                            <hr />
                                        </div>
                                    </div>
                                        
                                            <asp:Label ID="Label2" runat="server" Text="Tổng tiền: " Font-Size="Larger" Font-Bold="True"></asp:Label>
                                            <asp:Label ID="Label1" runat="server" Font-Size="Larger" Font-Bold="True"></asp:Label>
                               </center>
                                    
                                        
                                
                                
                            </div>
                        </div>

                    </div>
                </div>

            </div>

        </div>
    </div>



</asp:Content>
