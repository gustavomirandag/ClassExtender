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

namespace WebInterface.fckeditor.editor.dialog
{
    public partial class fck_ink : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["isfInkData"] == null)
            {
                if ((Session["isfUrl"] != null) && (!System.IO.File.Exists(Session["isfUrl"].ToString())))
                {
                    isfInkDataReturn.Value = "";
                    bkgImgUrlReturn.Value = Session["imageUrl"].ToString();
                    Session.Remove("isfUrl");
                }
            }
            else
                carregaIsf();
        }

        protected void carregaIsf()
        {
            isfInkDataReturn.Value = Session["isfInkData"].ToString();
            Session.Remove("isfInkData");
            Session.Remove("isfUrl");
        }
    }
}
