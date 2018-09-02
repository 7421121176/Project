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
    public partial class DangNhap : Form
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataReader sdr;

        public DangNhap()
        {
            InitializeComponent();
        }

        private void DangNhap_Load(object sender, EventArgs e)
        {
            txtTendangnhap.Focus();
        }

        private void btDangnhap_Click(object sender, EventArgs e)
        {
            try
            {
                conn = new SqlConnection();
                conn.ConnectionString = Connect.sqlcon;
                if (conn.State == ConnectionState.Open)
                    conn.Close();
                conn.Open();
                cmd = new SqlCommand("SELECT * FROM tb_User WHERE Username ='" + txtTendangnhap.Text + "' and Password = '" + txtMatkhau.Text + "'", conn);
                sdr = cmd.ExecuteReader();
                sdr.Read();
                if (sdr.HasRows)
                {
                    sdr.Close();
                    conn.Close();
                    MainForm fr = new MainForm();
                    fr.Show();
                    this.Hide();
                }
                else
                {
                    MessageBox.Show("WRONG");
                    txtMatkhau.Focus();
                }
                sdr.Close();
                conn.Close();
            }
            catch (Exception)
            {
                MessageBox.Show("Không thể đăng nhập ! ");
            }
        }

        private void btHuy_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

    }
}
