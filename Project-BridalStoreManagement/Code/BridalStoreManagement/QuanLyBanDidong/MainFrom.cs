using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace BridalStoreManagement
{
    public partial class MainForm : Form
    {
        public MainForm()
        {
            InitializeComponent();
        }

        private Form kiemtratontai(Type formtype)
        {
            foreach (Form f in this.MdiChildren)
            {
                if (f.GetType() == formtype)
                    return f;
            }
            return null;
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            toolStripStatusLabel1.Text = DateTime.Now.ToString();
        }

        private void nhânViênToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form frm = kiemtratontai(typeof(NhanVien));
            if (frm != null)
                frm.Activate();
            else
            {
                NhanVien fr = new NhanVien();
                fr.MdiParent = this;
                fr.Show();
            }
        }

        private void kháchHàngToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form frm = kiemtratontai(typeof(KhachHang));
            if (frm != null)
                frm.Activate();
            else
            {
                KhachHang fr = new KhachHang();
                fr.MdiParent = this;
                fr.Show();
            }
        }

        private void nhàCungCấpToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            Form frm = kiemtratontai(typeof(NhaCC));
            if (frm != null)
                frm.Activate();
            else
            {
                NhaCC fr = new NhaCC();
                fr.MdiParent = this;
                fr.Show();
            }
        }

        private void nhậpHàngToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form frm = kiemtratontai(typeof(NhapHang));
            if (frm != null)
                frm.Activate();
            else
            {
                NhapHang fr = new NhapHang  ();
                fr.MdiParent = this;
                fr.Show();
            }
        }

        private void MainForm_FormClosing(object sender, FormClosingEventArgs e)
        {
            Application.Exit();
        }

        private void đăngXuấtToolStripMenuItem_Click(object sender, EventArgs e)
        {
            DangNhap obj = new DangNhap();
            obj.Show();

            if (ActiveMdiChild != null)
                ActiveMdiChild.Close();
            this.Hide();
        }

        private void loạiToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form frm = kiemtratontai(typeof(Loai));
            if (frm != null)
                frm.Activate();
            else
            {
                Loai fr = new Loai();
                fr.MdiParent = this;
                fr.Show();
            }
        }

        private void tìmKiếmToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form frm = kiemtratontai(typeof(TimKiem));
            if (frm != null)
                frm.Activate();
            else
            {
                TimKiem fr = new TimKiem();
                fr.MdiParent = this;
                fr.Show();
            }
        }

        private void bánThuêHàngToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form frm = kiemtratontai(typeof(BanHang));
            if (frm != null)
                frm.Activate();
            else
            {
                BanHang fr = new BanHang();
                fr.MdiParent = this;
                fr.Show();
            }
        }
    }
}
