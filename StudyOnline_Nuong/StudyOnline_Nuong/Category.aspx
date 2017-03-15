<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="StudyOnline_Nuong.Category" %>

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
                <%-- Menu--%>
                <div class="category-names">
                    <div class="categories">
                        <h4>CHUYÊN MỤC</h4>
                        <ul>
                            <asp:Repeater runat="server" ID="rpChuyenMuc">
                                <ItemTemplate>
                                    <li class="discover-course-category">
                                        <a class="" href='../Category.aspx?cmid=<%#Eval("MaChuyenMucCha") %>&chuyenmucon_id=<%#Eval("MaChuyenMuc") %>'><%#Eval("TenChuyenMuc") %></a>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="wrapper-right">
                <div class="context-and-filters single-header flex-wrapper ">
                    <div class="l flex">
                        <h2>
                            <asp:Label ID="lblTenChuyenMuc" runat="server"></asp:Label>
                        </h2>
                        <p>
                            <asp:Label ID="lblMoTaChuyenMuc" runat="server"></asp:Label>
                        </p>
                    </div>
                    <div class="r" style="margin-left: 200px;">
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
                                  <%--  <asp:ListItem Value="TatCa">Tất cả</asp:ListItem>
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

                <div style="margin-top: 20px;" class="ajax-loader-stick none"></div>
                <div style="text-align: center; margin-top: 30px;"></div>
                <div class="pagination courses-list-pagination pagination-centered">

                    <ul class="pagination ">
                        <li class="firstselected selected">
                            <div><a href="#">1</a></div>
                        </li>
                        <li>
                            <div><a href="#">2</a></div>
                        </li>
                        <li>
                            <div><a href="#">3</a></div>
                        </li>
                        <li>
                            <div><a href="#">4</a></div>
                        </li>
                        <li>
                            <div><a href="#">5</a></div>
                        </li>
                        <li class="last">
                            <div><a href="#">Next</a></div>
                        </li>
                    </ul>

                </div>
            </div>
        </div>
    </div>

</asp:Content>
