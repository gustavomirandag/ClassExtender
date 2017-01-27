using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Core.Model;
using Core.Control;
using System.Net.Mail;

namespace WebInterface
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Request["__EVENTTARGET"] == null) || (Request["__EVENTTARGET"].ToString() != "lkbRecoverPassword"))
                ClientScript.RegisterHiddenField("__EVENTTARGET", btnSignIn.ClientID);
            else
                ClientScript.RegisterHiddenField("__EVENTTARGET", txtEmail.ClientID);
            DbControl.setDataBasePath(MapPath("data/db.mdb"));
        }

        protected void bntSignIn_Click(object sender, EventArgs e)
        {
            TUser tUser;
            
            //Verify if txtId is nothing
            if ((txtId.Value.Trim() == "") || (txtPassword.Value.Trim() == ""))
            {
                Response.Write("<script type='text/javascript'>alert('ID number and Password cannot be NULL!');</script>");
                return;
            }

            tUser = DbControl.getInstance().getUser(txtId.Value, txtPassword.Value);
            //Verify if ID or PASSWORD is Wrong
            if (tUser == null)
            {
                Response.Write("<script type='text/javascript'>alert('ID number or Password wrong!');</script>");
                return;
            }
            else
            {
                Session["user"] = tUser;
                if (tUser.id == "admin")
                    Response.Redirect("admin.aspx");
                else
                    Response.Redirect("home.aspx");
            }
        }

        protected void btnRecoverPassword_Click(object sender, EventArgs e)
        {
            sendMailIdPassword(txtEmail.Value);
            div_form_recover_login_password.Visible = false;
        }

        protected void btnCancelRecoverPassword_Click(object sender, EventArgs e)
        {
            div_form_recover_login_password.Visible = false;
        }

        protected void lkbRecoverPassword_Click(object sender, EventArgs e)
        {
            div_form_recover_login_password.Visible = true;
            txtEmail.Focus();
        }

        private void sendMailIdPassword(string mailAddress)
        {
            //###### Cria Email ######
            //System.Net.Mail
            MailMessage email = new MailMessage();

            //Atribui codificação para o BODY e o ASSUNTO
            //email.SubjectEncoding = System.Text.Encoding.GetEncoding("ISO-8859-1");
            email.BodyEncoding = System.Text.Encoding.GetEncoding("ISO-8859-1");

            TUser tUser = DbControl.getInstance().getUserByEmail(mailAddress);

            if (tUser == null)
            {
                Response.Write("<script type='text/javascript'>alert('Mail address not registered!');</script>");
                return;
            }
                
            string emailRecipient = tUser.email;

            //Atribui email real
            email.To.Add(new MailAddress(emailRecipient));

            //Atribui remetente
            email.From = new MailAddress("classextender@gmail.com", "ClassX");
            //Atribui assunto
            email.Subject = "ClassX - Recover of ID and PASSWORD";

            //Tipo de Corpo do Email
            email.IsBodyHtml = true;

            email.Body = "<font face='arial' size='2'>";
            email.Body += "<b>CLASS EXTENDER - Recover of ID and PASSWORD</b><br><br>";
            email.Body += "Hy " + tUser.name + ", this is an automatic message, don't answer please!<br>";
            email.Body += "Someone (probably you) requested to recover your ID and PASSWORD<br>";
            email.Body += " for Class Extender (http://ideias.inf.puc-rio.br/classx).<br>";
            email.Body += " <b>ID: </b>" + tUser.id + "<br>";
            email.Body += " <b>PASSWORD: </b>" + DbControl.getInstance().getUserPassword(tUser.id).ToString() + "<br><br>";
            email.Body += "If someone else made this request, ignore this message.";
            
            //###### Send Mail ######
            //try
            //{
                //=========== Send Mail =============
                System.Net.Mail.SmtpClient smtpClient = new System.Net.Mail.SmtpClient();
                smtpClient.Host = "smtp.gmail.com";
                System.Net.NetworkCredential smtpUserInfo = new System.Net.NetworkCredential("classextender@gmail.com", "flashclassx");
                smtpClient.Credentials = smtpUserInfo;
                smtpClient.EnableSsl = true;
                smtpClient.Send(email);
                Response.Write("<script type='text/javascript'>alert('Your ID and PASSWORD has been sent to your email account!');</script>");
                //=======================================
            //}
            /*catch
            {
                Response.Write("<script type='text/javascript'>alert('Error trying to send your recovery email!');</script>");
                return;
            }*/
            //###########################
        }
    }
}
