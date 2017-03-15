<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Course.aspx.cs" Inherits="StudyOnline_Nuong.Course" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="sticky-footer-wrapper">
        <div id="slp-wrap" class="clearfix ud-page">
            <div class="landing-3col clearfix">
                <div class="container">
                    <div class="rc">
                        <div class="pb prox">
                            <div class="pb-t">
                                <div class="pb-p">
                                    <span class="pb-ph">GIÁ:</span>
                                    <span class="pb-pr ">
                                        <asp:Label ID="lblGia" runat="server"></asp:Label>
                                    </span>
                                </div>
                                <div class="pb-ta">
                                    <asp:Button ID="btnBatDauHoc" class="btn btn-primary btn-lg" runat="server" Text="Bắt đầu học ngay" OnClick="btnBatDauHoc_Click" />
                                </div>
                            </div>

                        </div>
                        <div class="mco prox">
                            <h5 class="mco-h">KHÓA HỌC CÙNG CHUYÊN MỤC:</h5>
                            <ul class="mco-ul ud-courseimpressiontracker">
                                <asp:Repeater runat="server" ID="rpKhoaHocCungChuyenMuc">
                                    <ItemTemplate>
                                        <li class="mco-li">
                                            <div class="mco-l">
                                                <a href='../Course.aspx?cou=<%#Eval("MaKhoaHoc") %>' class="mco-tha">
                                                    <img width="75" height="75" class="mco-th" src='<%#Eval("AnhDaiDien") %>' alt="<%#Eval("TenKhoaHoc") %>">
                                                </a>
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            </div>
                                            <div class="mco-r">
                                                <a href='../Course.aspx?cou=<%#Eval("MaKhoaHoc") %>' class="mco-n"><%#Eval("TenKhoaHoc") %></a>
                                                <span class="mco-p"><%#Eval("Gia") %> VND</span></div>
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>

                            </ul>
                        </div>

                    </div>
                    <div class="lc">
                        <div class="cth-wr">
                            <div class="slp-promo-asset">
                                <asp:Image ID="imgAnhDaiDien"  width="270" height="200" runat="server" />
                            </div>
                        </div>

                        <div class="tb">
                            <h5 class="tb-h">GIỚI THIỆU KHÓA HỌC</h5>
                            <ul class="tb-ul">
                                <li class="tb-li">

                                    <div class="tb-bot collapsable-text compressed" style="height: 220px;">
                                        <div class="w3c-default">
                                            <asp:Literal ID="ltrMoTa" runat="server"></asp:Literal>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="mc">
                        <div class="ci prox">
                            <h2 class="ci-h">
                                <asp:Label ID="lblTenKhoaHoc" runat="server"></asp:Label>
                            </h2>
                        </div>
                        <div class="cd-c">
                            <b>Chuyên mục:</b><asp:HyperLink ID="hylChuyenMuc" class="cd-ca" runat="server"></asp:HyperLink>
                        </div>
                        <div class="cc">
                            <h4 class="cc-h lh">
                                <b>CẤU TRÚC KHÓA HỌC</b>
                            </h4>
                            <div class="nlp-lectures-container landing-lecs landing-3col-lecs">
                                <div class="lectures-list-wrap">
                                    <ul class="lec-list">
                                        <asp:Repeater runat="server" ID="rpPhanHoc" OnItemDataBound="rpPhanHoc_ItemDataBound">
                                            <ItemTemplate>
                                                <asp:HiddenField ID="hfMaPhanHoc" Value='<%#Eval("MaPhanHoc") %>' runat="server" />
                                                <li class="chap-li">
                                                    <div class="chap-wrapper">
                                                        <div class="chap-title">
                                                            <b>Phần học:</b>
                                                            <h5><%#Eval("TenPhanHoc") %></h5>
                                                        </div>
                                                        <ul>
                                                            <asp:Repeater runat="server" ID="rpBaiHoc">
                                                                <ItemTemplate>
                                                                    <li class="lec-li">
                                                                        <div class="lec">
                                                                            <div class="lec-left">
                                                                                <span class="course-no"></span>
                                                                            </div>
                                                                            <div class="lec-right ud-courseimpressiontracker ud-popup">
                                                                                <div class="lec-url">
                                                                                    <div class="lec-main">
                                                                                        <div class="lec-title">
                                                                                            <%#Eval("TenBaiHoc") %>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                        </ul>
                                                    </div>
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
        </div>
    </div>
    <div style="clear:both;"></div>
</asp:Content>
