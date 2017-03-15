using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudyOnline_Nuong.Admin
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (StudyOnlineDataContext db = new StudyOnlineDataContext())
                {
                    var kq = from x in db.CHUYENMUCs
                             where x.LoaiChuyenMuc.Trim() == "backend" && x.MaChuyenMucCha == 0 && x.TrangThai == true
                             select new { x.MaChuyenMuc, x.Link, x.TenChuyenMuc };
                    rpChuyenMucCha.DataSource = kq;
                    rpChuyenMucCha.DataBind();
                }
            }
        }

        protected void rpChuyenMucCha_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            using (StudyOnlineDataContext db = new StudyOnlineDataContext())
            {
                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    HiddenField hfMaCM= (HiddenField)e.Item.FindControl("hfMaChuyenMuc");
                    Repeater rpCMCon = (Repeater)e.Item.FindControl("rpChuyenMucCon");
                    var kq = from x in db.CHUYENMUCs
                             where x.LoaiChuyenMuc.Trim() == "backend" && x.MaChuyenMucCha.ToString() == hfMaCM.Value.ToString() && x.TrangThai == true
                             select new { x.MaChuyenMuc, x.Link, x.TenChuyenMuc };
                    rpCMCon.DataSource = kq;
                    rpCMCon.DataBind();
                }
            }
        }
    }
}