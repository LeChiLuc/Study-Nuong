﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudyOnline_Nuong.Admin
{
    public partial class CourseSearchUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //Code hien thi khoa hoc
        [WebMethod]
        public static string HienThiKhoaHoc(string user)
        {
            string data = string.Empty;

            using (StudyOnlineDataContext db = new StudyOnlineDataContext())
            {
                //lay toan bo khoa hoc
                var kq = from x in db.THANHVIEN_KHOAHOCs
                         where x.THANHVIEN.TenThanhVien.Contains(user)
                         select new { makhoahoc = x.MaKhoaHoc, tenkhoahoc = x.KHOAHOC.TenKhoaHoc, ngaydang = x.KHOAHOC.NgayDang, luotxem = x.KHOAHOC.LuotXem, chuyenmuc = x.KHOAHOC.CHUYENMUC.TenChuyenMuc, trinhdo = x.KHOAHOC.TRINHDO.TenTrinhDo, trangthai = x.KHOAHOC.TrangThai };

                JavaScriptSerializer serializer = new JavaScriptSerializer();
                data = serializer.Serialize(kq);
                return data;
            }
        }

        //Code xóa khóa học
        [WebMethod]
        public static string XoaKhoaHoc(int makhoahoc)
        {
            using (StudyOnlineDataContext db = new StudyOnlineDataContext())
            {
                var kh = db.KHOAHOCs.SingleOrDefault(x => x.MaKhoaHoc == makhoahoc);
                if (kh != null)
                {
                    var ph = from x in db.PHANHOCs
                             where x.MaKhoaHoc == kh.MaKhoaHoc
                             select x;

                    if (ph != null)
                    {
                        foreach (var a in ph)
                        {
                            var bh = from x in db.BAIHOCs
                                     where x.MaPhanHoc == a.MaPhanHoc
                                     select x;
                            foreach (var b in bh)
                            {
                                db.BAIHOCs.DeleteOnSubmit(b);
                            }

                            db.PHANHOCs.DeleteOnSubmit(a);
                        }

                    }
                    db.KHOAHOCs.DeleteOnSubmit(kh);
                    db.SubmitChanges();
                }
                return "True";
            }
        }
    }
}