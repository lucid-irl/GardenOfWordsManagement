<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="bookinventory.aspx.cs" Inherits="WebApplication1.bookinvent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-md-6">

                <div class="card">
                    <div class="card-body">

                        

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Thông tin tác giả</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100" src="imgs/bookstore/027-open-book.png" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>ID Tác giả</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox class="form-control" ID="TextBox7" runat="server">
                                        </asp:TextBox>
                                        <asp:Button class="btn btn-secondary" ID="Button1" 
                                        runat="server" Text="Tìm" />
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-8">
                                <label>Tên tác giả</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox8" runat="server"
                                        placeholder="tên tác giả">
                                    </asp:TextBox>
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
                                    <h4>Danh sách tác giả</h4>
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
