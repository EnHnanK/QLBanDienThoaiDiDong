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


        }

        private bool isCheck()
        {
           if(cbbChonbang.SelectedIndex == -1)
            {
                return false;
            }
           if(cbbChonbang.Items.Count < 2)
            {
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

        }

        private void btnCode_Click(object sender, EventArgs e)
        {

        }

        private void groupBox2_Enter(object sender, EventArgs e)
        {

        }

        private void btnExit_Click(object sender, EventArgs e)
        {

        }

        private void btnExcel_Click(object sender, EventArgs e)
        {

        }

        private void btnDelete_Click(object sender, EventArgs e)
        {

        }

        private void groupBox1_Enter(object sender, EventArgs e)
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
                for(int i = 0; i <= 1; i++)
                {
                    if(i == a)
                    {
                        tcTable.SelectedIndex = i;
                    }
                }
            }
        }

        
    }
}
