<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="usercart.aspx.cs" Inherits="WebApplication1.usercart" %>
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
                                    <h4>Quản lý giỏ hàng</h4>
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
                                    <asp:LinkButton class="btn btn-primary" ID="LinkButton2" runat="server" Text="B" > 
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
                                        <asp:LinkButton class="btn btn-primary" ID="LinkButton1" runat="server" Text="A" > 
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
                                    runat="server" Text="Sửa"  />
                            </div>

                            <div class="col-4">
                                <asp:Button ID="Button4" class="btn btn-lg btn-block btn-danger" 
                                    runat="server" Text="Xóa"  />
                            </div>

                        </div>
                    </div>
                </div>

                <a href="viewbook.aspx"><< Back to viewbook</a><br /><br />
            </div>

            <div class="col-md-6">
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

                            <div class="col">
                                <asp:GridView ID="GridView1" runat="server" Width="582px" BorderStyle="Dashed"></asp:GridView>
                                <asp:Label ID="Label1" runat="server" style="margin-left: 391px" Width="187px"></asp:Label>
                            </div>
                        </div>

                    </div>
                </div>

            </div>

        </div>
    </div>



</asp:Content>
