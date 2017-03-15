using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudyOnline_Nuong
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (StudyOnlineDataContext db = new StudyOnlineDataContext())
            {
                var kq = from x in db.CHUYENMUCs
                         where x.LoaiChuyenMuc.Trim() == "frontend" && x.MaChuyenMucCha == 0 && x.TrangThai == true
                         select new { x.MaChuyenMuc, x.Link, x.TenChuyenMuc };
                rpChuyenMuc.DataSource = kq;
                rpChuyenMuc.DataBind();

                rpNoiDungChuyenMucCha.DataSource = kq;
                rpNoiDungChuyenMucCha.DataBind();
            }
        }

        //Load khóa học tương ứng với các chuyên mục
        protected void rpNoiDungChuyenMucCha_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            using (StudyOnlineDataContext db = new StudyOnlineDataContext())
            {
                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    HiddenField hfMaCM = (HiddenField)e.Item.FindControl("hfMaChuyenMuc");
                    Repeater rpCMCon = (Repeater)e.Item.FindControl("rpNoiDungChuyenMucCon");
                    //load khóa học
                    var kq = (from x in db.KHOAHOCs
                              where x.MaChuyenMuc.ToString() == hfMaCM.Value.ToString() || x.CHUYENMUC.MaChuyenMucCha.ToString() == hfMaCM.Value.ToString()
                              select new {x.Gia, x.MaKhoaHoc,x.TenKhoaHoc,x.AnhDaiDien,x.SoHocVien,x.LuotXem,TenThanhVien=x.THANHVIEN_KHOAHOCs.SingleOrDefault(y=>y.MaKhoaHoc==x.MaKhoaHoc && y.Loai=="Day").THANHVIEN.TenThanhVien }).Take(4);//lấy số khóa học là 4
                    rpCMCon.DataSource = kq;
                    rpCMCon.DataBind();
                }
            }
        }

        //Code dang ky thanh vien
        [WebMethod(EnableSession = true)]//dùng cho sự kiện ajax, 
        public static string DangKyThanhVien(string tenthanhvien, string matkhau, string email, string trangthai)
        {
            using (StudyOnlineDataContext db = new StudyOnlineDataContext())
            {
                //thêm thành viên
                THANHVIEN tv = new THANHVIEN();
                tv.TenThanhVien = tenthanhvien;
                tv.MatKhau = matkhau;
                tv.Email = email;
                
                tv.TrangThai = bool.Parse(trangthai);
                db.THANHVIENs.InsertOnSubmit(tv);
                db.SubmitChanges();

                //tạo session
                HttpContext.Current.Session["UserName"] = tv.TenThanhVien;
                HttpContext.Current.Session["MaThanhVien"] = tv.MaThanhVien;
                return tv.TenThanhVien.ToString();
            }
        }

        //Code thanh vien dang nhap
        [WebMethod(EnableSession = true)]
        public static string DangNhapThanhVien(string matkhau, string email)
        {
            using (StudyOnlineDataContext db = new StudyOnlineDataContext())
            {
                //kiểm tra thông tin thành viên
                var tv = db.THANHVIENs.SingleOrDefault(x => x.Email.ToString().Trim() == email.Trim() && x.MatKhau.ToString().Trim() == matkhau.Trim()&&x.TrangThai==true);
                if (tv != null)
                {
                    //nếu có thành viên với thông tin mật khẩu và email thì tạo session
                    HttpContext.Current.Session["UserName"] = tv.TenThanhVien;
                    HttpContext.Current.Session["MaThanhVien"] = tv.MaThanhVien;
                }
                return tv.TenThanhVien.ToString();
            }
        }

        //Code thanh vien dang xuat
        [WebMethod(EnableSession = true)]
        public static string DangXuat()
        {
            //set session = null
            HttpContext.Current.Session["UserName"] = null;
            HttpContext.Current.Session["MaThanhVien"] = null;
            return "True";

        }

    }
}