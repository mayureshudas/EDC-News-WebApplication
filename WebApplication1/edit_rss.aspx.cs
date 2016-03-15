using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace WebApplication1
{
    public partial class edit_rss : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.Columns[1].Visible = false;

            add_rss.Enabled = true;
            add_rss.Visible = true;

            descr_text.Visible = false;
            descr.Enabled = false;
            descr.Visible = false;

            url.Visible = false;
            url_textbox.Visible = false;
            url_textbox.Enabled = false;

            submit.Visible = false;
            submit.Enabled = false;
            cancel.Visible = false;
            cancel.Enabled = false;
        }

        protected void add_rss_Click(object sender, EventArgs e)
        {
            add_rss.Enabled = false;
            add_rss.Visible = false;

            descr_text.Visible = true;
            descr.Enabled = true;
            descr.Visible = true;

            url.Visible = true;
            url_textbox.Visible = true;
            url_textbox.Enabled = true;

            submit.Visible = true;
            submit.Enabled = true;
            cancel.Visible = true;
            cancel.Enabled = true;
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            cancel.Visible = true;
            cancel.Enabled = true;
            string script = "<script language=\"javascript\">\n" + "alert (\"Ambos os campos têm de ser preenchidos\");\n" + "</script>";
            if (descr.Text.Length == 0 || url_textbox.Text.Length == 0)
            {
                ClientScript.RegisterStartupScript(script.GetType(), "Error", script);
            }
            else
            {
                XmlDocument xdoc = XmlDataSource1.GetXmlDocument();
                XmlElement rss = xdoc.CreateElement("feed");
                XmlAttribute descricao = xdoc.CreateAttribute("description");
                XmlAttribute url_xml = xdoc.CreateAttribute("url");

                descricao.Value = descr.Text;
                url_xml.Value = url_textbox.Text;

                rss.Attributes.Append(descricao);
                rss.Attributes.Append(url_xml);
                xdoc.DocumentElement.AppendChild(rss);

                XmlDataSource1.Save();

                Response.Redirect("edit_rss.aspx");
            }
        }
        protected void Edit(object sender, GridViewEditEventArgs e)
        {

        }
        protected void Update(object sender, GridViewUpdateEventArgs e)
        {
            GridView1.Columns[1].Visible = true;
            GridView1.DataBind();
            XmlDocument xdoc = XmlDataSource1.GetXmlDocument();
            String descricao_old = GridView1.Rows[e.RowIndex].Cells[1].Text;
            XmlElement rss = xdoc.SelectSingleNode("feedList/feed[@description='"+descricao_old+"']") as XmlElement;

            //rss.Attributes["description"].Value = e.NewValues["description"].ToString();
            rss.Attributes["url"].Value = e.NewValues["url"].ToString();

            XmlDataSource1.Save();

           Response.Redirect("edit_rss.aspx");
        }
        protected void Delete(object sender, GridViewDeleteEventArgs e)
        {
            GridView1.DataBind();
            XmlDocument xdoc = XmlDataSource1.GetXmlDocument();
            XmlElement rss = xdoc.SelectSingleNode("feedList/feed[@url='" + e.Values["url"] + "']") as XmlElement;
            xdoc.DocumentElement.RemoveChild(rss);
            XmlDataSource1.Save();

            Response.Redirect("edit_rss.aspx");
        }
    }
}