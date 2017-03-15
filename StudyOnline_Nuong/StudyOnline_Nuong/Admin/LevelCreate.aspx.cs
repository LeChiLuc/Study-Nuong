using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudyOnline_Nuong.Admin
{
    public partial class LevelCreate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void btnLuu_Click(object sender, EventArgs e)
        {
            using (StudyOnlineDataContext db = new StudyOnlineDataContext())
            {
                TRINHDO td = new TRINHDO();
                td.TenTrinhDo = txtTenTrinhDo.Text;
                td.TrangThai = bool.Parse(cbTrangThai.SelectedValue.ToString());
                td.GhiChu = txtGhiChu.Text;
                db.TRINHDOs.InsertOnSubmit(td);
                db.SubmitChanges();
                Response.Write("<script>alert('Bạn đã thêm thành công!')</script>");
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtTenTrinhDo.Text = "";
            txtGhiChu.Text = "";
        }
    }
}