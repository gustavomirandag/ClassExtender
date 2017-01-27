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

namespace WebInterface
{
    public partial class top : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TUser tUser = (TUser)Session["user"];

            //User not logged or SESSION EXPIRED
            if (tUser == null)
                Response.Redirect("login.aspx");
            //MOSTRAR MENSAGEM DE NÃO LOGADO OU SESSÃO EXPIRADA

            if (!Page.IsPostBack)
            {
                strongName.InnerText = tUser.name;
                strongId.InnerText = tUser.id;

                TTopic tTopic = tUser.topic;
                //Verify that the USER is NOT in Course
                if (Session["inTopic"] == null || Convert.ToBoolean(Session["inTopic"]) == false)
                {
                    content_top.Visible = false;
                    aux_menu.Visible = false;
                }
                else
                {
                    content_top.Visible = true;
                    aux_menu.Visible = true;
                    /* FINISH TOPIC INSIDE A TOPIC IS NO MORE POSSIBLE
                    if (tUser.isTeacher)
                        liFinishTopic.Visible = true;
                    else
                        liFinishTopic.Visible = false;
                     */
                    liFinishTopic.Visible = false;//For how long?
                    spanCourse.InnerText = tTopic.tCourse.id + " (" + tTopic.tCourse.groupId + ") - " + tTopic.title;
                    spanStartTime.InnerText = "Started at " + tTopic.startDateTime.ToString();
                    
                    //ForecastEnd - SUSPENDED FOR A WHILE
                    spanForecastEnd.Visible = false;
                    //strongForecastEnd.InnerText = ((tTopic.startDateTime.AddHours(2)).ToString());

                    //Responsable Teacher - SUSPENDED FOR A WHILE
                    spanTeacher.Visible = false;
                    /*if (tTopic.tCourse.responsableTeacher != null)
                        strongTeacher.InnerText = tTopic.tCourse.responsableTeacher.name;
                    else
                        spanTeacher.Visible = false;*/
                }
            }

            if (Request["__EVENTTARGET"] == "leaveTopic")
            {
                if (Session["topicId"] != null)
                {
                    Session.Remove("topicId");
                    DbControl.getInstance().exitTopic(tUser);
                }
                Response.Redirect("home.aspx");
            }

            if (Request["__EVENTTARGET"] == "home")
            {
                Response.Redirect("home.aspx");
            }

            if (Request["__EVENTTARGET"] == "myAccount")
            {
                Response.Redirect("account.aspx");
            }

            if (Request["__EVENTTARGET"] == "finishTopic")
            {
                TTopic tTopic = tUser.topic;

                DbControl.getInstance().exitTopic(tUser);
                DbControl.getInstance().finishTopic(tTopic);

                Response.Redirect("home.aspx");
            }
        }

        protected void btnSignOut_Click(object sender, EventArgs e)
        {
            TUser tUser = (TUser)Session["user"];

            if (tUser.topic != null)
            {
                DbControl.getInstance().exitTopic(tUser);
            }
            Session.Abandon();
            Response.Redirect("login.aspx");
        }
    }
}
