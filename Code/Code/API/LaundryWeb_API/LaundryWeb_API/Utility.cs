using System;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;

namespace LaundryWeb_API
{
    public class Utility
    {
        public static string EmialFrom = "";
        public static string UserName = "";
        public static string Password = "";
        public static string SMTPHost = "";
        public static string Port = "";
        public static string enableSSL = "";

        public static string EncryptPassword(string clearText)
        {
            string EncryptionKey = "MAKV2SPBNI99212";
            byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    clearText = Convert.ToBase64String(ms.ToArray());
                }
            }
            return clearText;
        }

        public static string DecryptPassword(string cipherText)
        {
            string EncryptionKey = "MAKV2SPBNI99212";
            byte[] cipherBytes = Convert.FromBase64String(cipherText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(cipherBytes, 0, cipherBytes.Length);
                        cs.Close();
                    }
                    cipherText = Encoding.Unicode.GetString(ms.ToArray());
                }
            }
            return cipherText;
        }


        public static string GetIPAddress()
        {
            string IPAddress = "";
            IPHostEntry Host = default(IPHostEntry);
            string Hostname = null;
            Hostname = System.Environment.MachineName;
            Host = Dns.GetHostEntry(Hostname);
            foreach (IPAddress IP in Host.AddressList)
            {
                if (IP.AddressFamily == System.Net.Sockets.AddressFamily.InterNetwork)
                {
                    IPAddress = Convert.ToString(IP);
                }
            }
            return IPAddress;
        }

        /// <summary>
        /// Sending mail function
        /// </summary>
        /// <param name="to">To email address</param>
        /// <param name="from">From email address</param>
        /// <param name="subject">Subject of email</param>
        /// <param name="body">Email body</param>
        /// <param name="CC">CC for email</param>
        public static string SendMail(string to, string subject, string body, string CC, Attachment attachment = null)
        {
            string response = string.Empty;
            try
            {
                System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage(EmialFrom, to, subject, body);
                mail.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = SMTPHost;
                smtp.Port = Convert.ToInt32(Port);
                smtp.UseDefaultCredentials = true;

                NetworkCredential crdntl = new NetworkCredential(EmialFrom, Password);

                smtp.Credentials = crdntl;

                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.EnableSsl = Convert.ToBoolean(enableSSL);

                smtp.Send(mail);

                //System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage(ConfigurationManager.AppSettings["EmailFrom"].ToString(), to, sub, body);
                //mail.IsBodyHtml = true;
                //mail.Priority = System.Net.Mail.MailPriority.Normal;

                //SmtpClient smtp = new SmtpClient();
                //smtp.Host = ConfigurationManager.AppSettings["smtpHost"].ToString();
                //smtp.Port = Convert.ToInt32(ConfigurationManager.AppSettings["port"].ToString());
                //smtp.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["enableSSL"]);
                //smtp.Credentials = new NetworkCredential(ConfigurationManager.AppSettings["UserName"].ToString(), ConfigurationManager.AppSettings["Password"].ToString());
                //smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                //smtp.Send(mail);
                response = "Success";
            }
            catch (Exception ex)
            {
                response = "Fail";
            }
            return response;
        }
    }
}
