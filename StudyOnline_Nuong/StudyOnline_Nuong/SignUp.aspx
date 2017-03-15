<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="StudyOnline_Nuong.SignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        //Kiểm tra mail có đúng định dạng mail hay không. Nếu đúng trả về true
        function validateEmail(email) {
            var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            return re.test(email);
        }
        function SignUp1() {
            var tenthanhvien = $('input#txtTenThanhVien_SignUp1').val();
            var matkhau = $('input#txtPassword_SignUp1').val();
            var email = $('input#txtEmail_SignUp1').val();
            var trangthai = 'TRUE';
            if (tenthanhvien == "" || matkhau == "" || email == "")
                alert("Thông tin đăng ký không được để trống");
            else {
                if (validateEmail(email)) {
                    $.ajax({
                        type: 'POST',
                        contentType: 'application/json; charset=utf-8',
                        url: '/SignUp.aspx/DangKyThanhVien',
                        data: "{tenthanhvien:'" + tenthanhvien + "',matkhau:'" + matkhau + "',email:'" + email + "',trangthai:'" + trangthai + "'}",
                        dataType: "json",
                        success: function (response2) {
                            alert("Đăng ký thành công!");
                            var html = "<div class='general-header-right fx fxac fxje' id='Login_Yes'>" +
                                                    "<a href='../User/CourseCreate.aspx' class='white-link sb become-ins-link'>Tạo khóa học</a>" +
                                                    "<span class='green-separator'></span>" +
                                                    "<a href='../User/CourseUserManage.aspx' class='white-link sb my-courses-link'>Khóa học của tôi</a>" +
                                                    "<span class='green-separator'></span>" +
                                                    "<div class='btn-group user-dropdown ml5'>" +
                                                        "<div class='dropdown-toggle user-toggle fxac' data-toggle='dropdown'>" +
                                                           " <a class='white-link fxac' href='#'>" +
                                                                "<b class='mini-title ellipsis'>" + tenthanhvien + "</b>" +
                                                                "<i class='icon-caret-down user-caret ml10'></i>" +
                                                            "</a>" +
                                                        "</div>" +
                                                    "</div>" +
                                               " </div>";
                            $('#Login_No').html(html);
                            window.location.replace("../Default.aspx");
                        },
                        error: function (e) {
                            alert("Đăng ký thất bại! Kiểm tra lại thông tin đăng ký");
                        },
                    });
                }
                else
                    alert("Email không hợp lệ!");
            }
        }
    </script>
    <div id="sticky-footer-wrapper">
        <div id="popup-inner" class="with-facebook static-content-wrapper">
            <div id="login-box-header">
                <h3 class="">Tham gia và bắt đầu học ngay hôm nay!</h3>
            </div>
            <div id="login-box-container" class="clearfix table popup-signup-box">

                <div id="login-fb-wrapper" class="cell">
                    <h3>Đăng ký qua Facebook</h3>
                    <div class="fb-connect-button-wrapper">
                        <a class="fb-connect-button font-os" href="#">Kết nối với <b>Facebook</b></a>
                    </div>
                    <div id="fb-signup-box">
                        <fb:facepile max-rows="5" width="300" data-max-rows="5" data-width="170"></fb:facepile>
                    </div>
                </div>

                <div id="login-form-wrapper" class="cell">
                    <h3 class="pb10">hoặc Email</h3>
                    <div id="signup-form" name="signup-form" class="ud-formajaxify">
                        <div class="form-errors black-tooltip none">
                            <p></p>
                        </div>
                        <div class="manage-fields-wrapper ">
                            <div class=" non-labeled">
                                <div id="tooltip-reference-fullName" class="tooltip-reference">
                                    <input id="txtTenThanhVien_SignUp1" name="fullName" type="text" class="text-input  " placeholder="Họ và tên">
                                </div>
                            </div>
                            <div class=" non-labeled">
                                <div id="tooltip-reference-email" class="tooltip-reference">
                                    <input id="txtEmail_SignUp1" name="email" type="email" class="text-input" rel="isEmailValid" placeholder="E-mail">
                                </div>
                            </div>
                            <div class=" non-labeled">
                                <div id="tooltip-reference-password" class="tooltip-reference ">
                                    <input id="txtPassword_SignUp1" name="password" type="password" class="text-input  " placeholder="Mật khẩu">
                                </div>
                            </div>

                        </div>
                        <div class="submit-row">
                            <input onclick="SignUp1()" value="Đăng ký" class="btn btn-success" data-loading-text="Signup">
                        </div>
                    </div>

                </div>
            </div>
            <div style="padding: 15px">
                Bạn đã có tài khoản? <a class="btn btn-primary " style="display: inline; margin-left: 5px;" href="../Login.aspx">Đăng nhập </a>
            </div>
        </div>
    </div>
</asp:Content>
