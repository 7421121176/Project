using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.IO;

namespace BridalStoreManagement
{
    public partial class BanHang : Form
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataSet ds;
        bool check;
        bool checkct;

        public BanHang()
        {
            InitializeComponent();

            conn = new SqlConnection();
            conn.ConnectionString = Connect.sqlcon;

            ds = new DataSet();
        }

        private void BanHang_Load(object sender, EventArgs e)
        {
            try
            {
                ena();
                btLuu.Enabled = false;
                groupBox1.Enabled = false;

                sda = new SqlDataAdapter("select mahdb as 'Mã Hóa Đơn Bán', ngayban as 'Ngày Bán', manv as 'Mã Nhân Viên', makh as 'Mã Khách Hàng', tongtien as 'Tổng Tiền' from tb_HDB", conn);
                sda.Fill(ds, "tb_HDB");
                dataGridView1.DataSource = ds.Tables["tb_HDB"];

                sda = new SqlDataAdapter("select * from tb_Nhanvien", conn);
                sda.Fill(ds, "tb_Nhanvien");
                cbNhanvien.DataSource = ds.Tables["tb_Nhanvien"];
                cbNhanvien.DisplayMember = "manv";
                cbNhanvien.ValueMember = "tennv";

                sda = new SqlDataAdapter("select * from tb_Khachhang", conn);
                sda.Fill(ds, "tb_Khachhang");
                cbKhachhang.DataSource = ds.Tables["tb_Khachhang"];
                cbKhachhang.DisplayMember = "makh";
                cbKhachhang.ValueMember = "tenkh";

                enact();
                btLuuct.Enabled = false;

                sda = new SqlDataAdapter("select masp as 'Mã Sản Phẩm', tensp as 'Tên Sản Phẩm', maloai as 'Mã Loại', giaban as 'Giá Bán', giathue as 'Giá Thuê', soluong as 'Số Lượng', anh as 'Hình Ảnh', kichco as 'Kích Cỡ' from tb_Sanpham", conn);
                sda.Fill(ds, "tb_Sanpham");
                dataGridView2.DataSource = ds.Tables["tb_Sanpham"];

                sda = new SqlDataAdapter("select * from tb_Loai", conn);
                sda.Fill(ds, "tb_Loai");
                cbTenLoai.DataSource = ds.Tables["tb_Loai"];
                cbTenLoai.DisplayMember = "maloai";
                cbTenLoai.ValueMember = "tenloai";

                sda = new SqlDataAdapter("select mahdb as 'Mã Hóa Đơn Bán', masp as 'Mã Sản Phẩm', thue as 'Thuê', soluong as 'Số lượng' from tb_CTHHDB", conn);
                sda.Fill(ds, "tb_CTHHDB");
                dataGridView3.DataSource = ds.Tables["tb_CTHHDB"];
            }
            catch (Exception)
            {
                MessageBox.Show("Không Thể Mở !");
            }
        }

        private void btHuy_Click(object sender, EventArgs e)
        {
            ena();
            btLuu.Enabled = false;
            groupBox1.Enabled = false;

            clear();
        }

        private void btXoa_Click(object sender, EventArgs e)
        {
            try
            {
                DialogResult dr = MessageBox.Show("Record will delete ?", "Question", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
                if (dr == DialogResult.OK)
                {

                    if (dataGridView1.Rows.Count > 1 && dataGridView1.SelectedRows[0].Index != dataGridView1.Rows.Count)
                    {
                        if (conn.State == ConnectionState.Open)
                            conn.Close();
                        conn.Open();
                        cmd = new SqlCommand();
                        cmd.Connection = conn;
                        cmd.CommandText = "delete from tb_HDB where mahdb = '" + this.dataGridView1.SelectedRows[0].Cells[0].Value.ToString() + "'";
                        dataGridView1.Rows.RemoveAt(dataGridView1.SelectedRows[0].Index);
                        cmd.ExecuteNonQuery();

                        load();

                    }
                    conn.Close();
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Không Thể Xóa !");
            }
        }

        private void btThem_Click(object sender, EventArgs e)
        {
            check = true;
            ena();
            btThem.Enabled = false;
            btSua.Enabled = false;
            btXoa.Enabled = false;
            dataGridView1.Enabled = false;
            clear();
        }

        private void btLuu_Click(object sender, EventArgs e)
        {
            ena();
            btLuu.Enabled = false;
            groupBox1.Enabled = false;

            if (check)
            {
                add();
            }
            else
            {
                edit();
            }

            load();
        }

        private void btSua_Click(object sender, EventArgs e)
        {
            check = false;
            ena();
            btThem.Enabled = false;
            btSua.Enabled = false;
            btXoa.Enabled = false;
            txtMaHoaDon.Enabled = false;
        }

        private void load()
        {
            try
            {
                ds.Tables["tb_HDB"].Clear();
                sda = new SqlDataAdapter("select mahdb as 'Mã Hóa Đơn Bán', ngayban as 'Ngày Bán', manv as 'Mã Nhân Viên', makh as 'Mã Khách Hàng', tongtien as 'Tổng Tiền' from tb_HDB", conn);
                sda.Fill(ds, "tb_HDB");
                dataGridView1.DataSource = ds.Tables["tb_HDB"];
            }
            catch (Exception)
            {
                MessageBox.Show("Không Thể Mở !");
            }
        }

        private void clear()
        {
            txtMaHoaDon.Text = "";
            cbNhanvien.Text = "";
            cbKhachhang.Text = "";
            txtThanhTien.Text = "";
        }

        private void add()
        {
            try
            {
                if (conn.State == ConnectionState.Open)
                    conn.Close();
                conn.Open();
                cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = "insert into tb_HDB(mahdb,ngayban,manv,makh) " +
                    "values (@mahdb,@ngayban,@manv,@makh)";

                cmd.Parameters.AddWithValue("@mahdb", txtMaHoaDon.Text.ToString());
                cmd.Parameters.AddWithValue("@ngayban", txtNgayNhap.Text.ToString());
                cmd.Parameters.AddWithValue("@manv", cbNhanvien.Text.ToString());
                cmd.Parameters.AddWithValue("@makh", cbKhachhang.Text.ToString());

                cmd.ExecuteNonQuery();
                conn.Close();
            }
            catch (Exception)
            {
                MessageBox.Show("Không Thể Thêm !");
            }
        }

        private void edit()
        {
            try
            {
                if (conn.State == ConnectionState.Open)
                    conn.Close();
                conn.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = "update tb_HDB set ngayban=@ngayban,manv=@manv,makh=@makh where mahdb = '" + txtMaHoaDon.Text.ToString() + "'";

                cmd.Parameters.AddWithValue("@ngayban", txtNgayNhap.Text.ToString());
                cmd.Parameters.AddWithValue("@manv", cbNhanvien.Text.ToString());
                cmd.Parameters.AddWithValue("@makh", cbKhachhang.Text.ToString());

                cmd.ExecuteNonQuery();
                conn.Close();
            }
            catch (Exception)
            {
                MessageBox.Show("Không Thể Sửa !");
            }
        }

        private void ena()
        {
            dataGridView1.Enabled = true;
            groupBox1.Enabled = true;
            btThem.Enabled = true;
            btSua.Enabled = true;
            btXoa.Enabled = true;
            btHuy.Enabled = true;
            btLuu.Enabled = true;
            txtMaHoaDon.Enabled = true;

            lblKhachhang.Text = "- - - -";
            lblNhanvien.Text = "- - - -";
        }

        private void cbNhanvien_SelectedValueChanged(object sender, EventArgs e)
        {
            lblNhanvien.Text = cbNhanvien.SelectedValue.ToString();
        }

        private void cbKhachhang_SelectedValueChanged(object sender, EventArgs e)
        {
            lblKhachhang.Text = cbKhachhang.SelectedValue.ToString();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            txtMaHoaDon.Text = dataGridView1.CurrentRow.Cells[0].Value.ToString();
            txtNgayNhap.Text = dataGridView1.CurrentRow.Cells[1].Value.ToString();
            cbNhanvien.Text = dataGridView1.CurrentRow.Cells[2].Value.ToString();
            cbKhachhang.Text = dataGridView1.CurrentRow.Cells[3].Value.ToString();
            txtThanhTien.Text = dataGridView1.CurrentRow.Cells[4].Value.ToString();

            loadct();
            clearct();
            tabControl1.SelectedIndex = 1;
        }


        // chi tiet


        private void btHuyct_Click(object sender, EventArgs e)
        {
            ena();
            btLuu.Enabled = false;
            groupBox1.Enabled = false;

            clearct();
        }

        private void btXoact_Click(object sender, EventArgs e)
        {
            try
            {
                DialogResult dr = MessageBox.Show("Record will delete ?", "Question", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
                if (dr == DialogResult.OK)
                {

                    if (dataGridView3.Rows.Count > 1 && dataGridView3.SelectedRows[0].Index != dataGridView3.Rows.Count)
                    {
                        if (conn.State == ConnectionState.Open)
                            conn.Close();
                        conn.Open();
                        cmd = new SqlCommand();
                        cmd.Connection = conn;
                        cmd.CommandText = "delete from tb_CTHHDB where macthdb = '" + this.dataGridView3.SelectedRows[0].Cells[0].Value.ToString() + "'";
                        dataGridView3.Rows.RemoveAt(dataGridView3.SelectedRows[0].Index);
                        cmd.ExecuteNonQuery();

                        load();

                    }
                    conn.Close();
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Không Thể Xóa !");
            }
        }

        private void btThemct_Click(object sender, EventArgs e)
        {
            checkct = true;
            enact();
            btThemct.Enabled = false;
            btSuact.Enabled = false;
            btXoact.Enabled = false;
        }

        private void btSuact_Click(object sender, EventArgs e)
        {
            checkct = false;
            enact();
            btThemct.Enabled = false;
            btSuact.Enabled = false;
            btXoact.Enabled = false;
        }

        private void btLuuct_Click(object sender, EventArgs e)
        {
            //int sum = 0;
            //for (int i = 0; i < dataGridView3.Rows.Count; ++i)
            //{
            //    sum += Convert.ToInt32(dataGridView3.Rows[i].Cells[4].Value);
            //}
            //txtThanhTien.Text = sum.ToString();

            if (checkct)
            {
                addct();
            }
            else
            {
                editct();
            }

            if (conn.State == ConnectionState.Open)
                conn.Close();
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;

            cmd.CommandText = "update tb_HDB set tongtien=@tongtien where mahdb = '" + txtMaHoaDon.Text.ToString() + "'";
            cmd.Parameters.AddWithValue("@tongtien", txtThanhTien.Text.ToString());
            cmd.ExecuteNonQuery();

            if (float.Parse(dataGridView2.CurrentRow.Cells[5].Value.ToString()) - float.Parse(txtSoLuong.Text) > 0)
            {
                cmd.CommandText = "update tb_Sanpham set soluong = soluong - '" + txtSoLuong.Text.ToString() + "' where masp = '" + dataGridView2.CurrentRow.Cells[0].Value.ToString() + "'";
                cmd.ExecuteNonQuery();
            }
            else
            {
                MessageBox.Show("Hiện tại sản phẩm này đã hết hàng, xin chọn sản phẩm khác !");
            }

            conn.Close();

            load();
            loadct();
            enact();
            btLuuct.Enabled = false;
        }

        private void dataGridView2_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            ImageConverter icover = new ImageConverter();
            txtTenSanPham.Text = dataGridView2.CurrentRow.Cells[1].Value.ToString();
            cbTenLoai.Text = dataGridView2.CurrentRow.Cells[2].Value.ToString();
            txtGiaBan.Text = dataGridView2.CurrentRow.Cells[3].Value.ToString();
            txtGiaThue.Text = dataGridView2.CurrentRow.Cells[4].Value.ToString();
            if (float.Parse(dataGridView2.CurrentRow.Cells[5].Value.ToString()) > 0)
            {
                txtTinhTrang.Text = "Còn " + dataGridView2.CurrentRow.Cells[5].Value.ToString() + " sản phẩm";
            }
            else
            {
                txtTinhTrang.Text = "Hết Hàng";
            }
            cbKichCo.Text = dataGridView2.CurrentRow.Cells[7].Value.ToString();
            pictureBox1.Image = (Image)icover.ConvertFrom(dataGridView2.CurrentRow.Cells[6].Value);
        }

        private void addct()
        {
            try
            {
                if (conn.State == ConnectionState.Open)
                    conn.Close();
                conn.Open();
                cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = "insert into tb_CTHHDB " +
                   "values (@mahdb,@masp,@thue,@soluong)";

                cmd.Parameters.AddWithValue("@mahdb", txtMaHoaDon.Text.ToString());
                cmd.Parameters.AddWithValue("@masp", dataGridView2.CurrentRow.Cells[0].Value.ToString());
                if (rbtnThue.Checked)
                {
                    cmd.Parameters.AddWithValue("@thue", "True");
                }
                else
                {
                    cmd.Parameters.AddWithValue("@thue", "False");
                }
                cmd.Parameters.AddWithValue("@soluong", txtSoLuong.Text.ToString());
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            catch (Exception)
            {
                MessageBox.Show("Không Thể Thêm !");
            }
        }

        private void editct()
        {
            try
            {
                if (conn.State == ConnectionState.Open)
                    conn.Close();
                conn.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = "update tb_CTHHDB set thue=@thue,soluong=@soluong where macthdb = '" + dataGridView3.CurrentRow.Cells[0].Value.ToString() + "'";

                if (rbtnThue.Checked)
                {
                    cmd.Parameters.AddWithValue("@thue", "True");
                }
                else
                {
                    cmd.Parameters.AddWithValue("@thue", "False");
                }
                cmd.Parameters.AddWithValue("@soluong", txtSoLuong.Text.ToString());

                cmd.ExecuteNonQuery();
                conn.Close();
            }
            catch (Exception)
            {
                MessageBox.Show("Không Thể Sửa !");
            }
        }

        private void dataGridView3_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dataGridView3.CurrentRow.Cells[2].Value.ToString() == "True")
            {
                rbtnThue.Checked = true;
            }
            else
            {
                rbtMua.Checked = true;
            }
            txtSoLuong.Text = dataGridView3.CurrentRow.Cells[3].Value.ToString();
        }

        private void loadct()
        {
            try
            {
                ds.Tables["tb_CTHHDB"].Clear();
                sda = new SqlDataAdapter("select mahdb as 'Mã Hóa Đơn Bán', masp as 'Mã Sản Phẩm', thue as 'Thuê', soluong as 'Số lượng' from tb_CTHHDB where mahdb = '" + txtMaHoaDon.Text.ToString() + "'", conn);
                sda.Fill(ds, "tb_CTHHDB");
                dataGridView3.DataSource = ds.Tables["tb_CTHHDB"];

                ds.Tables["tb_Sanpham"].Clear();
                sda = new SqlDataAdapter("select masp as 'Mã Sản Phẩm', tensp as 'Tên Sản Phẩm', maloai as 'Mã Loại', giaban as 'Giá Bán', giathue as 'Giá Thuê', soluong as 'Số Lượng', anh as 'Hình Ảnh', kichco as 'Kích Cỡ' from tb_Sanpham", conn);
                sda.Fill(ds, "tb_Sanpham");
                dataGridView2.DataSource = ds.Tables["tb_Sanpham"];
            }
            catch (Exception)
            {
                MessageBox.Show("Không Thể Mở !");
            }
        }

        private void clearct()
        {
            txtSoLuong.Text = "";
        }

        private void enact()
        {
            btThemct.Enabled = true;
            btSuact.Enabled = true;
            btXoact.Enabled = true;
            btLuuct.Enabled = true;
            btHuyct.Enabled = true;
            lblLoai.Text = "- - - -";
        }

        private void cbTenLoai_SelectedValueChanged(object sender, EventArgs e)
        {
            lblLoai.Text = cbTenLoai.SelectedValue.ToString();
        }
    }
}
