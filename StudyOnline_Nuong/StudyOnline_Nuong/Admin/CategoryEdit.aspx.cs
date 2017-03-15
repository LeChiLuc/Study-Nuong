using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudyOnline_Nuong.Admin
{
    public partial class CategoryEdit : System.Web.UI.Page
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

                    string machuyenmuc = Request.QueryString["cid"];
                    var chuyenmuc = db.CHUYENMUCs.SingleOrDefault(x => x.MaChuyenMuc.ToString() == machuyenmuc.Trim());
                    cbChuyenMucCha.SelectedValue = chuyenmuc.MaChuyenMucCha.ToString();
                    cbLoaiChuyenMuc.SelectedValue = chuyenmuc.LoaiChuyenMuc.ToString().Trim();
                    txtTenChuyenMuc.Text = chuyenmuc.TenChuyenMuc;
                    txtLink.Text = chuyenmuc.Link;
                    txtThuTu.Text = chuyenmuc.ThuTu.ToString();
                    cbTrangThai.SelectedValue = chuyenmuc.TrangThai.ToString().Trim();
                    txtGhiChu.Text = chuyenmuc.GhiChu;
                }
            }
        }
        protected void btnLuu_Click(object sender, EventArgs e)
        {
            using (StudyOnlineDataContext db = new StudyOnlineDataContext())
            {
                string machuyenmuc=Request.QueryString["cid"];
                var cm = db.CHUYENMUCs.SingleOrDefault(x => x.MaChuyenMuc.ToString() == machuyenmuc.Trim());
                cm.TenChuyenMuc = txtTenChuyenMuc.Text;
                cm.MaChuyenMucCha = int.Parse(cbChuyenMucCha.SelectedValue.ToString());
                cm.LoaiChuyenMuc = cbLoaiChuyenMuc.SelectedValue.ToString();
                cm.Link = txtLink.Text;
                if (txtThuTu.Text != "")
                    cm.ThuTu = int.Parse(txtThuTu.Text);
                cm.TrangThai = bool.Parse(cbTrangThai.SelectedValue.ToString());
                cm.GhiChu = txtGhiChu.Text;
                db.SubmitChanges();
                Response.Write("<script>alert('Bạn đã sửa thành công!')</script>");
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