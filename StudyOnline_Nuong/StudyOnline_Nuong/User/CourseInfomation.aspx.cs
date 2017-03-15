using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudyOnline_Nuong.User
{
    public partial class CourseInfomation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserName"] == null)
                {
                    string makhoahoc = Request.QueryString["couid"];
                    string url = "/User/CourseInfomation.aspx?couid="+makhoahoc+"";
                    Response.Redirect("/Login.aspx?url=" + url + "");
                }
                else
                {
                    using (StudyOnlineDataContext db = new StudyOnlineDataContext())
                    {
                        //lay toan bo chuyen muc
                        Load_ChuyenMuc();
                        //var kq1 = from x in db.CHUYENMUCs
                        //          where x.LoaiChuyenMuc == "frontend"
                        //          select new { x.MaChuyenMuc, x.TenChuyenMuc };
                        //cbChuyenMuc.DataSource = kq1;
                        //cbChuyenMuc.DataTextField = "TenChuyenMuc";
                        //cbChuyenMuc.DataValueField = "MaChuyenMuc";
                        //cbChuyenMuc.DataBind();


                        //lay toan bo trinh do
                        var kq = from x in db.TRINHDOs
                                 where x.TrangThai == true
                                 select new { x.MaTrinhDo, x.TenTrinhDo };
                        cbTrinhDo.DataSource = kq;
                        cbTrinhDo.DataTextField = "TenTrinhDo";
                        cbTrinhDo.DataValueField = "MaTrinhDo";
                        cbTrinhDo.DataBind();

                        //hien thi thong tin khoa hoc
                        string makhoahoc = Request.QueryString["couid"];
                        var kh = db.KHOAHOCs.SingleOrDefault(x => x.MaKhoaHoc.ToString() == makhoahoc.Trim());
                        txtTenKhoaHoc.Text = kh.TenKhoaHoc;
                        txtMoTa.Text = kh.MoTa;
                        txtGia.Text = kh.Gia.ToString();
                        if (kh.MaChuyenMuc != null)
                            cbChuyenMuc.SelectedValue = kh.MaChuyenMuc.ToString();
                        if (kh.MaTrinhDo != null)
                            cbTrinhDo.SelectedValue = kh.MaTrinhDo.ToString();
                    }
                }
            }
        }

        protected void Load_ChuyenMuc()
        {
            List<CHUYENMUC> listcha;
            List<CHUYENMUC> listcon;
            List<CHUYENMUC> listall = new List<CHUYENMUC>();
            using (StudyOnlineDataContext db = new StudyOnlineDataContext())
            {

                listcha = db.CHUYENMUCs.Where(x => x.MaChuyenMucCha == 0 && x.LoaiChuyenMuc == "frontend").ToList();
                foreach (CHUYENMUC ltl in listcha)
                {
                    listall.Add(ltl);
                    listcon = db.CHUYENMUCs.Where(c => c.MaChuyenMucCha == ltl.MaChuyenMuc && c.MaChuyenMucCha != 0 && c.LoaiChuyenMuc == "frontend").ToList();
                    foreach (CHUYENMUC ltlcon in listcon)
                    {
                        ltlcon.TenChuyenMuc = " -- " + ltlcon.TenChuyenMuc;
                    }
                    listall.AddRange(listcon);
                }
                cbChuyenMuc.DataSource = listall;
                cbChuyenMuc.DataTextField = "TenChuyenMuc";
                cbChuyenMuc.DataValueField = "MaChuyenMuc";
                cbChuyenMuc.DataBind();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            using (StudyOnlineDataContext db = new StudyOnlineDataContext())
            {
                string makhoahoc = Request.QueryString["couid"];
                var kh = db.KHOAHOCs.SingleOrDefault(x => x.MaKhoaHoc.ToString() == makhoahoc.ToString());
                kh.TenKhoaHoc = txtTenKhoaHoc.Text;
                kh.MoTa = txtMoTa.Text;
                if (fuAnhDaiDien.HasFile)
                {
                    string path = Server.MapPath("~/Upload/Course/" + fuAnhDaiDien.FileName);
                    fuAnhDaiDien.SaveAs(path);
                    kh.AnhDaiDien = "/Upload/Course/" + fuAnhDaiDien.FileName;
                }
                if (txtGia.Text == "")
                    kh.Gia = 0;
                else
                    kh.Gia = double.Parse(txtGia.Text);
                kh.MaChuyenMuc = int.Parse(cbChuyenMuc.SelectedValue);
                kh.MaTrinhDo = int.Parse(cbTrinhDo.SelectedValue);
                kh.TrangThai = true;
                db.SubmitChanges();
            }
        }
    }
}