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
    public partial class topicCometUpdate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void timerStartCOMET_Tick(object sender, EventArgs e)
        {
            Response.Expires = 0;

            //IMPOSSIBILITIES ANOTHER UPDATE CALL
            divStatus.InnerHtml = "ok"; //UPDATE MESSAGES
            timerStartCOMET.Enabled = false;

            //NOT USING, BECAUSE COMET ITSELF IS NOT WORKING PROPERLY
            //waitForUpdate(); //COMET started

            checkUpdate();
            timerStartCOMET.Enabled = true;
        }

        //NOT USING, BECAUSE COMET ITSELF IS NOT WORKING PROPERLY
        protected void timerExpireCOMET_Tick(object sender, EventArgs e)
        {
            //Restart COMET connection
            timerStartCOMET.Enabled = true;
        }

        void checkUpdate()
        {
            //============ UPDATE MESSAGES & PARTICIPANTS ============
            int topicId = Convert.ToInt32(Session["topicId"]);
            if ((Convert.ToInt32(Session["updateAvaiable"]) != Convert.ToInt32(Application["updateAvaiable_" + topicId.ToString()])) && (Session["editingMessage"] == null))
            {
                Session["updateAvaiable"] = Convert.ToInt32(Convert.ToInt32(Application["updateAvaiable_" + topicId.ToString()]));
                divStatus.InnerHtml = "updateMsgsAndPart"; //UPDATE MESSAGES
            }
            //========================================================
        }

        //NOT USING, BECAUSE COMET ITSELF IS NOT WORKING PROPERLY
        void waitForUpdate()
        {
            int topicId = Convert.ToInt32(Session["topicId"]);

            while ((Session["editingMessage"] == null))
            {

                //============ UPDATE MESSAGES & PARTICIPANTS ============
                if ((Convert.ToInt32(Session["updateAvaiable"]) != Convert.ToInt32(Application["updateAvaiable_" + topicId.ToString()])) && (Session["editingMessage"] == null))
                {
                    Session["updateAvaiable"] = Convert.ToInt32(Convert.ToInt32(Application["updateAvaiable_" + topicId.ToString()]));
                    divStatus.InnerHtml = "updateMsgsAndPart"; //UPDATE MESSAGES
                    break;
                }
                //========================================================
                //System.Threading.Thread.Sleep(4000);
            }
        }
    }
}
