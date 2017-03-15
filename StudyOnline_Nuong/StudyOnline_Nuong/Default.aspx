<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="StudyOnline_Nuong.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="main container ud-discover-withsidebar featured-courses with-sidebar">

        <%-- Slider --%>
        <%--   <script type="text/javascript">
            $(document).ready(function () {
                $('#slider1').cycle({
                });
            });
        </script>--%>

        <div class="top course-discover-top">
            <div class="slider-wrapper">
                <div class="slider-container">
                    <div class="ud-slider slider">
                        <ul class="slide-this" style="left: 0px;" id="slider1">
                            <li style="background: #4b6aa1" class="b">
                                <a href="#">
                                    <img src="/Upload/Slider/1.jpg" />
                                </a>
                            </li>
              
                        </ul>
                        <nav>
                            <div class="container">
                                <span class="prev on"></span>
                                <span class="next on"></span>
                            </div>
                        </nav>
                    </div>
                </div>
            </div>
        </div>


        <%--   <uc3:_Slider ID="_Slider1" runat="server" />--%>
        <div class="container">
            <div class="main-content">
                <div class="wrapper-left">
                   

                    <%-- Chuyên mục --%>
                    <div class="category-names">
                        <div class="categories">
                            <h4>CHUYÊN MỤC</h4>
                            <ul>
                                <asp:Repeater runat="server" ID="rpChuyenMuc">
                                    <ItemTemplate>
                                        <li class="discover-course-category">
                                            <a class="" href='../Category.aspx?cmid=<%#Eval("MaChuyenMuc") %>'><%#Eval("TenChuyenMuc") %></a>
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>

                            </ul>
                        </div>
                    </div>

                </div>

                <div class="wrapper-right">
                    <%-- List Lesson by Category --%>
                    <div id="discover-courses-rows">
                        <asp:Repeater runat="server" ID="rpNoiDungChuyenMucCha" OnItemDataBound="rpNoiDungChuyenMucCha_ItemDataBound">
                            <ItemTemplate>
                                <asp:HiddenField ID="hfMaChuyenMuc" Value='<%#Eval("MaChuyenMuc") %>' runat="server" />
                                <div class="ud-coursecarousel course-list-wrapper collection fullscreen-courses-with-sidebar">
                                    <div class="courses-header">
                                        <div class="left-items">
                                            <a href='../Category.aspx?cmid=<%#Eval("MaChuyenMuc") %>' class="show-all-toggle">
                                                <h4 class="list-title ellipsis"><%#Eval("TenChuyenMuc") %></h4>
                                            </a>
                                        </div>
                                    </div>

                                    <div class="discover-courses-list-mask">
                                        <ul class="discover-courses-list one-line">
                                            <asp:Repeater runat="server" ID="rpNoiDungChuyenMucCon">
                                                <ItemTemplate>
                                                    <li class="course-box small">

                                                        <a class="mask" href='/Course.aspx?cou=<%#Eval("MaKhoaHoc") %>'>
                                                            <span class="course-thumb">
                                                                <img src='<%#Eval("AnhDaiDien") %>'>
                                                            </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                            <span class="title"><%#Eval("TenKhoaHoc") %></span><span class="details2">
                                                                <span class="price-col"><span class="gray">Giá</span>
                                                                    <span class="green"><%#Eval("Gia") %> VND</span>
                                                                </span>
                                                                <span class="reviews-col">
                                                                    <span class="gray">Lượt xem</span>
                                                                    <span class="count"><%#Eval("LuotXem") %> </span>
                                                                </span>
                                                                <span class="users-col">
                                                                    <span class="gray">Học viên</span>
                                                                    <span class="count"><%#Eval("SoHocVien") %></span>
                                                                </span>
                                                            </span>
                                                            <span class="instructors">
                                                                <span >
                                                                    <span class="ins-name ellipsis">
                                                                        <%#Eval("TenThanhVien") %>
                                                                    </span>
                                                                </span>
                                                            </span>
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                                                    </li>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </ul>
                                    </div>

                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>

                    <%--  <uc1:_listlesson id="_ListLesson1" runat="server" />--%>
                </div>
            </div>
        </div>

    </div>
</asp:Content>
