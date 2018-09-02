namespace BridalStoreManagement
{
    partial class KhachHang
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(KhachHang));
            this.btThem = new System.Windows.Forms.Button();
            this.pnHienThiKhachHang = new System.Windows.Forms.Panel();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.panel1 = new System.Windows.Forms.Panel();
            this.btLuu = new System.Windows.Forms.Button();
            this.btSua = new System.Windows.Forms.Button();
            this.btHuy = new System.Windows.Forms.Button();
            this.btXoa = new System.Windows.Forms.Button();
            this.panel2 = new System.Windows.Forms.Panel();
            this.label5 = new System.Windows.Forms.Label();
            this.txtDiaChi = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.txtSdt = new System.Windows.Forms.TextBox();
            this.txtMaKhachHang = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.txtHoTen = new System.Windows.Forms.TextBox();
            this.pnHienThiKhachHang.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.panel1.SuspendLayout();
            this.panel2.SuspendLayout();
            this.SuspendLayout();
            // 
            // btThem
            // 
            this.btThem.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.btThem.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btThem.Image = global::QuanLyBanDidong.Properties.Resources.add2;
            this.btThem.Location = new System.Drawing.Point(121, 3);
            this.btThem.Name = "btThem";
            this.btThem.Size = new System.Drawing.Size(75, 45);
            this.btThem.TabIndex = 8;
            this.btThem.UseVisualStyleBackColor = true;
            this.btThem.Click += new System.EventHandler(this.btThem_Click);
            // 
            // pnHienThiKhachHang
            // 
            this.pnHienThiKhachHang.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.pnHienThiKhachHang.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.pnHienThiKhachHang.Controls.Add(this.dataGridView1);
            this.pnHienThiKhachHang.Location = new System.Drawing.Point(1, 197);
            this.pnHienThiKhachHang.Name = "pnHienThiKhachHang";
            this.pnHienThiKhachHang.Size = new System.Drawing.Size(873, 251);
            this.pnHienThiKhachHang.TabIndex = 26;
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dataGridView1.Location = new System.Drawing.Point(0, 0);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.ReadOnly = true;
            this.dataGridView1.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dataGridView1.Size = new System.Drawing.Size(871, 249);
            this.dataGridView1.TabIndex = 0;
            this.dataGridView1.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellContentClick);
            // 
            // panel1
            // 
            this.panel1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel1.Controls.Add(this.btThem);
            this.panel1.Controls.Add(this.btLuu);
            this.panel1.Controls.Add(this.btSua);
            this.panel1.Controls.Add(this.btHuy);
            this.panel1.Controls.Add(this.btXoa);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.panel1.Location = new System.Drawing.Point(0, 454);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(874, 53);
            this.panel1.TabIndex = 24;
            // 
            // btLuu
            // 
            this.btLuu.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.btLuu.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btLuu.Image = global::QuanLyBanDidong.Properties.Resources.save;
            this.btLuu.Location = new System.Drawing.Point(258, 3);
            this.btLuu.Name = "btLuu";
            this.btLuu.Size = new System.Drawing.Size(75, 45);
            this.btLuu.TabIndex = 12;
            this.btLuu.UseVisualStyleBackColor = true;
            this.btLuu.Click += new System.EventHandler(this.btLuu_Click);
            // 
            // btSua
            // 
            this.btSua.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.btSua.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btSua.Image = global::QuanLyBanDidong.Properties.Resources.edit;
            this.btSua.Location = new System.Drawing.Point(403, 3);
            this.btSua.Name = "btSua";
            this.btSua.Size = new System.Drawing.Size(75, 45);
            this.btSua.TabIndex = 9;
            this.btSua.UseVisualStyleBackColor = true;
            this.btSua.Click += new System.EventHandler(this.btSua_Click);
            // 
            // btHuy
            // 
            this.btHuy.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.btHuy.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btHuy.Image = global::QuanLyBanDidong.Properties.Resources.load;
            this.btHuy.Location = new System.Drawing.Point(726, 3);
            this.btHuy.Name = "btHuy";
            this.btHuy.Size = new System.Drawing.Size(75, 45);
            this.btHuy.TabIndex = 11;
            this.btHuy.UseVisualStyleBackColor = true;
            this.btHuy.Click += new System.EventHandler(this.btHuy_Click);
            // 
            // btXoa
            // 
            this.btXoa.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.btXoa.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btXoa.Image = global::QuanLyBanDidong.Properties.Resources.delete;
            this.btXoa.Location = new System.Drawing.Point(571, 3);
            this.btXoa.Name = "btXoa";
            this.btXoa.Size = new System.Drawing.Size(75, 45);
            this.btXoa.TabIndex = 10;
            this.btXoa.UseVisualStyleBackColor = true;
            this.btXoa.Click += new System.EventHandler(this.btXoa_Click);
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.label5);
            this.panel2.Controls.Add(this.txtDiaChi);
            this.panel2.Controls.Add(this.label1);
            this.panel2.Controls.Add(this.txtSdt);
            this.panel2.Controls.Add(this.txtMaKhachHang);
            this.panel2.Controls.Add(this.label4);
            this.panel2.Controls.Add(this.label3);
            this.panel2.Controls.Add(this.label2);
            this.panel2.Controls.Add(this.txtHoTen);
            this.panel2.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel2.Location = new System.Drawing.Point(0, 0);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(874, 166);
            this.panel2.TabIndex = 27;
            // 
            // label5
            // 
            this.label5.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 20.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(322, 17);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(324, 31);
            this.label5.TabIndex = 34;
            this.label5.Text = "Danh Sách Khách Hàng";
            // 
            // txtDiaChi
            // 
            this.txtDiaChi.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.txtDiaChi.Location = new System.Drawing.Point(166, 133);
            this.txtDiaChi.Multiline = true;
            this.txtDiaChi.Name = "txtDiaChi";
            this.txtDiaChi.Size = new System.Drawing.Size(696, 30);
            this.txtDiaChi.TabIndex = 33;
            // 
            // label1
            // 
            this.label1.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(69, 99);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(64, 13);
            this.label1.TabIndex = 26;
            this.label1.Text = "Họ và Tên :";
            // 
            // txtSdt
            // 
            this.txtSdt.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.txtSdt.Location = new System.Drawing.Point(572, 96);
            this.txtSdt.Name = "txtSdt";
            this.txtSdt.Size = new System.Drawing.Size(290, 20);
            this.txtSdt.TabIndex = 32;
            // 
            // txtMaKhachHang
            // 
            this.txtMaKhachHang.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.txtMaKhachHang.Location = new System.Drawing.Point(166, 62);
            this.txtMaKhachHang.Name = "txtMaKhachHang";
            this.txtMaKhachHang.Size = new System.Drawing.Size(291, 20);
            this.txtMaKhachHang.TabIndex = 31;
            // 
            // label4
            // 
            this.label4.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(69, 65);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(91, 13);
            this.label4.TabIndex = 29;
            this.label4.Text = "Mã Khách Hàng :";
            // 
            // label3
            // 
            this.label3.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(473, 99);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(81, 13);
            this.label3.TabIndex = 28;
            this.label3.Text = "Số Điện Thoại :";
            // 
            // label2
            // 
            this.label2.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(69, 136);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(47, 13);
            this.label2.TabIndex = 27;
            this.label2.Text = "Địa Chỉ :";
            // 
            // txtHoTen
            // 
            this.txtHoTen.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.txtHoTen.Location = new System.Drawing.Point(167, 96);
            this.txtHoTen.Name = "txtHoTen";
            this.txtHoTen.Size = new System.Drawing.Size(290, 20);
            this.txtHoTen.TabIndex = 30;
            // 
            // KhachHang
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(874, 507);
            this.Controls.Add(this.panel2);
            this.Controls.Add(this.pnHienThiKhachHang);
            this.Controls.Add(this.panel1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "KhachHang";
            this.Text = "Khách Hàng ";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.KhachHang_Load);
            this.pnHienThiKhachHang.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.panel1.ResumeLayout(false);
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btThem;
        private System.Windows.Forms.Panel pnHienThiKhachHang;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Button btLuu;
        private System.Windows.Forms.Button btSua;
        private System.Windows.Forms.Button btHuy;
        private System.Windows.Forms.Button btXoa;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox txtDiaChi;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtSdt;
        private System.Windows.Forms.TextBox txtMaKhachHang;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtHoTen;

    }
}