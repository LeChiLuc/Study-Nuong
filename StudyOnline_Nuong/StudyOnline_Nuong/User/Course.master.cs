using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudyOnline_Nuong.User
{
    public partial class Course : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (HttpContext.Current.Request.QueryString["couid"] != null)
                {
                    string makhoahoc = HttpContext.Current.Request.QueryString["couid"].ToString();
                    lblMenuCoBan.Text = "<a href='../User/CourseInfomation.aspx?couid=" + makhoahoc + "'>Cơ bản </a>";
                    lblMenuChiTiet.Text = "<a href='../User/CourseDetail.aspx?couid=" + makhoahoc + "'>Chi tiết </a>";

                    using (StudyOnlineDataContext db = new StudyOnlineDataContext())
                    {
                        var kh = db.THANHVIEN_KHOAHOCs.SingleOrDefault(x => x.MaKhoaHoc.ToString() == makhoahoc && x.Loai == "Day");
                        lblTenKhoaHoc.Text = kh.KHOAHOC.TenKhoaHoc;
                        lblTenThanhVien.Text = kh.THANHVIEN.TenThanhVien;

                    }
                }
            }
        }

        protected void btnXuatBan_Click(object sender, EventArgs e)
        {
            using (StudyOnlineDataContext db = new StudyOnlineDataContext())
            {
                string makhoahoc = HttpContext.Current.Request.QueryString["couid"].ToString();
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
                        String receiver = "lecongphuc92@gmail.com";//Tài khoản nhận tiền 
                        String price = "5000";//Lấy giá 
                        NL_Checkout nl = new NL_Checkout();
                        String url;
                        url = nl.buildCheckoutUrl(return_url, receiver, transaction_info, order_code, price);
                        Response.Redirect(url);

                    }
                }
            }
        }

        protected void btnXem_Click(object sender, EventArgs e)
        {
            Response.Redirect("../LessonDetail.aspx?detail=" + HttpContext.Current.Request.QueryString["couid"]);
        }
    }
}