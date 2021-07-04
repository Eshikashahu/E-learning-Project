<%@ Page Title="" Language="VB" MasterPageFile="~/user/user.master" AutoEventWireup="false" CodeFile="changepass.aspx.vb" Inherits="changepass" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
    <table>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Change Password" Font-Bold="False" Font-Names="Calibri" Font-Size="X-Large" ForeColor="#006600"></asp:Label></td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Current Password" Font-Names="Arial" Font-Size="Medium"></asp:Label></td>
            <td>
                <asp:TextBox ID="TxtCurrentPassword" runat="server" Font-Names="Arial" Font-Size="Medium" TextMode="Password" Width="250px"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Current password is required" ControlToValidate="TxtCurrentPassword" Display="Dynamic" Font-Names="Arial" Font-Size="Medium" ForeColor="#990033" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="New Password" Font-Names="Arial" Font-Size="Medium"></asp:Label></td>
            <td>
                <asp:TextBox ID="TxtNewPassword" runat="server" Font-Names="Arial" Font-Size="Medium" TextMode="Password" Width="250px"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="New password is required" ControlToValidate="TxtNewPassword" Display="Dynamic" Font-Names="Arial" Font-Size="Medium" ForeColor="#990033" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Confirm New Password" Font-Names="Arial" Font-Size="Medium"></asp:Label></td>
            <td>
                <asp:TextBox ID="TxtConfirmNewPwd" runat="server" Font-Names="Arial" Font-Size="Medium" TextMode="Password" Width="250px"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Confirm new password is required" ControlToValidate="TxtConfirmNewPwd" Display="Dynamic" Font-Names="Arial" Font-Size="Medium" ForeColor="#990033" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="New password and confirm new password must be same" ControlToCompare="TxtNewPassword" ControlToValidate="TxtConfirmNewPwd" Display="Dynamic" Font-Names="Arial" Font-Size="Medium" ForeColor="#990033" SetFocusOnError="True"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td></td>
            <td style="text-align: right">
                <asp:Button ID="BtnChangePwd" runat="server" Text="Change Password" Font-Names="Arial" Font-Size="Medium" BackColor="#2C3E50" BorderColor="#2C3E50" BorderStyle="Solid" ForeColor="White" Height="40px" /></td>
            <td></td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Label ID="LblMsg" runat="server" Font-Names="Arial" Font-Size="Medium"></asp:Label></td>
        </tr>
    </table>
</asp:Content>

