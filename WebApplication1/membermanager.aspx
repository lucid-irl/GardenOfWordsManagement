<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="membermanager.aspx.cs" Inherits="WebApplication1.membermanager" %>
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
                                    <h4>Quản lý member</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100" src="imgs/bookstore/025-man.png" />
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
                                <label>ID Thành viên</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox class="form-control" ID="TextBox7" runat="server">
                                        </asp:TextBox>
                                        <asp:LinkButton class="btn btn-primary" ID="LinkButton3" 
                                        runat="server" Text="A"> <i class="fas fa-check-circle"></i>
                                        </asp:LinkButton>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Họ Tên</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox8" runat="server"
                                        placeholder="Họ Tên">
                                    </asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-5">
                                <label>Trạng thái</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox class="form-control mr-1" ID="TextBox4" runat="server">
                                        </asp:TextBox>
                                        <asp:LinkButton class="btn btn-success mr-1" ID="Button5" 
                                        runat="server" Text="A"> <i class="fas fa-check-circle"></i>
                                        </asp:LinkButton>
                                        <asp:LinkButton class="btn btn-warning mr-1" ID="LinkButton1" 
                                        runat="server" Text="A"> <i class="fas fa-circle-notch"></i>
                                        </asp:LinkButton>
                                        <asp:LinkButton class="btn btn-danger mr-1" ID="LinkButton2" 
                                        runat="server" Text="D"> <i class="fas fa-times-circle"></i>
                                        </asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                            

                        </div>

                        <div class="row">
                            
                            <div class="col-md-3">
                                <label>Ngày sinh</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox2" runat="server"
                                        placeholder="day-of-birth" ReadOnly="True">
                                    </asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <label>Điện thoại</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox5" runat="server"
                                        placeholder="Phone number" ReadOnly="True">
                                    </asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Mail</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox1" runat="server"
                                        placeholder="email address" ReadOnly="True">
                                    </asp:TextBox>
                                </div>
                            </div>

                        </div>
                        
                        <div class="row">
                            
                            <div class="col-md-4">
                                <label>Thành phố</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox3" runat="server"
                                        placeholder="city" ReadOnly="true">
                                    </asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Quận/Huyện</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox6" runat="server"
                                        placeholder="state" ReadOnly="true">
                                    </asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Giới tính</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox9" runat="server"
                                        placeholder="sex" ReadOnly="true">
                                    </asp:TextBox>
                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-12">
                                <label>Địa chỉ</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox10" runat="server"
                                        placeholder="full address" ReadOnly="true" TextMode="MultiLine" Rows="2">
                                    </asp:TextBox>
                                </div>
                            </div>

                        </div>

                        <div class="row">
                            

                            <div class="col-12 mx-auto">
                                <asp:Button ID="Button4" class="btn btn-lg btn-block btn-danger" 
                                    runat="server" Text="Xóa thành viên" />
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
                                    <h4>Danh sách member</h4>
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
