<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inicial.aspx.cs" Inherits="WebApplication1.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    
    <h2><i class="fa fa-rss"></i> My Feed Reader</h2>
    <div class="row">
        <div class="col-md-9">
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="XmlDataSource2" DataTextField="description" DataValueField="url" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="form-control" Width="549">
                </asp:DropDownList>
        </div>
        <div class="row">
        <div class="col-md-3">
        <asp:Button ID="Button1" runat="server"  PostBackUrl="~/edit_rss.aspx" Text="Manage Feeds" CssClass="form-control"/>
        </div>
    </div>
    </div>  
  
    

     <div class="row">
        <div class="col-md-9" >
            <h3>Feed Info</h3>
             
            <asp:DetailsView ID="DetailsView2" runat="server" DataSourceID="XmlDataSource1" CssClass="table" Width="745px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            </asp:DetailsView>
            <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="http://feeds.feedburner.com/PublicoRSS?formal=xml" TransformFile="~/feedheader.xslt"></asp:XmlDataSource>
             
         <asp:XmlDataSource ID="XmlDataSource2" runat="server" DataFile="~/feedList.xml"></asp:XmlDataSource>
    <asp:XmlDataSource ID="XmlDataSource3" runat="server" DataFile="http://feeds.feedburner.com/PublicoRSS?format=xml" TransformFile="~/feedinfo.xslt" EnableCaching="False"></asp:XmlDataSource>
    <asp:XmlDataSource ID="XmlDataSource4" runat="server" DataFile="http://feeds.feedburner.com/PublicoRSS?format=xml" TransformFile="~/image.xslt" EnableCaching="False"></asp:XmlDataSource>

        </div>
       
        <div class="col-md-3">
            <h3>Feed Image:</h3>
            <p>
                
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataSourceID="XmlDataSource4" Height="50px" Width="125px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" OnPageIndexChanging="DetailsView1_PageIndexChanging">
                    <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <Fields>
                        <asp:ImageField DataImageUrlField="url" SortExpression="url" />
                    </Fields>
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                </asp:DetailsView>
                
            </p>
        </div>
    </div>
    
  
    <h3>Feed News  <asp:Label ID="Literal1" runat="server" Font-Size="Smaller"></asp:Label> </h3> 

       

    <asp:GridView ID="GridView1" runat="server" CellPadding="4" DataSourceID="XmlDataSource3" Font-Size="8pt" ForeColor="#333333" GridLines="None" AllowPaging="True" OnPageIndexChanged="GridView1_PageIndexChanged" CssClass="table" AutoGenerateColumns="False" OnDataBound="GridView1_DataBound">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="link" ControlStyle-Font-Bold="true" DataTextField="title" HeaderText="Title" Target="_blank" />
            <asp:BoundField DataField="description" ControlStyle-Font-Bold="true" HeaderText="Description" SortExpression="description" />
            <asp:BoundField DataField="category" ControlStyle-Font-Bold="true" HeaderText="Category" SortExpression="category" />
            <asp:BoundField DataField="Date" ControlStyle-Font-Bold="true" HeaderText="Date" SortExpression="Date" />
        </Columns>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" ForeColor="Navy" Font-Bold="True" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#4D0000" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#820000" />
    </asp:GridView>
    </asp:Content>
