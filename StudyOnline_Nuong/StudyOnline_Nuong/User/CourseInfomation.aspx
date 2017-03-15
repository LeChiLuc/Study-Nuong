<%@ Page Title="" Language="C#" MasterPageFile="~/User/Course.master" AutoEventWireup="true" CodeBehind="CourseInfomation.aspx.cs" Inherits="StudyOnline_Nuong.User.CourseInfomation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="form-wrapper">
        <h2>Thông tin cơ bản của khóa học</h2>
        <div class="form-errors black-tooltip none">
            <p></p>
        </div>
        <div class="manage-fields-wrapper ">
            <div id="form-item-title" class=" labeled">
                <label>Tiêu đề:</label>
                <div class="tooltip-reference" id="tooltip-reference-title">
                    <asp:TextBox ID="txtTenKhoaHoc" placeholder="e.g. Học lập trình web" class="text-input ch-count-field ud-textinput" runat="server"></asp:TextBox>
                </div>
            </div>
            <div id="form-item-headline" class=" labeled">
                <label> Mô tả:</label>
                <div class="tooltip-reference" id="tooltip-reference-headline">
                    <asp:TextBox ID="txtMoTa" TextMode="MultiLine" runat="server" placeholder="e.g. abc" Style="resize: none; overflow: auto;" class="ud-form ch-count-field ud-textinput "></asp:TextBox>
                </div>
            </div>
            <div id="Div3" class=" labeled">
                <label>Giá:</label>
                <div class="tooltip-reference" id="Div4">
                    <asp:TextBox ID="txtGia" placeholder="e.g. Nhập giá khóa học" class="text-input ch-count-field ud-textinput" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class=" labeled">
                <label> Ảnh đại diện:</label>
                <div class="tooltip-reference">
                    <asp:FileUpload ID="fuAnhDaiDien" runat="server" />
                </div>
            </div>
            <div id="form-item-courseCategoryId" class="two-cols first labeled">
                <label>Chuyên mục:</label>
                <div class="tooltip-reference">
                    <asp:DropDownList ID="cbChuyenMuc" runat="server"></asp:DropDownList>
                </div>
            </div>

            <div id="Div1" class="two-cols second labeled">
                <label>Trình độ:</label>
                <div class="tooltip-reference" id="Div2">
                    <asp:DropDownList ID="cbTrinhDo" runat="server"></asp:DropDownList>
                </div>
            </div>
        </div>
        <div class="submit-row">
            <asp:Button ID="btnSave" class="btn btn-success" runat="server" Text="Save" OnClick="btnSave_Click" />
        </div>
    </div>

</asp:Content>
