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
    public partial class KhachHang : Form
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataSet ds;
        bool check;

        public KhachHang()
        {
            InitializeComponent();

            conn = new SqlConnection();
            conn.ConnectionString = Connect.sqlcon;

            ds = new DataSet();
        }

        private void KhachHang_Load(object sender, EventArgs e)
        {
            try
            {
                ena();
                btLuu.Enabled = false;
                panel2.Enabled = false;

                sda = new SqlDataAdapter("select makh as 'Mã Khách Hàng', tenkh as 'Tên Khách Hàng', diachi as 'Địa Chỉ', sdtkh as 'Số Điện Thoại' from tb_Khachhang", conn);
                sda.Fill(ds);
                dataGridView1.DataSource = ds.Tables[0];
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
                        cmd.CommandText = "delete from tb_Khachhang where makh = '" + this.dataGridView1.SelectedRows[0].Cells[0].Value.ToString() + "'";
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
            txtMaKhachHang.Enabled = false;
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
            txtMaKhachHang.Text = dataGridView1.CurrentRow.Cells[0].Value.ToString();
            txtHoTen.Text = dataGridView1.CurrentRow.Cells[1].Value.ToString();
            txtSdt.Text = dataGridView1.CurrentRow.Cells[3].Value.ToString();
            txtDiaChi.Text = dataGridView1.CurrentRow.Cells[2].Value.ToString();
        }

        private void load()
        {
            try
            {
                ds.Tables[0].Clear();
                sda = new SqlDataAdapter("select makh as 'Mã Khách Hàng', tenkh as 'Tên Khách Hàng', diachi as 'Địa Chỉ', sdtkh as 'Số Điện Thoại' from tb_Khachhang", conn);
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
            txtMaKhachHang.Text = "";
            txtHoTen.Text = "";
            txtSdt.Text = "";
            txtDiaChi.Text = "";
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
                cmd.CommandText = "insert into tb_Khachhang(makh,tenkh,diachi,sdtkh) values (@makh,@tenkh,@diachi,@sdtkh) ";
                cmd.Parameters.AddWithValue("@makh", txtMaKhachHang.Text.ToString());
                cmd.Parameters.AddWithValue("@tenkh", txtHoTen.Text.ToString());
                cmd.Parameters.AddWithValue("@diachi", txtDiaChi.Text.ToString());
                cmd.Parameters.AddWithValue("@sdtkh", txtSdt.Text.ToString());

                cmd.ExecuteNonQuery();
                conn.Close();
            }
            catch (Exception )
            {
                MessageBox.Show("Không thể thêm !");
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
                cmd.CommandText = "update tb_Khachhang set tenkh=@tenkh,diachi=@diachi,sdtkh=@sdtkh where makh = '" + txtMaKhachHang.Text.ToString() + "'";
                cmd.Parameters.AddWithValue("@tenkh", txtHoTen.Text.ToString());
                cmd.Parameters.AddWithValue("@diachi", txtDiaChi.Text.ToString());
                cmd.Parameters.AddWithValue("@sdtkh", txtSdt.Text.ToString());

                cmd.ExecuteNonQuery();
                conn.Close();
            }
            catch (Exception )
            {
                MessageBox.Show("Không thể sửa !");
            }
        }

        private void ena()
        {
            dataGridView1.Enabled = true;
            panel2.Enabled = true;
            btThem.Enabled = true;
            btSua.Enabled = true;
            btXoa.Enabled = true;
            btHuy.Enabled = true;
            btLuu.Enabled = true;
            txtMaKhachHang.Enabled = true;
        }
    }
}
