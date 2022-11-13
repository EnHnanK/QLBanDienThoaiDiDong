using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace NHOM12_CNTT5_K61_QLBanDienThoaiDiDong.NewFolder1
{
    internal class tStaff
    {
        public string addData(string idStaff, string nameStaff, int genderStaff, string birthdayStaff,string adderssStaff, string phoneNumberStaff, string idPoisition)
        {
            MessageBox.Show(birthdayStaff);
            string sql = $"INSERT INTO Staff VALUES ('{idStaff}', N'{nameStaff}', '{genderStaff}', '{birthdayStaff}', N'{adderssStaff}', '{phoneNumberStaff}', '{idPoisition}')";
            return sql;
        }   
        public string editData(string idStaff, string nameStaff, int genderStaff, string birthdayStaff, string adderssStaff, string phoneNumberStaff, string idPoisition)
        {
            string sql = $"UPDATE Staff SET IDStaff = '{idStaff}', NameStaff = N'{nameStaff}', Gender = '{genderStaff}', Birthday = '{birthdayStaff}', Address = N'{adderssStaff}', PhoneNumber = '{phoneNumberStaff}', IDPoisition = '{idPoisition}'";
            return sql;
        }
        public string editData(string idStaff)
        {
            string sql = $"DELETE FROM Staff WHERE IDStaff = '{idStaff}'";
            return sql;
        }
    }
}
