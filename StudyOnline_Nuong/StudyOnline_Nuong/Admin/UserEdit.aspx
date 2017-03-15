<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="UserEdit.aspx.cs" Inherits="StudyOnline_Nuong.Admin.UserEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function EditUser() {
            var tenthanhvien = $('input#txtTenThanhVien').val();
            var matkhau = $('input#txtMatKhau').val();
            var email = $('input#txtEmail').val();
            var trangthai = $('input#cbTrangThai_input').val();
            var ghichu = $('textarea#txtGhiChu').val();

            $.ajax({
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                url: '/Admin/UserCreate.aspx/SuaThanhVien',
                data: "{tenthanhvien:'" + tenthanhvien + "',matkhau:'" + matkhau + "',email:'" + email + "',trangthai:'" + trangthai + "',ghichu:'" + ghichu + "'}",
                dataType: "json",
                async: "true",
                success: function (response2) {
                    alert("Sửa user thành công!");
                },
                error: function (e) {
                    alert(e);
                },
            });

        }
        function Reset() {
            $('input#txtTenThanhVien').val("");
            $('input#txtMatKhau').val("");
            $('input#txtEmail').val("");
            $('input#cbTrangThai_input').val("True");
            $('textarea#txtGhiChu').val("");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- start content-outer -->
    <div id="content-outer">
        <!-- start content -->
        <div id="content">
            <div id="page-heading">
                <h1>Edit User</h1>
            </div>
            <table border="0" width="100%" cellpadding="0" cellspacing="0" id="content-table">
                <tr>
                    <th rowspan="3" class="sized">
                        <img src="images/shared/side_shadowleft.jpg" width="20" height="300" alt="" /></th>
                    <th class="topleft"></th>
                    <td id="tbl-border-top">&nbsp;</td>
                    <th class="topright"></th>
                    <th rowspan="3" class="sized">
                        <img src="images/shared/side_shadowright.jpg" width="20" height="300" alt="" /></th>
                </tr>
                <tr>
                    <td id="tbl-border-left"></td>
                    <td>
                        <!--  start content-table-inner -->
                        <div id="content-table-inner">

                            <table border="0" width="100%" cellpadding="0" cellspacing="0">
                                <tr valign="top">
                                    <td>
                                        <!-- start id-form -->
                                        <table border="0" cellpadding="0" cellspacing="0" id="id-form">

                                            <tr>
                                                <th valign="top">Tên thành viên:</th>
                                                <td>
                                                    <input type="text" id="txtTenThanhVien" class="inp-form" />
                                                    <%-- <input type="text" class="inp-form-error" />--%>
                                                </td>
                                                <%-- <td>
                                                    <div class="error-left"></div>
                                                    <div class="error-inner">This field is required.</div>
                                                </td>--%>
                                            </tr>
                                            <tr>
                                                <th valign="top">Mật khẩu:</th>
                                                <td>
                                                    <input type="password" id="txtMatKhau" class="inp-form" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <th valign="top">Email:</th>
                                                <td>
                                                    <input type="text" id="txtEmail" class="inp-form" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <th valign="top">Trạng thái:</th>
                                                <td>
                                                    <select id="cbTrangThai" class="styledselect_form_1">
                                                        <option value="">True</option>
                                                        <option value="">Fasle</option>
                                                    </select>
                                                </td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <th valign="top">Ghi chú:</th>
                                                <td>
                                                    <textarea id="txtGhiChu" rows="" cols="" class="form-textarea"></textarea></td>
                                                <td></td>
                                            </tr>

                                            <tr>
                                                <th>&nbsp;</th>
                                                <td valign="top">
                                                    <input type="button" onclick="EditUser()" class="form-submit" />
                                                    <input type="reset" onclick="Reset()" class="form-reset" />
                                                </td>
                                                <td></td>
                                            </tr>
                                        </table>
                                        <!-- end id-form  -->
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>
                                        <img src="images/shared/blank.gif" width="695" height="1" alt="blank" /></td>
                                    <td></td>
                                </tr>
                            </table>
                            <div class="clear"></div>
                        </div>
                        <!--  end content-table-inner  -->
                    </td>
                    <td id="tbl-border-right"></td>
                </tr>
                <tr>
                    <th class="sized bottomleft"></th>
                    <td id="tbl-border-bottom">&nbsp;</td>
                    <th class="sized bottomright"></th>
                </tr>
            </table>
            <div class="clear">&nbsp;</div>

        </div>
        <!--  end content -->
        <div class="clear">&nbsp;</div>
    </div>
    <!--  end content-outer -->
    <div class="clear">&nbsp;</div>
</asp:Content>
