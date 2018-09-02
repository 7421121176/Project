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
    public partial class NhapHang : Form
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataSet ds;
        bool check;
        bool checkct;

        public NhapHang()
        {
            InitializeComponent();

            conn = new SqlConnection();
            conn.ConnectionString = Connect.sqlcon;

            ds = new DataSet();
        }

        private void NhapHang_Load(object sender, EventArgs e)
        {
            try
            {
                ena();
                btLuu.Enabled = false;
                groupBox1.Enabled = false;

                sda = new SqlDataAdapter("select mahdn as 'Mã Hóa Đơn Nhập', ngaynhap as 'Ngày Nhập', manv as 'Mã Nhân Viên', mancc as 'Mã Nhà Cung Cấp', tongtien as 'Tổng Tiền' from tb_HDN", conn);
                sda.Fill(ds, "tb_HDN");
                dataGridView1.DataSource = ds.Tables["tb_HDN"];

                sda = new SqlDataAdapter("select * from tb_Nhanvien", conn);
                sda.Fill(ds, "tb_Nhanvien");
                cbNhanvien.DataSource = ds.Tables["tb_Nhanvien"];
                cbNhanvien.DisplayMember = "manv";
                cbNhanvien.ValueMember = "tennv";

                sda = new SqlDataAdapter("select * from tb_NCC", conn);
                sda.Fill(ds, "tb_NCC");
                cbNhaCC.DataSource = ds.Tables["tb_NCC"];
                cbNhaCC.DisplayMember = "mancc";
                cbNhaCC.ValueMember = "tenncc";

                enact();
                btLuuct.Enabled = false;
                panel5.Enabled = false;

                sda = new SqlDataAdapter("select masp as 'Mã Sản Phẩm', tensp as 'Tên Sản Phẩm', maloai as 'Mã Loại', gianhap as 'Giá Nhập', giaban as 'Giá Bán', giathue as 'Giá Thuê', soluong as 'Số Lượng', anh as 'Hình Ảnh', ghichu as 'Ghi Chú', kichco as 'Kích Cỡ', (gianhap*soluong) as 'Tổng Tiền' from tb_Sanpham", conn);
                sda.Fill(ds, "tb_Sanpham");
                dataGridView2.DataSource = ds.Tables["tb_Sanpham"];

                sda = new SqlDataAdapter("select * from tb_Loai", conn);
                sda.Fill(ds, "tb_Loai");
                cbTenLoai.DataSource = ds.Tables["tb_Loai"];
                cbTenLoai.DisplayMember = "maloai";
                cbTenLoai.ValueMember = "tenloai";
            }
            catch (Exception )
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
                        cmd.CommandText = "delete from tb_HDN where mahdn = '" + this.dataGridView1.SelectedRows[0].Cells[0].Value.ToString() + "'";
                        dataGridView1.Rows.RemoveAt(dataGridView1.SelectedRows[0].Index);
                        cmd.ExecuteNonQuery();

                        load();

                    }
                    conn.Close();
                }
            }
            catch (Exception )
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

        private void btSua_Click(object sender, EventArgs e)
        {
            check = false;
            ena();
            btThem.Enabled = false;
            btSua.Enabled = false;
            btXoa.Enabled = false;
            txtMaHoaDon.Enabled = false;
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

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            txtMaHoaDon.Text = dataGridView1.CurrentRow.Cells[0].Value.ToString();
            txtNgayNhap.Text = dataGridView1.CurrentRow.Cells[1].Value.ToString();
            cbNhanvien.Text = dataGridView1.CurrentRow.Cells[2].Value.ToString();
            cbNhaCC.Text = dataGridView1.CurrentRow.Cells[3].Value.ToString();
            txtThanhTien.Text = dataGridView1.CurrentRow.Cells[4].Value.ToString();

            loadct();
            clearct();
            tabControl1.SelectedIndex = 1;
        }

        private void load()
        {
            try
            {
                ds.Tables["tb_HDN"].Clear();
                sda = new SqlDataAdapter("select mahdn as 'Mã Hóa Đơn Nhập', ngaynhap as 'Ngày Nhập', manv as 'Mã Nhân Viên', mancc as 'Mã Nhà Cung Cấp', tongtien as 'Tổng Tiền' from tb_HDN", conn);
                sda.Fill(ds, "tb_HDN");
                dataGridView1.DataSource = ds.Tables["tb_HDN"];
            }
            catch (Exception )
            {
                MessageBox.Show("Không Thể Mở !");
            }
        }

        private void clear()
        {
            txtMaHoaDon.Text = "";
            cbNhanvien.Text = "";
            cbNhaCC.Text = "";
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
                cmd.CommandText = "insert into tb_HDN(mahdn,ngaynhap,manv,mancc) " +
                    "values (@Mahdn,@ngaynhap,@manv,@mancc)";

                cmd.Parameters.AddWithValue("@Mahdn", txtMaHoaDon.Text.ToString());
                cmd.Parameters.AddWithValue("@ngaynhap", txtNgayNhap.Text.ToString());
                cmd.Parameters.AddWithValue("@manv", cbNhanvien.Text.ToString());
                cmd.Parameters.AddWithValue("@mancc", cbNhaCC.Text.ToString());

                cmd.ExecuteNonQuery();
                conn.Close();
            }
            catch (Exception )
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
                cmd.CommandText = "update tb_HDN set ngaynhap=@ngaynhap,manv=@manv,mancc=@mancc where mahdn = '" + txtMaHoaDon.Text.ToString() + "'";

                cmd.Parameters.AddWithValue("@ngaynhap", txtNgayNhap.Text.ToString());
                cmd.Parameters.AddWithValue("@manv", cbNhanvien.Text.ToString());
                cmd.Parameters.AddWithValue("@mancc", cbNhaCC.Text.ToString());

                cmd.ExecuteNonQuery();
                conn.Close();
            }
            catch (Exception )
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

            lblNhaCC.Text = "- - - -";
            lblNhanvien.Text = "- - - -";
        }


        // chi tiet

        private void btHuyct_Click(object sender, EventArgs e)
        {
            enact();
            btLuuct.Enabled = false;
            panel5.Enabled = false;

            clearct();
        }

        private void btXoact_Click(object sender, EventArgs e)
        {
            try
            {
                DialogResult dr = MessageBox.Show("Record will delete ?", "Question", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
                if (dr == DialogResult.OK)
                {

                    if (dataGridView2.Rows.Count > 1 && dataGridView2.SelectedRows[0].Index != dataGridView2.Rows.Count)
                    {
                        if (conn.State == ConnectionState.Open)
                            conn.Close();
                        conn.Open();
                        cmd = new SqlCommand();
                        cmd.Connection = conn;
                        cmd.CommandText = "delete from tb_Sanpham where masp = '" + this.dataGridView2.SelectedRows[0].Cells[0].Value.ToString() + "'";
                        dataGridView2.Rows.RemoveAt(dataGridView2.SelectedRows[0].Index);
                        cmd.ExecuteNonQuery();

                        load();

                    }
                    conn.Close();
                }
            }
            catch (Exception )
            {
                MessageBox.Show("Không Thể Xóa !");
            }
        }

        private void btThemct_Click(object sender, EventArgs e)
        {
            checkct = true;
            enact();
            clearct();
            btThemct.Enabled = false;
            btSuact.Enabled = false;
            btXoact.Enabled = false;
            dataGridView2.Enabled = false;
        }

        private void btSuact_Click(object sender, EventArgs e)
        {
            checkct = false;
            enact();
            btThemct.Enabled = false;
            btSuact.Enabled = false;
            btXoact.Enabled = false;
            txtMaSanPham.Enabled = false;
        }

        private void btLuuct_Click(object sender, EventArgs e)
        {
            int sum = 0;
            for (int i = 0; i < dataGridView2.Rows.Count; ++i)
            {
                sum += Convert.ToInt32(dataGridView2.Rows[i].Cells[10].Value);
            }
            txtThanhTien.Text = sum.ToString();
 
            if (checkct)
            {
                addct();
            }
            else
            {
                if (lbimgpath.Text == "- - - -")
                {
                    editnoi();
                }
                else
                {
                    editct();
                }
            }

            if (conn.State == ConnectionState.Open)
                conn.Close();
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
           
            cmd.CommandText = "update tb_HDN set tongtien=@tongtien where mahdn = '" + txtMaHoaDon.Text.ToString() + "'";
            cmd.Parameters.AddWithValue("@tongtien", txtThanhTien.Text.ToString());
            cmd.ExecuteNonQuery();
            conn.Close();

            load();
            loadct();
            enact();
            btLuuct.Enabled = false;
            panel5.Enabled = false;
        }

        private void dataGridView2_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            ImageConverter icover = new ImageConverter();
            txtMaSanPham.Text = dataGridView2.CurrentRow.Cells[0].Value.ToString();
            txtTenSanPham.Text = dataGridView2.CurrentRow.Cells[1].Value.ToString();
            cbTenLoai.Text = dataGridView2.CurrentRow.Cells[2].Value.ToString();
            txtGiaNhap.Text = dataGridView2.CurrentRow.Cells[3].Value.ToString();
            txtGiaBan.Text = dataGridView2.CurrentRow.Cells[4].Value.ToString();
            txtGiaThue.Text = dataGridView2.CurrentRow.Cells[5].Value.ToString();
            txtSoLuong.Text = dataGridView2.CurrentRow.Cells[6].Value.ToString();
            txtGhiChu.Text = dataGridView2.CurrentRow.Cells[8].Value.ToString();
            cbKichCo.Text = dataGridView2.CurrentRow.Cells[9].Value.ToString();
            pictureBox1.Image = (Image)icover.ConvertFrom(dataGridView2.CurrentRow.Cells[7].Value);

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
                cmd.CommandText = "insert into tb_Sanpham " +
                   "values (@masp,@tensp,@maloai,@gianhap,@giaban,@giathue,@soluong,@anh,@ghichu,@kichco,@mahdnct)";

                cmd.Parameters.AddWithValue("@masp", txtMaSanPham.Text.ToString());
                cmd.Parameters.AddWithValue("@tensp", txtTenSanPham.Text.ToString());
                cmd.Parameters.AddWithValue("@maloai", cbTenLoai.Text.ToString());
                cmd.Parameters.AddWithValue("@gianhap", txtGiaNhap.Text.ToString());
                cmd.Parameters.AddWithValue("@giaban", txtGiaBan.Text.ToString());
                cmd.Parameters.AddWithValue("@giathue", txtGiaThue.Text.ToString());
                cmd.Parameters.AddWithValue("@soluong", txtSoLuong.Text.ToString());
                cmd.Parameters.AddWithValue("@ghichu", txtGhiChu.Text.ToString());
                cmd.Parameters.AddWithValue("@kichco", cbKichCo.Text.ToString());
                cmd.Parameters.AddWithValue("@mahdnct", txtMaHoaDon.Text.ToString());
                cmd.Parameters.AddWithValue("@anh", LoadHinh());

                cmd.ExecuteNonQuery();
                conn.Close();
            }
            catch (Exception )
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
                //byte[] imageData = ReadFile(lbimgpath.Text);
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = "update tb_Sanpham set tensp=@tensp,maloai=@maloai,gianhap=@gianhap,giaban=@giaban,giathue=@giathue,soluong=@soluong,anh=@anh,ghichu=@ghichu,kichco=@kichco where masp = '" + txtMaSanPham.Text.ToString() + "'";

                cmd.Parameters.AddWithValue("@tensp", txtTenSanPham.Text.ToString());
                cmd.Parameters.AddWithValue("@maloai", cbTenLoai.Text.ToString());
                cmd.Parameters.AddWithValue("@gianhap", txtGiaNhap.Text.ToString());
                cmd.Parameters.AddWithValue("@giaban", txtGiaBan.Text.ToString());
                cmd.Parameters.AddWithValue("@giathue", txtGiaThue.Text.ToString());
                cmd.Parameters.AddWithValue("@soluong", txtSoLuong.Text.ToString());
                cmd.Parameters.AddWithValue("@ghichu", txtGhiChu.Text.ToString());
                cmd.Parameters.AddWithValue("@kichco", cbKichCo.Text.ToString());
                cmd.Parameters.AddWithValue("@anh", LoadHinh());

                cmd.ExecuteNonQuery();
                conn.Close();
            }
            catch (Exception )
            {
                MessageBox.Show("Không Thể Sửa !");
            }
        }

        private void editnoi()
        {
            try
            {
                if (conn.State == ConnectionState.Open)
                    conn.Close();
                conn.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = "update tb_Sanpham set tensp=@tensp,maloai=@maloai,gianhap=@gianhap,giaban=@giaban,giathue=@giathue,soluong=@soluong,ghichu=@ghichu,kichco=@kichco where masp = '" + txtMaSanPham.Text.ToString() + "'";

                cmd.Parameters.AddWithValue("@tensp", txtTenSanPham.Text.ToString());
                cmd.Parameters.AddWithValue("@maloai", cbTenLoai.Text.ToString());
                cmd.Parameters.AddWithValue("@gianhap", txtGiaNhap.Text.ToString());
                cmd.Parameters.AddWithValue("@giaban", txtGiaBan.Text.ToString());
                cmd.Parameters.AddWithValue("@giathue", txtGiaThue.Text.ToString());
                cmd.Parameters.AddWithValue("@soluong", txtSoLuong.Text.ToString());
                cmd.Parameters.AddWithValue("@ghichu", txtGhiChu.Text.ToString());
                cmd.Parameters.AddWithValue("@kichco", cbKichCo.Text.ToString());

                cmd.ExecuteNonQuery();
                conn.Close();
            }
            catch (Exception )
            {
                MessageBox.Show("Không Thể Sửa !");
            }
        }

        private void clearct()
        {
            txtMaSanPham.Text = "";
            txtTenSanPham.Text = "";
            cbTenLoai.Text = "";
            cbKichCo.Text = "";
            txtGiaNhap.Text = "";
            txtGiaBan.Text = "";
            txtGiaThue.Text = "";
            txtSoLuong.Text = "";
            txtGhiChu.Text = "";
            pictureBox1.Image = null;
        }

        private void enact()
        {
            btThemct.Enabled = true;
            btSuact.Enabled = true;
            btXoact.Enabled = true;
            btLuuct.Enabled = true;
            btHuyct.Enabled = true;
            dataGridView2.Enabled = true;
            panel5.Enabled = true;
            lbimgpath.Text = "- - - -";
            lblLoai.Text = "- - - -";
        }

        private void loadct()
        {
            try
            {
                ds.Tables["tb_Sanpham"].Clear();
                sda = new SqlDataAdapter("select masp as 'Mã Sản Phẩm', tensp as 'Tên Sản Phẩm', maloai as 'Mã Loại', gianhap as 'Giá Nhập', giaban as 'Giá Bán', giathue as 'Giá Thuê', soluong as 'Số Lượng', anh as 'Hình Ảnh', ghichu as 'Ghi Chú', kichco as 'Kích Cỡ', (gianhap*soluong) as 'Tổng Tiền' from tb_Sanpham where mahdn = '" + txtMaHoaDon.Text.ToString() + "'", conn);
                sda.Fill(ds, "tb_Sanpham");
                dataGridView2.DataSource = ds.Tables["tb_Sanpham"];
            }
            catch (Exception )
            {
                MessageBox.Show("Không Thể Mở !");
            }
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            try
            {
                OpenFileDialog openFileDialog1 = new OpenFileDialog();
                openFileDialog1.Filter = "image Files (*.jpg;*.jpeg;*.bmp;*.gif;*.png)|*.jpg;*.jpeg;*.bmp;*.gif;*.png";
                openFileDialog1.Title = "Chọn Hình";
                //openFileDialog1.FilterIndex = 1;
                openFileDialog1.RestoreDirectory = true;
                if (openFileDialog1.ShowDialog() == DialogResult.OK)
                {
                    pictureBox1.ImageLocation = openFileDialog1.FileName;
                    lbimgpath.Text = openFileDialog1.FileName;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private byte[] LoadHinh()
        {
            FileStream fs;
            fs = new FileStream(lbimgpath.Text, FileMode.Open, FileAccess.Read);

            byte[] picbye = new byte[fs.Length];
            fs.Read(picbye, 0, System.Convert.ToInt32(fs.Length));
            fs.Close();
            return picbye;
        }

        private void txtGiaNhap_TextChanged(object sender, EventArgs e)
        {
            try
            {
                if (txtGiaNhap.Text == "0" | txtGiaNhap.Text == "")
                {
                    txtGiaThue.Text = "0";
                    txtGiaBan.Text = "0";
                }
                else
                {
                    float gianhap = float.Parse(txtGiaNhap.Text.ToString());
                    double giaban = gianhap + gianhap * 0.5;
                    txtGiaBan.Text = giaban.ToString();

                    double giathue = gianhap + gianhap * 0.25;
                    txtGiaThue.Text = giathue.ToString();
                }
            }
            catch (Exception )
            {
                MessageBox.Show("Vui Lòng Nhập Chính Xác !");
            }
        }

        private void cbNhanvien_SelectedValueChanged(object sender, EventArgs e)
        {
            lblNhanvien.Text = cbNhanvien.SelectedValue.ToString();
        }

        private void cbNhaCC_SelectedValueChanged(object sender, EventArgs e)
        {
            lblNhaCC.Text = cbNhaCC.SelectedValue.ToString();
        }

        private void cbTenLoai_SelectedValueChanged(object sender, EventArgs e)
        {
            lblLoai.Text = cbTenLoai.SelectedValue.ToString();
        }
    }
}
