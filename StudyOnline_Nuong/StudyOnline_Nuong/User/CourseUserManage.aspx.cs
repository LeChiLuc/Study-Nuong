using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudyOnline_Nuong.User
{
    public partial class CourseUserManage : System.Web.UI.Page
    {
        static string mathanhvien = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                string url = "/User/CourseUserManage.aspx";
                Response.Redirect("/Login.aspx?url=" + url + "");
            }
            else
            {
                mathanhvien = Session["MaThanhVien"].ToString();
            }
        }
        //Code hien thi thanh vien hoc hoac day khoa hoc
        [WebMethod]
        public static string HienThiThanhVien_KhoaHoc(string loai)
        {
            string data = string.Empty;
            using (StudyOnlineDataContext db = new StudyOnlineDataContext())
            {
                //lay toan bo chuyen muc
                var kq = from x in db.THANHVIEN_KHOAHOCs
                         where x.MaThanhVien == int.Parse(mathanhvien) && x.Loai.Trim() == loai
                         select new { makhoahoc = x.MaKhoaHoc,tenkhoahoc=x.KHOAHOC.TenKhoaHoc,anhdaidien=x.KHOAHOC.AnhDaiDien };

                JavaScriptSerializer serializer = new JavaScriptSerializer();
                data = serializer.Serialize(kq);
                return data;
            }
        }

      
    }
}