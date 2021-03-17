<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminlogin.aspx.cs" Inherits="WebApplication1.adminlogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="150" src="imgs/bookstore/024-man.png" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Quản trị viên đăng nhập</h3>
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
                                
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox1" runat="server" 
                                        placeholder="Admin ID"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox2" runat="server" 
                                        placeholder="Password" TextMode="Password"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <asp:Button class="btn btn-success btn-block btn-lg" ID="Button1" 
                                        runat="server" Text="Login" />
                                </div>

                                
                            </div>
                        </div>
                    </div>
                </div>

                <a href="homepage.aspx"><< Back to home</a><br /><br />
            </div>
        </div>
    </div>

</asp:Content>
