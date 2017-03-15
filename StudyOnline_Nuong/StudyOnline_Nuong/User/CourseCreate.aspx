<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="CourseCreate.aspx.cs" Inherits="StudyOnline_Nuong.User.CourseCreate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="teachv4">
        <div id="r1">
            <div class="container">
                <h1 class="everything">Tất cả mọi thứ để bạn cần dạy trực tuyến.</h1>
           
                <div class="flex-wrapper top-items">
                    <div class="tl flex">
                        <div class="who">
                            <div class="ud-slider slider ins-slider">
                                <ul style="left: 0px;" class="slide-this">
                                    <li>
                                        <img src="/Images/createcourse.png"/>
                                    </li>
                                </ul>
                            </div>
                            <h1>Ai có thể dạy? Chính bạn!</h1>
                            <p>
                                TMCEdu giúp bạn tạo khóa học và dạy trực tuyến. Chúng tôi khuyến khích các khóa học chất lượng giúp người dạy nâng cáo kỹ năng giao tiếp quyết định sự thành công của bạn.
                            </p>
                        </div>
                    </div>
                    <div class="tr flex">
                        <div class="become-form white-box">
                            <h2 class="wbg">Tạo khóa học</h2>
                            <div class="user-form-wrapper">
                                <div class="fields signup-form user-form">
                                    <div id="create-course-form">
                                        <div class="manage-fields-wrapper ">
                                            <div class=" labeled" id="form-item-title">
                                                <label>Bạn muốn dạy gì?:</label>
                                                <div id="tooltip-reference-title" class="tooltip-reference">
                                                    <asp:TextBox ID="txtTenKhoaHoc" class="text-input ch-count-field ud-textinput" placeholder="e.g. Lập trình website" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="submit-row">
                                            <asp:Button ID="btnLuuKhoaHoc" runat="server" class="btn btn-success" Text="Tạo khóa học" OnClick="btnLuuKhoaHoc_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</asp:Content>
