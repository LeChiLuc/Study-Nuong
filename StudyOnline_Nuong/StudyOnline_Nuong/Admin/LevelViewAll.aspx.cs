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
    public partial class LevelViewAll : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Code hien thi chuyen muc
        [WebMethod]
        public static string HienThiTrinhDo()
        {
            string data = string.Empty;

            using (StudyOnlineDataContext db = new StudyOnlineDataContext())
            {
                //lay toan bo trinh do
                var kq = from x in db.TRINHDOs
                         select new { matrinhdo = x.MaTrinhDo, tentrinhdo = x.TenTrinhDo, trangthai = x.TrangThai, ghichu = x.GhiChu };

                JavaScriptSerializer serializer = new JavaScriptSerializer();
                data = serializer.Serialize(kq);
                return data;
            }
        }

        //Code xoa trinh do
        [WebMethod]
        public static string XoaTrinhDo(int matrinhdo)
        {
            using (StudyOnlineDataContext db = new StudyOnlineDataContext())
            {
                var td = db.TRINHDOs.SingleOrDefault(x => x.MaTrinhDo == matrinhdo);
                db.TRINHDOs.DeleteOnSubmit(td);
                db.SubmitChanges();
                return "True";
            }
        }
    }
}