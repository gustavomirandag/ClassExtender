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

namespace Interface_Web
{
    public partial class admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["inTopic"] = false;
        }

        protected void btnUsers_Click(object sender, EventArgs e)
        {
            if (divUsers.Visible)
                divUsers.Visible = false;
            else
            {
                divUsers.Visible = true;
                dvCreateUser.Visible = false;
            }
        }

        protected void btnCancelUser_Click(object sender, EventArgs e)
        {
            divUsers.Visible = false;
            btnCreateUser.Enabled = true;
        }

        //Session["selectedUser"] = gvUsers.SelectedRow.Cells[1].Text;

        protected void btnCreateUser_Click(object sender, EventArgs e)
        {
            dvCreateUser.ChangeMode(DetailsViewMode.Insert);
            dvCreateUser.Visible = true;
            btnCreateUser.Enabled = false;
        }

        protected void dvCreateUser_ModeChanging(object sender, DetailsViewModeEventArgs e)
        {
            if (e.NewMode == DetailsViewMode.ReadOnly)
            {
                dvCreateUser.Visible = false;
                btnCreateUser.Enabled = true;
            }
        }

        protected void btnCreateCourse_Click(object sender, EventArgs e)
        {
            dvCreateCourse.ChangeMode(DetailsViewMode.Insert);
            dvCreateCourse.Visible = true;
            btnCreateCourse.Enabled = false;
        }

        protected void btnCancelCourse_Click(object sender, EventArgs e)
        {
            divCourses.Visible = false;
            btnCreateCourse.Enabled = true;
        }

        protected void btnCourses_Click(object sender, EventArgs e)
        {
            if (divCourses.Visible)
                divCourses.Visible = false;
            else
            {
                divCourses.Visible = true;
                dvCreateCourse.Visible = false;
            }
        }

        protected void dvCreateCourse_ModeChanging(object sender, DetailsViewModeEventArgs e)
        {
            if (e.NewMode == DetailsViewMode.ReadOnly)
            {
                dvCreateCourse.Visible = false;
                btnCreateCourse.Enabled = true;
            }
        }

        protected void btnUserCourse_Click(object sender, EventArgs e)
        {
            if (divUserCourse.Visible)
                divUserCourse.Visible = false;
            else
            {
                divUserCourse.Visible = true;
                dvCreateUserCourse.Visible = false;
            }
        }

        protected void btnCancelUserCourse_Click(object sender, EventArgs e)
        {
            divUserCourse.Visible = false;
            btnCreateUserCourse.Enabled = true;
        }

        protected void btnCreateUserCourse_Click(object sender, EventArgs e)
        {
            dvCreateUserCourse.ChangeMode(DetailsViewMode.Insert);
            dvCreateUserCourse.Visible = true;
            btnCreateUserCourse.Enabled = false;
        }

        protected void dvCreateUserCourse_ModeChanging(object sender, DetailsViewModeEventArgs e)
        {
            if (e.NewMode == DetailsViewMode.ReadOnly)
            {
                dvCreateUserCourse.Visible = false;
                btnCreateUserCourse.Enabled = true;
            }
        }

        protected void upGeral_PreRender(object sender, EventArgs e)
        {
            divStartHere.Visible = !(divUsers.Visible || divCourses.Visible || divUserCourse.Visible);
        }

    }
}
