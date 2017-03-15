<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="StudyOnline_Nuong.Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="clear: both;"></div>
    <div id="pjax-container" class="main container
            ud-discover-withsidebar
            featured-courses
            with-sidebar
            ud-courseimpressiontracker">
        <div class="main-content container">
            <div class="wrapper-left">
                <div class="search-v2 course-search">
                    <input type="text" placeholder="Search for courses" autocomplete="off" name="q" />
                    <button type="submit" class="icon-search search-btn"></button>
                </div>
                <%-- Menu--%>
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
                <div class="context-and-filters single-header flex-wrapper ">
                    <script type="text/javascript">
                        //Ham tra ve couid lay tu url cua trinh duyet
                        function getParameterByName(name) {
                            name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
                            var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                                results = regex.exec(location.search);
                            return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
                        }
                        $(document).ready(function () {
                            var tukhoa = getParameterByName("tukhoa");
                            $("h2#TuKhoa").html(tukhoa);
                        });
                    </script>


                    <div class="l flex">
                        <p>
                            Kết quả tìm kiếm của từ khóa:
                            <h2 id="TuKhoa"> </h2>
                        </p>

                    </div>
                    <div class="r" style="float: right; margin-left: 350px;">
                         <div class="action-box price">
                            <span class="title">Giá:</span>
                            <div class="btn-group">
                                 <asp:DropDownList ID="cbGia" class="btn btn-default" Style="width: 100px;" runat="server" AutoPostBack="True" OnSelectedIndexChanged="cbGia_SelectedIndexChanged">
                                    <asp:ListItem Value="TatCa">Tất cả</asp:ListItem>
                                    <asp:ListItem Value="MienPhi">Miễn phí</asp:ListItem>
                                    <asp:ListItem Value="TraPhi">Trả phí</asp:ListItem>
                                </asp:DropDownList>


                            </div>
                        </div>
                        <div class="action-box price">
                            <span class="title">Trình độ:</span>
                            <div class="btn-group">
                                <asp:DropDownList ID="cbTrinhDo" class="btn btn-default" Style="width: 100px;" runat="server" AutoPostBack="True" OnSelectedIndexChanged="cbTrinhDo_SelectedIndexChanged">
                                   <%-- <asp:ListItem Value="TatCa">Tất cả</asp:ListItem>
                                    <asp:ListItem Value="CoBan">Cơ bản</asp:ListItem>
                                    <asp:ListItem Value="NangCao">Nâng cao</asp:ListItem>--%>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </div>

                <%-- List Lesson --%>
                <div id="discover-courses-rows">
                    <div class="ud-coursecarousel course-list-wrapper collection fullscreen-courses-with-sidebar">
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
                                                    <span>
                                                        <span class="ins-name ellipsis">
                                                             <%#Eval("TenThanhVien") %>
                                                        </span>
                                                    </span>
                                                </span>
                                              </a>
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
