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
    public partial class CourseDetail : System.Web.UI.Page
    {
        static string makhoahoc = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                string makhoahoc = Request.QueryString["couid"];
                string url = "/User/CourseDetail.aspx?couid=" + makhoahoc + "";
                Response.Redirect("/Login.aspx?url=" + url + "");
            }
        }

        //Code lay phan hoc
        [WebMethod]
        public static string HienThiPhanHoc(int makhoahoc)
        {
            string data = string.Empty;

            using (StudyOnlineDataContext db = new StudyOnlineDataContext())
            {
                //lay toan bo phan hoc trong khoa hoc 
                var kq1 = from x in db.PHANHOCs
                          where x.MaKhoaHoc == makhoahoc
                          select new { maphanhoc = x.MaPhanHoc, tenphanhoc = x.TenPhanHoc };

                JavaScriptSerializer serializer = new JavaScriptSerializer();
                data = serializer.Serialize(kq1);
                return data;
            }
        }

        //Code them phan hoc
        [WebMethod]
        public static string ThemPhanHoc(string tenphanhoc, int makhoahoc)
        {
            using (StudyOnlineDataContext db = new StudyOnlineDataContext())
            {
                PHANHOC ph = new PHANHOC();
                ph.TenPhanHoc = tenphanhoc;
                ph.MaKhoaHoc = makhoahoc;
                db.PHANHOCs.InsertOnSubmit(ph);
                db.SubmitChanges();
                return ph.MaPhanHoc.ToString();
            }
        }

        //Code sua phan hoc
        [WebMethod]
        public static string SuaPhanHoc(string tenphanhoc, int maphanhoc)
        {
            using (StudyOnlineDataContext db = new StudyOnlineDataContext())
            {
                var ph = db.PHANHOCs.SingleOrDefault(x => x.MaPhanHoc == maphanhoc);
                ph.TenPhanHoc = tenphanhoc;
                db.SubmitChanges();
                return ph.TenPhanHoc.ToString();
            }
        }

        [WebMethod]
        public static string XoaPhanHoc(int maphanhoc)
        {
            using (StudyOnlineDataContext db = new StudyOnlineDataContext())
            {
                var ph = db.PHANHOCs.SingleOrDefault(x => x.MaPhanHoc == maphanhoc);
                if (ph != null)
                {
                    var bh = from x in db.BAIHOCs
                                 where x.MaPhanHoc==ph.MaPhanHoc
                                 select x;
                    foreach (var a in bh)
                    {
                        db.BAIHOCs.DeleteOnSubmit(a);
                    }
                    db.PHANHOCs.DeleteOnSubmit(ph);
                    db.SubmitChanges();
                }
                return "True";
            }
        }

        //Code lay bai hoc
        [WebMethod]
        public static string HienThiBaiHoc(int maphanhoc)
        {
            string data = string.Empty;

            using (StudyOnlineDataContext db = new StudyOnlineDataContext())
            {
                //lay toan bo bài hoc trong phan hoc 
                var kq1 = from x in db.BAIHOCs
                          where x.MaPhanHoc == maphanhoc
                          select new { mabaihoc = x.MaBaiHoc, tenbaihoc = x.TenBaiHoc, maphanhoc = x.MaPhanHoc };

                JavaScriptSerializer serializer = new JavaScriptSerializer();
                data = serializer.Serialize(kq1);
                return data;
            }
        }
        //Code them noi dung text cho bai hoc
        [WebMethod]
        public static string SuaNoiDungBaiHoc_Text(string tenbaihoc, string noidungbaihoc, int mabaihoc)
        {
            using (StudyOnlineDataContext db = new StudyOnlineDataContext())
            {
                var bh = db.BAIHOCs.SingleOrDefault(x => x.MaBaiHoc == mabaihoc);
                bh.TenBaiHoc = tenbaihoc;
                bh.NoiDungBaiHoc = noidungbaihoc;
                bh.LoaiNoiDung = "Text";
                db.SubmitChanges();
                return "True";
            }
        }

        //Code them noi dung Video cho bai hoc
        [WebMethod]
        public static string SuaNoiDungBaiHoc_Video(string tenbaihoc, string noidungbaihoc, int mabaihoc)
        {
            using (StudyOnlineDataContext db = new StudyOnlineDataContext())
            {
                var bh = db.BAIHOCs.SingleOrDefault(x => x.MaBaiHoc == mabaihoc);
                bh.TenBaiHoc = tenbaihoc;
                bh.NoiDungBaiHoc = noidungbaihoc;
                bh.LoaiNoiDung = "Video";
                db.SubmitChanges();
                return "True";
            }
        }


        //Code them noi dung Audio cho bai hoc
        [WebMethod]
        public static string SuaNoiDungBaiHoc_Audio(string tenbaihoc, string noidungbaihoc, int mabaihoc)
        {
            using (StudyOnlineDataContext db = new StudyOnlineDataContext())
            {
                var bh = db.BAIHOCs.SingleOrDefault(x => x.MaBaiHoc == mabaihoc);
                bh.TenBaiHoc = tenbaihoc;
                bh.NoiDungBaiHoc = noidungbaihoc;
                bh.LoaiNoiDung = "Audio";
                db.SubmitChanges();
                return "True";
            }
        }

        //Code them bai hoc
        [WebMethod]
        public static string ThemBaiHoc(string tenbaihoc, int maphanhoc)
        {
            using (StudyOnlineDataContext db = new StudyOnlineDataContext())
            {
                BAIHOC bh = new BAIHOC();
                bh.TenBaiHoc = tenbaihoc;
                bh.MaPhanHoc = maphanhoc;
                db.BAIHOCs.InsertOnSubmit(bh);
                db.SubmitChanges();
                return bh.MaBaiHoc.ToString();
            }
        }

        [WebMethod]
        public static string SuaTenBaiHoc(string tenbaihoc, int mabaihoc)
        {
            using (StudyOnlineDataContext db = new StudyOnlineDataContext())
            {
                var bh = db.BAIHOCs.SingleOrDefault(x => x.MaBaiHoc == mabaihoc);
                bh.TenBaiHoc = tenbaihoc;
                db.SubmitChanges();
                return bh.TenBaiHoc.ToString();
            }
        }

        [WebMethod]
        public static string XoaBaiHoc(int mabaihoc)
        {
            using (StudyOnlineDataContext db = new StudyOnlineDataContext())
            {
                var bh = db.BAIHOCs.SingleOrDefault(x => x.MaBaiHoc == mabaihoc);
                db.BAIHOCs.DeleteOnSubmit(bh);
                db.SubmitChanges();
                return "True";
            }
        }
    }
}   