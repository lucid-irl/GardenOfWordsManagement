<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="bookinventory.aspx.cs" Inherits="WebApplication1.bookinvent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6">

                <div class="card">
                    <div class="card-body">


                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Kho sách</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="150" src="imgs/bookstore/018-books.png" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <asp:FileUpload class="form-control" ID="FileUpload1" runat="server" />
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
                                        runat="server" Text="A" OnClick="LinkButton3_Click"> 
                                            <i class="fas fa-search"></i>
                                        </asp:LinkButton>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-9">
                                <label>Tên sách</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox8" runat="server"
                                        placeholder="book name">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>Language</label>
                                <div class="form-group">
                                   <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
                                      <asp:ListItem Text="English" Value="English" />
                                      <asp:ListItem Text="Hindi" Value="Hindi" />
                                      <asp:ListItem Text="Marathi" Value="Marathi" />
                                      <asp:ListItem Text="French" Value="French" />
                                      <asp:ListItem Text="German" Value="German" />
                                      <asp:ListItem Text="Urdu" Value="Urdu" />
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
                                <div class="form-group">
                                   <asp:DropDownList class="form-control" ID="DropDownList3" runat="server">
                                      <asp:ListItem Text="A1" Value="a1" />
                                      <asp:ListItem Text="a2" Value="a2" />
                                   </asp:DropDownList>
                                </div>
                                <label>Publish Date</label>
                                <div class="form-group">
                                   <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Date" TextMode="Date"></asp:TextBox>
                                </div>
                             </div>
                             <div class="col-md-4">
                                <label>Genre</label>
                                <div class="form-group">
                                   <asp:ListBox CssClass="form-control" ID="ListBox1" runat="server" SelectionMode="Multiple" Rows="5">
                                      <asp:ListItem Text="Action" Value="Action" />
                                      <asp:ListItem Text="Adventure" Value="Adventure" />
                                      <asp:ListItem Text="Comic Book" Value="Comic Book" />
                                      <asp:ListItem Text="Self Help" Value="Self Help" />
                                      <asp:ListItem Text="Motivation" Value="Motivation" />
                                      <asp:ListItem Text="Healthy Living" Value="Healthy Living" />
                                      <asp:ListItem Text="Wellness" Value="Wellness" />
                                      <asp:ListItem Text="Crime" Value="Crime" />
                                      <asp:ListItem Text="Drama" Value="Drama" />
                                      <asp:ListItem Text="Fantasy" Value="Fantasy" />
                                      <asp:ListItem Text="Horror" Value="Horror" />
                                      <asp:ListItem Text="Poetry" Value="Poetry" />
                                      <asp:ListItem Text="Personal Development" Value="Personal Development" />
                                      <asp:ListItem Text="Romance" Value="Romance" />
                                      <asp:ListItem Text="Science Fiction" Value="Science Fiction" />
                                      <asp:ListItem Text="Suspense" Value="Suspense" />
                                      <asp:ListItem Text="Thriller" Value="Thriller" />
                                      <asp:ListItem Text="Art" Value="Art" />
                                      <asp:ListItem Text="Autobiography" Value="Autobiography" />
                                      <asp:ListItem Text="Encyclopedia" Value="Encyclopedia" />
                                      <asp:ListItem Text="Health" Value="Health" />
                                      <asp:ListItem Text="History" Value="History" />
                                      <asp:ListItem Text="Math" Value="Math" />
                                      <asp:ListItem Text="Textbook" Value="Textbook" />
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
                                        placeholder="edition">
                                    </asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Giá</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox6" runat="server"
                                        placeholder="cost" TextMode="Number">
                                    </asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Số trang</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox9" runat="server"
                                        placeholder="pages" TextMode="Number">
                                    </asp:TextBox>
                                </div>
                            </div>

                        </div>

                        <div class="row">
                            
                            <div class="col-md-4">
                                <label>Nhập vào</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox1" runat="server"
                                        placeholder="actual stock" TextMode="Number">
                                    </asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Hiện có</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox2" runat="server"
                                        placeholder="current stock" TextMode="Number" ReadOnly="true">
                                    </asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Đã bán</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox5" runat="server"
                                        placeholder="selled" TextMode="Number" ReadOnly="true">
                                    </asp:TextBox>
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
                                <asp:Button ID="Button4" class="btn btn-lg btn-block btn-success" 
                                    runat="server" Text="Thêm" OnClick="Button4_Click" />
                            </div>

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

                <a href="homepage.aspx"><< Back to home</a><br /><br />
            </div>

            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Sách trong kho</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">

                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gardenofwordsConnectionString %>" SelectCommand="SELECT * FROM [book_master_tbl]"></asp:SqlDataSource>

                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" 
                                    ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="book_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="book_id" HeaderText="book_id" ReadOnly="True" SortExpression="book_id" />
                                        <asp:BoundField DataField="book_name" HeaderText="book_name" SortExpression="book_name" />
                                        <asp:BoundField DataField="genre" HeaderText="genre" SortExpression="genre" />
                                        <asp:BoundField DataField="author_name" HeaderText="author_name" SortExpression="author_name" />
                                        <asp:BoundField DataField="publisher_name" HeaderText="publisher_name" SortExpression="publisher_name" />
                                        <asp:BoundField DataField="language" HeaderText="language" SortExpression="language" />
                                        <asp:BoundField DataField="edition" HeaderText="edition" SortExpression="edition" />
                                        <asp:BoundField DataField="cost" HeaderText="cost" SortExpression="cost" />
                                        <asp:BoundField DataField="pages" HeaderText="pages" SortExpression="pages" />
                                        <asp:BoundField DataField="book_description" HeaderText="book_description" SortExpression="book_description" />
                                        <asp:BoundField DataField="actual_stock" HeaderText="actual_stock" SortExpression="actual_stock" />
                                        <asp:BoundField DataField="current_stock" HeaderText="current_stock" SortExpression="current_stock" />
                                        <asp:BoundField DataField="book_img_link" HeaderText="book_img_link" SortExpression="book_img_link" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>

                    </div>
                </div>

            </div>

        </div>
    </div>


</asp:Content>
