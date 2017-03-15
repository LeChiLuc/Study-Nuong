<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="StudyOnline_Nuong.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        //Ham tra ve couid lay tu url cua trinh duyet
        function getParameterByName(name) {
            name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
            var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                results = regex.exec(location.search);
            return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
        }
        //Kiểm tra mail có đúng định dạng mail hay không. Nếu đúng trả về true
        function validateEmail(email) {
            var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            return re.test(email);
        }
        function Login1() {
            var matkhau = $('input#txtPassword_Login1').val();
            var email = $('input#txtEmail_Login1').val();
            if (matkhau == "" || email == "")
                alert("Thông tin đăng nhập không được để trống");
            else {
                if (validateEmail(email)) {

                    $.ajax({
                        type: 'POST',
                        contentType: 'application/json; charset=utf-8',
                        url: '/Login.aspx/DangNhapThanhVien',
                        data: "{matkhau:'" + matkhau + "',email:'" + email + "'}",
                        dataType: "json",
                        success: function (response2) {
                            alert("Đăng nhập thành công!");
                            var html = "<div class='general-header-right fx fxac fxje' id='Login_Yes'>" +
                                                    "<a href='../User/CourseCreate.aspx' class='white-link sb become-ins-link'>Tạo khóa học</a>" +
                                                    "<span class='green-separator'></span>" +
                                                    "<a href='../User/CourseUserManage.aspx' class='white-link sb my-courses-link'>Khóa học của tôi</a>" +
                                                    "<span class='green-separator'></span>" +
                                                    "<div class='btn-group user-dropdown ml5'>" +
                                                        "<div class='dropdown-toggle user-toggle fxac' data-toggle='dropdown'>" +
                                                           " <a class='white-link fxac' href='#'>" +
                                                                "<b class='mini-title ellipsis'>" + response2.d + "</b>" +
                                                                "<i class='icon-caret-down user-caret ml10'></i>" +
                                                            "</a>" +
                                                        "</div>" +
                                                    "</div>" +
                                               " </div>";
                            $('#Login_No').html(html);
                            var url = getParameterByName("url");
                            if (url != null)
                                window.location.replace(url);
                            else
                                window.location.replace("/");
                        },
                        error: function (e) {
                            console.log(e);
                            alert("Đăng nhập thất bại! Kiểm tra lại thông tin đăng nhập");
                        },
                    });
                }
                else
                    alert("Email không hợp lệ!");
            }
        }
    </script>
    <div id="sticky-footer-wrapper">
        <div id="popup-inner" class="with-facebook  static-content-wrapper">
            <div id="login-box-header">
                <h3>Đăng nhập và bắt đầu học!</h3>
            </div>
            <div id="login-box-container" class="clearfix table popup-signup-box">
                <div id="login-fb-wrapper" class="cell">
                    <h3>Đăng nhập qua Facebook</h3>
                    <div class="fb-connect-button-wrapper">
                        <a class="fb-connect-button font-os" href="#">Đăng nhập qua <b>Facebook</b></a>
                    </div>
                </div>
                <div id="login-form-wrapper" class="cell">
                    <h3 class="pb10">hoặc với tài khoản TMCEdu</h3>
                    <div id="login-form" class="ud-formajaxify">
                        <div class="form-errors black-tooltip none">
                            <p></p>
                        </div>
                        <div class="manage-fields-wrapper ">
                            <div class=" non-labeled">
                                <div id="tooltip-reference-email" class="tooltip-reference">
                                    <input id="txtEmail_Login1" name="email" type="email" class="text-input" placeholder="E-mail">
                                </div>
                            </div>
                            <div class=" non-labeled">
                                <div id="tooltip-reference-password" class="tooltip-reference">
                                    <input id="txtPassword_Login1" name="password" type="password" class="text-input  " placeholder="Mật khẩu">
                                </div>
                            </div>
                        </div>
                        <div class="submit-row">
                            <input onclick="Login1()" value="Đăng nhập" class="btn btn-success">
                        </div>
                    </div>
                </div>
            </div>
            <div style="padding: 15px">
                Bạn chưa có tài khoản? <a class="btn btn-primary " style="display: inline; margin-left: 5px;" href="../SignUp.aspx">Đăng ký </a>
            </div>
        </div>
    </div>

</asp:Content>
