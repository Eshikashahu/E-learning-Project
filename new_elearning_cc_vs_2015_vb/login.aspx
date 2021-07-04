<%@ Page Title="" Language="VB" MasterPageFile="~/start.master" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="login" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <center>
    <table style="text-align: left">
        <tr>
            <td style="text-align:center"><asp:Label ID="Label1" runat="server" Text="Login Here" Font-Names="Arial" Font-Bold="False" Font-Size="X-Large" ForeColor="Black"></asp:Label></td>
        </tr>
        </table>
        </center>
    <hr />
    <center>
        <table style="text-align:left">
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Userid" Font-Names="Arial" Font-Size="Medium"></asp:Label></td>
            <td>
                <asp:TextBox ID="TxtUserid" runat="server" Font-Names="Arial" Font-Size="Medium"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Userid is required" ControlToValidate="TxtUserid" Display="Dynamic" Font-Names="Arial" Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Password" Font-Names="Arial" Font-Size="Medium"></asp:Label></td>
            <td>
                <asp:TextBox ID="TxtPassword" TextMode="Password" runat="server" Font-Names="Arial" Font-Size="Medium"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password is required" ControlToValidate="TxtPassword" Display="Dynamic" Font-Names="Arial" Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="BtnLogin" runat="server" Text="Login" Font-Names="Arial" Font-Size="Medium" BackColor="#2C3E50" BorderColor="#2C3E50" BorderStyle="Solid" ForeColor="White" Height="40px" Width="100px" /></td>
            <td></td>
        </tr>
        <tr>
            <td colspan="3" style="text-align:center">
                <asp:Label ID="LblMsg" runat="server" Font-Names="Arial" Font-Size="Medium"></asp:Label></td>
        </tr>
        <tr>            
            <td colspan="3" style="text-align:center">
                <asp:HyperLink ID="HyperLink2" runat="server" Font-Names="Arial" Font-Size="Medium" NavigateUrl="~/forgetpassword.aspx">Forget Password?</asp:HyperLink></td>            
        </tr>
    </table>
    </center>
    <hr />
</asp:Content>

