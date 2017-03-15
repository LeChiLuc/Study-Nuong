<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="LessonDetail.aspx.cs" Inherits="StudyOnline_Nuong.LessonDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="ckeditor/ckeditor.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $.ajax({
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                url: '/LessonDetail.aspx/HienThiPhanHoc',
                data: "{}",//hiển thị nên k cần truyền điều kiện về server.
                dataType: "json",
                async: "true",//đồng bộ, chờ ajax khác thực thi xong
                success: function (response) {
                    var objJson = JSON.parse(response.d);
                    for (var i = 0; i < objJson.length; i++) {
                        var count = $('li#LiPhanHocMoi li ul').size() + 1;
                        var htmlPhanHoc = "<li class='chap-li ng-scope'>" +
                                            "<div class='chap-wrapper'>" +
                                                "<div class='chap-title'>" +
                                                    "<h5 class='ng-binding'>Phần " + count + ": <span class='ng-binding'>" + objJson[i].tenphanhoc + "</span></h5>" +
                                                "</div>" +
                                                "<ul>" +
                                                 "<li id='LiBaiHocMoi" + objJson[i].maphanhoc + "'></li>" +
                                               " </ul>" +
                                            "</div>" +
                                        "</li>";
                        $("li#LiPhanHocMoi").append(htmlPhanHoc);//thêm đoạn html vào thẻ li có id=LiPhanHocMoi

                        $.ajax({
                            type: 'POST',
                            contentType: 'application/json; charset=utf-8',
                            url: '/LessonDetail.aspx/HienThiBaiHoc',
                            data: "{maphanhoc:'" + objJson[i].maphanhoc + "'}",
                            dataType: "json",
                            async: "true",
                            success: function (response2) {
                                var objJson2 = JSON.parse(response2.d);//chuyển dữ liệu trả về thành kiểu JSON
                               
                                for (var j = 0; j < objJson2.length; j++) {
                                    var count2 = ($('li#LiBaiHocMoi' + objJson2[j].maphanhoc+ ' li').size()) + 1;
                                  
                                    var htmlBaiHoc = "<li class='lec-li ng-scope'>" +
                                                       "<span>" +
                                                           "<a class='lec-url block ng-scope' href=\"javascript:HienThiNoiDung('" + objJson2[j].noidungbaihoc + "','" + objJson2[j].loainoidung + "');\">" +
                                                               "<div class='lec-right'>" +
                                                                   "<div class='lec-main'>" +
                                                                       "<div class='lec-title ng-binding'>" +
                                                                          " " + count2 + ". <span class='title ng-binding'>" + objJson2[j].tenbaihoc + "</span>" +
                                                                       "</div>" +
                                                                   "</div>" +
                                                               "</div>" +
                                                           "</a>" +
                                                       "</span>" +
                                                  " </li>";
                                    $('li#LiBaiHocMoi' + objJson2[j].maphanhoc + '').append(htmlBaiHoc);
                                }
                            },
                            error: function (e) {
                                alert(e);
                            },
                        });
                    }
                },
                error: function (e) {
                    alert(e);
                },
            });

            //Hien thi bình luận
            $.ajax({
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                url: '/LessonDetail.aspx/HienThiBinhLuan',
                data: "{}",
                dataType: "json",
                success: function (response2) {
                    console.log(response2.d);
                    var objJson2 = JSON.parse(response2.d);
                    for (var j = 0; j < objJson2.length; j++) {
                        var html = "<li class='ng-scope'>" +
                                        "<span class='ng-isolate-scope'>" +
                                            "<span class='ng-scope'>" +
                                                "<div class='activity-box'>" +
                                                    "<div class='activity-header clearfix'>" +
                                                        "<div class='header-left clearfix'>" +
                                                        "<a class='ud-popover no-padding' href='#'>" +
                                                            "<span class='activity-header-link'>" +
                                                                    "<span>" + objJson2[j].thanhvien + "</span>" +
                                                              "</span>" +
                                                            "</a>" +
                                                        "</div>" +
                                                    "</div>" +

                                                    "<div>" +
                                                        "<div class='ng-scope'>" +
                                                            "<div class='activity-body'>" +
                                                                "<div class='activity-content w3c-default ng-binding'>" +
                                                                    "<p>" + objJson2[j].noidungphanhoi + "</p>" +
                                                               "</div>" +
                                                            "</div>" +
                                                        "</div>" +
                                                    "</div>" +
                                                "</div>" +
                                            " </span>" +
                                        "</span>" +
                                    "</li>";
                        $('#LiBinhLuan').append(html);
                    }
                },
                error: function (e) {
                    console.log(e);
                    // alert("Thêm thất bại, xin kiểm tra lại!");
                },
            });

        });


        function HienThiNoiDung(noidungbaihoc, loainoidung) {
         
            var noidung = "";
            if (loainoidung == "Video") {
                noidung = "<span>" +
                               "<video width='555' height='240' controls autoplay>" +
                                  "<source src=" + noidungbaihoc + " type='video/mp4'>" +
                                "</video>" +
                          "</span>";
            }
            else {
                if (loainoidung == "Text") {
                    noidung = noidungbaihoc;
                }
                else {
                    noidung="<span>" +
                                "<audio width='555' controls autoplay>" +
                                    "<source src=" + noidungbaihoc + " type='audio/mpeg'>" +
                                "</audio>"+
                            "</span>";
                }
            }
            $('#NoiDungBaiHoc').html(noidung);
        }

        function ThemBinhLuan() {
            var noidungbinhluan = $('#txtBinhLuan').val();
            $.ajax({
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                url: '/LessonDetail.aspx/ThemBinhLuan',
                data: "{noidungbinhluan:'" + noidungbinhluan + "'}",
                dataType: "json",
                success: function (response2) {
                    console.log(response2.d);
                    alert("Thêm bình luận thành công!");
                    $('#txtBinhLuan').val("");
                    var html = "<li class='ng-scope'>" +
                                    "<span class='ng-isolate-scope'>" +
                                        "<span class='ng-scope'>" +
                                            "<div class='activity-box'>" +
                                                "<div class='activity-header clearfix'>" +
                                                    "<div class='header-left clearfix'>" +
                                                    "<a class='ud-popover no-padding' href='#'>" +
                                                        "<span class='activity-header-link'>" +
                                                                "<span>" + response2.d + "</span>" +
                                                          "</span>" +
                                                        "</a>" +
                                                    "</div>" +
                                                "</div>" +

                                                "<div>" +
                                                    "<div class='ng-scope'>" +
                                                        "<div class='activity-body'>" +
                                                            "<div class='activity-content w3c-default ng-binding'>" +
                                                                "<p>" + noidungbinhluan + "</p>" +
                                                           "</div>" +
                                                        "</div>" +
                                                    "</div>" +
                                                "</div>" +
                                            "</div>" +
                                        " </span>" +
                                    "</span>" +
                                "</li>";
                    $('#LiBinhLuan').append(html);
                },
                error: function (e) {
                    console.log(e);
                    alert("Thêm thất bại, xin kiểm tra lại!");
                },
            });
        }
    </script>

    <div class="dashboard-v37 ud-angular-loader ng-scope">
        <div>
            <div class="cd-header-container clearfix">
                <div style="background: #4b6aa1" class="cd-header-image"></div>
                <div class="general-header">
                    <div class="container">
                        <div class="ins-container">
                            <a href="#" data-delay="300" data-trigger="hover" data-placement="bottom" data-fname="ud_popover" data-module-id="ud.popover" initialize-ud-widget="" class="ud-popover no-padding ins-box" show-title="course.hasSingleInstructor" is-visible="course.hasAtLeastOneVisibleInstructor" instructor="course.visibleInstructors.0" data-original-title="" title="">
                                <img class="mini-thumb" alt="" src="../Upload/User/WP_002425.jpg"/>
                                <b class="mini-title table-cel">
                                    <b class="ng-binding">
                                        <asp:Label ID="lblTenThanhVien" runat="server"></asp:Label></b>
                                </b>

                            </a>
                        </div>
                        <h1 class="course-title ellipsis">
                            <asp:Label ID="lblTenKhoaHoc" runat="server"></asp:Label></h1>
                    </div>
                </div>
            </div>

            <div class="general-main">
                <div class="container">
                    <div class="activity-container">
                        <div class="inner">
                            <div class="next-lec-thumb">
                                <div id="NoiDungBaiHoc"></div>
                            </div>
                            <!-- ngView -->
                            <div class="ng-scope">
                                <div style="margin: 7px;"></div>
                                <div class="activity-creation">
                                    <span class="thumb-wrapper">
                                        <img alt="me" class="thumb" src="../Upload/User/WP_002425.jpg" />
                                    </span>

                                    <div class="activity-submit-box">
                                        <div class="header">
                                            <a href="javascript:void(0)" class="activity-type-btn ng-scope ng-binding on">Bình luận
                                            </a>
                                        </div>
                                        <div class="activity-fields discussion-creation-pane clearfix">
                                        </div>
                                        <div class="activity-fields clearfix ng-hide">

                                            <div>
                                                <div class="ng-hide">
                                                    <textarea id="txtBinhLuan" style="height: 60px;"></textarea>
                                                    <div class="submit-row">
                                                        <input type="button" value="Gửi" class="btn btn-small btn-success btn-ask ng-binding" onclick="ThemBinhLuan()" />
                                                        <span class="or">hoặc</span>
                                                        <a href="#" class="cancel-link">Hủy bỏ</a>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>

                                    </div>
                                </div>

                                <ul class="all-activities all-activites-dashboard">
                                    <li id="LiBinhLuan"></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="lectures-container">
                        <div class="lectures-container-header-wrapper" style="width: 570px;">
                            <div class="lectures-container-header ng-hide">
                                <h4>Nội dung khóa học</h4>
                            </div>
                            <div class="completed-data">
                                <span class="you-completed ng-hide">Chào mừng bạn đến với khóa học. Chúc bạn học tốt
                                </span>
                            </div>
                        </div>
                        <div class="flex-wrapper lectures-flex-wrapper">
                            <div class="flex lectures-flex">
                                <div class="lectures-list-wrap">
                                    <ul class="lec-list">
                                        <li id="LiPhanHocMoi"></li>
                                    </ul>

                                </div>
                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
