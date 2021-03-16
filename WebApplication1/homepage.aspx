<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="WebApplication1.homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
        <img src="imgs/thumpmail_3.png" class="img-fluid" />
    </section>

    <section>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <center>
                    <h2>Các tính năng của chúng tôi</h2>
                    <p><b>- Gồm 3 chức năng chính -</b></p>
                    </center>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <center>
                    <img width="150px" src="imgs/bookstore/016-books.png" />
                    <h4>Giỏ hàng</h4>
                    <p class="text-justify">Đây sẽ là giỏ hàng của bạn. 
                        Tất cả thông tin về sách bạn đã chọn sẽ ở trong này.
                        Bạn có thể vào để chỉnh sửa giỏ hàng và thanh toán. :33</p>
                    </center>
                </div>

                <div class="col-md-4">
                    <center>
                    <img width="150px" src="imgs/bookstore/008-book.png" />
                    <h4>Tìm kiếm</h4>
                    <p class="text-justify">Bấm vào đây để tìm kiếm sách. 
                        Tất cả các đầu sách sẽ ở trong này. 
                        Bạn có thể tìm kiếm theo nhiều từ khóa khác nhau.
                        Hoặc đơn giản là bấm zô cho zui hê hê...</p>
                    </center>
                </div>

                <div class="col-md-4">
                    <center>
                    <img width="150px" src="imgs/bookstore/002-bookstore.png" />
                    <h4>Nhà phát hành</h4>
                    <p class="text-justify">Đây là danh sách những nhà phát hành sách. 
                        Tất cả thông tin của NPH sẽ được trình bày và cập nhật trong này.
                        Bấm vào để xem thử có NPH nào đang bán sách của chị X không :vv</p>
                    </center>
                </div>

            </div>
        </div>
    </section>

    <section>
        <img src="imgs/homepage-banner-1.png" class="img-fluid" />
    </section>

</asp:Content>
