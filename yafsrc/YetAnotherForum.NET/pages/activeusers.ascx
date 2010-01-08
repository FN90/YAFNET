<%@ Control Language="c#" CodeFile="activeusers.ascx.cs" AutoEventWireup="True" Inherits="YAF.Pages.activeusers" %>
<%@ Import Namespace="YAF.Classes.Core"%>
<YAF:PageLinks runat="server" ID="PageLinks" />
<div class="DivTopSeparator"></div>
<table class="content" width="100%" cellspacing="1" cellpadding="0">
	<tr>
		<td class="header1" colspan="7">
			<YAF:LocalizedLabel ID="LocalizedLabel1" runat="server" LocalizedTag="title" />
		</td>
	</tr>
	<tr>
		<td class="header2">
			<YAF:LocalizedLabel ID="LocalizedLabel2" runat="server" LocalizedTag="username" />
		</td>
		<td class="header2">
			<YAF:LocalizedLabel ID="LocalizedLabelLatestActions" runat="server" LocalizedTag="latest_action" />
		</td>
		<td class="header2">
			<YAF:LocalizedLabel ID="LocalizedLabel3" runat="server" LocalizedTag="logged_in" />
		</td>
		<td class="header2">
			<YAF:LocalizedLabel ID="LocalizedLabel4" runat="server" LocalizedTag="last_active" />
		</td>
		<td class="header2">
			<YAF:LocalizedLabel ID="LocalizedLabel5" runat="server" LocalizedTag="active" />
		</td>
		<td class="header2">
			<YAF:LocalizedLabel ID="LocalizedLabel6" runat="server" LocalizedTag="browser" />
		</td>
		<td class="header2">
			<YAF:LocalizedLabel ID="LocalizedLabel7" runat="server" LocalizedTag="platform" />
		</td>
	</tr>
	<asp:Repeater ID="UserList" runat="server">
		<ItemTemplate>
			<tr>
				<td class="post">		
					<YAF:UserLink ID="NameLink"   runat="server" UserID='<%# Convert.ToInt32(Eval("UserID")) %>' 				
					 Style='<%# Eval("Style").ToString() %>' UserName='<%# Eval("UserName").ToString() %>'    />
				    <asp:PlaceHolder ID="HiddenPlaceHolder" runat="server" Visible='<%# Convert.ToBoolean(Eval("IsHidden"))%>' >
				    (<YAF:LocalizedLabel ID="Hidden" LocalizedTag="HIDDEN" runat="server" />)
				    </asp:PlaceHolder>				    
				</td>
				<td class="post">				
					<YAF:ActiveLocation ID="ActiveLocation2" UserID='<%# Convert.ToInt32((Eval("UserID") == DBNull.Value)? 0 : Eval("UserID")) %>' UserName='<%# Eval("UserName") %>' ForumPage='<%# Eval("ForumPage") %>' ForumID='<%# Convert.ToInt32((Eval("ForumID") == DBNull.Value)? 0 : Eval("ForumID")) %>' ForumName='<%# Eval("ForumName") %>' TopicID='<%# Convert.ToInt32((Eval("TopicID") == DBNull.Value)? 0 : Eval("TopicID")) %>' TopicName='<%# Eval("TopicName") %>' LastLinkOnly="false"  runat="server"></YAF:ActiveLocation>     
				</td>
				<td class="post">
					<%# YafServices.DateTime.FormatTime((DateTime)((System.Data.DataRowView)Container.DataItem)["Login"]) %>
				</td>				
				<td class="post">
					<%# YafServices.DateTime.FormatTime((DateTime)((System.Data.DataRowView)Container.DataItem)["LastActive"]) %>
				</td>
				<td class="post">
					<%# GetTextFormatted( "minutes", ((System.Data.DataRowView)Container.DataItem)["Active"]) %>
				</td>
				<td class="post">
					<%# Eval("Browser") %>
				</td>
				<td class="post">
					<%# Eval("Platform") %>
				</td>
			</tr>
		</ItemTemplate>
	</asp:Repeater>
</table>
<div id="DivSmartScroller">
	<YAF:SmartScroller ID="SmartScroller1" runat="server" />
</div>
