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
    public partial class UserViewAll : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //Code hien thi thanh vien
        [WebMethod]
        public static string HienThiThanhVien()
        {
            string data = string.Empty;

            using (StudyOnlineDataContext db = new StudyOnlineDataContext())
            {
                //lay toan bo user
                var kq = from x in db.THANHVIENs
                          select new {mathanhvien=x.MaThanhVien, tenthanhvien = x.TenThanhVien, email = x.Email,tranthai=x.TrangThai,ghichu=x.GhiChu };

                JavaScriptSerializer serializer = new JavaScriptSerializer();
                data = serializer.Serialize(kq);
                return data;
            }
        }

        //Code xoa thành viên
        [WebMethod]
        public static string XoaThanhVien(int mathanhvien)
        {
            using (StudyOnlineDataContext db = new StudyOnlineDataContext())
            {
                var tv = db.THANHVIENs.SingleOrDefault(x => x.MaThanhVien == mathanhvien);
                db.THANHVIENs.DeleteOnSubmit(tv);
                db.SubmitChanges();
                return "True";
            }
        }
    }
}