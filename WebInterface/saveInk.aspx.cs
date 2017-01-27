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
    public partial class saveInk : System.Web.UI.Page
    {
        /// <summary>
        /// Helper method to create a GIF image file from the serialized ink data.
        /// Note:  since the ink data was serialized on the client side, the
        /// server does not need to have any specialized knowledge of ink.
        /// </summary>
        /// <param name="path">The location where the image should be created</param>
        /// <param name="fileName">The filename of the image</param>
        /// <param name="inkData">The serialized ink data</param>
        public void CreateGif(String path, String fileName, String inkBody)
        {
            String gifFilePath = Path.Combine(path, fileName + ".gif");
            using (FileStream fs = File.Create(gifFilePath))
            {
                byte[] bytes = Convert.FromBase64String(inkBody);
                fs.Write(bytes, 0, bytes.Length);
            }
        }

        public void CreateIsf(String path, String fileName, String inkBody)
        {
            String isfFilePath = Path.Combine(path, fileName + ".isf");
            using (FileStream fs = File.Create(isfFilePath))
            {
                byte[] bytes = Convert.FromBase64String(inkBody);
                fs.Write(bytes, 0, bytes.Length);
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

                String gifInkUrl = form.GetValues("gifInkUrl")[0];
                string fileName = null;    

                /*if (gifInkUrl.Trim() != "")
                {
                    fileName = Path.GetFileNameWithoutExtension(gifInkUrl);
                }
                else
                {*/
                    // Specifies the name of the web page file to generate.
                    //a timestamp to uniquely identify each blog.
                    {
                        fileName = DateTime.Now.Ticks.ToString();
                    }while (System.IO.File.Exists(Path.Combine(imagePath, fileName)));
                //}

                // Extract the blog title and body data posted to the server
                String gifInkData = form.GetValues("gifInkData")[0];
                String isfInkData = form.GetValues("isfInkData")[0];
                String imageUrl = form.GetValues("imageUrl")[0]; //Using INK over an image

                // Html fragment to be inserted into the blog's web page.  
                string content = null;

                //if (imageUrl != String.Empty)
                //{
                //    CreateIsf(imagePath, fileName, isfInkData);
                //}
                //else
                //{
                    // Check if ink data is available.  If so create a corresponding GIF 
                    // from the serialized ink data and an HTML fragment referencing it.
                    // Otherwise, create an HTML fragment with text from the blog.
                    if ((String.Empty != gifInkData) && (String.Empty != isfInkData))
                    {
                        // Use helper method to create a GIF image file from ink data 
                        CreateGif(imagePath, fileName, gifInkData);
                        CreateIsf(imagePath, fileName, isfInkData);

                        // Create an HTML fragment to reference the image file
                        content = "<img src=\"Blogs/Images/" + fileName + ".gif\"></img>";
                    }
                    else
                    {
                        Response.Write("<script>alert('Ink panel em branco!');</script>");
                    }
                //}

                // Redirect the user to home.aspx, which displays a list of all
                // available blogs.
                Response.Clear();

                Response.Redirect("fckeditor/editor/dialog/fck_ink.aspx?urlImagem=" + "http://" + Server.MachineName + "/classx/data/ink/" + fileName + ".gif");
            }
        }
    }
}
