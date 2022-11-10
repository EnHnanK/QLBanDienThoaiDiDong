using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;
using Excel = Microsoft.Office.Interop.Excel;

namespace NHOM12_CNTT5_K61_QLBanDienThoaiDiDong
{
    public partial class Form1 : Form
    {
        ProcessDatabase dtBase = new ProcessDatabase();
        private DataTable dtBanhang;
        public Form1()
        {
            InitializeComponent();
        }
        private void Form1_Load(object sender, EventArgs e)
        {
            tcTable.Appearance = TabAppearance.FlatButtons;
            tcTable.ItemSize = new Size(0, 1);
            tcTable.SizeMode = TabSizeMode.Fixed;

        }

        private bool isCheck()
        {
           if(cbbChonbang.SelectedIndex == -1)
            {
                MessageBox.Show("Vui lòng chọn bảng cần xem", "Thông Báo", MessageBoxButtons.OK);
                return false;
            }
           if(cbbChonbang.Items.Count < 2)
            {
                MessageBox.Show("Chưa hiển thị được dữ liệu bảng vui lòng kiểm tra SQL", "Thông Báo", MessageBoxButtons.OK);
                return false;
            }
          

            return true;
        }
        private void loadSQL(string i)
        {
            dtBanhang = dtBase.DocBang(i);
            dgvData.DataSource = dtBanhang;

        }
        private void btnEdit_Click(object sender, EventArgs e)
        {

        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            if (txtSearch.Text.Trim() != "")
            {
                string sql, table, col;
                table = this.cbbChonbang.GetItemText(this.cbbChonbang.SelectedItem);
                col = this.cbbChoncot.GetItemText(this.cbbChoncot.SelectedItem);
                sql = $"SELECT * FROM {table} WHERE {col} = N'{txtSearch.Text.Trim()}'";
                loadSQL(sql);
                if (dgvData.Rows.Count < 2)
                {
                    MessageBox.Show("Không tìm thấy dữ liệu vừa nhâp", "Thông Báo", MessageBoxButtons.OK);
                    dgvData.DataSource = null;
                }
            }
            else
            {
                MessageBox.Show("Vui lòng nhập thông tin cần tìm kiếm", "Thông Báo", MessageBoxButtons.OK);
                txtSearch.Focus();
            }
        }

        private void btnCode_Click(object sender, EventArgs e)
        {

        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnExcel_Click(object sender, EventArgs e)
        {

        }

        private void btnDelete_Click(object sender, EventArgs e)
        {

        }

        private void btnAdd_Click(object sender, EventArgs e)
        {

        }

        private void cbbChonbang_Click(object sender, EventArgs e)
        {
            cbbChonbang.SelectedIndex = -1;
            cbbChonbang.DataSource = dtBase.DocBang("SELECT object_id,name FROM sys.Tables");
            cbbChonbang.ValueMember = "object_id"; 
            cbbChonbang.DisplayMember = "name";
           
        }

        private void cbbChonbang_SelectionChangeCommitted(object sender, EventArgs e)
        {
              if (isCheck()) {
                string sql;
                int a;
                sql = "SELECT * FROM ";
                sql = sql + this.cbbChonbang.GetItemText(this.cbbChonbang.SelectedItem);
                loadSQL(sql);
                a = cbbChonbang.SelectedIndex;
                for(int i = 0; i <= cbbChonbang.Items.Count; i++)
                {
                    if(i == a)
                    {
                        tcTable.SelectedIndex = i;
                    }
                }
            }
        }

        private void cbbChoncot_Click(object sender, EventArgs e)
        {
            if (isCheck())
            {
                string sql;
                sql = $"SELECT ORDINAL_POSITION, COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = N'{this.cbbChonbang.GetItemText(this.cbbChonbang.SelectedItem)}'";
                cbbChoncot.SelectedIndex = -1;
                cbbChoncot.DataSource = dtBase.DocBang(sql);
                cbbChoncot.ValueMember = "ORDINAL_POSITION";
                cbbChoncot.DisplayMember = "COLUMN_NAME";

            }

        }
    }
}
