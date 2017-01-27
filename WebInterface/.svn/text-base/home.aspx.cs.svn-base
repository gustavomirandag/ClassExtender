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
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["inTopic"] = false;

            if (!Page.IsPostBack)
            {
                TUser tUser = (TUser)Session["user"];
                Session["userId"] = tUser.id;
                Session["topicId"] = null;
                Session["isTeacher"] = tUser.isTeacher;

                List<TCourse> listTCourse;
                ListItem listItem;
                TCourse tCourseAux;

                if (tUser.isTeacher)
                {
                    btnActiveTopic.Visible = true;
                    btnCreateTopic.Visible = true;
                }
                else
                {
                    btnCreateTopic.Visible = false;
                    btnActiveTopic.Visible = false;
                }
                addContentToLbStartedTopics(tUser.id);

                listTCourse = DbControl.getInstance().getCourses(tUser.id, true);
                Session["currentCourses"] = listTCourse;
                lbCurrentCourses.Items.Clear();
                for (int count = 0; count < listTCourse.Count; count++)
                {
                    tCourseAux = listTCourse[count];
                    listItem = new ListItem(tCourseAux.ToString(), tCourseAux.id);
                    lbCurrentCourses.Items.Add(listItem);
                }

                listTCourse = Core.Control.DbControl.getInstance().getCourses(tUser.id, false);
                lbPastCourses.Items.Clear();
                for (int count = 0; count < listTCourse.Count; count++)
                {
                    tCourseAux = listTCourse[count];
                    listItem = new ListItem(tCourseAux.ToString(), tCourseAux.id);
                    lbPastCourses.Items.Add(listItem);
                }
                Session["pastCourses"] = listTCourse;
            }
        }

        protected void addContentToLbStartedTopics(string user_id)
        {            
            List<TTopic> listTTopic;
            ListItem listItem;
            TTopic tTopicAux;

            listTTopic = DbControl.getInstance().getStartedTopics(user_id);
            Session["startedTopics"] = listTTopic;
            lbStartedTopics.Items.Clear();
            for (int count=0; count < listTTopic.Count; count++)
            {
                tTopicAux = listTTopic[count];
                listItem = new ListItem(tTopicAux.ToString() + " <-- started at " + tTopicAux.startDateTime.ToString(), tTopicAux.id.ToString());
                lbStartedTopics.Items.Add(listItem);
            }
        }

        protected void btnCreateTopic_Click(object sender, EventArgs e)
        {
            if (lbCurrentCourses.SelectedIndex >= 0)
            {
                lbCurrentCourses.Enabled = false;
                divStartTopic.Visible = true;
                tbTopicTitle.Focus();
            }
            else
            {
                Response.Write("<script>alert('Please, select a course!');</script>");
            }
        }

        protected void btnEnterStartedTopic_Click(object sender, EventArgs e)
        {
            if (lbStartedTopics.SelectedIndex >= 0)
            {
                List<TTopic> listTTopic = (List<TTopic>)Session["startedTopics"];
                TTopic tTopic = null;
                int tTopicId = Convert.ToInt32(lbStartedTopics.SelectedValue);

                for (int count = 0; count < listTTopic.Count; count++)
                {
                    tTopic = listTTopic[count];
                    if (tTopic.id == tTopicId)
                        break;
                }

                TUser tUser = (TUser)Session["user"];
                //Insert in DATABASE
                DbControl.getInstance().enterTopic(tUser, tTopic);
                Application["updateAvaiable_" + tTopic.id.ToString()] = Convert.ToInt32(Application["updateAvaiable_" + tTopic.id.ToString()]) + 1; //Notify everybody that a new user entered
                Session["updateAvaiable"] = Convert.ToInt32(Application["updateAvaiable_" + tTopic.id.ToString()]);
                Response.Redirect("topic.aspx");
            }
            else
            {
                Response.Write("<script>alert('Please, select a topic to enter!');</script>");
            }
        }

        protected void messageModeChanged(object sender, EventArgs e)
        {
            //Atualiza dados
        }

        protected void messageModeChanging(object sender, FormViewModeEventArgs e)
        {
            //Atualiza dados
        }

        protected void messageItemCreated(object sender, EventArgs e)
        {
            FormView formView = (FormView)sender;

            DropDownList ddlRecipient = (DropDownList)formView.FindControl("ddlRecipient");

            if ((ddlRecipient != null) && (ddlRecipient.Items.Count <= 0) && (formView.CurrentMode != FormViewMode.ReadOnly))
            {
                //Add USERS to RECIPIENT DROPDOWNBOX

                ddlRecipient.Items.Clear();

                int topicId = Convert.ToInt32(Session["topicId"]);
                List<TUser> listTUser = new List<TUser>();
                ListItem listItem;
                TUser tUserAux;

                //Add EVERYBODY
                listItem = new ListItem("Everybody", "Everybody");
                ddlRecipient.Items.Add(listItem);

                //Add MySelf (Annotation)
                listItem = new ListItem("Myself (Annotation)", Session["userId"].ToString());
                ddlRecipient.Items.Add(listItem);


                //Add Users of my CURRENT CLASSES
                List<TCourse> listTCourse = (List<TCourse>) Session["currentCourses"];
                TCourse tCourseAux;
                Boolean userExistInList = false;
                for (int count = 0; count < listTCourse.Count; count++)
                {
                    tCourseAux = listTCourse[count];
                    listTUser = DbControl.getInstance().getUsersCourse(tCourseAux.id, true);
                    for (int count2 = 0; count2 < listTUser.Count; count2++)
                    {
                        tUserAux = listTUser[count2];
                        userExistInList = false;
                        //Verify if the USER is already in the List (including me)
                        for (int count3 = 0; count3 < ddlRecipient.Items.Count; count3++)
                        {
                            if (tUserAux.id == ddlRecipient.Items[count3].Value)
                            {
                                userExistInList = true;
                                break;
                            }
                        }
                        if (!userExistInList)
                        {
                            listItem = new ListItem(tUserAux.ToString(), tUserAux.id);
                            ddlRecipient.Items.Add(listItem);
                        }
                    }
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

        protected void btnStartAndEnterTopic_Click(object sender, EventArgs e)
        {
            List<TCourse> listTCourse = (List<TCourse>)Session["currentCourses"];
            TCourse tCourse = null;
            string tCourseId = lbCurrentCourses.SelectedValue;

            for (int count = 0; count < listTCourse.Count; count++)
            {
                tCourse = listTCourse[count];
                if (tCourse.id == tCourseId)
                    break;
            }

            TUser tUser = (TUser)Session["user"];
            //Insert in DATABASE
            TTopic tTopic = DbControl.getInstance().createTopic(tUser, tCourse, tbTopicTitle.Text);
            Application["updateAvaiable_" + tTopic.id.ToString()] = 0;
            Session["updateAvaiable"] = 0;
            DbControl.getInstance().enterTopic(tUser, tTopic);
            Response.Redirect("topic.aspx");
        }

        protected void btnJustStartTopic_Click(object sender, EventArgs e)
        {
            List<TCourse> listTCourse = (List<TCourse>)Session["currentCourses"];
            TCourse tCourse = null;
            string tCourseId = lbCurrentCourses.SelectedValue;

            for (int count = 0; count < listTCourse.Count; count++)
            {
                tCourse = listTCourse[count];
                if (tCourse.id == tCourseId)
                    break;
            }

            TUser tUser = (TUser)Session["user"];
            //Insert in DATABASE
            TTopic tTopic = DbControl.getInstance().createTopic(tUser, tCourse, tbTopicTitle.Text);
            addContentToLbStartedTopics(tUser.id);
            btnCancelTopic_Click(sender, e);
        }

        protected void btnCancelTopic_Click(object sender, EventArgs e)
        {
            tbTopicTitle.Text = "";
            lbCurrentCourses.Enabled = true;
            divStartTopic.Visible = false;
        }

        protected void lbSelectedIndexChanged(object sender, EventArgs e)
        {
            ListBox lbCourses = ((ListBox)sender);

            if (lbCourses.ID == "lbPastCourses")
                lbCurrentCourses.SelectedIndex = -1;
            else
                lbPastCourses.SelectedIndex = -1;
            String selectedCourse = lbCourses.SelectedValue;
            divArchivedTopics.Visible = true;
            h4ArchivedTopics.InnerText = "Archived Topics of " + selectedCourse;

            addContentToLbArchivedTopics(selectedCourse);
        }

        protected void addContentToLbArchivedTopics(string courseId)
        {
            List<TTopic> listTTopic;
            ListItem listItem;
            TTopic tTopicAux;

            listTTopic = DbControl.getInstance().getArchivedTopics(courseId);
            Session["archivedTopics"] = listTTopic;
            lbArchivedTopics.Items.Clear();
            for (int count = 0; count < listTTopic.Count; count++)
            {
                tTopicAux = listTTopic[count];
                listItem = new ListItem(tTopicAux.ToString() + " <-- finished at " + tTopicAux.finishDateTime.ToString(), tTopicAux.id.ToString());
                lbArchivedTopics.Items.Add(listItem);
            }
            Session["lastCourseListArchived"] = courseId;
        }

        protected void btnEnterArchivedTopic_Click(object sender, EventArgs e)
        {
            if (lbArchivedTopics.SelectedIndex >= 0)
            {
                List<TTopic> listTTopic = (List<TTopic>)Session["ArchivedTopics"];
                TTopic tTopic = null;
                int tTopicId = Convert.ToInt32(lbArchivedTopics.SelectedValue);

                for (int count = 0; count < listTTopic.Count; count++)
                {
                    tTopic = listTTopic[count];
                    if (tTopic.id == tTopicId)
                        break;
                }

                TUser tUser = (TUser)Session["user"];
                //Insert in DATABASE
                DbControl.getInstance().enterTopic(tUser, tTopic);
                Application["updateAvaiable_" + tTopic.id.ToString()] = Convert.ToInt32(Application["updateAvaiable_" + tTopic.id.ToString()]) + 1; //Notify everybody that a new user entered
                Session["updateAvaiable"] = Convert.ToInt32(Application["updateAvaiable_" + tTopic.id.ToString()]);
                Response.Redirect("topic.aspx");
            }
            else
            {
                Response.Write("<script>alert('Please, select a topic to enter!');</script>");
            }
        }

        protected void btnActiveTopic_Click(object sender, EventArgs e)
        {
            TUser tUser = (TUser)Session["user"];
            int topicId = Convert.ToInt32(lbArchivedTopics.SelectedValue);

            DbControl.getInstance().activeTopic(topicId);
            addContentToLbStartedTopics(tUser.id);
            addContentToLbArchivedTopics(Session["lastCourseListArchived"].ToString());
        }

        protected void reorderList_contentItemCreated(object sender, AjaxControlToolkit.ReorderListItemEventArgs e)
        {
            //NOT WORKING
            //IT DON'T FIND THE CONTROL "ddlPrivacy"
            /*
            AjaxControlToolkit.ReorderList reorderList = (AjaxControlToolkit.ReorderList)sender;

            DropDownList ddlPrivacy = (DropDownList)reorderList.FindControl("ddlPrivacy");

            if ((ddlPrivacy != null) && (ddlPrivacy.Items.Count <= 0))
            {
                //Add USERS to RECIPIENT DROPDOWNBOX

                ddlPrivacy.Items.Clear();

                int topicId = Convert.ToInt32(Session["topicId"]);
                List<TUser> listTUser = new List<TUser>();
                ListItem listItem;
                TUser tUserAux;

                //Add EVERYBODY
                listItem = new ListItem("Everybody", "Everybody");
                ddlPrivacy.Items.Add(listItem);

                //Add MySelf (Annotation)
                listItem = new ListItem("Myself (Annotation)", Session["userId"].ToString());
                ddlPrivacy.Items.Add(listItem);


                //Add Users of my CURRENT CLASSES
                List<TCourse> listTCourse = (List<TCourse>)Session["currentCourses"];
                TCourse tCourseAux;
                Boolean userExistInList = false;
                for (int count = 0; count < listTCourse.Count; count++)
                {
                    tCourseAux = listTCourse[count];
                    listTUser = DbControl.getInstance().getUsersCourse(tCourseAux.id, true);
                    for (int count2 = 0; count2 < listTUser.Count; count2++)
                    {
                        tUserAux = listTUser[count2];
                        userExistInList = false;
                        //Verify if the USER is already in the List (including me)
                        for (int count3 = 0; count3 < ddlPrivacy.Items.Count; count3++)
                        {
                            if (tUserAux.id == ddlPrivacy.Items[count3].Value)
                            {
                                userExistInList = true;
                                break;
                            }
                        }
                        if (!userExistInList)
                        {
                            listItem = new ListItem(tUserAux.ToString(), tUserAux.id);
                            ddlPrivacy.Items.Add(listItem);
                        }
                    }
                }
                //----------------------------------
            }
            */
        }

        protected void formView_contentItemCreated(object sender, EventArgs e)
        {
            //NOT USED ANYMORE
            //BECAUSE "reorderList_contentItemCreated" DIDN'T WORKED, SO "ddlPrivacy" have a STATIC LIST
            /*
            FormView formView = (FormView)sender;

            DropDownList ddlPrivacy = (DropDownList)formView.FindControl("ddlPrivacy");

            if ((ddlPrivacy != null) && (ddlPrivacy.Items.Count <= 0))
            {
                //Add USERS to RECIPIENT DROPDOWNBOX

                ddlPrivacy.Items.Clear();

                int topicId = Convert.ToInt32(Session["topicId"]);
                List<TUser> listTUser = new List<TUser>();
                ListItem listItem;
                TUser tUserAux;

                //Add EVERYBODY
                listItem = new ListItem("Everybody", "Everybody");
                ddlPrivacy.Items.Add(listItem);

                //Add MySelf (Annotation)
                listItem = new ListItem("Myself (Annotation)", Session["userId"].ToString());
                ddlPrivacy.Items.Add(listItem);


                //Add Users of my CURRENT CLASSES
                List<TCourse> listTCourse = (List<TCourse>)Session["currentCourses"];
                TCourse tCourseAux;
                Boolean userExistInList = false;
                for (int count = 0; count < listTCourse.Count; count++)
                {
                    tCourseAux = listTCourse[count];
                    listTUser = DbControl.getInstance().getUsersCourse(tCourseAux.id, true);
                    for (int count2 = 0; count2 < listTUser.Count; count2++)
                    {
                        tUserAux = listTUser[count2];
                        userExistInList = false;
                        //Verify if the USER is already in the List (including me)
                        for (int count3 = 0; count3 < ddlPrivacy.Items.Count; count3++)
                        {
                            if (tUserAux.id == ddlPrivacy.Items[count3].Value)
                            {
                                userExistInList = true;
                                break;
                            }
                        }
                        if (!userExistInList)
                        {
                            listItem = new ListItem(tUserAux.ToString(), tUserAux.id);
                            ddlPrivacy.Items.Add(listItem);
                        }
                    }
                }
                //----------------------------------
            }
            */

        }

        protected void fvInsertMessage_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            updateMessages();
        }

        void updateMessages()
        {
            upMessages.DataBind();
            upMessages.Update();
        }

        protected void dbDataSourceContentItems_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            e.Command.Connection.Close();
            DbControl.getInstance().setPositionOfNewContentItem("A");
        }

        protected void reorderListContentItems_ItemReorder(object sender, AjaxControlToolkit.ReorderListItemReorderEventArgs e)
        {
            DbControl.getInstance().changePositionOfContentItems(e.OldIndex, e.NewIndex, Session["userId"].ToString());
        }
    }
}
