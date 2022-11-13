using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NHOM12_CNTT5_K61_QLBanDienThoaiDiDong
{
    internal class ProcessDatabase
    {
        string strConnect;
        SqlConnection sqlConnect;

        public ProcessDatabase()
        {
            strConnect = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=""F:\Hoc Tap\C#\NHOM12_CNTT5_K61_QLBanDienThoaiDiDong\NHOM12_CNTT5_K61_QLBanDienThoaiDiDong\Data.mdf"";Integrated Security=True";
        }
        private void KetNoiCSDL()
        {
            sqlConnect = new SqlConnection(strConnect);
            if (sqlConnect.State != ConnectionState.Open)
            {
                sqlConnect.Open();
            }
        }

        private void DongKetNoiCSDL()
        {
            if (sqlConnect.State != ConnectionState.Closed)
            {
                sqlConnect.Close();
            };
            sqlConnect.Dispose();
        }

        public DataTable DocBang(string sql)
        {
            DataTable dtBang = new DataTable();
            KetNoiCSDL();
            SqlDataAdapter sqldataAdapte = new SqlDataAdapter(sql, sqlConnect);
            sqldataAdapte.Fill(dtBang);
            DongKetNoiCSDL();
            return dtBang;
        }

        public void CapNhatDuLieu(string sql)
        {
            KetNoiCSDL();
            SqlCommand sqlcommand = new SqlCommand();
            sqlcommand.Connection = sqlConnect;
            sqlcommand.CommandText = sql;
            sqlcommand.ExecuteNonQuery();
            DongKetNoiCSDL();
        }
    }
}
