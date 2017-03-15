<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="CourseSearchUser.aspx.cs" Inherits="StudyOnline_Nuong.Admin.CourseSearchUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- start content -->
    <div id="content">

        <!--  start page-heading -->
        <div id="page-heading">
            <h1>Tìm kiếm khóa học theo thành viên</h1>
        </div>
        <!-- end page-heading -->
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
                    <div id="content-table-inner">
                        <!--  start table-content  -->
                        <div id="table-content">

                            <table border="0" cellpadding="0" cellspacing="0" id="id-form">

                                <tr>
                                    <th valign="top">Tên thành viên:</th>
                                    <td>
                                        <input type="text" class="inp-form" name="name" id="txtTimKiem" />
                                        <input type="button" value="Tìm kiếm" onclick="TimKiem()" />
                                    </td>
                                </tr>
                            </table>

                            <table border="0" width="100%" cellpadding="0" cellspacing="0" id="product-table">
                                <tr>
                                    <th class="table-header-check"><a id="toggle-all"></a></th>
                                    <th class="table-header-repeat line-left minwidth-1"><a href="">Tên khóa học</a>	</th>
                                    <th class="table-header-repeat line-left"><a href="">Ngày đăng</a></th>
                                    <th class="table-header-repeat line-left"><a href="">Lượt xem</a></th>
                                    <th class="table-header-repeat line-left"><a href="">Chuyên mục</a></th>
                                    <th class="table-header-repeat line-left"><a href="">Trình độ</a></th>
                                    <th class="table-header-repeat line-left"><a href="">Trạng thái</a></th>
                                    <th class="table-header-options line-left"><a href="">Options</a></th>
                                </tr>

                            </table>
                        </div>

                        <table border="0" cellpadding="0" cellspacing="0" id="paging-table">
                            <tr>
                                <td>
                                    <a href="" class="page-far-left"></a>
                                    <a href="" class="page-left"></a>
                                    <div id="page-info">Trang <strong>1</strong> / 15</div>
                                    <a href="" class="page-right"></a>
                                    <a href="" class="page-far-right"></a>
                                </td>
                            </tr>
                        </table>
                        <!--  end paging -->

                        <div class="clear"></div>

                    </div>
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
    <script type="text/javascript">
        function Html() {
            var html = " <tr>" +
                            "<th class='table-header-check'><a id='toggle-all'></a></th>" +
                            "<th class='table-header-repeat line-left minwidth-1'><a href=''>Tên khóa học</a>	</th>" +
                            "<th class='table-header-repeat line-left'><a href=''>Ngày đăng</a></th>" +
                            "<th class='table-header-repeat line-left'><a href=''>Lượt xem</a></th>" +
                            "<th class='table-header-repeat line-left'><a href=''>Chuyên mục</a></th>" +
                            "<th class='table-header-repeat line-left'><a href=''>Trình độ</a></th>" +
                            "<th class='table-header-repeat line-left'><a href=''>Trạng thái</a></th>" +
                            "<th class='table-header-options line-left'><a href=''>Options</a></th>" +
                        "</tr>";
            return html;
        }
        function TimKiem() {
            var user = $('#txtTimKiem').val();
            //if (p == 13) {
            $.ajax({
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                url: '/Admin/CourseSearchUser.aspx/HienThiKhoaHoc',
                data: "{user:'" + user + "'}",
                dataType: "json",
                async: "true",
                success: function (response) {
                    $("table#product-table").html("");
                    $("table#product-table").append(Html());

                    var objJson = JSON.parse(response.d);
                    for (var i = 0; i < objJson.length; i++) {
                        var html = "<tr class='alternate-row' id='Dong" + objJson[i].machuyenmuc + "'>" +
                                        "<td id='ckKhoaHoc" + objJson[i].makhoahoc + "'>" +
                                            "<input type='checkbox' /></td>" +
                                        "<td><a href='../User/CourseInfomation.aspx?couid=" + objJson[i].makhoahoc + "'>" + objJson[i].tenkhoahoc + "</a></td>" +
                                        "<td> " + objJson[i].ngaydang + "</a></td>" +
                                        "<td>" + objJson[i].luotxem + "</td>" +
                                        "<td>" + objJson[i].chuyenmuc + "</td>" +
                                        "<td>" + objJson[i].trinhdo + "</td>" +
                                        //"<td>" + objJson[i].thanhvien + "</td>" +
                                        "<td>" + objJson[i].trangthai + "</td>" +
                                        "<td class='options-width'>" +
                                            "<a href='javascript:void(0)' onclick='XoaKhoaHoc(" + objJson[i].makhoahoc + ")' title='Xóa' class='icon-2 info-tooltip'></a>" +
                                            "<a href='../User/CourseInfomation.aspx?couid=" + objJson[i].makhoahoc + "' title='Sửa' class='icon-5 info-tooltip'></a>" +
                                        "</td>" +
                                    "</tr>";
                        $("table#product-table").append(html);
                    }
                },
                error: function (e) {
                    alert(e);
                },
            });
        };

        //xóa khóa học
        function XoaKhoaHoc(id) {
            $.ajax({
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                url: '/Admin/CourseSearchUser.aspx/XoaKhoaHoc',
                data: "{makhoahoc:'" + id + "'}",
                success: function (response) {
                    alert('Xóa khóa học thành công!!');
                    $('#Dong' + id + '').remove();
                },
                error: function (e) {
                    alert("Lỗi rồi");
                },
            });
        }
    </script>
</asp:Content>
