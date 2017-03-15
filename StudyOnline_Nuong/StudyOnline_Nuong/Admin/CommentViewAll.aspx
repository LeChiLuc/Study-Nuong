<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="CommentViewAll.aspx.cs" Inherits="StudyOnline_Nuong.Admin.CommentViewAll" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $.ajax({
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                url: '/Admin/CommentViewAll.aspx/HienThiBinhLuan',
                data: "{}",
                dataType: "json",
                async: "true",
                success: function (response) {
                    var objJson = JSON.parse(response.d);
                    for (var i = 0; i < objJson.length; i++) {
                        var html = "<tr class='alternate-row'>" +
                                        "<td id='ckBinhLuan" + objJson[i].mabinhluan + "'>" +
                                            "<input type='checkbox' /></td>" +
                                        "<td><a href='../Course.aspx?cou="+objJson[i].makhoahoc+"'>" + objJson[i].tenkhoahoc + "</td>" +
                                        "<td>" + objJson[i].noidungbinhluan + "</a></td>" +
                                        "<td>" + objJson[i].thanhvien + "</td>" +
                                        "<td>" + objJson[i].ngaydang + "</td>" +
                                        "<td>" + objJson[i].trangthai + "</td>" +
                                    "</tr>";
                        $("table#product-table").append(html);
                    }
                },
                error: function (e) {
                    alert(e);
                },
            });
        });
    </script>
    <!-- start content -->
    <div id="content">

        <div id="page-heading">
            <h1>Bình luận</h1>
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
                    <div id="content-table-inner">
                        <div id="table-content">

                            <table border="0" width="100%" cellpadding="0" cellspacing="0" id="product-table">
                                <tr>
                                    <th class="table-header-check"><a id="toggle-all"></a></th>
                                    <th class="table-header-repeat line-left minwidth-1"><a href="">Khóa học</a>	</th>
                                    <th class="table-header-repeat line-left minwidth-1"><a href="">Nội dung phản hồi</a></th>
                                    <th class="table-header-repeat line-left"><a href="">Thành viên</a></th>
                                    <th class="table-header-repeat line-left"><a href="">Ngày đăng</a></th>
                                    <th class="table-header-repeat line-left"><a href="">Trạng Thái</a></th>
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
    <div class="clear">&nbsp;</div>
</asp:Content>
