using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace BridalStoreManagement
{
    public partial class TimKiem : Form
    {
        DataSet ds;
        SqlDataAdapter sda;
        SqlConnection conn;

        public TimKiem()
        {
            InitializeComponent();

            conn = new SqlConnection();
            conn.ConnectionString = Connect.sqlcon;

            ds = new DataSet();
        }

        private void btnTimKiemSP_Click(object sender, EventArgs e)
        {
            if (rbMasp.Checked)
            {
                ds.Tables["tb_Sanpham"].Clear();
                sda = new SqlDataAdapter("select masp as 'Mã Sản Phẩm', tensp as 'Tên Sản Phẩm', maloai as 'Mã Loại', gianhap as 'Giá Nhập', giaban as 'Giá Bán', giathue as 'Giá Thuê', soluong as 'Số Lượng', anh as 'Hình Ảnh', ghichu as 'Ghi Chú', kichco as 'Kích Cỡ', (gianhap*soluong) as 'Tổng Tiền' from tb_Sanpham where masp like '%" + txtSanPham.Text.ToString() + "%'", conn);
                sda.Fill(ds, "tb_Sanpham");
                dataGridView2.DataSource = ds.Tables["tb_Sanpham"];
            }
            else if (rbtensp.Checked)
            {
                ds.Tables["tb_Sanpham"].Clear();
                sda = new SqlDataAdapter("select masp as 'Mã Sản Phẩm', tensp as 'Tên Sản Phẩm', maloai as 'Mã Loại', gianhap as 'Giá Nhập', giaban as 'Giá Bán', giathue as 'Giá Thuê', soluong as 'Số Lượng', anh as 'Hình Ảnh', ghichu as 'Ghi Chú', kichco as 'Kích Cỡ', (gianhap*soluong) as 'Tổng Tiền' from tb_Sanpham where tensp like '%" + txtSanPham.Text.ToString() + "%'", conn);
                sda.Fill(ds, "tb_Sanpham");
                dataGridView2.DataSource = ds.Tables["tb_Sanpham"];
            }
            else if (rbMaloai.Checked)
            {
                ds.Tables["tb_Sanpham"].Clear();
                sda = new SqlDataAdapter("select masp as 'Mã Sản Phẩm', tensp as 'Tên Sản Phẩm', maloai as 'Mã Loại', gianhap as 'Giá Nhập', giaban as 'Giá Bán', giathue as 'Giá Thuê', soluong as 'Số Lượng', anh as 'Hình Ảnh', ghichu as 'Ghi Chú', kichco as 'Kích Cỡ', (gianhap*soluong) as 'Tổng Tiền' from tb_Sanpham where maloai like '%" + txtSanPham.Text.ToString() + "%'", conn);
                sda.Fill(ds, "tb_Sanpham");
                dataGridView2.DataSource = ds.Tables["tb_Sanpham"];
            }
            else if (rbKichco.Checked)
            {
                ds.Tables["tb_Sanpham"].Clear();
                sda = new SqlDataAdapter("select masp as 'Mã Sản Phẩm', tensp as 'Tên Sản Phẩm', maloai as 'Mã Loại', gianhap as 'Giá Nhập', giaban as 'Giá Bán', giathue as 'Giá Thuê', soluong as 'Số Lượng', anh as 'Hình Ảnh', ghichu as 'Ghi Chú', kichco as 'Kích Cỡ', (gianhap*soluong) as 'Tổng Tiền' from tb_Sanpham where kichco like '%" + txtSanPham.Text.ToString() + "%'", conn);
                sda.Fill(ds, "tb_Sanpham");
                dataGridView2.DataSource = ds.Tables["tb_Sanpham"];
            }
            else if (rbAll.Checked)
            {
                ds.Tables["tb_Sanpham"].Clear();
                sda = new SqlDataAdapter("select masp as 'Mã Sản Phẩm', tensp as 'Tên Sản Phẩm', maloai as 'Mã Loại', gianhap as 'Giá Nhập', giaban as 'Giá Bán', giathue as 'Giá Thuê', soluong as 'Số Lượng', anh as 'Hình Ảnh', ghichu as 'Ghi Chú', kichco as 'Kích Cỡ', (gianhap*soluong) as 'Tổng Tiền' from tb_Sanpham", conn);
                sda.Fill(ds, "tb_Sanpham");
                dataGridView2.DataSource = ds.Tables["tb_Sanpham"];
            }
            else
            {
                MessageBox.Show("Dữ liệu tìm không thấy hoặc không tồn tại!");
                MessageBox.Show("Hãy chắc chắn bạn nhập chính xác!");
            }
        }

        private void btTimKiemDH_Click(object sender, EventArgs e)
        {
            if (rbMaDHN.Checked)
            {
                ds.Tables["tb_HDN"].Clear();
                sda = new SqlDataAdapter("select mahdn as 'Mã Hóa Đơn Nhập', ngaynhap as 'Ngày Nhập', manv as 'Mã Nhân Viên', mancc as 'Mã Nhà Cung Cấp', tongtien as 'Tổng Tiền' from tb_HDN where mahdn like '%" + txtDonHang.Text.ToString() + "%'", conn);
                sda.Fill(ds, "tb_HDN");
                dataGridView3.DataSource = ds.Tables["tb_HDN"];
            }
            else if (rbMaDHB.Checked)
            {
                ds.Tables["tb_HDN"].Clear();
                sda = new SqlDataAdapter("select mahdb as 'Mã Hóa Đơn Bán', ngayban as 'Ngày Bán', manv as 'Mã Nhân Viên', makh as 'Mã Khách Hàng', tongtien as 'Tổng Tiền' from tb_HDB where mahdb like '%" + txtDonHang.Text.ToString() + "%'", conn);
                sda.Fill(ds, "tb_HDB");
                dataGridView1.DataSource = ds.Tables["tb_HDB"];
            }
            else
            {
                MessageBox.Show("Dữ liệu tìm không thấy hoặc không tồn tại!");
                MessageBox.Show("Hãy chắc chắn bạn nhập chính xác!");
            }
        }

        private void TimKiem_Load(object sender, EventArgs e)
        {
            sda = new SqlDataAdapter("select masp as 'Mã Sản Phẩm', tensp as 'Tên Sản Phẩm', maloai as 'Mã Loại', gianhap as 'Giá Nhập', giaban as 'Giá Bán', giathue as 'Giá Thuê', soluong as 'Số Lượng', anh as 'Hình Ảnh', ghichu as 'Ghi Chú', kichco as 'Kích Cỡ', (gianhap*soluong) as 'Tổng Tiền' from tb_Sanpham", conn);
            sda.Fill(ds, "tb_Sanpham");
            dataGridView2.DataSource = ds.Tables[0];

            sda = new SqlDataAdapter("select mahdn as 'Mã Hóa Đơn Nhập', ngaynhap as 'Ngày Nhập', manv as 'Mã Nhân Viên', mancc as 'Mã Nhà Cung Cấp', tongtien as 'Tổng Tiền' from tb_HDN where mahdn like '%" + txtDonHang.Text.ToString() + "%'", conn);
            sda.Fill(ds, "tb_HDN");
            dataGridView3.DataSource = ds.Tables["tb_HDN"];
        }

        private void rbMaDHB_CheckedChanged(object sender, EventArgs e)
        {
            ds.Tables["tb_HDN"].Clear();
            sda = new SqlDataAdapter("select mahdb as 'Mã Hóa Đơn Bán', ngayban as 'Ngày Bán', manv as 'Mã Nhân Viên', makh as 'Mã Khách Hàng', tongtien as 'Tổng Tiền' from tb_HDB where mahdb like '%" + txtDonHang.Text.ToString() + "%'", conn);
            sda.Fill(ds, "tb_HDB");
            dataGridView1.DataSource = ds.Tables["tb_HDB"];
        }

        private void rbMaDHN_CheckedChanged(object sender, EventArgs e)
        {
            ds.Tables["tb_HDN"].Clear();
            sda = new SqlDataAdapter("select mahdn as 'Mã Hóa Đơn Nhập', ngaynhap as 'Ngày Nhập', manv as 'Mã Nhân Viên', mancc as 'Mã Nhà Cung Cấp', tongtien as 'Tổng Tiền' from tb_HDN where mahdn like '%" + txtDonHang.Text.ToString() + "%'", conn);
            sda.Fill(ds, "tb_HDN");
            dataGridView3.DataSource = ds.Tables["tb_HDN"];
        }

        private void rbAll_CheckedChanged(object sender, EventArgs e)
        {
            ds.Tables["tb_Sanpham"].Clear();
            sda = new SqlDataAdapter("select masp as 'Mã Sản Phẩm', tensp as 'Tên Sản Phẩm', maloai as 'Mã Loại', gianhap as 'Giá Nhập', giaban as 'Giá Bán', giathue as 'Giá Thuê', soluong as 'Số Lượng', anh as 'Hình Ảnh', ghichu as 'Ghi Chú', kichco as 'Kích Cỡ', (gianhap*soluong) as 'Tổng Tiền' from tb_Sanpham", conn);
            sda.Fill(ds, "tb_Sanpham");
            dataGridView2.DataSource = ds.Tables["tb_Sanpham"];
        }

        private void rbKichco_CheckedChanged(object sender, EventArgs e)
        {
            ds.Tables["tb_Sanpham"].Clear();
            sda = new SqlDataAdapter("select masp as 'Mã Sản Phẩm', tensp as 'Tên Sản Phẩm', maloai as 'Mã Loại', gianhap as 'Giá Nhập', giaban as 'Giá Bán', giathue as 'Giá Thuê', soluong as 'Số Lượng', anh as 'Hình Ảnh', ghichu as 'Ghi Chú', kichco as 'Kích Cỡ', (gianhap*soluong) as 'Tổng Tiền' from tb_Sanpham where kichco like '%" + txtSanPham.Text.ToString() + "%'", conn);
            sda.Fill(ds, "tb_Sanpham");
            dataGridView2.DataSource = ds.Tables["tb_Sanpham"];
        }

        private void rbMaloai_CheckedChanged(object sender, EventArgs e)
        {
            ds.Tables["tb_Sanpham"].Clear();
            sda = new SqlDataAdapter("select masp as 'Mã Sản Phẩm', tensp as 'Tên Sản Phẩm', maloai as 'Mã Loại', gianhap as 'Giá Nhập', giaban as 'Giá Bán', giathue as 'Giá Thuê', soluong as 'Số Lượng', anh as 'Hình Ảnh', ghichu as 'Ghi Chú', kichco as 'Kích Cỡ', (gianhap*soluong) as 'Tổng Tiền' from tb_Sanpham where maloai like '%" + txtSanPham.Text.ToString() + "%'", conn);
            sda.Fill(ds, "tb_Sanpham");
            dataGridView2.DataSource = ds.Tables["tb_Sanpham"];
        }

        private void rbtensp_CheckedChanged(object sender, EventArgs e)
        {
            ds.Tables["tb_Sanpham"].Clear();
            sda = new SqlDataAdapter("select masp as 'Mã Sản Phẩm', tensp as 'Tên Sản Phẩm', maloai as 'Mã Loại', gianhap as 'Giá Nhập', giaban as 'Giá Bán', giathue as 'Giá Thuê', soluong as 'Số Lượng', anh as 'Hình Ảnh', ghichu as 'Ghi Chú', kichco as 'Kích Cỡ', (gianhap*soluong) as 'Tổng Tiền' from tb_Sanpham where tensp like '%" + txtSanPham.Text.ToString() + "%'", conn);
            sda.Fill(ds, "tb_Sanpham");
            dataGridView2.DataSource = ds.Tables["tb_Sanpham"];
        }

        private void rbMasp_CheckedChanged(object sender, EventArgs e)
        {
            ds.Tables["tb_Sanpham"].Clear();
            sda = new SqlDataAdapter("select masp as 'Mã Sản Phẩm', tensp as 'Tên Sản Phẩm', maloai as 'Mã Loại', gianhap as 'Giá Nhập', giaban as 'Giá Bán', giathue as 'Giá Thuê', soluong as 'Số Lượng', anh as 'Hình Ảnh', ghichu as 'Ghi Chú', kichco as 'Kích Cỡ', (gianhap*soluong) as 'Tổng Tiền' from tb_Sanpham where masp like '%" + txtSanPham.Text.ToString() + "%'", conn);
            sda.Fill(ds, "tb_Sanpham");
            dataGridView2.DataSource = ds.Tables["tb_Sanpham"];
        }
    }
}
