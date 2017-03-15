<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="LevelViewAll.aspx.cs" Inherits="StudyOnline_Nuong.Admin.LevelViewAll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $.ajax({
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                url: '/Admin/LevelViewAll.aspx/HienThiTrinhDo',
                data: "{}",
                dataType: "json",
                async: "true",
                success: function (response) {
                    var objJson = JSON.parse(response.d);
                    for (var i = 0; i < objJson.length; i++) {
                        var html = "<tr class='alternate-row' id='Dong" + objJson[i].machuyenmuc + "'>" +
                                        "<td id='ckTrinhDo" + objJson[i].matrinhdo + "'>" +
                                            "<input type='checkbox' /></td>" +
                                        "<td>" + objJson[i].tentrinhdo + "</td>" +
                                        "<td>" + objJson[i].trangthai + "</td>" +
                                        "<td>" + objJson[i].ghichu + "</td>" +
                                        "<td class='options-width'>" +
                                            "<a href='javascript:void(0)' onclick='XoaTrinhDo(" + objJson[i].matrinhdo + ")' title='Xóa' class='icon-2 info-tooltip'></a>" +
                                            "<a href='../Admin/LevelEdit.aspx?cid=" + objJson[i].matrinhdo + "' title='Sửa' class='icon-5 info-tooltip'></a>" +
                                        "</td>" +
                                    "</tr>";
                        $("table#product-table").append(html);
                    }
                },
                error: function (e) {
                    alert(e);
                },
            });
        });

        //xóa trình độ
        function XoaTrinhDo(id) {
            $.ajax({
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                url: '/Admin/LevelViewAll.aspx/XoaTrinhDo',
                data: "{matrinhdo:'" + id + "'}",
                success: function (response) {
                    alert('Xóa trình độ thành công!!');
                    $('#Dong' + id + '').remove();
                },
                error: function (e) {
                    alert("Lỗi rồi");
                },
            });
        }
    </script>

    <div id="content">

        <div id="page-heading">
            <h1>Trình độ</h1>
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
                                        <th class="table-header-repeat line-left minwidth-1"><a href="">Tên trình độ</a>	</th>
                                        <th class="table-header-repeat line-left"><a href="">Trạng thái</a></th>
                                        <th class="table-header-repeat line-left"><a href="">Ghi chú</a></th>
                                        <th class="table-header-options line-left"><a href="">Chức năng</a></th>
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
