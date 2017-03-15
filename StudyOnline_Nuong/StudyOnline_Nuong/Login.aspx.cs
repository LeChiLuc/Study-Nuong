using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudyOnline_Nuong
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //Code thanh vien dang nhap
        [WebMethod(EnableSession = true)]
        public static string DangNhapThanhVien(string matkhau, string email)
        {
            using (StudyOnlineDataContext db = new StudyOnlineDataContext())
            {
                var tv = db.THANHVIENs.SingleOrDefault(x => x.Email.ToString().Trim() == email.Trim() && x.MatKhau.ToString().Trim() == matkhau.Trim()&&x.TrangThai==true);
                if (tv != null)
                {
                    HttpContext.Current.Session["UserName"] = tv.TenThanhVien;
                    HttpContext.Current.Session["MaThanhVien"] = tv.MaThanhVien;
                }
                return tv.TenThanhVien.ToString();
            }
        }
    }
}