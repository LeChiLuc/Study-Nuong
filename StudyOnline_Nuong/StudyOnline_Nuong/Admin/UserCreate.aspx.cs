using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudyOnline_Nuong.Admin
{
    public partial class UserCreate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            }
        }
        //Code them thanh vien
        [WebMethod]
        public static string ThemThanhVien(string tenthanhvien, string matkhau,string email, string quyenhan, string trangthai,string ghichu)
        {
            using (StudyOnlineDataContext db = new StudyOnlineDataContext())
            {
                THANHVIEN tv = new THANHVIEN();
                tv.TenThanhVien = tenthanhvien;
                tv.MatKhau = matkhau;
                tv.Email = email;
                
                tv.TrangThai=bool.Parse(trangthai);
                tv.GhiChu = ghichu;
                db.THANHVIENs.InsertOnSubmit(tv);
                db.SubmitChanges();
                return tv.MaThanhVien.ToString();
            }
        }
    }
}