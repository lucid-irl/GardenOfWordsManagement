<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ordermanager.aspx.cs" Inherits="WebApplication1.ordermanager" %>
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
                                    <h4>Quản lý đơn hàng</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100" src="imgs/bookstore/016-books.png" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            

                            <div class="col-md-6">
                                <label>ID Order</label>
                                <div class="form-group">
                                    <div class="input-group">
                                    <asp:TextBox class="form-control" ID="TextBox8" runat="server"
                                        placeholder="order id">
                                    </asp:TextBox>
                                    <asp:LinkButton class="btn btn-primary" ID="LinkButton2" runat="server" Text="B" OnClick="LinkButton2_Click"> 
                                            <i class="fas fa-search"></i></asp:LinkButton>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>ID Thành viên</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox class="form-control" ID="TextBox7" runat="server" 
                                            placeholder="member id">
                                        </asp:TextBox>
                                        <asp:LinkButton class="btn btn-primary" ID="LinkButton1" runat="server" Text="A" OnClick="LinkButton1_Click"> 
                                            <i class="fas fa-search"></i></asp:LinkButton>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="row">
                            
                            <div class="col-md-6">
                                <label>Giá Order</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox2" runat="server"
                                        placeholder="order cost" ReadOnly="True">
                                    </asp:TextBox>
                                </div>
                            </div>


                            <div class="col-md-6">
                                <label>Tên thành viên</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox1" runat="server"
                                        placeholder="member name" ReadOnly="True">
                                    </asp:TextBox>
                                </div>
                            </div>

                        </div>
                        
                        <div class="row">
                            
                            <div class="col-md-6">
                                <label>Ngày order</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox3" runat="server"
                                        placeholder="tên order" TextMode="Date">
                                    </asp:TextBox>
                                </div>
                            </div>


                            <div class="col-md-6">
                                <label>Tình trạng</label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
                                        <asp:ListItem Text="Đã thanh toán" Value="payed"></asp:ListItem>
                                        <asp:ListItem Text="COD" Value="cod"></asp:ListItem>
                                        <asp:ListItem Text="Chưa thanh toán" Value="wait"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                        </div>

                        <div class="row">
                            
                            <div class="col-4">
                                <asp:Button ID="Button3" class="btn btn-lg btn-block btn-success" 
                                    runat="server" Text="Sửa" OnClick="Button3_Click" />
                            </div>

                            <div class="col-4">
                                <asp:Button ID="Button4" class="btn btn-lg btn-block btn-danger" 
                                    runat="server" Text="Xóa" OnClick="Button4_Click" />
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
                                    <h4>Danh sách đơn hàng</h4>
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
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gardenofwordsConnectionString %>" SelectCommand="SELECT * FROM [order_master_tbl]"></asp:SqlDataSource>
                                <asp:GridView class="table table-striped table-bordered" 
                                    ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="order_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="order_id" HeaderText="Order ID" ReadOnly="True" SortExpression="order_id" />
                                        <asp:BoundField DataField="member_id" HeaderText="User ID" SortExpression="member_id" />
                                        <asp:BoundField DataField="member_name" HeaderText="Name" SortExpression="member_name" />
                                        <asp:BoundField DataField="no_book" HeaderText="NoB" SortExpression="no_book" />
                                        <asp:BoundField DataField="order_cost" HeaderText="Cost" SortExpression="order_cost" />
                                        <asp:BoundField DataField="order_day" HeaderText="Ngày" SortExpression="order_day" />
                                        <asp:BoundField DataField="order_status" HeaderText="Trạng thái" SortExpression="order_status" />
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
