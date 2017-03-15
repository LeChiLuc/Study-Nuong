using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudyOnline_Nuong.Admin
{
    public partial class CommentViewAll : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //Code hien thi chuyen muc
        [WebMethod]
        public static string HienThiBinhLuan()
        {
            string data = string.Empty;

            using (StudyOnlineDataContext db = new StudyOnlineDataContext())
            {
                //lay toan bo chuyen muc
                var kq = from x in db.PHANHOIs
                         select new { mabinhluan = x.MaPhanHoi, tenkhoahoc = x.KHOAHOC.TenKhoaHoc, noidungbinhluan = x.NoiDungPhanHoi,makhoahoc=x.MaKhoaHoc, thanhvien = x.THANHVIEN.TenThanhVien,ngaydang=x.NgayDang, trangthai = x.TrangThai};

                JavaScriptSerializer serializer = new JavaScriptSerializer();
                data = serializer.Serialize(kq);
                return data;
            }
        }
    }
}