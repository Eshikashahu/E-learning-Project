<%@ Page Language="VB" AutoEventWireup="false" CodeFile="pagenotfound.aspx.vb" Inherits="pagenotfound" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width: 100%; text-align: center">
                <tr>
                    <td>
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/page_not_found_1.png" /></td>
                </tr>
                <tr>
                    <td>
                        <asp:HyperLink ID="HyperLink1" runat="server" Font-Names="Arial" Font-Size="Medium" NavigateUrl="~/home.aspx">Home</asp:HyperLink></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
