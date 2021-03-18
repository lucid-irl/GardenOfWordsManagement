<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="usersignup.aspx.cs" Inherits="WebApplication1.usersignup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container">
        <div class="row">
            <div class="col-md-8 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100" src="imgs/bookstore/028-location.png" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Đăng kí thành viên</h4>
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
                                <center>
                                    <span class="badge badge-success">Thông tin đăng nhập</span>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>Tên đăng nhập</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox7" runat="server" 
                                        placeholder="user id"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Mật khẩu</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox8" runat="server" 
                                        TextMode="Password"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Nhập lại mật khẩu</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox9" runat="server" 
                                        TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <span class="badge badge-info">Thông tin cá nhân</span>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label>Họ tên</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox1" runat="server" 
                                        placeholder="vd: Tran Huy Hoang"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Ngày sinh</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox2" runat="server" 
                                        placeholder="" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label>Số điện thoại</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox3" runat="server" 
                                        placeholder="" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Email</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox4" runat="server" 
                                        placeholder="email@abc.xyz" TextMode="Email"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>Thành phố/Tỉnh thành</label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="DropDownList2" runat="server">
                                        <asp:ListItem Text="Thành phố Hà Nội" Value="Thành phố Hà Nội"></asp:ListItem>
                                        <asp:ListItem Text="Thành phố Hồ Chí Minh" Value="Thành phố Hồ Chí Minh"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh An Giang" Value="Tỉnh An Giang"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Bà Rịa - Vũng Tàu" Value="Tỉnh Bà Rịa - Vũng Tàu"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Bạc Liêu" Value="Tỉnh Bạc Liêu"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Bắc Giang" Value="Tỉnh Bắc Giang"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Bắc Kạn" Value="Tỉnh Bắc Kạn"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Bắc Ninh" Value="Tỉnh Bắc Ninh"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Bến Tre" Value="Tỉnh Bến Tre"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Bình Dương" Value="Tỉnh Bình Dương"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Bình Định" Value="Tỉnh Bình Định"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Bình Phước" Value="Tỉnh Bình Phước"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Bình Thuận" Value="Tỉnh Bình Thuận"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Cao Bằng" Value="Tỉnh Cao Bằng"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Cà Mau" Value="Tỉnh Cà Mau"></asp:ListItem>
                                        <asp:ListItem Text="Thành phố Cần Thơ" Value="Thành phố Cần Thơ"></asp:ListItem>
                                        <asp:ListItem Text="Thành phố Hải Phòng" Value="Thành phố Hải Phòng"></asp:ListItem>
                                        <asp:ListItem Text="Thành phố Đà Nẵng" Value="Thành phố Đà Nẵng"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Gia Lai" Value="Tỉnh Gia Lai"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Hòa Bình" Value="Tỉnh Hòa Bình"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Hà Giang" Value="Tỉnh Hà Giang"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Hà Nam" Value="Tỉnh Hà Nam"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Hà Tĩnh" Value="Tỉnh Hà Tĩnh"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Hưng Yên" Value="Tỉnh Hưng Yên"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Hải Dương" Value="Tỉnh Hải Dương"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Hậu Giang" Value="Tỉnh Hậu Giang"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Điện Biên" Value="Tỉnh Điện Biên"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Đắk Lắk" Value="Tỉnh Đắk Lắk"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Đắk Nông" Value="Tỉnh Đắk Nông"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Đồng Nai" Value="Tỉnh Đồng Nai"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Đồng Tháp" Value="Tỉnh Đồng Tháp"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Khánh Hòa" Value="Tỉnh Khánh Hòa"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Kiên Giang" Value="Tỉnh Kiên Giang"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Kon Tum" Value="Tỉnh Kon Tum"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Lai Châu" Value="Tỉnh Lai Châu"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Long An" Value="Tỉnh Long An"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Lào Cai" Value="Tỉnh Lào Cai"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Lâm Đồng" Value="Tỉnh Lâm Đồng"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Lạng Sơn" Value="Tỉnh Lạng Sơn"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Nam Định" Value="Tỉnh Nam Định"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Nghệ An" Value="Tỉnh Nghệ An"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Ninh Bình" Value="Tỉnh Ninh Bình"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Ninh Thuận" Value="Tỉnh Ninh Thuận"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Phú Thọ" Value="Tỉnh Phú Thọ"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Phú Yên" Value="Tỉnh Phú Yên"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Quảng Bình" Value="Tỉnh Quảng Bình"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Quảng Nam" Value="Tỉnh Quảng Nam"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Quảng Ngãi" Value="Tỉnh Quảng Ngãi"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Quảng Ninh" Value="Tỉnh Quảng Ninh"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Quảng Trị" Value="Tỉnh Quảng Trị"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Sóc Trăng" Value="Tỉnh Sóc Trăng"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Sơn La" Value="Tỉnh Sơn La"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Thanh Hóa" Value="Tỉnh Thanh Hóa"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Thái Bình" Value="Tỉnh Thái Bình"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Thái Nguyên" Value="Tỉnh Thái Nguyên"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Thừa Thiên - Huế" Value="Tỉnh Thừa Thiên - Huế"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Tiền Giang" Value="Tỉnh Tiền Giang"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Trà Vinh" Value="Tỉnh Trà Vinh"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Tuyên Quang" Value="Tỉnh Tuyên Quang"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Tây Ninh" Value="Tỉnh Tây Ninh"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Vĩnh Long" Value="Tỉnh Vĩnh Long"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Vĩnh Phúc" Value="Tỉnh Vĩnh Phúc"></asp:ListItem>
                                        <asp:ListItem Text="Tỉnh Yên Bái" Value="Tỉnh Yên Bái"></asp:ListItem>

                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Quận/Huyện</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox5" runat="server" 
                                        placeholder="không có cũng được..."></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Giới tính</label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
                                        <asp:ListItem Text="Nam" Value="nam"></asp:ListItem>
                                        <asp:ListItem Text="Nữ" Value="nu"></asp:ListItem>
                                        <asp:ListItem Text="Khác" Value="other"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <label>Địa chỉ</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox6" runat="server" 
                                        placeholder="địa chỉ đầy đủ, vd: 13 abc" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:Button class="btn btn-success btn-block btn-lg" ID="Button1" 
                                        runat="server" Text="Đăng kí" OnClick="Button1_Click" />
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
