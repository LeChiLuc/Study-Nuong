USE [StudyEnglishOnline_Nuong]
GO
/****** Object:  Table [dbo].[THANHVIEN]    Script Date: 06/22/2014 14:58:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[THANHVIEN](
	[MaThanhVien] [int] IDENTITY(1,1) NOT NULL,
	[TenThanhVien] [nvarchar](250) NULL,
	[MatKhau] [char](50) NULL,
	[Email] [char](50) NOT NULL,
	[TrangThai] [bit] NULL,
	[GhiChu] [nvarchar](250) NULL,
 CONSTRAINT [PK_THANHVIEN] PRIMARY KEY CLUSTERED 
(
	[MaThanhVien] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[THANHVIEN] ON
INSERT [dbo].[THANHVIEN] ([MaThanhVien], [TenThanhVien], [MatKhau], [Email], [TrangThai], [GhiChu]) VALUES (2, N'Nguyễn Nương', N'titmitchit                                        ', N'nuongtk82it@gmail.com                             ', 1, NULL)
INSERT [dbo].[THANHVIEN] ([MaThanhVien], [TenThanhVien], [MatKhau], [Email], [TrangThai], [GhiChu]) VALUES (12, N'Thảo Vy', N'titmitchit                                        ', N'thaovy@gmail.com                                  ', 1, NULL)
INSERT [dbo].[THANHVIEN] ([MaThanhVien], [TenThanhVien], [MatKhau], [Email], [TrangThai], [GhiChu]) VALUES (14, N'Nhật Minh', N'titmitchit                                        ', N'nhatminh@gmail.com                                ', 1, NULL)
INSERT [dbo].[THANHVIEN] ([MaThanhVien], [TenThanhVien], [MatKhau], [Email], [TrangThai], [GhiChu]) VALUES (15, N'Thảo Mai', N'titmitchit                                        ', N'thaomai@gmail.com                                 ', 1, N'')
SET IDENTITY_INSERT [dbo].[THANHVIEN] OFF
/****** Object:  Table [dbo].[TRINHDO]    Script Date: 06/22/2014 14:58:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRINHDO](
	[MaTrinhDo] [int] IDENTITY(1,1) NOT NULL,
	[TenTrinhDo] [nvarchar](250) NULL,
	[TrangThai] [bit] NULL,
	[GhiChu] [nvarchar](250) NULL,
 CONSTRAINT [PK_TRINHDO] PRIMARY KEY CLUSTERED 
(
	[MaTrinhDo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TRINHDO] ON
INSERT [dbo].[TRINHDO] ([MaTrinhDo], [TenTrinhDo], [TrangThai], [GhiChu]) VALUES (1, N'Cơ bản', 1, N'')
INSERT [dbo].[TRINHDO] ([MaTrinhDo], [TenTrinhDo], [TrangThai], [GhiChu]) VALUES (2, N'Nâng cao', 1, NULL)
SET IDENTITY_INSERT [dbo].[TRINHDO] OFF
/****** Object:  Table [dbo].[CHUYENMUC]    Script Date: 06/22/2014 14:58:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CHUYENMUC](
	[MaChuyenMuc] [int] IDENTITY(1,1) NOT NULL,
	[TenChuyenMuc] [nvarchar](250) NULL,
	[MaChuyenMucCha] [int] NULL,
	[LoaiChuyenMuc] [char](50) NULL,
	[Link] [nvarchar](500) NULL,
	[ThuTu] [int] NULL,
	[TrangThai] [bit] NULL,
	[GhiChu] [nvarchar](250) NULL,
 CONSTRAINT [PK_CHUYENMUC] PRIMARY KEY CLUSTERED 
(
	[MaChuyenMuc] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[CHUYENMUC] ON
INSERT [dbo].[CHUYENMUC] ([MaChuyenMuc], [TenChuyenMuc], [MaChuyenMucCha], [LoaiChuyenMuc], [Link], [ThuTu], [TrangThai], [GhiChu]) VALUES (1, N'Chuyên mục', 0, N'backend                                           ', N'../Admin/CategoryViewAll.aspx', 1, 1, NULL)
INSERT [dbo].[CHUYENMUC] ([MaChuyenMuc], [TenChuyenMuc], [MaChuyenMucCha], [LoaiChuyenMuc], [Link], [ThuTu], [TrangThai], [GhiChu]) VALUES (2, N'Thêm chuyên mục', 1, N'backend                                           ', N'../Admin/CategoryCreate.aspx', 1, 1, NULL)
INSERT [dbo].[CHUYENMUC] ([MaChuyenMuc], [TenChuyenMuc], [MaChuyenMucCha], [LoaiChuyenMuc], [Link], [ThuTu], [TrangThai], [GhiChu]) VALUES (3, N'Khóa học', 0, N'backend                                           ', N'../Admin/CourseViewAll.aspx', 2, 1, NULL)
INSERT [dbo].[CHUYENMUC] ([MaChuyenMuc], [TenChuyenMuc], [MaChuyenMucCha], [LoaiChuyenMuc], [Link], [ThuTu], [TrangThai], [GhiChu]) VALUES (4, N'Thành viên', 0, N'backend                                           ', N'../Admin/UserViewAll.aspx', 3, 1, NULL)
INSERT [dbo].[CHUYENMUC] ([MaChuyenMuc], [TenChuyenMuc], [MaChuyenMucCha], [LoaiChuyenMuc], [Link], [ThuTu], [TrangThai], [GhiChu]) VALUES (5, N'Thêm thành viên', 4, N'backend                                           ', N'../Admin/UserCreate.aspx', 1, 1, NULL)
INSERT [dbo].[CHUYENMUC] ([MaChuyenMuc], [TenChuyenMuc], [MaChuyenMucCha], [LoaiChuyenMuc], [Link], [ThuTu], [TrangThai], [GhiChu]) VALUES (6, N'Trình độ', 0, N'backend                                           ', N'../Admin/LevelViewAll.aspx', 4, 1, NULL)
INSERT [dbo].[CHUYENMUC] ([MaChuyenMuc], [TenChuyenMuc], [MaChuyenMucCha], [LoaiChuyenMuc], [Link], [ThuTu], [TrangThai], [GhiChu]) VALUES (7, N'Thêm trình độ', 6, N'backend                                           ', N'../Admin/LevelCreate.aspx', 1, 1, NULL)
INSERT [dbo].[CHUYENMUC] ([MaChuyenMuc], [TenChuyenMuc], [MaChuyenMucCha], [LoaiChuyenMuc], [Link], [ThuTu], [TrangThai], [GhiChu]) VALUES (8, N'Bình luận', 0, N'backend                                           ', N'../Admin/CommentViewAll.aspx', 5, 1, NULL)
INSERT [dbo].[CHUYENMUC] ([MaChuyenMuc], [TenChuyenMuc], [MaChuyenMucCha], [LoaiChuyenMuc], [Link], [ThuTu], [TrangThai], [GhiChu]) VALUES (15, N'KỸ NĂNG', 0, N'frontend                                          ', N'', 1, 1, N'')
INSERT [dbo].[CHUYENMUC] ([MaChuyenMuc], [TenChuyenMuc], [MaChuyenMucCha], [LoaiChuyenMuc], [Link], [ThuTu], [TrangThai], [GhiChu]) VALUES (16, N'Ngữ pháp', 15, N'frontend                                          ', NULL, NULL, 1, NULL)
INSERT [dbo].[CHUYENMUC] ([MaChuyenMuc], [TenChuyenMuc], [MaChuyenMucCha], [LoaiChuyenMuc], [Link], [ThuTu], [TrangThai], [GhiChu]) VALUES (17, N'Nghe', 15, N'frontend                                          ', NULL, NULL, 1, NULL)
INSERT [dbo].[CHUYENMUC] ([MaChuyenMuc], [TenChuyenMuc], [MaChuyenMucCha], [LoaiChuyenMuc], [Link], [ThuTu], [TrangThai], [GhiChu]) VALUES (18, N'Nói', 15, N'frontend                                          ', NULL, NULL, 1, NULL)
INSERT [dbo].[CHUYENMUC] ([MaChuyenMuc], [TenChuyenMuc], [MaChuyenMucCha], [LoaiChuyenMuc], [Link], [ThuTu], [TrangThai], [GhiChu]) VALUES (19, N'Đọc', 15, N'frontend                                          ', NULL, NULL, 1, NULL)
INSERT [dbo].[CHUYENMUC] ([MaChuyenMuc], [TenChuyenMuc], [MaChuyenMucCha], [LoaiChuyenMuc], [Link], [ThuTu], [TrangThai], [GhiChu]) VALUES (20, N'Viết', 15, N'frontend                                          ', NULL, NULL, 1, NULL)
INSERT [dbo].[CHUYENMUC] ([MaChuyenMuc], [TenChuyenMuc], [MaChuyenMucCha], [LoaiChuyenMuc], [Link], [ThuTu], [TrangThai], [GhiChu]) VALUES (21, N'TIẾNG ANH TRẺ EM', 0, N'frontend                                          ', N'', 2, 1, N'')
INSERT [dbo].[CHUYENMUC] ([MaChuyenMuc], [TenChuyenMuc], [MaChuyenMucCha], [LoaiChuyenMuc], [Link], [ThuTu], [TrangThai], [GhiChu]) VALUES (22, N'Lớp 3', 21, N'frontend                                          ', N'', 1, 1, N'')
INSERT [dbo].[CHUYENMUC] ([MaChuyenMuc], [TenChuyenMuc], [MaChuyenMucCha], [LoaiChuyenMuc], [Link], [ThuTu], [TrangThai], [GhiChu]) VALUES (23, N'Lớp 4', 21, N'frontend                                          ', N'', 1, 1, N'')
INSERT [dbo].[CHUYENMUC] ([MaChuyenMuc], [TenChuyenMuc], [MaChuyenMucCha], [LoaiChuyenMuc], [Link], [ThuTu], [TrangThai], [GhiChu]) VALUES (24, N'Lớp 5', 21, N'frontend                                          ', N'', 1, 1, N'')
INSERT [dbo].[CHUYENMUC] ([MaChuyenMuc], [TenChuyenMuc], [MaChuyenMucCha], [LoaiChuyenMuc], [Link], [ThuTu], [TrangThai], [GhiChu]) VALUES (25, N'Tiếng Anh THCS', 28, N'frontend                                          ', N'', 1, 1, N'')
INSERT [dbo].[CHUYENMUC] ([MaChuyenMuc], [TenChuyenMuc], [MaChuyenMucCha], [LoaiChuyenMuc], [Link], [ThuTu], [TrangThai], [GhiChu]) VALUES (26, N'Tiếng Anh THPT', 28, N'frontend                                          ', N'', 1, 1, N'')
INSERT [dbo].[CHUYENMUC] ([MaChuyenMuc], [TenChuyenMuc], [MaChuyenMucCha], [LoaiChuyenMuc], [Link], [ThuTu], [TrangThai], [GhiChu]) VALUES (28, N'TIẾNG ANH PHỔ THÔNG', 0, N'frontend                                          ', N'', 3, 1, N'')
INSERT [dbo].[CHUYENMUC] ([MaChuyenMuc], [TenChuyenMuc], [MaChuyenMucCha], [LoaiChuyenMuc], [Link], [ThuTu], [TrangThai], [GhiChu]) VALUES (29, N'TIẾNG ANH NGƯỜI LỚN', 0, N'frontend                                          ', N'', 1, 1, N'')
INSERT [dbo].[CHUYENMUC] ([MaChuyenMuc], [TenChuyenMuc], [MaChuyenMucCha], [LoaiChuyenMuc], [Link], [ThuTu], [TrangThai], [GhiChu]) VALUES (30, N'Tiếng Anh giao tiếp', 29, N'frontend                                          ', N'', 1, 1, N'')
INSERT [dbo].[CHUYENMUC] ([MaChuyenMuc], [TenChuyenMuc], [MaChuyenMucCha], [LoaiChuyenMuc], [Link], [ThuTu], [TrangThai], [GhiChu]) VALUES (31, N'Tiếng Anh cơ bản', 29, N'frontend                                          ', N'', 1, 1, N'')
INSERT [dbo].[CHUYENMUC] ([MaChuyenMuc], [TenChuyenMuc], [MaChuyenMucCha], [LoaiChuyenMuc], [Link], [ThuTu], [TrangThai], [GhiChu]) VALUES (32, N'Học qua Video', 29, N'frontend                                          ', N'', 1, 1, N'')
INSERT [dbo].[CHUYENMUC] ([MaChuyenMuc], [TenChuyenMuc], [MaChuyenMucCha], [LoaiChuyenMuc], [Link], [ThuTu], [TrangThai], [GhiChu]) VALUES (33, N'Tiếng Anh cơ bản 1', 29, N'frontend                                          ', N'', 1, 1, N'')
SET IDENTITY_INSERT [dbo].[CHUYENMUC] OFF
/****** Object:  Table [dbo].[KHOAHOC]    Script Date: 06/22/2014 14:58:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHOAHOC](
	[MaKhoaHoc] [int] IDENTITY(1,1) NOT NULL,
	[TenKhoaHoc] [nvarchar](250) NULL,
	[AnhDaiDien] [nvarchar](500) NULL,
	[VideoGioiThieu] [nvarchar](500) NULL,
	[MoTa] [nvarchar](500) NULL,
	[NgayDang] [datetime] NULL,
	[LuotXem] [int] NULL,
	[SoHocVien] [int] NULL,
	[TrangThai] [bit] NULL,
	[MaChuyenMuc] [int] NULL,
	[MaTrinhDo] [int] NULL,
	[Gia] [float] NULL,
 CONSTRAINT [PK_KHOAHOC] PRIMARY KEY CLUSTERED 
(
	[MaKhoaHoc] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[KHOAHOC] ON
INSERT [dbo].[KHOAHOC] ([MaKhoaHoc], [TenKhoaHoc], [AnhDaiDien], [VideoGioiThieu], [MoTa], [NgayDang], [LuotXem], [SoHocVien], [TrangThai], [MaChuyenMuc], [MaTrinhDo], [Gia]) VALUES (4, N'12 thì trong tiếng Anh', N'/Upload/Course/52591_31a5_4.jpg', NULL, N'Khóa học 12 thì trong tiếng Anh, chúc các bạn học tốt', NULL, 18, 3, 1, 16, 1, 0)
INSERT [dbo].[KHOAHOC] ([MaKhoaHoc], [TenKhoaHoc], [AnhDaiDien], [VideoGioiThieu], [MoTa], [NgayDang], [LuotXem], [SoHocVien], [TrangThai], [MaChuyenMuc], [MaTrinhDo], [Gia]) VALUES (5, N'Câu điều kiện', N'/Upload/Course/67236_3d7f_10.jpg', NULL, N'chúc các bạn học tốt', NULL, 4, 1, 1, 15, 1, 0)
INSERT [dbo].[KHOAHOC] ([MaKhoaHoc], [TenKhoaHoc], [AnhDaiDien], [VideoGioiThieu], [MoTa], [NgayDang], [LuotXem], [SoHocVien], [TrangThai], [MaChuyenMuc], [MaTrinhDo], [Gia]) VALUES (6, N'Câu hỏi', N'/Upload/Course/114318_ba54_6.jpg', NULL, N'chúc các bạn học tốt', NULL, 7, 0, 1, 16, 1, 111111)
INSERT [dbo].[KHOAHOC] ([MaKhoaHoc], [TenKhoaHoc], [AnhDaiDien], [VideoGioiThieu], [MoTa], [NgayDang], [LuotXem], [SoHocVien], [TrangThai], [MaChuyenMuc], [MaTrinhDo], [Gia]) VALUES (7, N'Danh từ', N'/Upload/Course/7723_3e68_8.jpg', NULL, N'danh từ', NULL, 0, 0, 1, 16, 2, 0)
INSERT [dbo].[KHOAHOC] ([MaKhoaHoc], [TenKhoaHoc], [AnhDaiDien], [VideoGioiThieu], [MoTa], [NgayDang], [LuotXem], [SoHocVien], [TrangThai], [MaChuyenMuc], [MaTrinhDo], [Gia]) VALUES (8, N'Lớp 10', N'/Upload/Course/152754_0ddb_7.jpg', NULL, N'khóa học trực tuyến dành cho học sinh lớp 10. Chương trình học là nội dung trong sách giáo khoa lớp 10', NULL, 0, 0, 1, 26, 2, 0)
INSERT [dbo].[KHOAHOC] ([MaKhoaHoc], [TenKhoaHoc], [AnhDaiDien], [VideoGioiThieu], [MoTa], [NgayDang], [LuotXem], [SoHocVien], [TrangThai], [MaChuyenMuc], [MaTrinhDo], [Gia]) VALUES (9, N'Lớp 11', N'/Upload/Course/216828_2516_3.jpg', NULL, N'khóa học dành cho học sinh THPT lớp 11', NULL, 0, 0, 1, 26, 1, 11)
INSERT [dbo].[KHOAHOC] ([MaKhoaHoc], [TenKhoaHoc], [AnhDaiDien], [VideoGioiThieu], [MoTa], [NgayDang], [LuotXem], [SoHocVien], [TrangThai], [MaChuyenMuc], [MaTrinhDo], [Gia]) VALUES (10, N'Science and Technology', N'/Upload/Course/7819_13e5_7.jpg', NULL, N'Science and Technology', NULL, 2, 1, 1, 30, 1, 0)
INSERT [dbo].[KHOAHOC] ([MaKhoaHoc], [TenKhoaHoc], [AnhDaiDien], [VideoGioiThieu], [MoTa], [NgayDang], [LuotXem], [SoHocVien], [TrangThai], [MaChuyenMuc], [MaTrinhDo], [Gia]) VALUES (11, N'Bé học bảng chữ cái tiếng Anh', N'/Upload/Course/40629_2b0c_10.jpg', NULL, N'Bé học bảng chữ cái tiếng Anh', NULL, 0, 0, 1, 22, 2, 2)
INSERT [dbo].[KHOAHOC] ([MaKhoaHoc], [TenKhoaHoc], [AnhDaiDien], [VideoGioiThieu], [MoTa], [NgayDang], [LuotXem], [SoHocVien], [TrangThai], [MaChuyenMuc], [MaTrinhDo], [Gia]) VALUES (12, N'Lớp 4', N'/Upload/Course/117056_5be8_7.jpg', NULL, N'KH Lớp 3', NULL, 0, 0, 1, 23, 1, 0)
INSERT [dbo].[KHOAHOC] ([MaKhoaHoc], [TenKhoaHoc], [AnhDaiDien], [VideoGioiThieu], [MoTa], [NgayDang], [LuotXem], [SoHocVien], [TrangThai], [MaChuyenMuc], [MaTrinhDo], [Gia]) VALUES (13, N'Bé học số', N'/Upload/Course/198944_a857_5.jpg', NULL, N'Bé học số', NULL, 0, 0, 1, 23, 1, 0)
INSERT [dbo].[KHOAHOC] ([MaKhoaHoc], [TenKhoaHoc], [AnhDaiDien], [VideoGioiThieu], [MoTa], [NgayDang], [LuotXem], [SoHocVien], [TrangThai], [MaChuyenMuc], [MaTrinhDo], [Gia]) VALUES (14, N'Lớp 5', N'/Upload/Course/40626_809a_5.jpg', NULL, N'lớp 5', NULL, 0, 0, 1, 24, 1, 0)
INSERT [dbo].[KHOAHOC] ([MaKhoaHoc], [TenKhoaHoc], [AnhDaiDien], [VideoGioiThieu], [MoTa], [NgayDang], [LuotXem], [SoHocVien], [TrangThai], [MaChuyenMuc], [MaTrinhDo], [Gia]) VALUES (21, N'Học tiếng Anh qua lời bài hát', N'/Upload/Course/28967_7bc5_2.jpg', NULL, N'nghe bài hát', NULL, 0, 0, 1, 32, 1, 12000)
SET IDENTITY_INSERT [dbo].[KHOAHOC] OFF
/****** Object:  Table [dbo].[THANHVIEN_KHOAHOC]    Script Date: 06/22/2014 14:58:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[THANHVIEN_KHOAHOC](
	[MaThanhVien] [int] NOT NULL,
	[MaKhoaHoc] [int] NOT NULL,
	[Loai] [char](50) NULL,
	[TrangThaiThanhToan] [bit] NULL,
 CONSTRAINT [PK_THANHVIEN_KHOAHOC] PRIMARY KEY CLUSTERED 
(
	[MaThanhVien] ASC,
	[MaKhoaHoc] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[THANHVIEN_KHOAHOC] ([MaThanhVien], [MaKhoaHoc], [Loai], [TrangThaiThanhToan]) VALUES (2, 4, N'Day                                               ', 0)
INSERT [dbo].[THANHVIEN_KHOAHOC] ([MaThanhVien], [MaKhoaHoc], [Loai], [TrangThaiThanhToan]) VALUES (2, 5, N'Day                                               ', 0)
INSERT [dbo].[THANHVIEN_KHOAHOC] ([MaThanhVien], [MaKhoaHoc], [Loai], [TrangThaiThanhToan]) VALUES (2, 6, N'Day                                               ', 0)
INSERT [dbo].[THANHVIEN_KHOAHOC] ([MaThanhVien], [MaKhoaHoc], [Loai], [TrangThaiThanhToan]) VALUES (2, 7, N'Day                                               ', 0)
INSERT [dbo].[THANHVIEN_KHOAHOC] ([MaThanhVien], [MaKhoaHoc], [Loai], [TrangThaiThanhToan]) VALUES (2, 8, N'Day                                               ', 0)
INSERT [dbo].[THANHVIEN_KHOAHOC] ([MaThanhVien], [MaKhoaHoc], [Loai], [TrangThaiThanhToan]) VALUES (2, 9, N'Day                                               ', 0)
INSERT [dbo].[THANHVIEN_KHOAHOC] ([MaThanhVien], [MaKhoaHoc], [Loai], [TrangThaiThanhToan]) VALUES (2, 10, N'Day                                               ', 0)
INSERT [dbo].[THANHVIEN_KHOAHOC] ([MaThanhVien], [MaKhoaHoc], [Loai], [TrangThaiThanhToan]) VALUES (2, 11, N'Day                                               ', 0)
INSERT [dbo].[THANHVIEN_KHOAHOC] ([MaThanhVien], [MaKhoaHoc], [Loai], [TrangThaiThanhToan]) VALUES (2, 12, N'Day                                               ', 0)
INSERT [dbo].[THANHVIEN_KHOAHOC] ([MaThanhVien], [MaKhoaHoc], [Loai], [TrangThaiThanhToan]) VALUES (2, 13, N'Day                                               ', 0)
INSERT [dbo].[THANHVIEN_KHOAHOC] ([MaThanhVien], [MaKhoaHoc], [Loai], [TrangThaiThanhToan]) VALUES (2, 14, N'Day                                               ', 0)
INSERT [dbo].[THANHVIEN_KHOAHOC] ([MaThanhVien], [MaKhoaHoc], [Loai], [TrangThaiThanhToan]) VALUES (2, 21, N'Day                                               ', 0)
/****** Object:  Table [dbo].[PHANHOI]    Script Date: 06/22/2014 14:58:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHANHOI](
	[MaPhanHoi] [int] IDENTITY(1,1) NOT NULL,
	[MaKhoaHoc] [int] NULL,
	[NoiDungPhanHoi] [nvarchar](500) NULL,
	[MaThanhVien] [int] NULL,
	[NgayDang] [datetime] NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK_PHANHOI] PRIMARY KEY CLUSTERED 
(
	[MaPhanHoi] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHANHOC]    Script Date: 06/22/2014 14:58:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHANHOC](
	[MaPhanHoc] [int] IDENTITY(1,1) NOT NULL,
	[TenPhanHoc] [nvarchar](250) NULL,
	[MaKhoaHoc] [int] NULL,
 CONSTRAINT [PK_PHANHOC] PRIMARY KEY CLUSTERED 
(
	[MaPhanHoc] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PHANHOC] ON
INSERT [dbo].[PHANHOC] ([MaPhanHoc], [TenPhanHoc], [MaKhoaHoc]) VALUES (5, N'Present tenses (các thời hiện tại)', 4)
INSERT [dbo].[PHANHOC] ([MaPhanHoc], [TenPhanHoc], [MaKhoaHoc]) VALUES (6, N'Past tenses (các thời quá khứ)', 4)
INSERT [dbo].[PHANHOC] ([MaPhanHoc], [TenPhanHoc], [MaKhoaHoc]) VALUES (7, N'Future tenses (các thời tương lai)', 4)
INSERT [dbo].[PHANHOC] ([MaPhanHoc], [TenPhanHoc], [MaKhoaHoc]) VALUES (9, N'Câu điều kiện', 5)
INSERT [dbo].[PHANHOC] ([MaPhanHoc], [TenPhanHoc], [MaKhoaHoc]) VALUES (10, N'Câu hỏi', 6)
INSERT [dbo].[PHANHOC] ([MaPhanHoc], [TenPhanHoc], [MaKhoaHoc]) VALUES (11, N'Định nghĩa và phân loại danh từ', 7)
INSERT [dbo].[PHANHOC] ([MaPhanHoc], [TenPhanHoc], [MaKhoaHoc]) VALUES (12, N'Unit 1. A DAY IN THE LIFE OF', 8)
INSERT [dbo].[PHANHOC] ([MaPhanHoc], [TenPhanHoc], [MaKhoaHoc]) VALUES (13, N'Unit 2. SCHOOL TALKS', 8)
INSERT [dbo].[PHANHOC] ([MaPhanHoc], [TenPhanHoc], [MaKhoaHoc]) VALUES (14, N'Science and Technology', 10)
INSERT [dbo].[PHANHOC] ([MaPhanHoc], [TenPhanHoc], [MaKhoaHoc]) VALUES (19, N'Remember When (Alan Jackson)', 21)
SET IDENTITY_INSERT [dbo].[PHANHOC] OFF
/****** Object:  Table [dbo].[CAUHOI]    Script Date: 06/22/2014 14:58:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CAUHOI](
	[MaCauHoi] [int] IDENTITY(1,1) NOT NULL,
	[TenCauHoi] [nvarchar](250) NULL,
	[MaPhanHoc] [int] NULL,
	[NoiDungCauHoi] [nvarchar](500) NULL,
	[DapAnA] [nvarchar](250) NULL,
	[DapAnB] [nvarchar](250) NULL,
	[DapAnC] [nvarchar](250) NULL,
	[DapAnD] [nvarchar](250) NULL,
	[DapAnDung] [char](10) NULL,
	[LoaiCauHoi] [nchar](10) NULL,
 CONSTRAINT [PK_CAUHOI] PRIMARY KEY CLUSTERED 
(
	[MaCauHoi] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BAIHOC]    Script Date: 06/22/2014 14:58:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BAIHOC](
	[MaBaiHoc] [int] IDENTITY(1,1) NOT NULL,
	[TenBaiHoc] [nvarchar](250) NULL,
	[LoaiNoiDung] [char](50) NULL,
	[NoiDungBaiHoc] [nvarchar](max) NULL,
	[ThuTu] [int] NULL,
	[MaPhanHoc] [int] NULL,
 CONSTRAINT [PK_BAIHOC] PRIMARY KEY CLUSTERED 
(
	[MaBaiHoc] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[BAIHOC] ON
INSERT [dbo].[BAIHOC] ([MaBaiHoc], [TenBaiHoc], [LoaiNoiDung], [NoiDungBaiHoc], [ThuTu], [MaPhanHoc]) VALUES (13, N'Simple Present (thời hiện tại thường)', N'Text                                              ', N'<p><strong>TH&Igrave; HIỆN TẠI ĐƠN</strong></p>

<p><strong>1. Cấu tr&uacute;c:</strong></p>

<p>&nbsp; &nbsp; &nbsp;* &nbsp;Tobe: S + is/am/are + Adj/Noun &nbsp;&nbsp;</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Ex: She is beautiful</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;They are excellent students &nbsp; &nbsp;&nbsp;</p>

<p>&nbsp; &nbsp; &nbsp;* &nbsp;V-Infinitive: S + V (s/es) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br />
&nbsp;<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Ex: She plays tennis very well</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;They offent watch TV together</p>

<p><strong>2. C&aacute;ch sử dụng</strong></p>

<p>* &nbsp;Diễn tả một th&oacute;i quen (a habit)</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp;Ex: I usually go to bet at 11.pm</p>

<p>* &nbsp;Diễn đạt một lịch tr&igrave;nh c&oacute; sẵn (a schedule)</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp;Ex: The plane takes off at 3 p.m this afternoon</p>

<p>* Sử dụng trong c&acirc;u điều kiện loại 1:</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp;Ex: What will you do if you fail your exam</p>

<p>* &nbsp;Sử dụng trong cmột số cấu tr&uacute;c (hay xuất hiện trong đề thi):</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp;Ex: We will wait, until she comes.</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Tell her that I call as soon as she arrives home</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;My mom will open the door when/whenever/every time he comes home</p>

<p><strong>3. Một số từ nhận biết</strong></p>

<p>&nbsp; &nbsp;every, always, often, normally, usually, sometimes, seldom, nerver, first, then...</p>

<p><strong>4. Một số động từ kh&ocirc;ng c&oacute; dạng V-ing</strong></p>

<p>* &nbsp; Những động từ sau đ&acirc;y chỉ d&ugrave;ng ở dạng Đơn:</p>

<p>&nbsp; &nbsp; &nbsp; - state: be, cost, fit, mean, suit</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Example: We are on holiday.</p>

<p>&nbsp; &nbsp; &nbsp;- possession: belong, have</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Example: Sam has a cat.</p>

<p>&nbsp; &nbsp; &nbsp;- senses: feel, hear, see, smell, taste, touch</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Example: He feels the cold.</p>

<p>&nbsp; &nbsp; - feelings: hate, hope, like, love, prefer, regret, want, wish</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Example: Jane loves pizza.</p>

<p>&nbsp; &nbsp; &nbsp;- brain work: believe, know, think (nghĩ về), understand</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Example: I believe you.</p>
', NULL, 5)
INSERT [dbo].[BAIHOC] ([MaBaiHoc], [TenBaiHoc], [LoaiNoiDung], [NoiDungBaiHoc], [ThuTu], [MaPhanHoc]) VALUES (14, N'Present Progressive (thời hiện tại tiếp diễn)', N'Text                                              ', N'<p>TH&Igrave; HIỆN TẠI TIẾP DIỄN</p>

<p>1. Cấu tr&uacute;c:</p>

<p>&nbsp; &nbsp; &nbsp;* &nbsp;Tobe: S + is/am/are + Ving&nbsp;</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Ex: She is going to school</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;They are having excellent students &nbsp; &nbsp;&nbsp;</p>

<p>2. C&aacute;ch sử dụng</p>

<p>* &nbsp;Diễn tả một h&agrave;nh động đang diễn ra ở hiện tại</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp;Ex: I am washing clother</p>

<p>* &nbsp;Diễn đạt một lịch tr&igrave;nh c&oacute; sẵn (a schedule)</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp;Ex: The plane takes off at 3 p.m this afternoon</p>

<p>* Sử dụng trong c&acirc;u điều kiện loại 1:</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp;Ex: What will you do if you fail your exam</p>

<p>* &nbsp;Sử dụng trong cmột số cấu tr&uacute;c (hay xuất hiện trong đề thi):</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp;Ex: We will wait, until she comes.</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Tell her that I call as soon as she arrives home</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;My mom will open the door when/whenever/every time he comes home</p>

<p>3. Một số từ nhận biết</p>

<p>&nbsp; &nbsp;every, always, often, normally, usually, sometimes, seldom, nerver, first, then...</p>

<p>4. Một số động từ kh&ocirc;ng c&oacute; dạng V-ing</p>

<p>* &nbsp; Những động từ sau đ&acirc;y chỉ d&ugrave;ng ở dạng Đơn:</p>

<p>&nbsp; &nbsp; &nbsp; - state: be, cost, fit, mean, suit</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Example: We are on holiday.</p>

<p>&nbsp; &nbsp; &nbsp;- possession: belong, have</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Example: Sam has a cat.</p>

<p>&nbsp; &nbsp; &nbsp;- senses: feel, hear, see, smell, taste, touch</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Example: He feels the cold.</p>

<p>&nbsp; &nbsp; - feelings: hate, hope, like, love, prefer, regret, want, wish</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Example: Jane loves pizza.</p>

<p>&nbsp; &nbsp; &nbsp;- brain work: believe, know, think (nghĩ về), understand</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Example: I believe you.</p>
', NULL, 5)
INSERT [dbo].[BAIHOC] ([MaBaiHoc], [TenBaiHoc], [LoaiNoiDung], [NoiDungBaiHoc], [ThuTu], [MaPhanHoc]) VALUES (15, N'Present Perfect (thời hiện tại hoàn thành)', NULL, NULL, NULL, 5)
INSERT [dbo].[BAIHOC] ([MaBaiHoc], [TenBaiHoc], [LoaiNoiDung], [NoiDungBaiHoc], [ThuTu], [MaPhanHoc]) VALUES (16, N'Present Perfect Progressive (thời hiện tại hoàn thành tiếp diễn)  ', NULL, NULL, NULL, 5)
INSERT [dbo].[BAIHOC] ([MaBaiHoc], [TenBaiHoc], [LoaiNoiDung], [NoiDungBaiHoc], [ThuTu], [MaPhanHoc]) VALUES (17, N'Simple Past (thời quá khứ thường):', N'Text                                              ', N'<p><strong>TH&Igrave; QU&Aacute; KHỨ ĐƠN</strong></p>

<p>1. Cấu tr&uacute;c:</p>

<p>&nbsp; &nbsp; &nbsp;* &nbsp;Tobe: S + was/were&nbsp;+ Adj/Noun &nbsp;&nbsp;</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Ex: She was&nbsp;a beautiful girl&nbsp;</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;They were&nbsp;excellent students &nbsp; &nbsp;&nbsp;</p>

<p>&nbsp; &nbsp; &nbsp;* &nbsp;V-qk: S + V (s/es) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br />
&nbsp;<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Ex: She played&nbsp;tennis very well</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;They&nbsp;watched TV together</p>

<p>2. C&aacute;ch sử dụng</p>

<p>* &nbsp;D&ugrave;ng để diễn đạt một h&agrave;nh động đ&atilde; xảy ra dứt điểm tại một thời gian x&aacute;c định trong qu&aacute; khứ (kh&ocirc;ng c&ograve;n diễn ra hoặc ảnh hưởng tới hiện tại). Thời điểm trong c&acirc;u được x&aacute;c định r&otilde; rệt bằng một số c&aacute;c ph&oacute; từ chỉ thời gian như: yesterday, at that moment, last week, .</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp;Ex: I went&nbsp;to bet at 11.pm</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp;Ex: The plane took&nbsp;off at 3 p.m this afternoon</p>

<p>* Sử dụng trong c&acirc;u điều kiện loại 1:</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp;Ex: What will you do if you fail your exam</p>

<p>* &nbsp;Sử dụng trong cmột số cấu tr&uacute;c (hay xuất hiện trong đề thi):</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp;Ex: We will wait, until she comes.</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Tell her that I call as soon as she arrives home</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;My mom will open the door when/whenever/every time he comes home</p>

<p>3. Một số từ nhận biết</p>

<p>&nbsp; &nbsp;every, always, often, normally, usually, sometimes, seldom, nerver, first, then...</p>

<p>4. Một số động từ kh&ocirc;ng c&oacute; dạng V-ing</p>

<p>* &nbsp; Những động từ sau đ&acirc;y chỉ d&ugrave;ng ở dạng Đơn:</p>

<p>&nbsp; &nbsp; &nbsp; - state: be, cost, fit, mean, suit</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Example: We are on holiday.</p>

<p>&nbsp; &nbsp; &nbsp;- possession: belong, have</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Example: Sam has a cat.</p>

<p>&nbsp; &nbsp; &nbsp;- senses: feel, hear, see, smell, taste, touch</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Example: He feels the cold.</p>

<p>&nbsp; &nbsp; - feelings: hate, hope, like, love, prefer, regret, want, wish</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Example: Jane loves pizza.</p>

<p>&nbsp; &nbsp; &nbsp;- brain work: believe, know, think (nghĩ về), understand</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Example: I believe you.</p>

<p>..</p>

<p>He went to Spain last year.<br />
Bob bought a new bicyle yesterday.<br />
Maria did her homework last night.<br />
Mark washed the dishes after dinner.<br />
We drove to the grocery store this afternoon.<br />
George cooked dinner for his family Saturday night.</p>
', NULL, 6)
INSERT [dbo].[BAIHOC] ([MaBaiHoc], [TenBaiHoc], [LoaiNoiDung], [NoiDungBaiHoc], [ThuTu], [MaPhanHoc]) VALUES (18, N'Past Progresseive (thời quá khứ tiếp diễn):', NULL, NULL, NULL, 6)
INSERT [dbo].[BAIHOC] ([MaBaiHoc], [TenBaiHoc], [LoaiNoiDung], [NoiDungBaiHoc], [ThuTu], [MaPhanHoc]) VALUES (19, N'Past Perfect (thời quá khứ hoàn thành)', NULL, NULL, NULL, 6)
INSERT [dbo].[BAIHOC] ([MaBaiHoc], [TenBaiHoc], [LoaiNoiDung], [NoiDungBaiHoc], [ThuTu], [MaPhanHoc]) VALUES (20, N'Past Perfect Progressive (thời quá khứ hoàn thành tiếp diễn)', NULL, NULL, NULL, 6)
INSERT [dbo].[BAIHOC] ([MaBaiHoc], [TenBaiHoc], [LoaiNoiDung], [NoiDungBaiHoc], [ThuTu], [MaPhanHoc]) VALUES (21, N'Simple Future (thời tương lai thường)', NULL, NULL, NULL, 7)
INSERT [dbo].[BAIHOC] ([MaBaiHoc], [TenBaiHoc], [LoaiNoiDung], [NoiDungBaiHoc], [ThuTu], [MaPhanHoc]) VALUES (22, N'Near Future (tương lai gần)', NULL, NULL, NULL, 7)
INSERT [dbo].[BAIHOC] ([MaBaiHoc], [TenBaiHoc], [LoaiNoiDung], [NoiDungBaiHoc], [ThuTu], [MaPhanHoc]) VALUES (23, N'Future Progressive (thời tương lai tiếp diễn)', N'Text                                              ', N'<p><strong>Future Progressive (thời tương lai tiếp diễn)</strong></p>

&middot; D&ugrave;ng để diễn đạt một h&agrave;nh động sẽ xảy ra v&agrave;o một thời điểm nhất định trong tương lai.

<p>At 8:00 am tomorrow morning we will be attending the lecture. Good luck with the exam! We will be thinking of you. &middot; D&ugrave;ng kết hợp với present progressive kh&aacute;c để diễn đạt hai h&agrave;nh động đang song song xảy ra. Một ở hiện tại, c&ograve;n một ở tương lai.</p>

<p>Now we are learning English here, but by this time tomorrow we will be attending the meeting at the office.</p>

<p>&middot; Được d&ugrave;ng để đề cập đến c&aacute;c sự kiện tương lai đ&atilde; được x&aacute;c định hoặc quyết định (kh&ocirc;ng mang &yacute; nghĩa tiếp diễn). Professor Baxter will be giving another lecture on Roman glass-making at the same time next week. &middot; Hoặc những sự kiện được mong đợi l&agrave; sẽ xảy ra theo một tiến tr&igrave;nh thường lệ (nhưng kh&ocirc;ng diễn đạt &yacute; định của c&aacute; nh&acirc;n người n&oacute;i). You will be hearing from my solicitor. I will be seeing you one of these days, I expect. &middot; Dự đo&aacute;n cho tương lai: Don&#39;t phone now, they will be having dinner. &middot; Diễn đạt lời đề nghị nh&atilde; nhặn muốn biết về kế hoạch của người kh&aacute;c Will you be staying in here this evening? (&ocirc;ng c&oacute; dự định ở lại đ&acirc;y tối nay chứ ạ) &nbsp;</p>
', NULL, 7)
INSERT [dbo].[BAIHOC] ([MaBaiHoc], [TenBaiHoc], [LoaiNoiDung], [NoiDungBaiHoc], [ThuTu], [MaPhanHoc]) VALUES (24, N'Future Perfect (thời tương lai hoàn thành)', N'Text                                              ', N'<p>D&ugrave;ng để chỉ một h&agrave;nh động sẽ phải được ho&agrave;n tất ở v&agrave;o một thời điểm nhất định trong tương lai. N&oacute; thường được d&ugrave;ng với trạng từ chỉ thời gian dưới dạng: by the end of....., by the time + sentence</p>

<p>We will have accomplished the English grammar course by the end of next week.<br />
By the time human being migrates to the moon, most of the people alive today will have died.</p>
', NULL, 7)
INSERT [dbo].[BAIHOC] ([MaBaiHoc], [TenBaiHoc], [LoaiNoiDung], [NoiDungBaiHoc], [ThuTu], [MaPhanHoc]) VALUES (26, N'Điều kiện loại 1', N'Text                                              ', N'<p>C&acirc;u điều kiện c&oacute; thực l&agrave; c&acirc;u m&agrave; người n&oacute;i d&ugrave;ng để diễn đạt một h&agrave;nh động hoặc một t&igrave;nh huống thường xảy ra (th&oacute;i quen) hoặc sẽ xảy ra (trong tương lai) nếu điều kiện ở mệnh đều ch&iacute;nh được thoả m&atilde;n. Nếu n&oacute;i về tương lai, dạng c&acirc;u n&agrave;y được sử dụng khi n&oacute;i đến một điều kiện c&oacute; thể thực hiện được hoặc c&oacute; thể xảy ra.</p>

<p>TƯƠNG LAI (FUTURE ACTION)<br />
&nbsp;</p>

<p>If he tries much more, he will improve his English.<br />
If I have money, I will buy a new car.</p>

<p>TH&Oacute;I QUEN (HABITUAL)</p>

<p>if + S + simple present tense ... + simple present tense ...</p>

<p>If the doctor has morning office hours, he visits every patiens in the affternoon.<br />
I usually walk to school if I have enough time.</p>

<p>MỆNH LỆNH (COMMAND)</p>

<p>If + S + simple present tense ... + command form of verb + ...</p>

<p>If you go to the Post Office, mail this letter for me.<br />
Please call me if you hear anything from Jane.</p>

<p>13.2 Điều kiện kh&ocirc;ng thể thực hiện được (điều kiện kh&ocirc;ng c&oacute; thực hay điều kiện dạng II, III)<br />
C&acirc;u điều kiện kh&ocirc;ng c&oacute; thực d&ugrave;ng để diễn tả một h&agrave;nh động hoặc một trạng th&aacute;i sẽ xảy ra hoặc đ&atilde; c&oacute; thể xảy ra nếu như t&igrave;nh huống được đặt ra trong c&acirc;u kh&aacute;c với thực tế đang xảy ra hoặc đ&atilde; xảy ra. C&acirc;u điều kiện kh&ocirc;ng c&oacute; thực thường g&acirc;y nhầm lẫn v&igrave; sự thực về sự kiện m&agrave; c&acirc;u thể hiện lại tr&aacute;i ngược với c&aacute;ch thể hiện của c&acirc;u: nếu động từ của c&acirc;u l&agrave; khẳng định th&igrave; &yacute; nghĩa thực của c&acirc;u lại l&agrave; phủ định v&agrave; ngược lại.</p>

<p>If I were rich, I would travel around the world.<br />
(I am not rich) (I&rsquo;m not going to travel around the world)</p>

<p>If I hadn&rsquo;t been in a hurry, I wouldn&rsquo;t have had an accident.<br />
(I was in a hurry) (I had an accident)</p>
', NULL, 9)
INSERT [dbo].[BAIHOC] ([MaBaiHoc], [TenBaiHoc], [LoaiNoiDung], [NoiDungBaiHoc], [ThuTu], [MaPhanHoc]) VALUES (27, N'Điều kiện loại 2', N'Text                                              ', N'<p>If I had enough money now, I would buy a tourist trip to the moon.<br />
He would tell you about it if he were here.<br />
If he didn&rsquo;t speak so quickly, you could understand him.<br />
(He speaks very quicky) (You can&rsquo;t understand him)<br />
Động từ to be phải chia l&agrave; were ở tất cả c&aacute;c ng&ocirc;i.<br />
If I were you, I wouldn&#39;t go to that movie.</p>
', NULL, 9)
INSERT [dbo].[BAIHOC] ([MaBaiHoc], [TenBaiHoc], [LoaiNoiDung], [NoiDungBaiHoc], [ThuTu], [MaPhanHoc]) VALUES (28, N'Điều kiện 3', N'Text                                              ', N'<p>If we had known that you were there, we would have written you a letter.<br />
(We didn&rsquo;t know ...) (We didn&rsquo;t write you a letter)<br />
If we hadn&rsquo;t lost our way, we would have arrived sooner.<br />
If he had studied harder for that test, he would have passed it.</p>

<p>Ch&uacute; &yacute; rằng cũng c&oacute; thể thể hiện một điều kiện kh&ocirc;ng c&oacute; thực m&agrave; kh&ocirc;ng d&ugrave;ng if. Trong trường hợp đ&oacute;, trợ động từ had được đưa l&ecirc;n đầu c&acirc;u, đứng trước chủ ngữ. Mệnh đề điều kiện sẽ đứng trước mệnh đề ch&iacute;nh.</p>

<p>Had we known that you were there, we would have written you a letter.<br />
Had he studied harder for the test, he would have passed it.</p>

<p>Lưu &yacute;: C&acirc;u điều kiện kh&ocirc;ng phải l&uacute;c n&agrave;o cũng tu&acirc;n theo qui luật tr&ecirc;n. Trong một số trường hợp đặc biệt, một vế của điều kiện l&agrave; qu&aacute; khứ nhưng vế c&ograve;n lại c&oacute; thể ở hiện tại (do thời gian qui định).<br />
&nbsp; &nbsp; &nbsp; &nbsp; If she had caught the train, she would be here by now.</p>

<p>13.3 C&aacute;ch sử dụng will, would, could, should trong một số trường hợp kh&aacute;c<br />
Th&ocirc;ng thường c&aacute;c trợ động từ n&agrave;y kh&ocirc;ng được sử dụng với if trong mệnh đề điều kiện của c&acirc;u điều kiện, tuy nhi&ecirc;n vẫn c&oacute; một số ngoại lệ như sau:</p>

<p>If you (will/would): Nếu ..... vui l&ograve;ng. Thường được d&ugrave;ng trong c&aacute;c y&ecirc;u cầu lịch sự. Would lịch sự hơn will.<br />
&nbsp; &nbsp; &nbsp; &nbsp; If you will/would wait for a moment, I will go and see if Mr Conner is here.<br />
If + Subject + Will/Would: Nếu ..... chịu. Để diễn đạt &yacute; tự nguyện.<br />
&nbsp; &nbsp; &nbsp; &nbsp; If he will listen to me, I can help him.<br />
Will c&ograve;n được d&ugrave;ng theo mẫu c&acirc;u n&agrave;y để diễn đạt sự ngoan cố: Nếu ..... nhất định, Nếu ..... cứ.<br />
&nbsp; &nbsp; &nbsp; &nbsp; If you will turn on the music loudly so late tonight, no wonder why your neighbours complain.</p>

<p>If you could: Xin vui l&ograve;ng. Diễn đạt lịch sự 1 y&ecirc;u cầu m&agrave; người n&oacute;i cho rằng người kia sẽ đồng &yacute; như l&agrave; một lẽ đương nhi&ecirc;n.<br />
&nbsp; &nbsp; &nbsp; &nbsp; If you could open your book, please.</p>

<p>If + Subject + should + ..... + command: V&iacute; phỏng như. Diễn đạt một t&igrave;nh huống d&ugrave; c&oacute; thể xảy ra được song rất kh&oacute;.<br />
&nbsp; &nbsp; &nbsp; &nbsp; If you should find any difficulty in using that TV, please call me.<br />
C&oacute; thể đảo should l&ecirc;n tr&ecirc;n chủ ngữ v&agrave; bỏ if<br />
&nbsp; &nbsp; &nbsp; &nbsp; Should you find any difficulty in using that TV, please call me.</p>
', NULL, 9)
INSERT [dbo].[BAIHOC] ([MaBaiHoc], [TenBaiHoc], [LoaiNoiDung], [NoiDungBaiHoc], [ThuTu], [MaPhanHoc]) VALUES (29, N'Câu hỏi Yes/ No  ', N'Text                                              ', N'<p>Sở dĩ ta gọi l&agrave; như vậy v&igrave; khi trả lời, d&ugrave;ng Yes/No. Nhớ rằng khi trả lời:<br />
&nbsp; &nbsp; &nbsp; &nbsp; - Yes + Positive verb<br />
&nbsp; &nbsp; &nbsp; &nbsp; - No + Negative verb.<br />
(kh&ocirc;ng được trả lời theo kiểu c&acirc;u tiếng Việt)</p>

<p>Isn&#39;t Mary going to school today?<br />
Was Mark sick yesterday?<br />
Have you seen this movie before?<br />
Will the committe decide on the proposal today?<br />
Don&#39;t you still want to use the telephone?<br />
Did you go to class yesterday?<br />
Doesn&#39;t Ted like this picture?</p>
', NULL, 10)
INSERT [dbo].[BAIHOC] ([MaBaiHoc], [TenBaiHoc], [LoaiNoiDung], [NoiDungBaiHoc], [ThuTu], [MaPhanHoc]) VALUES (30, N'Câu hỏi lấy thông tin (information question)', N'Text                                              ', N'<p>Đối với loại c&acirc;u hỏi n&agrave;y, c&acirc;u trả lời kh&ocirc;ng thể đơn giản l&agrave; yes hay no m&agrave; phải c&oacute; th&ecirc;m th&ocirc;ng tin. Ch&uacute;ng thường d&ugrave;ng c&aacute;c từ nghi vấn, chia l&agrave;m 3 loại sau:</p>

<p>8.2.1 Who hoặc What: c&acirc;u hỏi chủ ngữ<br />
Đ&acirc;y l&agrave; c&acirc;u hỏi khi muốn biết chủ ngữ hay chủ thể của h&agrave;nh động.</p>

<p>&nbsp;</p>

<p>Something happened lastnight =&gt; What happened last night?<br />
Someone opened the door. =&gt; Who opened the door?</p>

<p>Ch&uacute; &yacute; c&aacute;c c&acirc;u sau đ&acirc;y l&agrave; sai ngữ ph&aacute;p:<br />
&nbsp; &nbsp; &nbsp; &nbsp; Who did open the door? (SAI)<br />
&nbsp; &nbsp; &nbsp; &nbsp; What did happen lastnight? (SAI)</p>

<p>8.2.2 Whom hoặc What: c&acirc;u hỏi t&acirc;n ngữ<br />
Đ&acirc;y l&agrave; c&aacute;c c&acirc;u hỏi d&ugrave;ng khi muốn biết t&acirc;n ngữ hay đối tượng t&aacute;c động của h&agrave;nh động</p>

<p>&nbsp;</p>

<p>Nhớ rằng trong tiếng Anh viết ch&iacute;nh tắc bắt buộc phải d&ugrave;ng whom mặc d&ugrave; trong tiếng Anh n&oacute;i c&oacute; thể d&ugrave;ng who thay cho whom trong mẫu c&acirc;u tr&ecirc;n.<br />
&nbsp; &nbsp; &nbsp; &nbsp; George bought something at the store. =&gt; What did George buy at the store?<br />
&nbsp; &nbsp; &nbsp; &nbsp; Ana knows someone from UK. =&gt; Whom does Ana know from UK?</p>

<p>8.2.3 When, Where, How v&agrave; Why: C&acirc;u hỏi bổ ngữ<br />
D&ugrave;ng khi muốn biết nơi chốn, thời gian, l&yacute; do, c&aacute;ch thức của h&agrave;nh động.</p>

<p>&nbsp;</p>

<p>How did Maria get to school today?<br />
When did he move to London?<br />
Why did she leave so early?<br />
Where has Ted gone?<br />
When will she come back?<br />
Ch&uacute; &yacute; tr&aacute;nh nhầm lẫn với c&aacute;c c&acirc;u sai như v&iacute; dụ ở phần 8.2.1</p>
', NULL, 10)
INSERT [dbo].[BAIHOC] ([MaBaiHoc], [TenBaiHoc], [LoaiNoiDung], [NoiDungBaiHoc], [ThuTu], [MaPhanHoc]) VALUES (31, N'Câu hỏi phức (embedded question)', N'Text                                              ', N'<p>L&agrave; c&acirc;u hoặc c&acirc;u hỏi chứa trong n&oacute; một c&acirc;u hỏi kh&aacute;c. C&acirc;u c&oacute; hai th&agrave;nh phần nối với nhau bằng một từ nghi vấn (question word). Động từ ở mệnh đề thứ hai (mệnh đề nghi vấn) phải đi sau v&agrave; chia theo chủ ngữ, kh&ocirc;ng được đảo vị tr&iacute; như ở c&acirc;u hỏi độc lập.&nbsp;</p>

<p>S + V (phrase) + question word + S + V</p>

<p>The authorities can&#39;t figure out why the plane landed at the wrong airport.<br />
We haven&rsquo;t assertained where the meeting will take place.</p>

<p>Trong trường hợp c&acirc;u hỏi phức l&agrave; một c&acirc;u hỏi, &aacute;p dụng mẫu c&acirc;u sau:&nbsp;</p>

<p>auxiliary + S + V + question word + S + V</p>

<p>Do you know where he went?<br />
Could you tell me what time it is?</p>

<p>Question word c&oacute; thể l&agrave; một từ, cũng c&oacute; thể l&agrave; một cụm từ như: whose + noun, how many, how much, how long, how often, what time, what kind.&nbsp;</p>

<p>I have no idea how long the interview will take.<br />
Do you know how often the bus run at night?<br />
Can you tell me how far the museum is from the store?<br />
I&rsquo;ll tell you what kind of ice-cream tastes best.<br />
The teacher asked us whose book was on his desk.</p>

<p>&nbsp;</p>
', NULL, 10)
INSERT [dbo].[BAIHOC] ([MaBaiHoc], [TenBaiHoc], [LoaiNoiDung], [NoiDungBaiHoc], [ThuTu], [MaPhanHoc]) VALUES (32, N'Vocabulary', N'Text                                              ', N'<p>Word &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Transcript &nbsp; &nbsp; &nbsp; &nbsp;Class &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Meaning &nbsp; &nbsp; &nbsp;&nbsp;</p>

<p>Go off &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/gəʊ ɒf/ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;v &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Đổ chu&ocirc;ng</p>

<p>Boil &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /bɔɪl/ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; v &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; S&ocirc;i, đun s&ocirc;i, luộc &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br />
Buffalo &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /ˈbʌfələʊ/ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; n &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;con tr&acirc;u &nbsp; &nbsp; &nbsp;</p>

<p>Arrive &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /əˈraiv/ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; v &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Đến, đạt tới &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br />
Plough &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /plaʊ/ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; v &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; C&agrave;y ruộng, xới đất &nbsp;&nbsp;</p>

<p>Rest &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/rest/ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;n &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Nghỉ ngơi, sự nghỉ ngơi. &nbsp; &nbsp; &nbsp;<br />
Repair &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/rɪˈpeəʳ/ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;v &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Sửa chữa &nbsp;</p>
', NULL, 12)
INSERT [dbo].[BAIHOC] ([MaBaiHoc], [TenBaiHoc], [LoaiNoiDung], [NoiDungBaiHoc], [ThuTu], [MaPhanHoc]) VALUES (33, N'Listening. A Letter to Minguel', N'Audio                                             ', N'/Admin/ckfinder/userfiles/files/Audio/Listen_A_Letter_to_Minguel.mp3', NULL, 12)
INSERT [dbo].[BAIHOC] ([MaBaiHoc], [TenBaiHoc], [LoaiNoiDung], [NoiDungBaiHoc], [ThuTu], [MaPhanHoc]) VALUES (34, N'Reading. Summer holidays', N'Text                                              ', N'<p>Seumas Macsporran is a very busy man. He is 60 years old and he has thirteen jobs. He is a postman, a policeman, a fireman, a taxi driver, a boat man, an ambulance man, an accountant, a petrol attendant, a barman and an undertaker. Also, he and his wife, Margaret, have a shop and a small hotel.<br />
Seumas lives and works on the island of Gigha in the West of Scotland. Only 120 peole live in Gigha but in summer 150 tourists come by boat everyday.</p>
', NULL, 12)
INSERT [dbo].[BAIHOC] ([MaBaiHoc], [TenBaiHoc], [LoaiNoiDung], [NoiDungBaiHoc], [ThuTu], [MaPhanHoc]) VALUES (35, N'Grammar: Present Tense', N'Text                                              ', N'<p><strong>1. Hiện tại đơn:</strong></p>

<p>* Cấu tr&uacute;c:</p>

<p>(+) S + V/ V(s;es) + Object...</p>

<p>(-) S do/ does not + V +...</p>

<p>(?) Do/ Does + S + V</p>

<p>* C&aacute;ch d&ugrave;ng:</p>

<p>_ H&agrave;nh động xảy ra ở hiện tại: i am here now</p>

<p>_ Th&oacute;i quen ở hiện tại: i play soccer</p>

<p>_ Sự thật hiển nhi&ecirc;n;Ch&acirc;n l&iacute; ko thể phủ nhận: the sun rises in the east</p>

<p>* Trạng từ đi k&egrave;m: always; usually; often; sometimes; occasionally; ever; seldom; rarely; every...</p>

<p>C&aacute;ch chia số nhiều:</p>

<p>Ở thể khẳng định của th&igrave; hiện tại đơn, &quot;động từ thường&quot; được chia bằng c&aacute;ch:</p>

<p>-Giữ nguy&ecirc;n h&igrave;nh thức nguy&ecirc;n mẫu của động từ khi chủ ngữ l&agrave; &quot;I / You / We / They v&agrave; c&aacute;c chủ ngữ số nhiều kh&aacute;c&quot;</p>

<p>-Th&ecirc;m &quot;s&quot; hoặc &quot;es&quot; sau động từ (Vs/es) khi chủ ngữ l&agrave; &quot;He / She / It v&agrave; c&aacute;c chủ ngữ số &iacute;t kh&aacute;c&quot;</p>

<p>&nbsp;+Phần lớn c&aacute;c trường hợp th&igrave; động từ khi chia với chủ ngữ số &iacute;t đều được th&ecirc;m &quot;s&quot;, ngoại trừ những từ tận c&ugrave;ng bằng &quot;o,x, ch, z, s, sh&quot; th&igrave; ta th&ecirc;m &quot;es&quot; v&agrave;o sau động từ.</p>

<p>+Khi động từ tận c&ugrave;ng l&agrave; &quot;y&quot; th&igrave; đổi &quot;y&quot; th&agrave;nh &quot;I&quot; v&agrave; th&ecirc;m &quot;es&quot; v&agrave;o sau động từ</p>

<p>C&aacute;ch ph&aacute;t &acirc;m s,es:</p>

<p>/iz/: ce, x, z, sh, ch, s, ge</p>

<p>/s/: t, p, f, k, th</p>

<p>/z/:kh&ocirc;ng c&oacute; trong hai trường hợp tr&ecirc;n</p>

<p><strong>2. Hiện tại tiếp diễn:</strong>&nbsp;</p>

<p>* Cấu tr&uacute;c:</p>

<p>(+) S + is/am/are + Ving</p>

<p>(-) S + is/am/are not + Ving</p>

<p>(?) Is/Am/ Are + S + Ving</p>

<p>* C&aacute;ch d&ugrave;ng:</p>

<p>_ Đang xảy ra tại 1 thời điểm x&aacute;c định ở hiện tại&nbsp;</p>

<p>_ Sắp xảy ra c&oacute; dự định từ trước.</p>

<p>_ Kh&ocirc;ng d&ugrave;ng với c&aacute;c động từ chi gi&aacute;c như: SEE; HEAR; LIKE; LOVE...</p>

<p>* Trạng từ đi k&egrave;m: At the moment; at this time; right now; now; ........</p>

<p><strong>3. Hiện tại ho&agrave;n th&agrave;nh:</strong></p>

<p>* Cấu tr&uacute;c:</p>

<p>(+) S + have/has + PII</p>

<p>(-) S + have/has not + PII</p>

<p>(?) Have/ Has + S + PII</p>

<p>* C&aacute;ch d&ugrave;ng:</p>

<p>_ Xảy ra trong q&uacute;a khứ, kết quả li&ecirc;n quan đến hiện tại.( Nhấn mạnh đến kết quả của h&agrave;nh động)</p>

<p>* Trạng từ: just; recently; lately; ever; never; already; yet; since; for; so far; until now; up to now; up to present..</p>

<p><strong>4. Hiện tại ho&agrave;n th&agrave;nh tiếp diễn:</strong></p>

<p>&nbsp;* Cấu tr&uacute;c:&nbsp;</p>

<p>&nbsp;(+) S + have/has been + Ving&nbsp;</p>

<p>(-) S + have/has been + Ving</p>

<p>&nbsp;(?) Have/Has + S + been + Ving</p>

<p>&nbsp;* C&aacute;ch d&ugrave;ng:</p>

<p>&nbsp;_ Xảy ra trong qu&aacute; khứ, k&eacute;o d&agrave;i đến hiện tại v&agrave; c&oacute; thể tiếp tục xảy ra trong tương lai. ( Nhấn mạnh t&iacute;nh li&ecirc;n tục của h&agrave;nh động)</p>

<p>* Trạng từ đi k&egrave;m: just; recently; lately; ever; never; since; for&hellip;.</p>
', NULL, 12)
INSERT [dbo].[BAIHOC] ([MaBaiHoc], [TenBaiHoc], [LoaiNoiDung], [NoiDungBaiHoc], [ThuTu], [MaPhanHoc]) VALUES (36, N'Vocabulary', NULL, NULL, NULL, 13)
INSERT [dbo].[BAIHOC] ([MaBaiHoc], [TenBaiHoc], [LoaiNoiDung], [NoiDungBaiHoc], [ThuTu], [MaPhanHoc]) VALUES (37, N'Listen  A Letter to Minguel', NULL, NULL, NULL, 13)
INSERT [dbo].[BAIHOC] ([MaBaiHoc], [TenBaiHoc], [LoaiNoiDung], [NoiDungBaiHoc], [ThuTu], [MaPhanHoc]) VALUES (38, N'Reading. The worlds oldest university', NULL, NULL, NULL, 13)
INSERT [dbo].[BAIHOC] ([MaBaiHoc], [TenBaiHoc], [LoaiNoiDung], [NoiDungBaiHoc], [ThuTu], [MaPhanHoc]) VALUES (39, N'Writing.Fill in a form', NULL, NULL, NULL, 13)
INSERT [dbo].[BAIHOC] ([MaBaiHoc], [TenBaiHoc], [LoaiNoiDung], [NoiDungBaiHoc], [ThuTu], [MaPhanHoc]) VALUES (40, N'Grammar: Gerund, To-infinitive', NULL, NULL, NULL, 13)
INSERT [dbo].[BAIHOC] ([MaBaiHoc], [TenBaiHoc], [LoaiNoiDung], [NoiDungBaiHoc], [ThuTu], [MaPhanHoc]) VALUES (41, N'Reading Biotechnology', N'Text                                              ', N'<p>Beer and Cheese<br />
&nbsp;<br />
When you are drinking a cold beer on a hot day, or eating a delicious cheese sandwich, you can thank biotechnology for the pleasure you are experiencing. That&rsquo;s right! Beer, bread and cheese are all produced using biotechnology. Perhaps a definition will be useful to understand how. A standard definition is that biotechnology (or biotech for short) is the application of science and engineering to the direct or indirect use of living organisms. And as you know, the food and drink above are all produced by the fermentation of micro-organisms. In beer, the yeast multiplies as it eats the sugars in the mixture and turns them into alcohol and CO2. This ancient technique was first used in Egypt to make bread and wine around 4000BC!<br />
Antibiotics<br />
&nbsp;<br />
Antibiotics are used to prevent and treat diseases, especially those caused by bacteria. They are natural substances that are created by bacteria and fungi. The first antibiotic was made in China in about 500BC &ndash; to cure boils. In 1928 Alexander Fleming discovered penicillin and it was considered a medical miracle. Modern research is looking at the creation of super-antibodies which can kill bacteria and viruses inside the cells that house them.<br />
Cleaning up<br />
&nbsp;<br />
Our modern consumer society produces a lot of waste which needs to be disposed of safely and without harmful end products. Environmental biotechnology can help. Indeed, the use of bacteria to treat sewage was first practiced in 1914 in Manchester, England. Vermiculture or using worms to treat waste is another environmentally-friendly practice and the end product is a natural fertiliser. Bacteria have even been developed to help with problems such as oil spills. They convert crude oil and gasoline into non-toxic substances such as carbon dioxide, water and oxygen and help create a cleaner, healthier environment.<br />
Modern times<br />
These examples of biotechnology are accepted by most people. However, the discovery of the DNA structure by Watson and Crick in 1953 was the beginning of the modern era of genetics and the following areas of biotech are very controversial. Read on&hellip;<br />
GM food<br />
&nbsp;<br />
The genetic modification of plants and crops has been in practice for many years. This involves changing the genetic code of these plants so that they are more resistant to bad conditions like drought, floods and frost. Supporters of GM food say that it can offer the consumer better quality, safety and taste and for over a decade Americans have been eating GM food. However, things are very different in Europe where genetically modified food is very strictly regulated and regarded with deep suspicion by the public. GM food has even been called &ldquo;Frankenfood&rdquo; in the press, a term inspired by the novel Frankenstein by Mary Shelley. There is a great cultural divide between America and Europe over whether such food is safe to eat and will not harm the environment and the discussion is still in progress.<br />
Cloning and stem cell research<br />
&nbsp;<br />
1997 saw the birth of Dolly the sheep, the first animal cloned from an adult cell. This was a remarkable achievement which created world-wide debate on the ethical issues surrounding cloning. International organisations such as the European parliament, UNESCO and WHO all declared that human cloning is both morally and legally wrong. However, we need to make a distinction between reproductive cloning and therapeutic cloning. Nowadays the idea of reproductive cloning &ndash; creating a copy of another person - is no longer interesting for researchers. Instead therapeutic cloning is creating excitement in the biotech world. Key to this technique are stem cells, which are master cells that have the potential to become any other kind of cell in the body e.g. nerve cells, blood, heart muscle or even brain cells. Stem cells themselves have generated a lot of controversy as it was believed that only human embryos could provide them. However, it now appears that adult stem cells offer the same possibility. This would mean that a patient who suffered a heart attack could provide doctors with his adult stem cells which could then be implanted back into his heart and used to create heart muscle, replacing the muscle that was damaged. As the genetic code is identical, there would be no problem of the body rejecting the implant as, unfortunately, happens with organ transplants. In the future, biotechnologists hope that stem cells could be used to grow entire organs. In this way biotechnology offers the hope of revolutionising medical treatment. In this brief overview of the history of biotechnology we have jumped from making bread to making human organs - an enormous leap- and it is clear that these modern practices raise many controversial issues. However, despite the debate, we can imagine that as biotechnology has been around for many years, it will still be around for some time to come - but who knows where it will take us?</p>
', NULL, 14)
INSERT [dbo].[BAIHOC] ([MaBaiHoc], [TenBaiHoc], [LoaiNoiDung], [NoiDungBaiHoc], [ThuTu], [MaPhanHoc]) VALUES (42, N'Grammar', N'Video                                             ', N'/Admin/ckfinder/userfiles/files/Video/video2.MP4', NULL, 14)
INSERT [dbo].[BAIHOC] ([MaBaiHoc], [TenBaiHoc], [LoaiNoiDung], [NoiDungBaiHoc], [ThuTu], [MaPhanHoc]) VALUES (48, N'Remember When (Alan Jackson)', N'Video                                             ', N'Admin/ckfinder/userfiles/files/Video/Remember.mp4', NULL, 19)
SET IDENTITY_INSERT [dbo].[BAIHOC] OFF
/****** Object:  ForeignKey [FK_KHOAHOC_CHUYENMUC]    Script Date: 06/22/2014 14:58:02 ******/
ALTER TABLE [dbo].[KHOAHOC]  WITH CHECK ADD  CONSTRAINT [FK_KHOAHOC_CHUYENMUC] FOREIGN KEY([MaChuyenMuc])
REFERENCES [dbo].[CHUYENMUC] ([MaChuyenMuc])
GO
ALTER TABLE [dbo].[KHOAHOC] CHECK CONSTRAINT [FK_KHOAHOC_CHUYENMUC]
GO
/****** Object:  ForeignKey [FK_KHOAHOC_TRINHDO]    Script Date: 06/22/2014 14:58:02 ******/
ALTER TABLE [dbo].[KHOAHOC]  WITH CHECK ADD  CONSTRAINT [FK_KHOAHOC_TRINHDO] FOREIGN KEY([MaTrinhDo])
REFERENCES [dbo].[TRINHDO] ([MaTrinhDo])
GO
ALTER TABLE [dbo].[KHOAHOC] CHECK CONSTRAINT [FK_KHOAHOC_TRINHDO]
GO
/****** Object:  ForeignKey [FK_THANHVIEN_KHOAHOC_KHOAHOC]    Script Date: 06/22/2014 14:58:02 ******/
ALTER TABLE [dbo].[THANHVIEN_KHOAHOC]  WITH CHECK ADD  CONSTRAINT [FK_THANHVIEN_KHOAHOC_KHOAHOC] FOREIGN KEY([MaKhoaHoc])
REFERENCES [dbo].[KHOAHOC] ([MaKhoaHoc])
GO
ALTER TABLE [dbo].[THANHVIEN_KHOAHOC] CHECK CONSTRAINT [FK_THANHVIEN_KHOAHOC_KHOAHOC]
GO
/****** Object:  ForeignKey [FK_THANHVIEN_KHOAHOC_THANHVIEN]    Script Date: 06/22/2014 14:58:02 ******/
ALTER TABLE [dbo].[THANHVIEN_KHOAHOC]  WITH CHECK ADD  CONSTRAINT [FK_THANHVIEN_KHOAHOC_THANHVIEN] FOREIGN KEY([MaThanhVien])
REFERENCES [dbo].[THANHVIEN] ([MaThanhVien])
GO
ALTER TABLE [dbo].[THANHVIEN_KHOAHOC] CHECK CONSTRAINT [FK_THANHVIEN_KHOAHOC_THANHVIEN]
GO
/****** Object:  ForeignKey [FK_PHANHOI_KHOAHOC]    Script Date: 06/22/2014 14:58:02 ******/
ALTER TABLE [dbo].[PHANHOI]  WITH CHECK ADD  CONSTRAINT [FK_PHANHOI_KHOAHOC] FOREIGN KEY([MaKhoaHoc])
REFERENCES [dbo].[KHOAHOC] ([MaKhoaHoc])
GO
ALTER TABLE [dbo].[PHANHOI] CHECK CONSTRAINT [FK_PHANHOI_KHOAHOC]
GO
/****** Object:  ForeignKey [FK_PHANHOI_THANHVIEN]    Script Date: 06/22/2014 14:58:02 ******/
ALTER TABLE [dbo].[PHANHOI]  WITH CHECK ADD  CONSTRAINT [FK_PHANHOI_THANHVIEN] FOREIGN KEY([MaThanhVien])
REFERENCES [dbo].[THANHVIEN] ([MaThanhVien])
GO
ALTER TABLE [dbo].[PHANHOI] CHECK CONSTRAINT [FK_PHANHOI_THANHVIEN]
GO
/****** Object:  ForeignKey [FK_PHANHOC_KHOAHOC]    Script Date: 06/22/2014 14:58:02 ******/
ALTER TABLE [dbo].[PHANHOC]  WITH CHECK ADD  CONSTRAINT [FK_PHANHOC_KHOAHOC] FOREIGN KEY([MaKhoaHoc])
REFERENCES [dbo].[KHOAHOC] ([MaKhoaHoc])
GO
ALTER TABLE [dbo].[PHANHOC] CHECK CONSTRAINT [FK_PHANHOC_KHOAHOC]
GO
/****** Object:  ForeignKey [FK_CAUHOI_PHANHOC]    Script Date: 06/22/2014 14:58:02 ******/
ALTER TABLE [dbo].[CAUHOI]  WITH CHECK ADD  CONSTRAINT [FK_CAUHOI_PHANHOC] FOREIGN KEY([MaPhanHoc])
REFERENCES [dbo].[PHANHOC] ([MaPhanHoc])
GO
ALTER TABLE [dbo].[CAUHOI] CHECK CONSTRAINT [FK_CAUHOI_PHANHOC]
GO
/****** Object:  ForeignKey [FK_BAIHOC_PHANHOC]    Script Date: 06/22/2014 14:58:02 ******/
ALTER TABLE [dbo].[BAIHOC]  WITH CHECK ADD  CONSTRAINT [FK_BAIHOC_PHANHOC] FOREIGN KEY([MaPhanHoc])
REFERENCES [dbo].[PHANHOC] ([MaPhanHoc])
GO
ALTER TABLE [dbo].[BAIHOC] CHECK CONSTRAINT [FK_BAIHOC_PHANHOC]
GO
