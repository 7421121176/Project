namespace BridalStoreManagement
{
    partial class DangNhap
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(DangNhap));
            this.btHuy = new System.Windows.Forms.Button();
            this.btDangnhap = new System.Windows.Forms.Button();
            this.txtMatkhau = new System.Windows.Forms.TextBox();
            this.txtTendangnhap = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // btHuy
            // 
            this.btHuy.Image = global::QuanLyBanDidong.Properties.Resources.exit;
            this.btHuy.Location = new System.Drawing.Point(223, 157);
            this.btHuy.Name = "btHuy";
            this.btHuy.Size = new System.Drawing.Size(75, 54);
            this.btHuy.TabIndex = 11;
            this.btHuy.UseVisualStyleBackColor = true;
            this.btHuy.Click += new System.EventHandler(this.btHuy_Click);
            // 
            // btDangnhap
            // 
            this.btDangnhap.Image = global::QuanLyBanDidong.Properties.Resources.login;
            this.btDangnhap.Location = new System.Drawing.Point(76, 157);
            this.btDangnhap.Name = "btDangnhap";
            this.btDangnhap.Size = new System.Drawing.Size(75, 54);
            this.btDangnhap.TabIndex = 10;
            this.btDangnhap.UseVisualStyleBackColor = true;
            this.btDangnhap.Click += new System.EventHandler(this.btDangnhap_Click);
            // 
            // txtMatkhau
            // 
            this.txtMatkhau.Location = new System.Drawing.Point(148, 100);
            this.txtMatkhau.Name = "txtMatkhau";
            this.txtMatkhau.PasswordChar = '*';
            this.txtMatkhau.Size = new System.Drawing.Size(176, 20);
            this.txtMatkhau.TabIndex = 9;
            // 
            // txtTendangnhap
            // 
            this.txtTendangnhap.Location = new System.Drawing.Point(151, 41);
            this.txtTendangnhap.Name = "txtTendangnhap";
            this.txtTendangnhap.Size = new System.Drawing.Size(176, 20);
            this.txtTendangnhap.TabIndex = 8;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(45, 100);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(55, 13);
            this.label2.TabIndex = 7;
            this.label2.Text = "Mật khẩu:";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(45, 41);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(84, 13);
            this.label1.TabIndex = 6;
            this.label1.Text = "Tên đăng nhập:";
            // 
            // DangNhap
            // 
            this.AcceptButton = this.btDangnhap;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(373, 253);
            this.Controls.Add(this.btHuy);
            this.Controls.Add(this.btDangnhap);
            this.Controls.Add(this.txtMatkhau);
            this.Controls.Add(this.txtTendangnhap);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "DangNhap";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Đăng Nhập";
            this.Load += new System.EventHandler(this.DangNhap_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btHuy;
        private System.Windows.Forms.Button btDangnhap;
        private System.Windows.Forms.TextBox txtMatkhau;
        private System.Windows.Forms.TextBox txtTendangnhap;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;

    }
}