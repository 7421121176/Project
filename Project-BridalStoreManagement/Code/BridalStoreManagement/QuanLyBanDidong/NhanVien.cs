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
    public partial class NhanVien : Form
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataSet ds;
        bool check;

        public NhanVien()
        {
            InitializeComponent();

            conn = new SqlConnection();
            conn.ConnectionString = Connect.sqlcon;

            ds = new DataSet();
        }

        private void NhanVien_Load(object sender, EventArgs e)
        {
            try
            {
                ena();
                btLuu.Enabled = false;
                panel2.Enabled = false;

                sda = new SqlDataAdapter("select manv as 'Mã Nhân Viên', tennv as 'Tên Nhân Viên', gioitinh as 'Giới Tính', ngaysinh as 'Ngày Sinh', dienthoai as 'Điện Thoại', diachi as 'Địa Chỉ' from tb_Nhanvien", conn);
                sda.Fill(ds);
                dataGridView1.DataSource = ds.Tables[0];
            }
            catch (Exception )
            {
                MessageBox.Show("Không Thể Mở !");
            }
        }

        private void btCancel_Click(object sender, EventArgs e)
        {
            ena();
            btLuu.Enabled = false;
            panel2.Enabled = false;

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
                        cmd.CommandText = "delete from tb_Nhanvien where manv = '" + this.dataGridView1.SelectedRows[0].Cells[0].Value.ToString() + "'";
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
            dataGridView1.Enabled = false;
        }

        private void btSua_Click(object sender, EventArgs e)
        {
            check = false;
            ena();
            btThem.Enabled = false;
            btSua.Enabled = false;
            btXoa.Enabled = false;
            txtManhanvien.Enabled = false;
        }

        private void btLuu_Click(object sender, EventArgs e)
        {
            ena();
            btLuu.Enabled = false;
            panel2.Enabled = false;

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
            txtManhanvien.Text = dataGridView1.CurrentRow.Cells[0].Value.ToString();
            txtTen.Text = dataGridView1.CurrentRow.Cells[1].Value.ToString();
            if (dataGridView1.CurrentRow.Cells[2].Value.ToString() == "True")
            {
                rbNam.Checked = true;
            }
            else
            {
                rbNu.Checked = true;
            }
            txtNgaysinh.Text = dataGridView1.CurrentRow.Cells[3].Value.ToString();
            txtSoDienThoai.Text = dataGridView1.CurrentRow.Cells[4].Value.ToString();
            txtDiachi.Text = dataGridView1.CurrentRow.Cells[5].Value.ToString();
        }

        private void load()
        {
            try
            {
                ds.Tables[0].Clear();
                sda = new SqlDataAdapter("select manv as 'Mã Nhân Viên', tennv as 'Tên Nhân Viên', gioitinh as 'Giới Tính', ngaysinh as 'Ngày Sinh', dienthoai as 'Điện Thoại', diachi as 'Địa Chỉ' from tb_Nhanvien", conn);
                sda.Fill(ds);
                dataGridView1.DataSource = ds.Tables[0];
            }
            catch (Exception )
            {
                MessageBox.Show("Không Thể Mở !");
            }
        }

        private void clear()
        {
            txtManhanvien.Text = "";
            txtTen.Text = "";
            rbNam.Checked = true;
            txtNgaysinh.Text = "";
            txtSoDienThoai.Text = "";
            txtDiachi.Text = "";
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
                cmd.CommandText = "insert into tb_Nhanvien " +
                    "values (@Manhanvien,@Ten,@Gioitinh,@Ngaysinh,@SoDienThoai,@Diachi)";

                cmd.Parameters.AddWithValue("@Manhanvien", txtManhanvien.Text.ToString());
                cmd.Parameters.AddWithValue("@Ten", txtTen.Text.ToString());
                if (rbNam.Checked)
                {
                    cmd.Parameters.AddWithValue("@Gioitinh", "True");
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Gioitinh", "False");
                }
                cmd.Parameters.AddWithValue("@Ngaysinh", txtNgaysinh.Text.ToString());
                cmd.Parameters.AddWithValue("@SoDienThoai", txtSoDienThoai.Text.ToString());
                cmd.Parameters.AddWithValue("@Diachi", txtDiachi.Text.ToString());

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
                cmd.CommandText = "update tb_Nhanvien set tennv=@Ten,gioitinh=@Gioitinh,ngaysinh=@Ngaysinh,dienthoai=@SoDienThoai,diachi=@Diachi where manv = '" + txtManhanvien.Text.ToString() + "'";

                cmd.Parameters.AddWithValue("@Ten", txtTen.Text.ToString());
                if (rbNam.Checked)
                {
                    cmd.Parameters.AddWithValue("@Gioitinh", "True");
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Gioitinh", "False");
                }
                cmd.Parameters.AddWithValue("@Ngaysinh", txtNgaysinh.Text.ToString());
                cmd.Parameters.AddWithValue("@SoDienThoai", txtSoDienThoai.Text.ToString());
                cmd.Parameters.AddWithValue("@Diachi", txtDiachi.Text.ToString());

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
            panel2.Enabled = true;
            btThem.Enabled = true;
            btSua.Enabled = true;
            btXoa.Enabled = true;
            btCancel.Enabled = true;
            btLuu.Enabled = true;
        }
    }
}
