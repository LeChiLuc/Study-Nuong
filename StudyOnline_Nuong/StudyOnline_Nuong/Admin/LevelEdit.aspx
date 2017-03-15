<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="LevelEdit.aspx.cs" Inherits="StudyOnline_Nuong.Admin.LevelEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- start content-outer -->
    <div id="content-outer">
        <!-- start content -->
        <div id="content">
            <div id="page-heading">
                <h1>Sửa Trình độ</h1>
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
                                                <th valign="top">Tên trình độ:</th>
                                                <td>
                                                    <asp:textbox id="txtTenTrinhDo" class="inp-form" runat="server"></asp:textbox>
                                                </td>
                                            </tr>
                                          
                                            <tr>
                                                <th valign="top">Trạng thái:</th>
                                                <td>
                                                    <asp:dropdownlist id="cbTrangThai" class="styledselect_form_1" runat="server">
                                                        <asp:ListItem Value="True">Hoạt động</asp:ListItem>
                                                        <asp:ListItem Value="False">Không hoạt động</asp:ListItem>
                                                    </asp:dropdownlist>
                                                </td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <th valign="top">Ghi chú:</th>
                                                <td>
                                                    <asp:textbox runat="server" id="txtGhiChu" textmode="MultiLine" class="form-textarea"></asp:textbox>
                                                </td>
                                                <td></td>
                                            </tr>

                                            <tr>
                                                <th>&nbsp;</th>
                                                <td valign="top">
                                                    <asp:button runat="server" class="form-submit" id="btnLuu" onclick="btnLuu_Click" />
                                                    <asp:button runat="server" class="form-reset" id="btnReset" onclick="btnReset_Click" />
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
