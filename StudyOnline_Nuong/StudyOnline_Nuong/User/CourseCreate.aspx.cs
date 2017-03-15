using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudyOnline_Nuong.User
{
    public partial class CourseCreate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["MaThanhVien"] == null)
                {
                    string url = "/User/CourseCreate.aspx";
                    Response.Redirect("/Login.aspx?url=" + url + "");
                }
            }

        }

        protected void btnLuuKhoaHoc_Click(object sender, EventArgs e)
        {
            using (StudyOnlineDataContext db = new StudyOnlineDataContext())
            {
                KHOAHOC kh = new KHOAHOC();
                kh.TenKhoaHoc = txtTenKhoaHoc.Text;
                kh.LuotXem = 0;
                kh.SoHocVien = 0;
                db.KHOAHOCs.InsertOnSubmit(kh);
                db.SubmitChanges();

                //thêm vào bảng thành viên khóa học
                THANHVIEN_KHOAHOC tv_kh = new THANHVIEN_KHOAHOC();
                tv_kh.MaThanhVien = int.Parse(Session["MaThanhVien"].ToString());
                tv_kh.MaKhoaHoc = kh.MaKhoaHoc;
                tv_kh.Loai = "Day";
                tv_kh.TrangThaiThanhToan = false;
                db.THANHVIEN_KHOAHOCs.InsertOnSubmit(tv_kh);
                db.SubmitChanges();
                Response.Write("<script>alert('Bạn đã tạo khóa học thành công!')</script>");
                Response.Redirect("../User/CourseInfomation.aspx?couid=" + kh.MaKhoaHoc.ToString());
            }
        }
    }
}