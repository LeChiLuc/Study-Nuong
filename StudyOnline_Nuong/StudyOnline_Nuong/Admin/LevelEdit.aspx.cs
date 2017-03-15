using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudyOnline_Nuong.Admin
{
    public partial class LevelEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (StudyOnlineDataContext db = new StudyOnlineDataContext())
                {
                    string matrinhdo = Request.QueryString["cid"];
                    var trinhdo = db.TRINHDOs.SingleOrDefault(x => x.MaTrinhDo.ToString() == matrinhdo.Trim());
                    txtTenTrinhDo.Text = trinhdo.TenTrinhDo;
                    cbTrangThai.SelectedValue = trinhdo.TrangThai.ToString().Trim();
                    txtGhiChu.Text = trinhdo.GhiChu;
                }
            }
        }
        protected void btnLuu_Click(object sender, EventArgs e)
        {
            using (StudyOnlineDataContext db = new StudyOnlineDataContext())
            {
                string matrinhdo = Request.QueryString["cid"];
                var cm = db.TRINHDOs.SingleOrDefault(x => x.MaTrinhDo.ToString() == matrinhdo.Trim());
                cm.TenTrinhDo = txtTenTrinhDo.Text;
              
                cm.TrangThai = bool.Parse(cbTrangThai.SelectedValue.ToString());
                cm.GhiChu = txtGhiChu.Text;
                db.SubmitChanges();
                Response.Write("<script>alert('Bạn đã sửa thành công!')</script>");
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtTenTrinhDo.Text = "";
            txtGhiChu.Text = "";
        }
    }
}