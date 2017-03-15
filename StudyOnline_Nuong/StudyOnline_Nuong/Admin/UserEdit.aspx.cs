using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudyOnline_Nuong.Admin
{
    public partial class UserEdit : System.Web.UI.Page
    {
        static string mathanhvien = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                mathanhvien = Request.QueryString["uid"];
            }
        }
        //Code sua thanh vien
        [WebMethod]
        public static string SuaThanhVien(string tenthanhvien, string matkhau, string email, string trangthai, string ghichu)
        {
            using (StudyOnlineDataContext db = new StudyOnlineDataContext())
            {
                var tv = db.THANHVIENs.SingleOrDefault(x => x.MaThanhVien.ToString() == mathanhvien.Trim());
                tv.TenThanhVien = tenthanhvien;
                tv.MatKhau = matkhau;
                tv.Email = email;
                tv.TrangThai = bool.Parse(trangthai);
                tv.GhiChu = ghichu;
                db.SubmitChanges();
                return tv.MaThanhVien.ToString();
            }
        }
    }
}