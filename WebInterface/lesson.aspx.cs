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
using System.Collections.Generic;
using Core.Control;
using Core.Model;

namespace WebInterface
{
    public partial class _class : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TUser tUser = (TUser)Session["user"];

            Session["userId"] = tUser.id;
            Session["lessonId"] = tUser.lesson.id;
            Session["isTeacher"] = tUser.isTeacher;

            contentTitle.InnerText = "Content of " + tUser.lesson.title;
            //Response.Write("<script>window.scroll(0, 4000);return false;</script>");
        }

        protected void lbTeachers_SelectedIndexChanged(object sender, EventArgs e)
        {
            lbTeachers.ToolTip = "Selected user: " + lbTeachers.SelectedValue + " - " + lbTeachers.SelectedItem.Text;
        }

        protected void lbStudents_SelectedIndexChanged(object sender, EventArgs e)
        {
            lbStudents.ToolTip = "Selected user: " + lbStudents.SelectedValue + " - " + lbStudents.SelectedItem.Text;
        }

        protected void timeToUpdate_Tick(object sender, EventArgs e)
        {
            int lessonId = Convert.ToInt32(Session["lessonId"]);

            if ((Convert.ToInt32(Session["updateAvaiable"]) != Convert.ToInt32(Application["updateAvaiable_" + lessonId.ToString()])) && (Session["editingMessage"] == null))
            {
                Session["updateAvaiable"] = Convert.ToInt32(Convert.ToInt32(Application["updateAvaiable_" + lessonId.ToString()]));

                upMessages.DataBind();
                upMessages.Update();
                upStudents.DataBind();
                upStudents.Update();
                upTeachers.DataBind();
                upTeachers.Update();
            }
        }

        protected void messageModeChanged(object sender, EventArgs e)
        {
            if (((FormView)sender).CurrentMode == FormViewMode.ReadOnly)
            {
                int lessonId = Convert.ToInt32(Session["lessonId"]);
                Session.Remove("editingMessage");
                Application["updateAvaiable_" + lessonId.ToString()] = Convert.ToInt32(Application["updateAvaiable_" + lessonId.ToString()]) + 1; //Notify everybody that i have sent a message
                Session["updateAvaiable"] = Convert.ToInt32(Convert.ToInt32(Application["updateAvaiable_" + lessonId.ToString()])); //But i don't need this
                timeToUpdate.Enabled = true;
            }
        }

        protected void messageModeChanging(object sender, FormViewModeEventArgs e)
        {
            if (e.NewMode != FormViewMode.ReadOnly)
            {
                timeToUpdate.Enabled = false;
                Session["editingMessage"] = true;
            }
        }

        protected void messageItemCreated(object sender, EventArgs e)
        {
            FormView formView = (FormView)sender;

            DropDownList ddlRecipient = (DropDownList)formView.FindControl("ddlRecipient");

            if ((ddlRecipient != null) && (ddlRecipient.Items.Count<=0) && (formView.CurrentMode != FormViewMode.ReadOnly))
            {
                //Add USERS to RECIPIENT DROPDOWNBOX
                
                ddlRecipient.Items.Clear();

                int lessonId = Convert.ToInt32(Session["lessonId"]);
                List<TUser> listTUser = new List<TUser>();
                ListItem listItem;
                TUser tUserAux;

                //Add EVERYBODY
                listItem = new ListItem("Everybody", "Everybody");
                ddlRecipient.Items.Add(listItem);

                //Add MySelf (Annotation)
                listItem = new ListItem("Myself (Annotation)", Session["userId"].ToString());
                ddlRecipient.Items.Add(listItem);

                //Add users that are TEACHERS
                listTUser = DbControl.getInstance().getUsersInLesson(lessonId, true);
                for (int count = 0; count < listTUser.Count; count++)
                {
                    tUserAux = listTUser[count];
                    if (tUserAux.id == Session["userId"].ToString())
                        continue;
                    listItem = new ListItem(tUserAux.id + " - " + tUserAux.name, tUserAux.id);
                    ddlRecipient.Items.Add(listItem);
                }

                //Add users that are STUDENTS
                listTUser = DbControl.getInstance().getUsersInLesson(lessonId, false);
                for (int count = 0; count < listTUser.Count; count++)
                {
                    tUserAux = listTUser[count];
                    if (tUserAux.id == Session["userId"].ToString())
                        continue;
                    listItem = new ListItem(tUserAux.id + " - " + tUserAux.name, tUserAux.id);
                    ddlRecipient.Items.Add(listItem);
                }
                //----------------------------------
            }
            else
            {
                Label lbRecipient = (Label)formView.FindControl("lbRecipient");
                Label lbSender = (Label)formView.FindControl("lbSender");

                if ((formView.DataItem != null) && (formView.DataItemCount > 0) && (lbRecipient != null) && (lbSender != null))
                {
                    //Show ID and Name in SENDER
                    String strSender = Convert.ToString(DataBinder.Eval(formView.DataItem, "sender"));
                    lbSender.Text = DbControl.getInstance().getUser(strSender).ToString();

                    //Show ID and Name in RECIPIENT
                    String strRecipient = Convert.ToString(DataBinder.Eval(formView.DataItem, "recipient"));
                    if (strRecipient == "Everybody")
                        lbRecipient.Text = "Everybody";
                    else
                    {
                        if (strRecipient == Session["userId"].ToString())
                        {
                            if (strSender == Session["userId"].ToString())
                                lbRecipient.Text = "Myself (Annotation)";
                            else
                                lbRecipient.Text = "For me!";
                        }
                        else
                            lbRecipient.Text = DbControl.getInstance().getUser(strRecipient).ToString();
                    }
                }
            }
            
        }
    }
}
