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
using Core.Control;
using Core.Model;

namespace Interface_Web
{
    public partial class account : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["inTopic"] = false;

            TUser tUser = (TUser)Session["user"];
            Session["userId"] = tUser.id;
            Session["isTeacher"] = tUser.isTeacher;

            //Show AVATAR image
            if (tUser.isTeacher)
                imgAvatar.Src = "img/ico_teacher.gif";
            else
                imgAvatar.Src = "img/ico_classer.gif";
        }

        protected void btnEditProfile_Click(object sender, EventArgs e)
        {
            if (divEditProfile.Visible == true)
                divEditProfile.Visible = false;
            else
            {
                divEditProfile.Visible = true;
                TUser tUser = DbControl.getInstance().getUser(Session["userId"].ToString());
                txtName.Text = tUser.name;
                txtEmail.Text = tUser.email;
            }
        }

        protected void btnUsers_Click(object sender, EventArgs e)
        {
            if (divChangePassword.Visible == true)
                divChangePassword.Visible = false;
            else
            {
                divChangePassword.Visible = true;
                txtOldPassword.Focus();
            }
        }

        protected void btnUpdateProfile_Click(object sender, EventArgs e)
        {
            if (DbControl.getInstance().updateUser(Session["userId"].ToString(), txtName.Text, txtEmail.Text))
            {
                divEditProfile.Visible = false;
                Response.Write("<script>alert('Profile updated!');</script>");
            }
            else
                Response.Write("<script>alert('Invalid new values!');</script>");
        }

        protected void btnCancelEditProfile_Click(object sender, EventArgs e)
        {
            divEditProfile.Visible = false;
        }

        protected void btnOkChangePassword_Click(object sender, EventArgs e)
        {
            //Compare old password with the new one
            if (txtNewPassword.Text != txtNewPassword2.Text)
            {
                errorMsgChangePassword.Text = "New password fields are differents!";
                return;
            }

            //-------- Change password on database --------
            if (DbControl.getInstance().changeUserPassword(Session["userId"].ToString(), txtOldPassword.Text, txtNewPassword.Text))
            {
                divChangePassword.Visible = false;
                Response.Write("<script>alert('Password changed!');</script>");
            }
            else
                Response.Write("<script>alert('Wrong old password');</script>");
            //-----------------------------------------------
        }

        protected void btnCancelChangePassword_Click(object sender, EventArgs e)
        {
            divChangePassword.Visible = false;
        }

        protected void upUpdateYou_PreRender(object sender, EventArgs e)
        {
            divStartHere.Visible = !(divEditProfile.Visible || divChangePassword.Visible);
        }
    }
}
