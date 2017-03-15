<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="CategoryEdit.aspx.cs" Inherits="StudyOnline_Nuong.Admin.CategoryEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- start content-outer -->
    <div id="content-outer">
        <!-- start content -->
        <div id="content">
            <div id="page-heading">
                <h1>Sửa Chuyên mục</h1>
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
                                                <th valign="top">Tên chuyên mục:</th>
                                                <td>
                                                    <asp:TextBox ID="txtTenChuyenMuc" class="inp-form" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th valign="top">Chuyên mục cha:</th>
                                                <td>
                                                    <asp:DropDownList ID="cbChuyenMucCha" class="styledselect_form_1" runat="server"></asp:DropDownList>
                                                </td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <th valign="top">Loại chuyên mục:</th>
                                                <td>
                                                    <asp:DropDownList ID="cbLoaiChuyenMuc" class="styledselect_form_1" runat="server">
                                                        <asp:ListItem Value="frontend">Frontend</asp:ListItem>
                                                        <asp:ListItem Value="backend">Backend</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <th valign="top">Link:</th>
                                                <td>
                                                    <asp:TextBox runat="server" ID="txtLink" class="inp-form" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <th valign="top">Thứ tự:</th>
                                                <td>
                                                    <asp:TextBox runat="server" ID="txtThuTu" class="inp-form" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <th valign="top">Trạng thái:</th>
                                                <td>
                                                    <asp:DropDownList ID="cbTrangThai" class="styledselect_form_1" runat="server">
                                                        <asp:ListItem Value="True">Hoạt động</asp:ListItem>
                                                        <asp:ListItem Value="False">Không hoạt động</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <th valign="top">Ghi chú:</th>
                                                <td>
                                                    <asp:TextBox runat="server" ID="txtGhiChu" TextMode="MultiLine" class="form-textarea"></asp:TextBox></td>
                                                <td></td>
                                            </tr>

                                            <tr>
                                                <th>&nbsp;</th>
                                                <td valign="top">
                                                    <asp:Button runat="server" class="form-submit" ID="btnLuu" OnClick="btnLuu_Click" />
                                                    <asp:Button runat="server" class="form-reset" ID="btnReset" OnClick="btnReset_Click" />
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
