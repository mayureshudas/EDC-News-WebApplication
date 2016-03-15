<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="manageFeed.aspx.cs" Inherits="EDC2015_Trabalho3.manageFeed" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <i class="fa fa-rss"></i><asp:Label ID="FeedLabel" runat="server" Text="My Feed Reader" Font-Size="Larger"></asp:Label>
    <br />
    <br />
    <asp:DropDownList ID="DropDownJornal" runat="server"></asp:DropDownList>
    <br />
    <br />
   
    <table style="width:100%;">
        <tr>
            <td style="width: 543px">
   
    <asp:DetailsView ID="DetailsView1" runat="server"  AutoGenerateRows="False" CssClass="table" DataSourceID="XmlDataSource1" Width="548px">
        <Fields>
            <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
            <asp:BoundField DataField="link" HeaderText="link" SortExpression="link" />
            <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
            <asp:BoundField DataField="language" HeaderText="language" SortExpression="language" />
            <asp:BoundField DataField="pubDate" HeaderText="pubDate" SortExpression="pubDate" />
            <asp:BoundField DataField="lastBuildDate" HeaderText="lastBuildDate" SortExpression="lastBuildDate" />
            <asp:BoundField DataField="category" HeaderText="category" SortExpression="category" />
        </Fields>
    </asp:DetailsView>
            </td>
            <td>
                <asp:DetailsView ID="DetailsView2" runat="server" DataSourceID="XmlDataSource2" Height="50px" Width="125px">
                </asp:DetailsView>
                <asp:XmlDataSource ID="XmlDataSource2" runat="server" DataFile="http://feeds.feedburner.com/PublicoRSS?formal=xml" TransformFile="~/image.xslt"></asp:XmlDataSource>
            </td>
        </tr>
    </table>
    <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="http://feeds.feedburner.com/PublicoRSS?formal=xml" TransformFile="~/feedInfo.xslt"></asp:XmlDataSource>
    </asp:Content>

