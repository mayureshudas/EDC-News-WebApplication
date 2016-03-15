<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="edit_rss.aspx.cs" Inherits="WebApplication1.edit_rss" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2><i class="fa fa-rss"></i> Gestão de Feeds</h2>

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="XmlDataSource1" ForeColor="#333333" GridLines="None" OnRowDeleting="Delete" OnRowEditing="Edit" OnRowUpdating="Update" DataKeyNames="description" CssClass="table">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:TemplateField HeaderText="Description">
            <ItemTemplate>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("url") %>' Target="_blank" Text='<%# Bind("description") %>'></asp:HyperLink>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="description" HeaderText="description" ReadOnly="True" SortExpression="description" Visible="False" />
        <asp:BoundField DataField="url" HeaderText="URL" SortExpression="url" />
        <asp:CommandField ShowEditButton="true" ShowDeleteButton="true"/>
        
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

    <div class="row">
        <div class="col-md-2">
            <asp:Button ID="add_rss" runat="server" OnClick="add_rss_Click" Text="Adicionar RSS" CssClass="form-control" Width="150"/>
        </div>
        <div class="col-md-5">
            <asp:Button ID="Button1" runat="server" PostBackUrl="~/Inicial.aspx" Text="Leitor de Feeds" CssClass="form-control" Width="150" />
            <br />
        </div>
    </div>

<asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/feedList.xml"></asp:XmlDataSource>
&nbsp;&nbsp;&nbsp;
<asp:Label ID="descr_text" runat="server" Text="Description: " Visible="False"></asp:Label>
&nbsp;<asp:TextBox ID="descr" runat="server" Enabled="False" Visible="False" Width="180px"></asp:TextBox>
&nbsp;&nbsp;
<asp:Label ID="url" runat="server" Text="Url: " Visible="False"></asp:Label>
&nbsp;
<asp:TextBox ID="url_textbox" runat="server" Enabled="False" Visible="False"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
&nbsp;
<br />
    <br />


 <div class="row">
        <div class="col-md-2">
            <asp:Button ID="submit" runat="server" Enabled="False" OnClick="submit_Click" Text="Submeter" Visible="False" CssClass="form-control" Width="100" />
        </div>
        <div class="col-md-5">
            <asp:Button ID="cancel" runat="server" Enabled="False" PostBackUrl="~/edit_rss.aspx" Text="Cancelar" CssClass="form-control" Width="100" Visible="False"/>
            <br />
        </div>
    </div>
    <p></p>
 
    


</asp:Content>


