namespace BridalStoreManagement
{
    partial class NhaCC
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(NhaCC));
            this.btXoa = new System.Windows.Forms.Button();
            this.panel3 = new System.Windows.Forms.Panel();
            this.btSua = new System.Windows.Forms.Button();
            this.btLuu = new System.Windows.Forms.Button();
            this.btThem = new System.Windows.Forms.Button();
            this.btCancel = new System.Windows.Forms.Button();
            this.txtDiachi = new System.Windows.Forms.TextBox();
            this.txtTen = new System.Windows.Forms.TextBox();
            this.panel4 = new System.Windows.Forms.Panel();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.panel1 = new System.Windows.Forms.Panel();
            this.panel2 = new System.Windows.Forms.Panel();
            this.txtSoDienThoai = new System.Windows.Forms.TextBox();
            this.txtManhacungcap = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.panel3.SuspendLayout();
            this.panel4.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.panel1.SuspendLayout();
            this.panel2.SuspendLayout();
            this.SuspendLayout();
            // 
            // btXoa
            // 
            this.btXoa.Image = global::QuanLyBanDidong.Properties.Resources.delete;
            this.btXoa.Location = new System.Drawing.Point(181, 3);
            this.btXoa.Name = "btXoa";
            this.btXoa.Size = new System.Drawing.Size(69, 49);
            this.btXoa.TabIndex = 10;
            this.btXoa.UseVisualStyleBackColor = true;
            this.btXoa.Click += new System.EventHandler(this.btXoa_Click);
            // 
            // panel3
            // 
            this.panel3.Controls.Add(this.btSua);
            this.panel3.Controls.Add(this.btLuu);
            this.panel3.Controls.Add(this.btThem);
            this.panel3.Controls.Add(this.btCancel);
            this.panel3.Controls.Add(this.btXoa);
            this.panel3.Location = new System.Drawing.Point(10, 256);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(259, 111);
            this.panel3.TabIndex = 19;
            // 
            // btSua
            // 
            this.btSua.Image = global::QuanLyBanDidong.Properties.Resources.edit;
            this.btSua.Location = new System.Drawing.Point(93, 3);
            this.btSua.Name = "btSua";
            this.btSua.Size = new System.Drawing.Size(69, 49);
            this.btSua.TabIndex = 9;
            this.btSua.UseVisualStyleBackColor = true;
            this.btSua.Click += new System.EventHandler(this.btSua_Click);
            // 
            // btLuu
            // 
            this.btLuu.Image = global::QuanLyBanDidong.Properties.Resources.save;
            this.btLuu.Location = new System.Drawing.Point(46, 58);
            this.btLuu.Name = "btLuu";
            this.btLuu.Size = new System.Drawing.Size(69, 48);
            this.btLuu.TabIndex = 12;
            this.btLuu.UseVisualStyleBackColor = true;
            this.btLuu.Click += new System.EventHandler(this.btLuu_Click);
            // 
            // btThem
            // 
            this.btThem.Image = global::QuanLyBanDidong.Properties.Resources.add2;
            this.btThem.Location = new System.Drawing.Point(8, 3);
            this.btThem.Name = "btThem";
            this.btThem.Size = new System.Drawing.Size(69, 49);
            this.btThem.TabIndex = 8;
            this.btThem.UseVisualStyleBackColor = true;
            this.btThem.Click += new System.EventHandler(this.btThem_Click);
            // 
            // btCancel
            // 
            this.btCancel.Image = global::QuanLyBanDidong.Properties.Resources.load;
            this.btCancel.Location = new System.Drawing.Point(152, 58);
            this.btCancel.Name = "btCancel";
            this.btCancel.Size = new System.Drawing.Size(69, 48);
            this.btCancel.TabIndex = 11;
            this.btCancel.UseVisualStyleBackColor = true;
            this.btCancel.Click += new System.EventHandler(this.btCancel_Click);
            // 
            // txtDiachi
            // 
            this.txtDiachi.Location = new System.Drawing.Point(86, 204);
            this.txtDiachi.Name = "txtDiachi";
            this.txtDiachi.Size = new System.Drawing.Size(173, 20);
            this.txtDiachi.TabIndex = 7;
            // 
            // txtTen
            // 
            this.txtTen.Location = new System.Drawing.Point(86, 44);
            this.txtTen.Name = "txtTen";
            this.txtTen.Size = new System.Drawing.Size(173, 20);
            this.txtTen.TabIndex = 5;
            // 
            // panel4
            // 
            this.panel4.Controls.Add(this.dataGridView1);
            this.panel4.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel4.Location = new System.Drawing.Point(275, 0);
            this.panel4.Name = "panel4";
            this.panel4.Size = new System.Drawing.Size(424, 374);
            this.panel4.TabIndex = 28;
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dataGridView1.Location = new System.Drawing.Point(0, 0);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.ReadOnly = true;
            this.dataGridView1.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dataGridView1.Size = new System.Drawing.Size(424, 374);
            this.dataGridView1.TabIndex = 25;
            this.dataGridView1.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellContentClick);
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.panel3);
            this.panel1.Controls.Add(this.panel2);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Left;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(275, 374);
            this.panel1.TabIndex = 27;
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.txtDiachi);
            this.panel2.Controls.Add(this.txtTen);
            this.panel2.Controls.Add(this.txtSoDienThoai);
            this.panel2.Controls.Add(this.txtManhacungcap);
            this.panel2.Controls.Add(this.label1);
            this.panel2.Controls.Add(this.label4);
            this.panel2.Controls.Add(this.label2);
            this.panel2.Controls.Add(this.label5);
            this.panel2.Location = new System.Drawing.Point(3, 3);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(269, 247);
            this.panel2.TabIndex = 19;
            // 
            // txtSoDienThoai
            // 
            this.txtSoDienThoai.Location = new System.Drawing.Point(86, 152);
            this.txtSoDienThoai.Name = "txtSoDienThoai";
            this.txtSoDienThoai.Size = new System.Drawing.Size(173, 20);
            this.txtSoDienThoai.TabIndex = 16;
            // 
            // txtManhacungcap
            // 
            this.txtManhacungcap.Location = new System.Drawing.Point(86, 10);
            this.txtManhacungcap.Name = "txtManhacungcap";
            this.txtManhacungcap.Size = new System.Drawing.Size(173, 20);
            this.txtManhacungcap.TabIndex = 4;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(5, 10);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(63, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Mã nhà CC:";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(2, 204);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(40, 13);
            this.label4.TabIndex = 3;
            this.label4.Text = "Địa chỉ";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(5, 44);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(32, 13);
            this.label2.TabIndex = 1;
            this.label2.Text = "Tên :";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(5, 159);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(81, 13);
            this.label5.TabIndex = 14;
            this.label5.Text = "Số Điện Thoại :";
            // 
            // NhaCC
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(699, 374);
            this.Controls.Add(this.panel4);
            this.Controls.Add(this.panel1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "NhaCC";
            this.Text = "Nhà Cung Cấp";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.NhaCC_Load);
            this.panel3.ResumeLayout(false);
            this.panel4.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.panel1.ResumeLayout(false);
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btXoa;
        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.Button btSua;
        private System.Windows.Forms.Button btLuu;
        private System.Windows.Forms.Button btThem;
        private System.Windows.Forms.Button btCancel;
        private System.Windows.Forms.TextBox txtDiachi;
        private System.Windows.Forms.TextBox txtTen;
        private System.Windows.Forms.Panel panel4;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.TextBox txtSoDienThoai;
        private System.Windows.Forms.TextBox txtManhacungcap;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.DataGridView dataGridView1;
    }
}