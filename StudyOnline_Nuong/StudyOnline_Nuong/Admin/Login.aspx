<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="StudyOnline_Nuong.Admin.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Study English Online - Nuong</title>
    <link rel="stylesheet" href="css/screen.css" type="text/css" media="screen" title="default" />
    <!--  jquery core -->
    <script src="js/jquery/jquery-1.4.1.min.js" type="text/javascript"></script>

    <!-- Custom jquery scripts -->
    <script src="js/jquery/custom_jquery.js" type="text/javascript"></script>

    <!-- MUST BE THE LAST SCRIPT IN <HEAD></HEAD></HEAD> png fix -->
    <script src="js/jquery/jquery.pngFix.pack.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(document).pngFix();
        });
    </script>

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
                  //if (validateEmail(email)) {

                      $.ajax({
                          type: 'POST',
                          contentType: 'application/json; charset=utf-8',
                          url: '/Admin/Login.aspx/DangNhapThanhVien',
                          data: "{matkhau:'" + matkhau + "',email:'" + email + "'}",
                          dataType: "json",
                          success: function (response2) {
                              alert("Đăng nhập thành công!");
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
                  //}
                  //else
                  //    alert("Email không hợp lệ!");
              }
          }
    </script>
</head>
<body>
    <form id="form1" runat="server">

        <!-- Start: login-holder -->
        <div id="login-holder">

            <div class="clear"></div>

            <!--  start loginbox ................................................................................. -->
            <div id="loginbox" style="margin-top:100px;">

                <!--  start login-inner -->
                <div id="login-inner">
                    <table border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <th>Email</th>
                            <td>
                                <input type="text" id="txtPassword_Login1" class="login-inp" /></td>
                        </tr>
                        <tr>
                            <th>Mật khẩu</th>
                            <td>
                                <input id="txtEmail_Login1" type="password" onfocus="this.value=''" class="login-inp" /></td>
                        </tr>
                       
                        <tr>
                            <th></th>
                            <td>
                                <input type="button" onclick="Login1()" class="submit-login" /></td>
                        </tr>
                    </table>
                </div>
                <!--  end login-inner -->
                <div class="clear"></div>
                
            </div>
            <!--  end loginbox -->
        </div>
        <!-- End: login-holder -->
    </form>
</body>
</html>
