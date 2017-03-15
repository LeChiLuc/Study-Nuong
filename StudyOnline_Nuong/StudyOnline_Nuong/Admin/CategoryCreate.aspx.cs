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
    public partial class CategoryCreate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (StudyOnlineDataContext db = new StudyOnlineDataContext())
                {
                    //lay toan bo chuyen muc cha
                    CHUYENMUC cm = new CHUYENMUC();
                    cm.MaChuyenMucCha = 0;
                    cm.TenChuyenMuc = "-- Thuộc chuyên mục cha --";
                    List<CHUYENMUC> list = new List<CHUYENMUC>();
                    list.Add(cm);
                    list.AddRange(db.CHUYENMUCs.ToList());
                    cbChuyenMucCha.DataSource = list.Where(x => x.MaChuyenMucCha == 0);
                    cbChuyenMucCha.DataTextField = "TenChuyenMuc";
                    cbChuyenMucCha.DataValueField = "MaChuyenMuc";
                    cbChuyenMucCha.DataBind();
                }
            }
        }
        protected void btnLuu_Click(object sender, EventArgs e)
        {
            using (StudyOnlineDataContext db = new StudyOnlineDataContext())
            {
                CHUYENMUC cm = new CHUYENMUC();
                cm.TenChuyenMuc = txtTenChuyenMuc.Text;
                if (cbChuyenMucCha.SelectedValue.ToString() != "")
                    cm.MaChuyenMucCha = int.Parse(cbChuyenMucCha.SelectedValue.ToString());
                else
                    cm.MaChuyenMucCha = 0;
                cm.LoaiChuyenMuc = cbLoaiChuyenMuc.SelectedValue.ToString();
                cm.Link = txtLink.Text;
                if (txtThuTu.Text != "")
                    cm.ThuTu = int.Parse(txtThuTu.Text);
                else
                    cm.ThuTu = 1;
                cm.TrangThai = bool.Parse(cbTrangThai.SelectedValue.ToString());
                cm.GhiChu = txtGhiChu.Text;
                db.CHUYENMUCs.InsertOnSubmit(cm);
                db.SubmitChanges();
                Response.Write("<script>alert('Bạn đã thêm thành công!')</script>");
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtTenChuyenMuc.Text = "";
            txtLink.Text = "";
            txtThuTu.Text = "";
            txtGhiChu.Text = "";
        }
    }
}