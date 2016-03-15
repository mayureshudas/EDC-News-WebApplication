using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.IO;

namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }


        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            XmlDataSource3.DataFile = DropDownList1.SelectedValue;
            XmlDataSource1.DataFile = DropDownList1.SelectedValue;
            XmlDataSource4.DataFile = DropDownList1.SelectedValue;

            try{
                XmlDocument xdoc = XmlDataSource3.GetXmlDocument();
                GridView1.DataBind();
                DetailsView1.DataBind();
                DetailsView2.DataBind();
                GridView1.PageIndex = 0;

            }
            catch (FileNotFoundException)
            {
                Response.Redirect("Rss_invalido.aspx");
            }
        }


        protected void GridView1_PageIndexChanged(object sender, EventArgs e)
        {
            XmlDataSource3.DataFile = DropDownList1.SelectedValue;
            XmlDataSource1.DataFile = DropDownList1.SelectedValue;
            GridView1.DataBind();
            DetailsView2.DataBind();
            GridView1.PageIndex = GridView1.PageIndex;
        }

        protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {
            //XmlDocument xdoc = XmlDataSource3.GetXmlDocument();
            //XmlElement image = xdoc.SelectSingleNode("channel/image/url[url='" + e.NewValues["url"].ToString() + "']") as XmlElement;
            //image.Attributes["url"].Value = e.NewValues["url"].ToString();
        }

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DetailsView1_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
        {
            XmlDataSource3.DataFile = DropDownList1.SelectedValue;
            XmlDataSource4.DataFile = DropDownList1.SelectedValue;
            XmlDataSource1.DataFile = DropDownList1.SelectedValue;
            GridView1.DataBind();
            DetailsView1.DataBind();
            DetailsView2.DataBind();
            GridView1.PageIndex = GridView1.PageIndex;
            DetailsView1.PageIndex = GridView1.PageIndex;
        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            var nodeCount = 0;
            using (var reader = XmlReader.Create(XmlDataSource3.DataFile))
            {
                while (reader.Read())
                {
                    if (reader.NodeType == XmlNodeType.Element &&
                        reader.Name == "item")
                    {
                        nodeCount++;
                    }
                }
            }
            Literal1.Text = String.Format("[{0:N0}]", nodeCount);
        }

        

      

       
    }
}