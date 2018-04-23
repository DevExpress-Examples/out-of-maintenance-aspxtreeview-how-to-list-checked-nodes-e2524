<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.1.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxTreeView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v10.2, Version=10.2.1.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
	<title>Untitled Page</title>
</head>
<body>
	<form id="form1" runat="server">
	<div>
	<!--region #Markup-->
	<script type="text/javascript">
		function OnCheckedChanged(s, e) {
			label.SetText("Checked nodes:");
			ListCheckedNodes(s);
		}

		function ListCheckedNodes(parent){    
			for (var i=0; i < parent.GetNodeCount(); i++){
				if (parent.GetNode(i).GetChecked()){
				   label.SetText(label.GetText() + " " + parent.GetNode(i).GetText())    
				}
				if (parent.GetNode(i).GetNodeCount() != 0){
				   ListCheckedNodes(parent.GetNode(i))
				}
			}
		}
	</script>
	<dx:ASPxTreeView ID="ASPxTreeView1" runat="server" AllowCheckNodes="True" ClientInstanceName="treeview" DataSourceID="XmlDataSource1">
		<ClientSideEvents CheckedChanged="OnCheckedChanged" />
	</dx:ASPxTreeView>
	<br />
	<dx:ASPxLabel ID="ASPxLabel1" runat="server" ClientInstanceName="label" Text="Checked nodes:">
	</dx:ASPxLabel>
	<asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/App_Data/MenuTabbedMenu.xml" XPath="/mainmenu/item"></asp:XmlDataSource>
	<!--endregion #Markup-->      
	</div>
	</form>
</body>
</html>