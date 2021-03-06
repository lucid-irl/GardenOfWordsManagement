<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="viewbook.aspx.cs" Inherits="WebApplication1.viewbook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
       $(document).ready(function () {
           $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
       });

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Sách hiện kó</h4>
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
                                                        <asp:BoundField DataField="book_id" HeaderText="ID" ReadOnly="True" SortExpression="book_id" />
                                        
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <div class="container-fluid">
                                                                    <div class="row">
                                                                        <div class="col-lg-10">
                                                                            <div class="row">
                                                                                <div class="col-12">
                                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("book_name") %>' Font-Bold="True" Font-Size="X-Large" ></asp:Label>
                                                                                </div>
                                                                            </div>

                                                                            <div class="row">
                                                                                <div class="col-12">
                                                                    
                                                                                    Tác giả:
                                                                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("author_name") %>'></asp:Label>
                                                                                    &nbsp;|| Thể loại:
                                                                                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("genre") %>'></asp:Label>
                                                                                    &nbsp;|| Ngôn ngữ:
                                                                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("language") %>'></asp:Label>
                                                                    
                                                                                </div>
                                                                            </div>

                                                                            <div class="row">
                                                                                <div class="col-12">
                                                                    
                                                                                    NPH:
                                                                                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("publisher_name") %>'></asp:Label>
                                                                                    &nbsp;|| Ngày PH:
                                                                                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%# Eval("publisher_date") %>'></asp:Label>
                                                                                    &nbsp;|| Số trang:
                                                                                    <asp:Label ID="Label7" runat="server" Font-Bold="True" Text='<%# Eval("pages") %>'></asp:Label>
                                                                    
                                                                                    &nbsp;</div>
                                                                            </div>

                                                                            <div class="row">
                                                                                <div class="col-12">
                                                                    
                                                                                    Giá:
                                                                                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Text='<%# Eval("cost") %>'></asp:Label>
                                                                                    &nbsp;|| Hiện có:
                                                                                    <asp:Label ID="Label11" runat="server" Font-Bold="True" Text='<%# Eval("current_stock") %>'></asp:Label>
                                                                                    &nbsp;|| Tái bản:
                                                                                    <asp:Label ID="Label8" runat="server" Font-Bold="True" Text='<%# Eval("edition") %>'></asp:Label>
                                                                    
                                                                                </div>
                                                                            </div>

                                                                            <div class="row">
                                                                                <div class="col-12">
                                                                    
                                                                                    Mô tả:
                                                                                    <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Size="Smaller" Text='<%# Eval("book_description") %>' Font-Italic="True"></asp:Label>
                                                                    
                                                                                </div>
                                                                            </div>

                                                                        </div>

                                                                        <div class="col-lg-2">
                                                                            
                                                                            <asp:Image class="img-fluid" ID="Image1" runat="server" ImageUrl='<%# Eval("book_img_link") %>' />
                                                                            <br />
                                                                            <asp:LinkButton class="btn btn-warning" ID="LinkButton13" runat="server" OnClick="LinkButton13_Click">
                                                                                Thêm vào giỏ<i class="fas fa-shopping-cart"></i></asp:LinkButton>
                                                                        </div>

                                                                    </div>
                                                                </div>

                                                            </ItemTemplate>

                                                        </asp:TemplateField>

                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                        </div>

                                    

                    </div>
                </div>

            </div>
            <center>
                <a href="home.aspx">
                        << Back to Home</a><span class="clearfix"></span>
                            <br />
            </center>
        </div>
    </div>
        

</asp:Content>
