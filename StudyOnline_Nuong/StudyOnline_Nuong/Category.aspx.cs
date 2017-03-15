using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudyOnline_Nuong
{
    public partial class Category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (StudyOnlineDataContext db = new StudyOnlineDataContext())
                {

                    if (Request.QueryString["chuyenmucon_id"] != null)
                    {
                        var kq = from x in db.CHUYENMUCs
                                 where x.LoaiChuyenMuc.Trim() == "frontend" && x.MaChuyenMucCha.ToString() == Request.QueryString["cmid"].ToString() && x.TrangThai == true
                                 select new { x.MaChuyenMucCha, x.MaChuyenMuc, x.Link, x.TenChuyenMuc };
                        rpChuyenMuc.DataSource = kq;
                        rpChuyenMuc.DataBind();

                        var kh = from x in db.KHOAHOCs
                                 where x.MaChuyenMuc.ToString() == Request.QueryString["chuyenmucon_id"].ToString()
                                 select new { x.Gia, x.MaKhoaHoc, x.TenKhoaHoc, x.AnhDaiDien, x.SoHocVien, x.LuotXem, TenThanhVien = x.THANHVIEN_KHOAHOCs.SingleOrDefault(y => y.MaKhoaHoc == x.MaKhoaHoc && y.Loai == "Day").THANHVIEN.TenThanhVien };
                        rpNoiDungChuyenMucCon.DataSource = kh;
                        rpNoiDungChuyenMucCon.DataBind();

                        var cm = from x in db.CHUYENMUCs
                                 where x.MaChuyenMuc.ToString() == Request.QueryString["chuyenmucon_id"].ToString()
                                 select new { x.TenChuyenMuc, x.GhiChu };
                        foreach (var a in cm)
                        {
                            lblTenChuyenMuc.Text = a.TenChuyenMuc;
                            lblMoTaChuyenMuc.Text = a.GhiChu;
                        }

                        //Load trình độ
                        TRINHDO td = new TRINHDO();
                        td.MaTrinhDo = 0;
                        td.TenTrinhDo = "Tất cả";
                        List<TRINHDO> list = new List<TRINHDO>();
                        list.Add(td);
                        list.AddRange(db.TRINHDOs.Where(x => x.TrangThai == true).ToList());
                        cbTrinhDo.DataSource = list;
                        cbTrinhDo.DataTextField = "TenTrinhDo";
                        cbTrinhDo.DataValueField = "MaTrinhDo";
                        cbTrinhDo.DataBind();

                    }
                    else
                    {
                        var kq = from x in db.CHUYENMUCs
                                 where x.LoaiChuyenMuc.Trim() == "frontend" && x.MaChuyenMucCha.ToString() == Request.QueryString["cmid"].ToString() && x.TrangThai == true
                                 select new { x.MaChuyenMucCha, x.MaChuyenMuc, x.Link, x.TenChuyenMuc };
                        rpChuyenMuc.DataSource = kq;
                        rpChuyenMuc.DataBind();

                        var kh = from x in db.KHOAHOCs
                                 where x.MaChuyenMuc.ToString() == Request.QueryString["cmid"].ToString() || x.CHUYENMUC.MaChuyenMucCha.ToString() == Request.QueryString["cmid"].ToString()
                                 select new { x.Gia, x.MaKhoaHoc, x.TenKhoaHoc, x.AnhDaiDien, x.SoHocVien, x.LuotXem, TenThanhVien = x.THANHVIEN_KHOAHOCs.SingleOrDefault(y => y.MaKhoaHoc == x.MaKhoaHoc && y.Loai == "Day").THANHVIEN.TenThanhVien };
                        rpNoiDungChuyenMucCon.DataSource = kh;
                        rpNoiDungChuyenMucCon.DataBind();

                        var cm = from x in db.CHUYENMUCs
                                 where x.MaChuyenMuc.ToString() == Request.QueryString["cmid"].ToString()
                                 select new { x.TenChuyenMuc, x.GhiChu };
                        foreach (var a in cm)
                        {
                            lblTenChuyenMuc.Text = a.TenChuyenMuc;
                            lblMoTaChuyenMuc.Text = a.GhiChu;
                        }

                        //Load trình độ
                        TRINHDO td = new TRINHDO();
                        td.MaTrinhDo = 0;
                        td.TenTrinhDo = "Tất cả";
                        List<TRINHDO> list = new List<TRINHDO>();
                        list.Add(td);
                        list.AddRange(db.TRINHDOs.Where(x => x.TrangThai == true).ToList());
                        cbTrinhDo.DataSource = list;
                        cbTrinhDo.DataTextField = "TenTrinhDo";
                        cbTrinhDo.DataValueField = "MaTrinhDo";
                        cbTrinhDo.DataBind();
                    }
                }
            }
        }

        protected void cbGia_SelectedIndexChanged(object sender, EventArgs e)
        {
            TimKiemKhoaHoc_TheoGia_TheoTrinhDo();
        }

        protected void cbTrinhDo_SelectedIndexChanged(object sender, EventArgs e)
        {
            TimKiemKhoaHoc_TheoGia_TheoTrinhDo();
        }

        public void TimKiemKhoaHoc_TheoGia_TheoTrinhDo()
        {
            using (StudyOnlineDataContext db = new StudyOnlineDataContext())
            {
                //nếu là chuyên mục con
                if (Request.QueryString["chuyenmucon_id"] != null)
                {
                    //nếu chọn giá là tất cả
                    if (cbGia.SelectedValue.ToString() == "TatCa")
                    {
                        //nếu chọn trình độ là tất cả
                        if (int.Parse(cbTrinhDo.SelectedValue.ToString()) ==0 )
                        {
                            var kh = from x in db.KHOAHOCs
                                     where x.MaChuyenMuc.ToString() == Request.QueryString["chuyenmucon_id"].ToString()
                                     select new { x.Gia, x.MaKhoaHoc, x.TenKhoaHoc, x.AnhDaiDien, x.SoHocVien, x.LuotXem, TenThanhVien = x.THANHVIEN_KHOAHOCs.SingleOrDefault(y => y.MaKhoaHoc == x.MaKhoaHoc && y.Loai == "Day").THANHVIEN.TenThanhVien };
                            rpNoiDungChuyenMucCon.DataSource = kh;
                            rpNoiDungChuyenMucCon.DataBind();
                        }
                        else
                        {
                            var kh = from x in db.KHOAHOCs
                                     where x.MaChuyenMuc.ToString() == Request.QueryString["chuyenmucon_id"].ToString() && x.MaTrinhDo ==int.Parse(cbTrinhDo.SelectedValue.ToString())
                                     select new { x.Gia, x.MaKhoaHoc, x.TenKhoaHoc, x.AnhDaiDien, x.SoHocVien, x.LuotXem, TenThanhVien = x.THANHVIEN_KHOAHOCs.SingleOrDefault(y => y.MaKhoaHoc == x.MaKhoaHoc && y.Loai == "Day").THANHVIEN.TenThanhVien };
                            rpNoiDungChuyenMucCon.DataSource = kh;
                            rpNoiDungChuyenMucCon.DataBind();
                        }
                    }
                    //nếu chọn giá là miễn phí
                    if (cbGia.SelectedValue.ToString() == "MienPhi")
                    {
                        //nếu chọn trình độ là tất cả
                        if (int.Parse(cbTrinhDo.SelectedValue.ToString()) == 0)
                        {
                            var kh = from x in db.KHOAHOCs
                                     where x.MaChuyenMuc.ToString() == Request.QueryString["chuyenmucon_id"].ToString() && x.Gia == 0
                                     select new { x.Gia, x.MaKhoaHoc, x.TenKhoaHoc, x.AnhDaiDien, x.SoHocVien, x.LuotXem, TenThanhVien = x.THANHVIEN_KHOAHOCs.SingleOrDefault(y => y.MaKhoaHoc == x.MaKhoaHoc && y.Loai == "Day").THANHVIEN.TenThanhVien };
                            rpNoiDungChuyenMucCon.DataSource = kh;
                            rpNoiDungChuyenMucCon.DataBind();
                        }
                        else
                        {
                            var kh = from x in db.KHOAHOCs
                                     where x.MaChuyenMuc.ToString() == Request.QueryString["chuyenmucon_id"].ToString() && x.MaTrinhDo == int.Parse(cbTrinhDo.SelectedValue.ToString()) && x.Gia == 0
                                     select new { x.Gia, x.MaKhoaHoc, x.TenKhoaHoc, x.AnhDaiDien, x.SoHocVien, x.LuotXem, TenThanhVien = x.THANHVIEN_KHOAHOCs.SingleOrDefault(y => y.MaKhoaHoc == x.MaKhoaHoc && y.Loai == "Day").THANHVIEN.TenThanhVien };
                            rpNoiDungChuyenMucCon.DataSource = kh;
                            rpNoiDungChuyenMucCon.DataBind();
                        }

                    }

                    //nếu chọn giá là trả phí
                    if (cbGia.SelectedValue.ToString() == "TraPhi")
                    {
                        //nếu chọn trình độ là tất cả
                        if (int.Parse(cbTrinhDo.SelectedValue.ToString()) == 0)
                        {
                            var kh = from x in db.KHOAHOCs
                                     where x.MaChuyenMuc.ToString() == Request.QueryString["chuyenmucon_id"].ToString() && x.Gia > 0
                                     select new { x.Gia, x.MaKhoaHoc, x.TenKhoaHoc, x.AnhDaiDien, x.SoHocVien, x.LuotXem, TenThanhVien = x.THANHVIEN_KHOAHOCs.SingleOrDefault(y => y.MaKhoaHoc == x.MaKhoaHoc && y.Loai == "Day").THANHVIEN.TenThanhVien };
                            rpNoiDungChuyenMucCon.DataSource = kh;
                            rpNoiDungChuyenMucCon.DataBind();
                        }
                        else
                        {
                            var kh = from x in db.KHOAHOCs
                                     where x.MaChuyenMuc.ToString() == Request.QueryString["chuyenmucon_id"].ToString() && x.MaTrinhDo == int.Parse(cbTrinhDo.SelectedValue.ToString()) && x.Gia> 0
                                     select new { x.Gia, x.MaKhoaHoc, x.TenKhoaHoc, x.AnhDaiDien, x.SoHocVien, x.LuotXem, TenThanhVien = x.THANHVIEN_KHOAHOCs.SingleOrDefault(y => y.MaKhoaHoc == x.MaKhoaHoc && y.Loai == "Day").THANHVIEN.TenThanhVien };
                            rpNoiDungChuyenMucCon.DataSource = kh;
                            rpNoiDungChuyenMucCon.DataBind();
                        }

                    }

                }

                //Nếu là chuyên mục cha
                else
                {
                    //nếu chọn giá là tất cả
                    if (cbGia.SelectedValue.ToString() == "TatCa")
                    {
                        //nếu chọn trình độ là tất cả
                        if (cbTrinhDo.SelectedValue.ToString() == "0")
                        {
                            var kh = from x in db.KHOAHOCs
                                     where (x.MaChuyenMuc.ToString() == Request.QueryString["cmid"].ToString() || x.CHUYENMUC.MaChuyenMucCha.ToString() == Request.QueryString["cmid"].ToString())
                                     select new { x.Gia, x.MaKhoaHoc, x.TenKhoaHoc, x.AnhDaiDien, x.SoHocVien, x.LuotXem, TenThanhVien = x.THANHVIEN_KHOAHOCs.SingleOrDefault(y => y.MaKhoaHoc == x.MaKhoaHoc && y.Loai == "Day").THANHVIEN.TenThanhVien };
                            rpNoiDungChuyenMucCon.DataSource = kh;
                            rpNoiDungChuyenMucCon.DataBind();
                        }
                        else
                        {
                            var kh = from x in db.KHOAHOCs
                                     where (x.MaChuyenMuc.ToString() == Request.QueryString["cmid"].ToString() || x.CHUYENMUC.MaChuyenMucCha.ToString() == Request.QueryString["cmid"].ToString()) && x.MaTrinhDo ==int.Parse(cbTrinhDo.SelectedValue.ToString())
                                     select new { x.Gia, x.MaKhoaHoc, x.TenKhoaHoc, x.AnhDaiDien, x.SoHocVien, x.LuotXem, TenThanhVien = x.THANHVIEN_KHOAHOCs.SingleOrDefault(y => y.MaKhoaHoc == x.MaKhoaHoc && y.Loai == "Day").THANHVIEN.TenThanhVien };
                            rpNoiDungChuyenMucCon.DataSource = kh;
                            rpNoiDungChuyenMucCon.DataBind();
                        }
                        
                    }
                    //nếu chọn giá là miễn phí
                    if (cbGia.SelectedValue.ToString() == "MienPhi")
                    {
                        //nếu chọn trình độ là tất cả
                        if (cbTrinhDo.SelectedValue.ToString() == "0")
                        {
                            var kh = from x in db.KHOAHOCs
                                     where (x.MaChuyenMuc.ToString() == Request.QueryString["cmid"].ToString() || x.CHUYENMUC.MaChuyenMucCha.ToString() == Request.QueryString["cmid"].ToString()) && x.Gia == 0
                                     select new { x.Gia, x.MaKhoaHoc, x.TenKhoaHoc, x.AnhDaiDien, x.SoHocVien, x.LuotXem, TenThanhVien = x.THANHVIEN_KHOAHOCs.SingleOrDefault(y => y.MaKhoaHoc == x.MaKhoaHoc && y.Loai == "Day").THANHVIEN.TenThanhVien };
                            rpNoiDungChuyenMucCon.DataSource = kh;
                            rpNoiDungChuyenMucCon.DataBind();
                        }
                        else
                        {
                            var kh = from x in db.KHOAHOCs
                                     where (x.MaChuyenMuc.ToString() == Request.QueryString["cmid"].ToString() || x.CHUYENMUC.MaChuyenMucCha.ToString() == Request.QueryString["cmid"].ToString()) && x.MaTrinhDo == int.Parse(cbTrinhDo.SelectedValue.ToString()) && x.Gia == 0
                                     select new { x.Gia, x.MaKhoaHoc, x.TenKhoaHoc, x.AnhDaiDien, x.SoHocVien, x.LuotXem, TenThanhVien = x.THANHVIEN_KHOAHOCs.SingleOrDefault(y => y.MaKhoaHoc == x.MaKhoaHoc && y.Loai == "Day").THANHVIEN.TenThanhVien };
                            rpNoiDungChuyenMucCon.DataSource = kh;
                            rpNoiDungChuyenMucCon.DataBind();
                        }

                    }

                    //nếu chọn giá là trả phí
                    if (cbGia.SelectedValue.ToString() == "TraPhi")
                    {
                        //nếu chọn trình độ là tất cả
                        if (cbTrinhDo.SelectedValue.ToString() == "0")
                        {
                            var kh = from x in db.KHOAHOCs
                                     where (x.MaChuyenMuc.ToString() == Request.QueryString["cmid"].ToString() || x.CHUYENMUC.MaChuyenMucCha.ToString() == Request.QueryString["cmid"].ToString()) && x.Gia > 0
                                     select new { x.Gia, x.MaKhoaHoc, x.TenKhoaHoc, x.AnhDaiDien, x.SoHocVien, x.LuotXem, TenThanhVien = x.THANHVIEN_KHOAHOCs.SingleOrDefault(y => y.MaKhoaHoc == x.MaKhoaHoc && y.Loai == "Day").THANHVIEN.TenThanhVien };
                            rpNoiDungChuyenMucCon.DataSource = kh;
                            rpNoiDungChuyenMucCon.DataBind();
                        }
                        else
                        {
                            var kh = from x in db.KHOAHOCs
                                     where (x.MaChuyenMuc.ToString() == Request.QueryString["cmid"].ToString() || x.CHUYENMUC.MaChuyenMucCha.ToString() == Request.QueryString["cmid"].ToString()) && x.MaTrinhDo == int.Parse(cbTrinhDo.SelectedValue.ToString()) && x.Gia > 0
                                     select new { x.Gia, x.MaKhoaHoc, x.TenKhoaHoc, x.AnhDaiDien, x.SoHocVien, x.LuotXem, TenThanhVien = x.THANHVIEN_KHOAHOCs.SingleOrDefault(y => y.MaKhoaHoc == x.MaKhoaHoc && y.Loai == "Day").THANHVIEN.TenThanhVien };
                            rpNoiDungChuyenMucCon.DataSource = kh;
                            rpNoiDungChuyenMucCon.DataBind();
                        }

                    }
                }
            }
        }
    }
}