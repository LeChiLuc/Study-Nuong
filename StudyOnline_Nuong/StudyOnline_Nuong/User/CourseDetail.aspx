<%@ Page Title="" Language="C#" MasterPageFile="~/User/Course.master" AutoEventWireup="true" CodeBehind="CourseDetail.aspx.cs" Inherits="StudyOnline_Nuong.User.CourseDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <script type="text/javascript">
        
        //Ham tra ve couid lay tu url cua trinh duyet
        function getParameterByName(name) {
            name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
            var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                results = regex.exec(location.search);
            return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
        }
        //Bài học
        $(document).ready(function () {
            var makhoahoc = getParameterByName('couid');
            $.ajax({
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                url: '/User/CourseDetail.aspx/HienThiPhanHoc',
                data: "{makhoahoc:'" + makhoahoc + "'}",
                dataType: "json",
                async: "true",
                success: function (response) {
                    console.log(response);
                    var objJson = JSON.parse(response.d);
                    for (var i = 0; i < objJson.length; i++) {
                        var html = HTMLPhanHoc(objJson[i].maphanhoc, objJson[i].tenphanhoc);
                        $('li#LiPhanHocMoi').append(html);
                        $.ajax({
                            type: 'POST',
                            contentType: 'application/json; charset=utf-8',
                            url: '/User/CourseDetail.aspx/HienThiBaiHoc',
                            data: "{maphanhoc:'" + objJson[i].maphanhoc + "'}",
                            dataType: "json",
                            async: "true",
                            success: function (response2) {
                                //alert(2);
                                console.log(response2.d);
                                var objJson2 = JSON.parse(response2.d);
                                for (var j = 0; j < objJson2.length; j++) {
                                    //console.log(j);
                                    var html2 = ScriptBaiHoc(objJson2[j].mabaihoc) + HTMLBaiHoc(objJson2[j].mabaihoc, objJson2[j].tenbaihoc, objJson2[j].maphanhoc);
                                    //alert(html);
                                    $('li#LiBaiHocMoi' + objJson2[j].maphanhoc + '').append(html2);
                                    //UlPhanHoc1
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
        });

        function HTMLBaiHoc(id, tenbaihoc, maphanhoc) {
            var count = ($('li#LiBaiHocMoi' + maphanhoc + ' li').size() / 2) + 1;
            var html = "<li class='cfi-lecture cfi-add-form editing opened' id='LiEditForm" + id + "' style='display: none;'>" +
                        "<span class='content ui-state-default'>" +
                            "<span class='cfi-item-type'>Bài học</span>" +
                            "<span class='cfi-item-number'>:</span>" +
                            "<span class='cfi-item-title'>" +
                                "<div id='add-lecture-form'>" +
                                    "<div class='manage-fields-wrapper '>" +
                                        "<div class=' non-labeled' id='form-item-title'>" +
                                            "<div id='tooltip-reference-title' class='tooltip-reference'>" +
                                                "<input id='TitleBH" + id + "' name='title' type='text' class='text-input ch-count-field ud-textinput ' placeholder='Điền nội dung'>" +
                                            "</div>" +
                                        "</div>" +
                                    "</div>" +
                                    "<div class='submit-row'>" +
                                        "<input value='Lưu bài học' id='btnSuaTenBaiHoc" + id + "' class='btn btn-success' onclick='SuaTenBaiHoc(" + id + ")'>" +
                                       " or <a class='cancel-link ' data-wrapcss='static-content-wrapper' id='btnCancel" + id + "' href='javascript:void(0)'>Hủy bỏ </a>" +
                                    "</div>" +
                                "</div>" +
                            "</span>" +
                            "<span class='js-delete-handle delete-handle' onclick='XoaBaiHoc(" + id + ")'></span>" +
                       "</span>" +
                    "</li>" +

                     "<li class='cfi-lecture cfi-sortable show-container' id='LiBH" + id + "'>" +
                        "<div class='cfi-content opened'>" +
                            "<span class='content ui-state-default'>" +
                                "<span class='cfi-item-type'>Bài học</span>" +
                               "<span class='cfi-item-number'>" + count + ":</span>" +
                                "<span class='cfi-item-title' id='SpanTitleBH" + id + "'>" + tenbaihoc + "</span>" +
                                "<span class='edit-handle' id='edit_handle_bh" + id + "'></span>" +
                                "<a href='javascript:void(0)' id='BH" + id + "' class='add-content btn btn-small btn-inverse container-switch floating' style='display:block;'>+ Thêm nội dung</a>" +
                                "<span class='collapse-btn container-switch none'></span>" +
                            "</span>" +
                       "</div>" +

                       "<div class='gray-container has-header tablet-m0' id='DivThemNDBH" + id + "' style='display: none;'>" +
                            "<div class='header'>" +
                                "Chọn loại nội dung" +
                                "<a class='close-btn container-switch close-btn-bh" + id + "' href='javascript:void(0)'></a>" +
                            "</div>" +
                            "<div class='main types'>" +
                                "<a id='btnThemVideo" + id + "'  class='lecture-icons video' data-type='Video' href='javascript:void(0)'>" +
                                    "<span>Video</span>" +
                                "</a>" +
                               " <a id='btnThemAudio" + id + "' class='lecture-icons audio' data-type='Audio' href='javascript:void(0)'>" +
                                   " <span>Audio</span>" +
                                "</a>" +
                                "<a id='btnThemText" + id + "' class='lecture-icons article' data-type='Article' href='javascript:void(0)'>" +
                                    "<span>Text</span>" +
                                "</a>" +
                            "</div>" +
                           "</div>" +

                         //Video 
                       " <div id='DivThemVideo" + id + "' class='gray-container has-header tablet-m0' style='display: none;'>" +
                            "<div class='header'>" +
                                "Thêm Video" +
                           " <a class='close-btn container-switch close-btn-bh" + id + "' href='javascript:void(0)'></a>" +
                            "</div>" +
                            "<div class='main create-asset-container ud-assetcreator' data-type='Video' data-shouldattachlecture='1'>" +
                                "<div class='tab-divs'>" +
                                    "<div class='upload-asset-container show'>" +
                                       " <div class='ud-assetcreator-fileuploader' data-type='Video' data-shouldattachlecture='1' data-s3='1'>" +
                                           " <div class='ud-s3upload'>" +
                                               " <div id='fine-uploader-1395888670'>" +
                                                  "  <div class='flex-wrapper' style='margin-top: 20px;'>" +
                                                      "  <div class='flex'>" +
                                                         "<input id='xFilePath"+id+"' name='FilePath' type='text' size='60' />" +
                                                          " <ul class='qq-upload-list-selector qq-upload-list none'></ul>" +
                                                        "</div>" +
                                                        "<div style='margin-left: 20px;'>" +
                                                               " <input class='qq-upload-button-selector qq-upload-button btn btn-success' type='button' value='Browse Server' onclick=\"BrowseServer('xFilePath"+id+"');\" />" +
                                                        "</div>" +
                                                        
                                                    "</div>" +
                                                     " <div class='submit-row'>" +
                                                                "<input type='button' value='Lưu' id='btnSaveVideo" + id + "' onclick=\"SuaNoiDungBaiHoc_Video(" + id + ",'" + tenbaihoc + "')\" class='btn btn-success' data-loading-text='Save'>" +
                                                          "</div>" +
                                                "</div>" +
                                            "</div>" +
                                          "</div>" +
                                    "</div>" +
                                "</div>" +
                            "</div>" +
                        "</div>" +

                        //Thêm Audio 
                       " <div id='DivThemAudio" + id + "' class='gray-container has-header tablet-m0' style='display: none;'>" +
                            "<div class='header'>" +
                                "Thêm Audio" +
                           " <a class='close-btn container-switch close-btn-bh" + id + "' href='javascript:void(0)'></a>" +
                            "</div>" +
                            "<div class='main create-asset-container ud-assetcreator' data-type='Video' data-shouldattachlecture='1'>" +
                                "<div class='tab-divs'>" +
                                    "<div class='upload-asset-container show'>" +
                                       " <div class='ud-assetcreator-fileuploader' data-type='Video' data-shouldattachlecture='1' data-s3='1'>" +
                                           " <div class='ud-s3upload'>" +
                                               " <div id='fine-uploader-1395888670'>" +
                                                  "  <div class='flex-wrapper' style='margin-top: 20px;'>" +
                                                      "  <div class='flex'>" +
                                                         "<input id='xFilePathAudio" + id + "' name='FilePathAudio' type='text' size='60' />" +
                                                          " <ul class='qq-upload-list-selector qq-upload-list none'></ul>" +
                                                        "</div>" +
                                                        "<div style='margin-left: 20px;'>" +
                                                               " <input class='qq-upload-button-selector qq-upload-button btn btn-success' type='button' value='Browse Server' onclick=\"BrowseServer('xFilePathAudio" + id + "');\" />" +
                                                        "</div>" +

                                                    "</div>" +
                                                     " <div class='submit-row'>" +
                                                                "<input type='button' value='Lưu' id='btnSaveAudio" + id + "' onclick=\"SuaNoiDungBaiHoc_Audio(" + id + ",'" + tenbaihoc + "')\" class='btn btn-success'>" +
                                                          "</div>" +
                                                "</div>" +
                                            "</div>" +
                                          "</div>" +
                                    "</div>" +
                                "</div>" +
                            "</div>" +
                        "</div>" +


                         //Thêm Text
                        "<div id='DivThemText" + id + "' class='gray-container has-header tablet-m0' style='display: none;'>" +
                            "<div class='header'>" +
                              "  Thêm Text" +
                               " <a class='close-btn container-switch close-btn-bh" + id + "' href='javascript:void(0)'></a>" +
                           " </div>" +
                            "<div class='asset-create-container'>" +
                              "  <div class='main create-asset-container ud-articlecreator' data-type='Article'>" +
                                    "<div class='upload-asset-container show'>" +
                                       " <div id='add-article-form' name='add-article-form'>" +
                                            "<div class='manage-fields-wrapper '>" +
                                                //editor
                                                "<textarea id='editorBH" + id + "' style='width=100px;'></textarea>" +
                                            "</div>" +
                                           " <div class='submit-row'>" +
                                                "<input type='button' value='Save' id='btnSave" + id + "' onclick=\"SuaNoiDungBaiHoc_Text(" + id + ",'" + tenbaihoc + "',CKEDITOR.instances.editorBH" + id + ".getData())\" class='btn btn-success' data-loading-text='Save'>" +
                                            "</div>" +
                                        "</div>" +
                                    "</div>" +
                               " </div>" +
                            "</div>" +
                        "</div>" +
                   "</li>";
            return html;
        }

        function ScriptBaiHoc(id) {
            var script = "<script type='text/javascript'>" +
                            " $(function () {" +

                                 "$('a#BH" + id + "').click(function () {" +//click vào them nôi dung
                                      "if ($('div#DivThemNDBH" + id + "').css('display') == 'none') {" + //nếu chưa hiển thị (audio, text)
                                          "$('div#DivThemNDBH" + id + "').show();" +
                                      "} else {" +
                                         " $('div#DivThemNDBH" + id + "').hide();" +
                                      "}" +

                                      "$('a#BH" + id + "').css('display','none');" +//nút chọn thêm nội dung ẩn đi.
                                  "});" +

                                  "$('a.close-btn-bh" + id + "').click(function () {" + 
                                      "$('div#DivThemNDBH" + id + "').hide();" +
                                      "$('div#DivThemVideo" + id + "').hide();" +
                                      "$('div#DivThemAudio" + id + "').hide();" +
                                      "$('div#DivThemText" + id + "').hide();" +
                                      "$('a#BH" + id + "').css('display','block');" + //hiện nút chọn nội dung
                                  "});" +

                                 " $('a#btnThemVideo" + id + "').click(function () {" +
                                      "$('div#DivThemNDBH" + id + "').hide();" +
                                      "$('div#DivThemVideo" + id + "').show();" +
                                      "$('div#DivThemAudio" + id + "').hide();" +
                                  "});" +

                                  " $('a#btnThemAudio" + id + "').click(function () {" +
                                      "$('div#DivThemNDBH" + id + "').hide();" +
                                      "$('div#DivThemVideo" + id + "').hide();" +
                                      "$('div#DivThemAudio" + id + "').show();" +
                                  "});" +


                                 "var editor" + id + ", html = '';" +
                                 "$('a#btnThemText" + id + "').click(function () {" +
                                     "$('div#DivThemNDBH" + id + "').hide();" +
                                     "$('div#DivThemText" + id + "').show();" +
                                      //editor
                                     "CKEDITOR.replace( 'editorBH" + id + "');" +
                                  "});" +

                                  " $('span#edit_handle_bh" + id + "').click(function () {" +
                                      "$('li#LiBH" + id + "').hide();" +
                                      "$('li#LiEditForm" + id + "').show();" +
                                  "});" +

                                   "$('a#btnCancel" + id + "').click(function () {" +
                                        "$('li#LiEditForm" + id + "').hide();" +
                                        "$('li#LiBH" + id + "').show();" +
                                   "});" +

                             " });" +
                  "<\/script>";
            return script;
        }

        function HTMLPhanHoc(id, tenphanhoc) {
            var count = $('li#LiPhanHocMoi li ul').size() + 1;
            var html = "<li class='cfi-lecture cfi-add-form editing opened' id='LiEditFormPH" + id + "' style='display: none;'>" +
                        "<span class='content ui-state-default'>" +
                            "<span class='cfi-item-type'>Phần học</span>" +
                            "<span class='cfi-item-number'>:</span>" +
                            "<span class='cfi-item-title'>" +
                                "<div id='add-lecture-form'>" +
                                    "<div class='manage-fields-wrapper '>" +
                                        "<div class=' non-labeled' id='form-item-title'>" +
                                            "<div id='tooltip-reference-title' class='tooltip-reference'>" +
                                                "<input id='TitlePH" + id + "' name='title' type='text' class='text-input ch-count-field ud-textinput ' placeholder='Điền nội dung'>" +
                                            "</div>" +
                                        "</div>" +
                                    "</div>" +
                                    "<div class='submit-row'>" +
                                        "<input value='Lưu phần học' class='btn btn-success' onclick='SuaPhanHoc(" + id + ")'>" +
                                       " or <a class='cancel-link ' onclick='btnCancelPH(" + id + ")' id='btnCancelPH" + id + "' href='javascript:void(0)'>Hủy bỏ </a>" +
                                    "</div>" +
                                "</div>" +
                            "</span>" +
                            "<span class='js-delete-handle delete-handle' onclick='XoaPhanHoc(" + id + ")'></span>" +
                       "</span>" +
                    "</li>" +

                       "<li> " +
                       "<ul id='UlPhanHoc" + id + "' class='cfi-sortables-list ud-jq-sortable ui-sortable' data-placeholder='ui-state-highlight' data-handle='.cfi-content' data-tolerance='pointer'>" +
                       "<li class='cfi-chapter cfi-sortable' data-type='chapter' id='LiPH" + id + "'>" +
                            "<div class='cfi-content opened'>" +
                                "<span class='content ui-state-default'>" +
                                    "<span class='cfi-item-type'>Phần</span>" +
                                   "<span class='cfi-item-number'>" + count + ":</span>" +
                                    "<span class='cfi-item-title' id='SpanTitlePH" + id + " '>" + tenphanhoc + "</span>" +
                                    "<span class='edit-handle' onclick='edit_handle_ph(" + id + ")'></span>" +
                                "</span>" +
                            "</div>" +
                        "</li>" +

                        "<li id='LiBaiHocMoi" + id + "'></li>" +

                        "<li class='cfi-lecture cfi-add-form editing opened' id='LiAddFormBH" + id + "' style='display: none;'>" +
                            "<span class='content ui-state-default'>" +
                                "<span class='cfi-item-type'>Bài học</span>" +
                                "<span class='cfi-item-number'>:</span>" +
                                "<span class='cfi-item-title'>" +
                                    "<div id='add-lecture-form'>" +
                                        "<div class='manage-fields-wrapper '>" +
                                            "<div class=' non-labeled' id='form-item-title'>" +
                                                "<div id='tooltip-reference-title' class='tooltip-reference'>" +
                                                    "<input id='TitleBH" + id + "' name='title' type='text' class='text-input ch-count-field ud-textinput ' placeholder='Điền nội dung'>" +
                                                "</div>" +
                                            "</div>" +
                                        "</div>" +
                                        "<div class='submit-row'>" +
                                            "<input value='Lưu bài học' id='btnLuuBaiHoc' onclick='LuuBaiHoc(" + id + ")' class='btn btn-success'>" +
                                            "or <a class='cancel-link ' data-wrapcss='static-content-wrapper' onclick='btnCancelBH(" + id + ")' href='javascript:void(0)'>Hủy bỏ </a>" +
                                        "</div>" +
                                    "</div>" +
                                "</span>" +
                            "</span>" +
                        "</li>" +

                        "<li class='cfi-lecture cfi-add' >" +
                            "<span class='content ui-state-default add-lecture-btn' onclick='LiThemBHMoi(" + id + ")' style='width:390px;float:left;'>Thêm bài học</span>" +
                            "<span class='content ui-state-default add-quiz-btn' style='margin-left:2px;width:390px;float:left;'>Thêm câu hỏi</span>" +
                        "</li>" +
                        "<li style='clear:both;'></li>" +
                     "</ul>" +
                   "</li>";

            return html;
        }

        function LuuBaiHoc(id) {
            var tenbaihoc = $('input#TitleBH' + id + '').val();
            var maphanhoc = id;
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/User/CourseDetail.aspx/ThemBaiHoc",
                data: "{tenbaihoc:'" + tenbaihoc + "',maphanhoc:'" + maphanhoc + "'}",
                success: function (str) {
                    alert('Lưu bài học thành công!!');
                    $('li#LiAddFormBH' + id + '').hide();
                    $('li#LiThemBHMoi' + id + '').show();
                    var html = ScriptBaiHoc(str.d) + HTMLBaiHoc(str.d, tenbaihoc, id);//str: dữ liệu trả về. d: data
                    $('li#LiBaiHocMoi' + id + '').append(html);
                },
                error: function (e) {
                    alert(e)
                },
            });
        }

        function SuaTenBaiHoc(id) {
            var tenbaihoc = $('input#TitleBH' + id + '').val();
            var mabaihoc = id;
            $.ajax({
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                url: '/User/CourseDetail.aspx/SuaTenBaiHoc',
                data: "{tenbaihoc:'" + tenbaihoc + "',mabaihoc:'" + mabaihoc + "'}",
                success: function (response) {
                    alert('Sửa tên bài học thành công!!');
                    $('span#SpanTitleBH' + id + '').html(response.d);
                    $('li#LiEditForm' + id + '').hide();
                    $('li#LiBH' + id + '').show();
                   
                },
                error: function (e) {
                    alert(e);
                },
            });
        }

        function XoaBaiHoc(id) {

            $.ajax({
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                url: '/User/CourseDetail.aspx/XoaBaiHoc',
                data: "{mabaihoc:'" + id + "'}",
                success: function (response) {
                    alert('Xóa bài học thành công!!');
                    $('li#LiEditForm' + id + '').remove();
                    $('li#LiBH' + id + '').remove();
                },
                error: function (e) {
                    alert("Lỗi rồi");
                },
            });
        }

        function SuaNoiDungBaiHoc_Text(id, tenbaihoc, editor_id) {
            var noidungbaihoc = editor_id;
            //alert(1);
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/User/CourseDetail.aspx/SuaNoiDungBaiHoc_Text",
                data: "{tenbaihoc:'" + tenbaihoc + "',noidungbaihoc:'" + noidungbaihoc + "',mabaihoc:'" + id + "'}",
                success: function (str) {
                    alert('Lưu nội dung bài học thành công!!');
                    $('div#DivThemText' + id + '').hide();
                    $('a#BH' + id + '').show();
                    
                },
                error: function (e) {
                    alert("Lỗi rồi");
                },
            });
        }

        function SuaNoiDungBaiHoc_Video(id, tenbaihoc) {
            var noidungbaihoc = $('input#xFilePath'+id+'').val();
            //alert(1);
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/User/CourseDetail.aspx/SuaNoiDungBaiHoc_Video",
                data: "{tenbaihoc:'" + tenbaihoc + "',noidungbaihoc:'" + noidungbaihoc + "',mabaihoc:'" + id + "'}",
                success: function (str) {
                    alert('Lưu nội dung bài học thành công!!');
                    $('div#DivThemVideo' + id + '').hide();
                    $('a#BH' + id + '').show();
                },
                error: function (e) {
                    alert("Lỗi rồi");
                },
            });
        }

        function SuaNoiDungBaiHoc_Audio(id, tenbaihoc) {
            var noidungbaihoc = $('input#xFilePathAudio' + id + '').val();
            //alert(1);
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/User/CourseDetail.aspx/SuaNoiDungBaiHoc_Audio",
                data: "{tenbaihoc:'" + tenbaihoc + "',noidungbaihoc:'" + noidungbaihoc + "',mabaihoc:'" + id + "'}",
                success: function (str) {
                    alert('Lưu nội dung bài học thành công!!');
                    $('div#DivThemAudio' + id + '').hide();
                    $('a#BH' + id + '').show();
                },
                error: function (e) {
                    alert("Lỗi rồi");
                },
            });
        }


        //Phần học
        function LuuPhanHoc() {
            var tenphanhoc = $("input#TitlePH").val();
            var makhoahoc = getParameterByName('couid');
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/User/CourseDetail.aspx/ThemPhanHoc",
                data: "{tenphanhoc:'" + tenphanhoc + "',makhoahoc:'" + makhoahoc + "'}",
                success: function (str) {
                    alert('Lưu phần học thành công!!');
                    $('li#LiAddFormPH').hide();
                    $("li#LiThemPhanHocMoi").show();
                    var html = HTMLPhanHoc(str.d, tenphanhoc);

                    $('li#LiPhanHocMoi').append(html);
                    //var count = $('ul#UlPhanHoc2 li').size();
                },
                error: function (e) {
                    alert(e);
                },
            });
        }

        function SuaPhanHoc(id) {
            var tenphanhoc = $('input#TitlePH' + id + '').val();
            var maphanhoc = id;
            $.ajax({
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                url: '/User/CourseDetail.aspx/SuaPhanHoc',
                data: "{tenphanhoc:'" + tenphanhoc + "',maphanhoc:'" + maphanhoc + "'}",
                success: function (response) {
                    alert('Sửa phần học thành công!!');
                    $('span#SpanTitlePH' + id + '').html(response.d);
                    $('li#LiEditFormPH' + id + '').hide();
                    $('li#LiPH' + id + '').show();
                },
                error: function (e) {
                    alert(e);
                },
            });
        }

        function XoaPhanHoc(id) {
            $.ajax({
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                url: '/User/CourseDetail.aspx/XoaPhanHoc',
                data: "{maphanhoc:'" + id + "'}",
                success: function (response) {
                    alert('Xóa phần học thành công!!');
                    $('li#LiEditFormPH' + id + '').remove();
                    $('ul#UlPhanHoc' + id + '').remove();
                },
                error: function (e) {
                    alert(e);
                },
            });
        }
        function edit_handle_ph(id) {
            $('li#LiPH' + id + '').hide();
            $('li#LiEditFormPH' + id + '').show();
        }


        function LiThemBHMoi(id) {
            if ($('li#LiAddFormBH' + id + '').css('display') == 'none') {//
                $('#TitleBH'+id+'').val("");
                $('li#LiAddFormBH' + id + '').show();
                $('li#LiThemBHMoi' + id + '').hide();
            }
        }

        function btnCancelBH(id) {
            $('li#LiAddFormBH' + id + '').hide();
            $('li#LiThemBHMoi' + id + '').show();
        }

        function btnCancelPH() {
            $('li#LiAddFormPH').hide();
            $("li#LiThemPhanHocMoi").show();
        }

        function btnCancelPH(id) {
            $('li#LiEditFormPH' + id + '').hide();
            $('li#LiPH' + id + '').show();
        }
        function ThemPhanHocMoi() {
            if ($('li#LiAddFormPH').css('display') == 'none') {
                $('li#LiAddFormPH').show();
                $("li#LiThemPhanHocMoi").hide();
            }
        }

        function BrowseServer(inputId) {
            var finder = new CKFinder();
            finder.basePath = '../Admin/';	// The path for the installation of CKFinder (default = "/ckfinder/").
            finder.selectActionFunction = SetFileField;
            finder.selectActionData = inputId;
            finder.popup();
        }

        // This is a sample function which is called when a file is selected in CKFinder.
        function SetFileField(fileUrl, data) {
            document.getElementById(data["selectActionData"]).value = fileUrl;
        }
    </script>
    <div class="form-wrapper">
        <h2>Chi tiết khóa học</h2>
        <div class="ud-curriculumform" id="create-course-form-curriculum-list">
            <ul id="UlKhoaHoc">
                <li id="LiPhanHocMoi"></li>
                <li>
                    <ul class="cfi-forms-list">
                        <li class="cfi-lecture cfi-add-form editing opened" id="LiAddFormPH" style="display: none;">
                            <span class="content ui-state-default">
                                <span class="cfi-item-type">Phần học</span>
                                <span class="cfi-item-number">:</span>
                                <span class="cfi-item-title">
                                    <div id="Div1">
                                        <div class="manage-fields-wrapper ">
                                            <div class=" non-labeled" id="Div2">
                                                <div id="Div3" class="tooltip-reference">
                                                    <input id="TitlePH" name="title" type="text" class="text-input ch-count-field ud-textinput " placeholder="Điền nội dung">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="submit-row">
                                            <input value="Lưu phần học" onclick="LuuPhanHoc()" class="btn btn-success"/>
                                            or <a class="cancel-link " onclick="btnCancelPH()" id="btnCancelPH" href="javascript:void(0)">Hủy bỏ </a>
                                        </div>
                                    </div>
                                </span>
                            </span>
                        </li>

                        <li class="cfi-chapter cfi-add" id="LiThemPhanHocMoi" onclick="ThemPhanHocMoi()">
                            <span class="content ui-state-default add-section-btn">Thêm phần học mới</span>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>

</asp:Content>
