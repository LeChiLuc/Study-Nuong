using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudyOnline_Nuong
{
    public partial class Course : System.Web.UI.Page
    {
        static string makhoahoc = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            makhoahoc = Request.QueryString["cou"].ToString();
            if (Session["MaThanhVien"] == null)
            {
                string url = "/Course.aspx?cou=" + makhoahoc + "";
                Response.Redirect("/Login.aspx?url=" + url + "");//chuyển sang trang login.aspx
            }
            else
            {
                using (StudyOnlineDataContext db = new StudyOnlineDataContext())
                {
                    var kq2 = from x in db.THANHVIEN_KHOAHOCs
                              where x.MaKhoaHoc.ToString() == makhoahoc && x.MaThanhVien == int.Parse(Session["MaThanhVien"].ToString())
                              select x;
                    if (kq2.Count() > 0)
                    {
                        Response.Redirect("/LessonDetail.aspx?detail=" + makhoahoc + "");//chuyển trang
                    }
                    else
                    {
                        var kq = from x in db.KHOAHOCs
                                 where x.MaKhoaHoc.ToString() == makhoahoc
                                 select x;
                        foreach (var a in kq)//duyệt từ đầu đến hết.
                        {
                            //load thông tin khóa học
                            ltrMoTa.Text = a.MoTa;
                            lblTenKhoaHoc.Text = a.TenKhoaHoc;
                            lblGia.Text = a.Gia.ToString();
                            hylChuyenMuc.Text = a.CHUYENMUC.TenChuyenMuc;
                            hylChuyenMuc.NavigateUrl = "/Category.aspx?cmid=" + a.MaChuyenMuc + "";//NavigateUrl: gán URL cho chuyen muc
                            imgAnhDaiDien.ImageUrl = a.AnhDaiDien;

                            //Tăng lượt xem lên 1
                            a.LuotXem = a.LuotXem + 1;
                            db.SubmitChanges();
                            //khóa học cùng chuyên mục
                            var khcm =( from x in db.KHOAHOCs
                                       where x.MaChuyenMuc == a.MaChuyenMuc
                                       select x).Take(3);//lay 3 khoa hoc
                            rpKhoaHocCungChuyenMuc.DataSource = khcm;
                            rpKhoaHocCungChuyenMuc.DataBind();
                           
                        }

                        //phanhoc
                        var ph = from x in db.PHANHOCs
                                 where x.MaKhoaHoc.ToString() == makhoahoc
                                 select new { x.MaPhanHoc, x.TenPhanHoc };
                        rpPhanHoc.DataSource = ph;
                        rpPhanHoc.DataBind();

                    }
                }
            }
        }

        protected void btnBatDauHoc_Click(object sender, EventArgs e)
        {
            using (StudyOnlineDataContext db = new StudyOnlineDataContext())
            {
                var kq = from x in db.KHOAHOCs
                         where x.MaKhoaHoc.ToString() == makhoahoc
                         select x;
                foreach (var a in kq)
                {
                    if (a.Gia > 0)
                    {
                        String return_url = "http://tmcedu.somee.com/LessonDetail.aspx?detail=" + makhoahoc + "";// Địa chỉ trả về 
                        String transaction_info = "Thanh toán khóa học " + makhoahoc + "";//Thông tin giao dịch
                        String order_code = makhoahoc;//Mã order
                        String receiver = "nuongtk82it@gmail.com";//Tài khoản nhận tiền 
                        String price = a.Gia.ToString();//Lấy giá 
                        NL_Checkout nl = new NL_Checkout();
                        String url;
                        url = nl.buildCheckoutUrl(return_url, receiver, transaction_info, order_code, price);
                        Response.Redirect(url);

                    }
                    else
                    {
                        THANHVIEN_KHOAHOC tv_kh = new THANHVIEN_KHOAHOC();
                        tv_kh.MaThanhVien = int.Parse(Session["MaThanhVien"].ToString());
                        tv_kh.MaKhoaHoc = int.Parse(makhoahoc);
                        tv_kh.Loai = "Hoc";
                        tv_kh.TrangThaiThanhToan = true;
                        db.THANHVIEN_KHOAHOCs.InsertOnSubmit(tv_kh);

                        //Tăng số học viên lên 1
                        a.SoHocVien = a.SoHocVien + 1;
                        db.SubmitChanges();

                        Response.Redirect("/LessonDetail.aspx?detail=" + makhoahoc + "");
                    }
                }

            }
        }

        protected void rpPhanHoc_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            using (StudyOnlineDataContext db = new StudyOnlineDataContext())
            {
                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    HiddenField hfMaPH = (HiddenField)e.Item.FindControl("hfMaPhanHoc");
                    Repeater rpBH = (Repeater)e.Item.FindControl("rpBaiHoc");
                    //bai hoc.
                    var bh = from x in db.BAIHOCs
                             where x.MaPhanHoc.ToString() == hfMaPH.Value.ToString()
                             select x;
                    rpBH.DataSource = bh;
                    rpBH.DataBind();
                }
            }
        }
    }
}