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
using System.Collections.Specialized;
using System.IO;

namespace WebInterface
{
    public partial class loadInk : System.Web.UI.Page
    {
        public String carregaIsf(String fileName)
        {
            using (FileStream fs = File.OpenRead(fileName))
            {
                byte[] isfBytes = new byte[fs.Length];
                fs.Read(isfBytes, 0, (int) fs.Length);
                
                return Convert.ToBase64String(isfBytes);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            NameValueCollection form = Request.Form;
            if (form.Keys.Count > 0)
            {
                // Determine the location where blog web pages and images are 
                // stored on the server
                string blogPath = Server.MapPath("~/data/");
                string imagePath = Path.Combine(blogPath, "ink");

                // If this location does not yet exist, create it.
                DirectoryInfo dirInfo = new DirectoryInfo(imagePath);
                
                if (!dirInfo.Exists)
                {
                    dirInfo.Create();
                }

                String fileName = form.GetValues("gifInkUrl")[0];
                Session["imageUrl"] = Path.Combine(imagePath, Path.GetFileName(fileName));

                fileName = fileName.Replace(".gif", ".isf");
                fileName = Path.GetFileName(fileName);
                String isfInkData = null;

                if (System.IO.File.Exists(Path.Combine(imagePath, fileName)))
                    isfInkData = carregaIsf(Path.Combine(imagePath, fileName));

                Session["isfInkData"] = isfInkData;
                Session["isfUrl"] = Path.Combine(imagePath, fileName);
                Response.Clear();
                Response.Redirect("fckeditor/editor/dialog/fck_ink.aspx");
                //Response.Redirect("fckeditor/editor/dialog/fck_ink.aspx?isfInkData=" + isfInkData);
            }
        }
    }
}
