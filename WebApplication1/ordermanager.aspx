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
                                    <asp:TextBox class="form-control" ID="TextBox8" runat="server"
                                        placeholder="order number">
                                    </asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>ID Thành viên</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox class="form-control" ID="TextBox7" runat="server">
                                        </asp:TextBox>
                                        <asp:Button class="btn btn-secondary" ID="Button1" 
                                        runat="server" Text="Tìm" />
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
                                <asp:Button ID="Button2" class="btn btn-lg btn-block btn-primary" 
                                    runat="server" Text="Thêm" />
                            </div>

                            <div class="col-4">
                                <asp:Button ID="Button3" class="btn btn-lg btn-block btn-success" 
                                    runat="server" Text="Sửa" />
                            </div>

                            <div class="col-4">
                                <asp:Button ID="Button4" class="btn btn-lg btn-block btn-danger" 
                                    runat="server" Text="Xóa" />
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
                                <asp:GridView class="table table-striped table-bordered" 
                                    ID="GridView1" runat="server"></asp:GridView>
                            </div>
                        </div>

                    </div>
                </div>

            </div>

        </div>
    </div>


</asp:Content>
