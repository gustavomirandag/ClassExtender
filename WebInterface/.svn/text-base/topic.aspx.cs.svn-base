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
            ClientScript.GetPostBackEventReference(this, "");

            Session["inTopic"] = true;

            TUser tUser = (TUser)Session["user"];

            //User not logged or SESSION EXPIRED
            if (tUser == null)
                Response.Redirect("login.aspx");

            Session["userId"] = tUser.id;
            Session["topicId"] = tUser.topic.id;
            Session["isTeacher"] = tUser.isTeacher;

            contentTitle.InnerText = "Content of " + tUser.topic.title;
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

        protected void messageModeChanged(object sender, EventArgs e)
        {
            if (((FormView)sender).CurrentMode == FormViewMode.ReadOnly)
            {
                Session.Remove("editingMessage");
            }
        }

        protected void messageModeChanging(object sender, FormViewModeEventArgs e)
        {
            if (e.NewMode != FormViewMode.ReadOnly)
            {
                Session["editingMessage"] = true;
            }
        }

        public bool isTeacher(String user_id)
        {
            return DbControl.getInstance().getUser(user_id).isTeacher;
        }

        protected void messageItemDeleted(object sender, EventArgs e)
        {
            notifyUpdate();
        }

        protected void messageItemCreated(object sender, EventArgs e)
        {
            FormView formView = (FormView)sender;

            DropDownList ddlRecipient = (DropDownList)formView.FindControl("ddlRecipient");

            if ((ddlRecipient != null) && (ddlRecipient.Items.Count<=0) && (formView.CurrentMode != FormViewMode.ReadOnly))
            {
                //======== Add USERS to RECIPIENT DROPDOWNBOX ========
                ddlRecipient.Items.Clear();

                int topicId = Convert.ToInt32(Session["topicId"]);
                TUser tUser = (TUser)Session["user"];
                List<TUser> listTUser = new List<TUser>();
                ListItem listItem;
                TUser tUserAux;

                //Get lists
                List<TUser> listTeachersInTopic = DbControl.getInstance().getUsersInTopic(topicId, true);
                List<TUser> listStudentsInTopic = DbControl.getInstance().getUsersInTopic(topicId, false);

                //Add EVERYBODY
                listItem = new ListItem("Everybody", "Everybody");
                ddlRecipient.Items.Add(listItem);

                //Add TEACHERS and MySelf (Annotation) - if isTeacher
                listItem = new ListItem("---- TEACHERS ----", "Teachers");
                ddlRecipient.Items.Add(listItem);
                if (tUser.isTeacher)
                {
                    //Add MySelf (Annotation)
                    listItem = new ListItem("Myself (Annotation)", Session["userId"].ToString());
                    ddlRecipient.Items.Add(listItem);
                }

                //Add users that are TEACHERS and are in topic
                listTUser = listTeachersInTopic;
                for (int count = 0; count < listTUser.Count; count++)
                {
                    tUserAux = listTUser[count];
                    if (tUserAux.id == Session["userId"].ToString())
                        continue;
                    listItem = new ListItem(tUserAux.id + " - " + tUserAux.name, tUserAux.id);
                    ddlRecipient.Items.Add(listItem);
                }
                
                //Add users that are TEACHERS and are OFF-LINE
                listTUser = DbControl.getInstance().getUsersCourse(tUser.topic.tCourse.id, true);
                for (int count = 0; count < listTUser.Count; count++)
                {
                    tUserAux = listTUser[count];
                    if (tUserAux.id == Session["userId"].ToString())
                        continue;
                    if (tUserAux.isTeacher)
                    {
                        //Check if the teacher is on-line
                        bool teacherIsOnline = false;
                        for (int countChecker = 0; countChecker < listTeachersInTopic.Count; countChecker++)
                        {
                            if (tUserAux.id == ((TUser)listTeachersInTopic[countChecker]).id)
                            {
                                teacherIsOnline = true;
                                break;
                            }
                        }
                        if (teacherIsOnline)
                            break;
                        //-------------------------------

                        //Add off-line teacher
                        listItem = new ListItem(tUserAux.id + " - " + tUserAux.name + " (off-line)", tUserAux.id);
                        ddlRecipient.Items.Add(listItem);
                    }
                }

                //Add STUDENTS and MySelf (Annotation) - if NOT isTeacher
                listItem = new ListItem("---- STUDENTS ----", "Students");
                ddlRecipient.Items.Add(listItem);
                if (!tUser.isTeacher)
                {
                    //Add MySelf (Annotation)
                    listItem = new ListItem("Myself (Annotation)", Session["userId"].ToString());
                    ddlRecipient.Items.Add(listItem);
                }

                //Add users that are STUDENTS and are in topic
                listTUser = listStudentsInTopic;
                for (int count = 0; count < listTUser.Count; count++)
                {
                    tUserAux = listTUser[count];
                    if (tUserAux.id == Session["userId"].ToString())
                        continue;
                    listItem = new ListItem(tUserAux.id + " - " + tUserAux.name, tUserAux.id);
                    ddlRecipient.Items.Add(listItem);
                }

                //Add users that are STUDENTS and are OFF-LINE
                listTUser = DbControl.getInstance().getUsersCourse(tUser.topic.tCourse.id, true);
                for (int count = 0; count < listTUser.Count; count++)
                {
                    tUserAux = listTUser[count];
                    if (tUserAux.id == Session["userId"].ToString())
                        continue;
                    if (!tUserAux.isTeacher)
                    {
                        //Check if the student is on-line
                        bool studentIsOnline = false;
                        for (int countChecker = 0; countChecker < listStudentsInTopic.Count; countChecker++)
                        {
                            if (tUserAux.id == ((TUser)listStudentsInTopic[countChecker]).id)
                            {
                                studentIsOnline = true;
                                break;
                            }
                        }
                        if (studentIsOnline)
                            continue;
                        //-------------------------------

                        //Add off-line student
                        listItem = new ListItem(tUserAux.id + " - " + tUserAux.name + " (off-line)", tUserAux.id);
                        ddlRecipient.Items.Add(listItem);
                    }
                }

                //=====================================================
            }
            else
            {
                Label lbRecipient = (Label)formView.FindControl("lbRecipient");
                Label lbSender = (Label)formView.FindControl("lbSender");

                if ((formView.DataItem != null) && (formView.DataItemCount > 0) && (lbRecipient != null) && (lbSender != null))
                {
                    //Show ID and Name in SENDER
                    String strSender = Convert.ToString(DataBinder.Eval(formView.DataItem, "sender"));
                    //From me
                    if (strSender == Session["userId"].ToString())
                        lbSender.Text = "Me - " + DbControl.getInstance().getUser(strSender).name;
                    else 
                        // From another user
                        lbSender.Text = DbControl.getInstance().getUser(strSender).ToString();

                    //Show ID and Name in RECIPIENT
                    String strRecipient = Convert.ToString(DataBinder.Eval(formView.DataItem, "recipient"));
                    switch (strRecipient)
                    {
                        case "Everybody":
                            lbRecipient.Text = "Everybody";
                            break;
                        case "Teachers":
                            lbRecipient.Text = "Teachers";
                            break;
                        case "Students":
                            lbRecipient.Text = "Students";
                            break;
                        default:
                            //By me
                            if (strSender == Session["userId"].ToString())
                            {
                                //To me
                                if (strRecipient == Session["userId"].ToString())
                                {
                                    lbRecipient.Text = "Myself (Annotation)";
                                    break;
                                }
                            }
                            
                            //To me
                            if (strRecipient == Session["userId"].ToString())
                                lbRecipient.Text = "For me! - " + DbControl.getInstance().getUser(strRecipient).name;
                            else
                                //Other cases
                                lbRecipient.Text = DbControl.getInstance().getUser(strRecipient).ToString();
                            break;
                    }//switch
                }
            }
            
        }

        void updateMsgs()
        {
            upMessages.DataBind();
            upMessages.Update();
            upStudents.DataBind();
            upStudents.Update();
            upTeachers.DataBind();
            upTeachers.Update();
        }

        protected void btnUpdateMsgs_Click(object sender, EventArgs e)
        {
            updateMsgs();
        }

        protected void fvInsertMessage_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            updateMsgs();
            notifyUpdate();
        }

        //Notify other clients that they need to UPDATE
        void notifyUpdate()
        {
            int topicId = Convert.ToInt32(Session["topicId"]);
            Application["updateAvaiable_" + topicId.ToString()] = Convert.ToInt32(Application["updateAvaiable_" + topicId.ToString()]) + 1; //Notify everybody that i have changed something
            Session["updateAvaiable"] = Convert.ToInt32(Convert.ToInt32(Application["updateAvaiable_" + topicId.ToString()])); //But i don't need this
        }

        protected void fvMessage_ItemDeleting(object sender, FormViewDeleteEventArgs e)
        {
            //Check if is Teacher
            if (!Convert.ToBoolean(Session["isTeacher"]))
            {
                //Ask on ASPX if really want to delete warning that it will be avaiable for the TEACHER
                //Check as deleted on database
                string message_id = e.Keys[0].ToString();
                DbControl.getInstance().setMessageDeletedByStudent(message_id);
                e.Cancel = true;//CANCEL DELETE permanently operation
                updateMsgs(); //Update Messages
                notifyUpdate();//Notify Update
            }
            //ELSE Delete permanently.
                
        }

        /*void publishRss()
        {
            DataSet dataSetMessages = dbDataSourceMessages.Select();

            RssChannel channel = new RssChannel();
            //Fill Channel
            foreach (ExampleData.NewsRow row in exampleData.News.Rows)
            {
                RssItem item = new RssItem();

                item.Title = row.news_title;
                item.Description = row.news_description;
                item.PubDate = row.news_date.ToUniversalTime();

                channel.Items.Add(item);
            }

            //Set Channel
            channel.Title = "My channel's title";
            channel.Description = "My channel's description";
            channel.LastBuildDate = channel.Items.LatestPubDate;

            //OutputTheFeed
            RssFeed feed = new RssFeed();
            feed.Channels.Add(channel);
            Response.ContentType = "text/xml";
            feed.Write(Response.OutputStream);
            Response.End();
        }*/
    }
}
