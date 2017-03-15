using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudyOnline_Nuong
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //Code dang ky thanh vien
        [WebMethod(EnableSession = true)]
        public static string DangKyThanhVien(string tenthanhvien, string matkhau, string email, string trangthai)
        {
            using (StudyOnlineDataContext db = new StudyOnlineDataContext())
            {

                THANHVIEN tv = new THANHVIEN();
                tv.TenThanhVien = tenthanhvien;
                tv.MatKhau = matkhau;
                tv.Email = email;
                
                tv.TrangThai = bool.Parse(trangthai);
                db.THANHVIENs.InsertOnSubmit(tv);
                db.SubmitChanges();
                HttpContext.Current.Session["UserName"] = tv.TenThanhVien;
                HttpContext.Current.Session["MaThanhVien"] = tv.MaThanhVien;
                return tv.TenThanhVien.ToString();
            }
        }

    }
}