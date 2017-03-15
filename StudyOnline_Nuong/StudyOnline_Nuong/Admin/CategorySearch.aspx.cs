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
    public partial class CategorySearch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //Code hien thi chuyen muc
        [WebMethod]
        public static string HienThiChuyenMuc(string tenchuyenmuc)
        {
            string data = string.Empty;

            using (StudyOnlineDataContext db = new StudyOnlineDataContext())
            {
                //lay toan bo chuyen muc quản trị
                var kq = from x in db.CHUYENMUCs
                         where x.TenChuyenMuc.Contains(tenchuyenmuc)
                         select new { machuyenmuc = x.MaChuyenMuc, tenchuyenmuc = x.TenChuyenMuc, chuyenmuccha = x.MaChuyenMucCha, link = x.Link, thutu = x.ThuTu, trangthai = x.TrangThai, ghichu = x.GhiChu };

                JavaScriptSerializer serializer = new JavaScriptSerializer();
                data = serializer.Serialize(kq);
                return data;
            }
        }

        //Code xoa chuyen muc
        [WebMethod]
        public static string XoaChuyenMuc(int machuyenmuc)
        {
            using (StudyOnlineDataContext db = new StudyOnlineDataContext())
            {
                var cm = db.CHUYENMUCs.SingleOrDefault(x => x.MaChuyenMuc == machuyenmuc);
                db.CHUYENMUCs.DeleteOnSubmit(cm);
                db.SubmitChanges();
                return "True";
            }
        }
    }
}