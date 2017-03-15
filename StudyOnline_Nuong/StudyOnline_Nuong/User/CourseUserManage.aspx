<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="CourseUserManage.aspx.cs" Inherits="StudyOnline_Nuong.User.CourseUserManage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="ud-angular-loader my-courses-v39 ng-scope" data-module-id="my-courses.app/app" data-module-name="myCoursesApp">
        <script type="text/javascript">
            $(document).ready(function () {
                ThanhVien_KhoaHoc("Hoc");
            });
            function ThanhVien_KhoaHoc(loai) {
                //alert(loai);
                console.log(loai);
                $.ajax({
                    type: 'POST',
                    contentType: 'application/json; charset=utf-8',
                    url: '/User/CourseUserManage.aspx/HienThiThanhVien_KhoaHoc',
                    data: "{loai:'" + loai + "'}",
                    dataType: "json",
                    async: "true",
                    success: function (response) {
                        var objJson = JSON.parse(response.d);
                        var html = "";
                        for (var i = 0; i < objJson.length; i++) {
                            if (loai == 'Day') {
                                //console.log(response);
                                html = html + "  <li class='course-box small'>" +
                                                    "<a class='mask' href='../User/CourseInfomation.aspx?couid=" + objJson[i].makhoahoc + "'>" +
                                                        "<span class='course-thumb'>" +
                                                           "<img src='" + objJson[i].anhdaidien + "'/>" +
                                                        "</span>" +
                                                        "<span class='title'>" + objJson[i].tenkhoahoc + "</span>" +
                                                    "</a>" +
                                                "</li>";
                            }
                            else if (loai == 'Hoc') {
                                //alert(1);
                                html = html + " <li class='course-box small'>" +
                                                    "<a class='mask' href='../LessonDetail.aspx?detail=" + objJson[i].makhoahoc + "'>" +
                                                        "<span class='course-thumb'>" +
                                                           "<img src='" + objJson[i].anhdaidien + "'/>" +
                                                        "</span>" +
                                                        "<span class='title'>" + objJson[i].tenkhoahoc + "</span>" +
                                                    "</a>" +
                                                "</li>";
                            }
                        }
                        // console.log(html);
                        $("li#KhoaHoc").html(html);
                    },
                    error: function (e) {
                        alert(e);
                    },
                });
            }
        </script>



        <div class="bbw1 bc-gray-lighter bg-white-smoke">
            <div class="container">
                <div class="main-nav fxw fxae prox">
                    <h2 class="main-heading m0 light fs30 fwn lh1">Khóa học của tôi</h2>
                    <div class="fx mr15">
                        <ul class="fr fs0 tabs">
                            <li>
                                <a href="javascript:ThanhVien_KhoaHoc('Hoc')" class="fs18 color-black link m0-5 pb20 pl10 pr10 on">Học</a>
                            </li>
                            <li>
                                <a href="javascript:ThanhVien_KhoaHoc('Day')" class="fs18 color-black link m0-5 pb20 pl10 pr10">Dạy</a>
                            </li>
                        </ul>
                    </div>

                    <div class="search-box-container pos-r top10">
                        <div class="search-box fxw fxac on">
                            <div class="fxw ng-pristine ng-invalid ng-invalid-required">
                                <input type="text" placeholder="Tìm kiếm khóa học của bạn" class="field ng-pristine ng-invalid ng-invalid-required" />
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <div class="bg-white-smoke-light">
            <div class="container">
                <!-- ngView:  -->
                <div style="padding-bottom: 40px;" class="ng-scope">
                    <div class="fxw fxac filter-and-pagination ng-scope">
                        <div class="flex">
                            <div class="btn-group filter-ddown white-ddown w200">
                                <div class="create-course-btn ng-scope">
                                    <a class="btn btn-success" href="../User/CourseCreate.aspx">
                                        <%-- <i class="icon-plus-sign" style="margin-right: 5px;"></i>--%>
                                        Tạo khóa học    
                                    </a>
                                </div>

                            </div>
                        </div>
                    </div>
                    <ul class="my-course-box-wrapper ng-scope">
                        <li id="KhoaHoc"></li>
                    </ul>

                </div>
            </div>
        </div>

    </div>
</asp:Content>
