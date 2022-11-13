using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Security;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace NHOM12_CNTT5_K61_QLBanDienThoaiDiDong
{
    public partial class Login : Form
    {
        public Login()
        {
            InitializeComponent();
        }
        static byte[] entropy = Encoding.Unicode.GetBytes("SaLtY bOy 6970 ePiC");
        public static string EncryptString(SecureString input)
        {
            byte[] encryptedData = ProtectedData.Protect(Encoding.Unicode.GetBytes(ToInsecureString(input)), entropy, DataProtectionScope.CurrentUser);
            return Convert.ToBase64String(encryptedData);
        }

        public static SecureString DecryptString(string encryptedData)
        {
            try
            {
                byte[] decryptedData = ProtectedData.Unprotect(Convert.FromBase64String(encryptedData), entropy, DataProtectionScope.CurrentUser);
                return ToSecureString(Encoding.Unicode.GetString(decryptedData));
            }
            catch
            {
                return new SecureString();
            }
        }

        public static SecureString ToSecureString(string input)
        {
            SecureString secure = new SecureString();
            foreach (char c in input)
            {
                secure.AppendChar(c);
            }
            secure.MakeReadOnly();
            return secure;
        }

        public static string ToInsecureString(SecureString input)
        {
            string returnValue = string.Empty;
            IntPtr ptr = System.Runtime.InteropServices.Marshal.SecureStringToBSTR(input);
            try
            {
                returnValue = System.Runtime.InteropServices.Marshal.PtrToStringBSTR(ptr);
            }
            finally
            {
                System.Runtime.InteropServices.Marshal.ZeroFreeBSTR(ptr);
            }
            return returnValue;
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            if (cbRemember.Checked == true)
            {
                Properties.Settings.Default.username = txtUsername.Text;
                Properties.Settings.Default.password = EncryptString(ToSecureString(txtPassword.Text));
                Properties.Settings.Default.Save();
            }
            else if (cbRemember.Checked == false)
            {
                Properties.Settings.Default.username = "";
                Properties.Settings.Default.password = "";
                Properties.Settings.Default.Save();
            }
            MessageBox.Show("{\"data\": \"some data\"}", "Login Message Alert", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }
        private void Form_Load(object sender, EventArgs e)
        {
            //textBox1.Text = "UserName";
            //textBox2.Text = "Password";
            if (Properties.Settings.Default.username != string.Empty)
            {
                txtEncrypt.Text = Properties.Settings.Default.username;
                cbRemember.Checked = true;
                SecureString password = DecryptString(Properties.Settings.Default.password);
                string readable = ToInsecureString(password);
                txtDecrypt.Text = readable;
            }
        }

        private void btnEncrypt_Click(object sender, EventArgs e)
        {
            Properties.Settings.Default.password = EncryptString(ToSecureString(txtPassword.Text));
            txtEncrypt.AppendText(Properties.Settings.Default.password.ToString() + Environment.NewLine);
        }

        private void btnDecrypt_Click(object sender, EventArgs e)
        {
            SecureString password = DecryptString(Properties.Settings.Default.password);
            string readable = ToInsecureString(password);
            txtDecrypt.AppendText(readable + Environment.NewLine);
        }
    }
}
