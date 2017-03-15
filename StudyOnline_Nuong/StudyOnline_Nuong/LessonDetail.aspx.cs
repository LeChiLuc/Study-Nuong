using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudyOnline_Nuong
{
    public partial class LessonDetail : System.Web.UI.Page
    {
        static string makhoahoc = "";
        public String result = "";
        public Boolean check;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserName"] == null)
                {
                    string url = "/Course.aspx?cou=" + makhoahoc + "";
                    Response.Redirect("/Login.aspx?url=" + url + "");
                }
                else
                {
                    makhoahoc = Request.QueryString["detail"];
                    using (StudyOnlineDataContext db = new StudyOnlineDataContext())
                    {
                       
                        var kq = from x in db.KHOAHOCs
                                 where x.MaKhoaHoc == int.Parse(makhoahoc.ToString())
                                 select new {x.TenKhoaHoc};
                        foreach (var a in kq)
                        {
                            lblTenKhoaHoc.Text = a.TenKhoaHoc;
                        }

                        var kq2 = from x in db.THANHVIEN_KHOAHOCs
                                  where x.MaKhoaHoc == int.Parse(makhoahoc.ToString()) && x.Loai=="Day"
                                 select new { x.THANHVIEN.TenThanhVien };
                        foreach (var a in kq2)
                        {
                            lblTenThanhVien.Text = a.TenThanhVien;
                        }
                    }
                    String transaction_info = Request.QueryString["transaction_info"];
                    String order_code = Request.QueryString["order_code"];
                    String payment_id = Request.QueryString["payment_id"];
                    String payment_type = Request.QueryString["payment_type"];
                    String secure_code = Request.QueryString["secure_code"];
                    String price = Request.QueryString["price"];
                    String error_text = Request.QueryString["error_text"];
                    NL_Checkout nl = new NL_Checkout();
                    check = nl.verifyPaymentUrl(transaction_info, order_code, price, payment_id, payment_type, error_text, secure_code);
                    if (check)
                    {
                        using (StudyOnlineDataContext db = new StudyOnlineDataContext())
                        {
                            THANHVIEN_KHOAHOC tv_kh = new THANHVIEN_KHOAHOC();
                            tv_kh.MaThanhVien = int.Parse(Session["MaThanhVien"].ToString());
                            tv_kh.MaKhoaHoc = int.Parse(makhoahoc);
                            tv_kh.Loai = "Hoc";
                            tv_kh.TrangThaiThanhToan = true;
                            db.THANHVIEN_KHOAHOCs.InsertOnSubmit(tv_kh);
                            db.SubmitChanges();
                        }

                        this.result = "Quá trình thanh toán thành công";
                    }
                    else
                        this.result = "Quá trình thanh toán thất bại bạn vui lòng thử lại";

                }
            }
        }
        //Code hien thi Khoa hoc
        [WebMethod]
        public static string HienThiPhanHoc()
        {
            string data = string.Empty;

            using (StudyOnlineDataContext db = new StudyOnlineDataContext())
            {
                //lay toan bo user
                var kq = from x in db.PHANHOCs
                         where x.MaKhoaHoc==int.Parse(makhoahoc.ToString())
                         select new { maphanhoc = x.MaPhanHoc, tenphanhoc = x.TenPhanHoc};

                JavaScriptSerializer serializer = new JavaScriptSerializer();
                data = serializer.Serialize(kq);
                return data;
            }
        }

        //Code lay bai hoc
        [WebMethod]
        public static string HienThiBaiHoc(int maphanhoc)
        {
            string data = string.Empty;

            using (StudyOnlineDataContext db = new StudyOnlineDataContext())
            {
                //lay toan bo phan hoc trong phan hoc 
                var kq1 = from x in db.BAIHOCs
                          where x.MaPhanHoc == maphanhoc
                          select new { mabaihoc = x.MaBaiHoc, tenbaihoc = x.TenBaiHoc, maphanhoc = x.MaPhanHoc,noidungbaihoc=x.NoiDungBaiHoc,loainoidung=x.LoaiNoiDung.Trim() };

                JavaScriptSerializer serializer = new JavaScriptSerializer();
                data = serializer.Serialize(kq1);
                return data;
            }
        }

        //Code them binh luan
        [WebMethod]
        public static string ThemBinhLuan(string noidungbinhluan)
        {
            using (StudyOnlineDataContext db = new StudyOnlineDataContext())
            {
                string mathanhvien = HttpContext.Current.Session["MaThanhVien"].ToString();
                PHANHOI ph = new PHANHOI();
                ph.MaKhoaHoc = int.Parse(makhoahoc);
                ph.MaThanhVien = int.Parse(mathanhvien);
                ph.NoiDungPhanHoi = noidungbinhluan;
                ph.NgayDang = DateTime.Now;
                ph.TrangThai = true;

                db.PHANHOIs.InsertOnSubmit(ph);
                db.SubmitChanges();

                return ph.THANHVIEN.TenThanhVien.ToString();
            }
        }
          
        //Code lay bai hoc
        [WebMethod]
        public static string HienThiBinhLuan()
        {
            string data = string.Empty;

            using (StudyOnlineDataContext db = new StudyOnlineDataContext())
            {
                //lay toan binh luan trong khoa hoc
                var kq1 = from x in db.PHANHOIs
                          where x.MaKhoaHoc.ToString() == makhoahoc
                          select new { noidungphanhoi = x.NoiDungPhanHoi, thanhvien = x.THANHVIEN.TenThanhVien };

                JavaScriptSerializer serializer = new JavaScriptSerializer();
                data = serializer.Serialize(kq1);
                return data;
            }
        }
        
    }
}