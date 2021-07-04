<%@ Page Title="" Language="VB" MasterPageFile="~/start.master" AutoEventWireup="false" CodeFile="forgetpassword.aspx.vb" Inherits="forgetpassword" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
     <center>
    <table style="text-align: left">
        <tr>
            <td style="text-align:center"><asp:Label ID="Label1" runat="server" Text="Forget Password" Font-Names="Arial" Font-Bold="False" Font-Size="X-Large" ForeColor="Black"></asp:Label></td>
        </tr>
        </table>
        </center>
    <hr />
    <center>

        <table style="text-align:left">
                <tr>
                    <td style="text-align:left">
                        <asp:Label ID="Label2" runat="server" Text="Userid" Font-Names="Arial" Font-Size="Medium"></asp:Label></td>
                    <td style="text-align:left">
                        <asp:TextBox ID="TxtUserId" runat="server" Font-Names="Arial" Font-Size="Medium" Width="350px"></asp:TextBox></td>
                    <td style="text-align:left"><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Userid is required" Display="Dynamic" Font-Names="Arial" Font-Size="Medium" ForeColor="#990033" ControlToValidate="TxtUserId" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:left">
                        <asp:Label ID="Label3" runat="server" Text="Security Question" Font-Names="Arial" Font-Size="Medium"></asp:Label></td>
                    <td style="text-align:left">
                        <asp:DropDownList ID="DdlSecurityQuestion" runat="server" Font-Names="Arial" Font-Size="Medium" Width="350px">
                            <asp:ListItem Value="-1">Select Security Question</asp:ListItem>
                            <asp:ListItem>WHAT IS YOUT FIRST SCHOOL NAME?</asp:ListItem>
                            <asp:ListItem>YOUR FAVOURITE FOOD?</asp:ListItem>
                            <asp:ListItem>WHICH COLOR YOU LIKE MOST?</asp:ListItem>
                        </asp:DropDownList></td>
                    <td style="text-align:left"><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Security question is required" Display="Dynamic" Font-Names="Arial" Font-Size="Medium" ForeColor="#990033" ControlToValidate="DdlSecurityQuestion" InitialValue="-1" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td style="text-align:left">
                        <asp:Label ID="Label4" runat="server" Text="Answer" Font-Names="Arial" Font-Size="Medium"></asp:Label></td>
                    <td style="text-align:left">
                        <asp:TextBox ID="TxtAnswer" runat="server" Font-Names="Arial" Font-Size="Medium" TextMode="Password" Width="350px"></asp:TextBox></td>
                    <td style="text-align:left"><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Answer is required" Display="Dynamic" Font-Names="Arial" Font-Size="Medium" ForeColor="#990033" ControlToValidate="TxtAnswer" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td></td>
                    <td style="text-align:right">
                        <asp:Button ID="BtnSendRequest" runat="server" Text="Send Request" Font-Names="Arial" Font-Size="Medium" BackColor="#2C3E50" BorderColor="#2C3E50" BorderStyle="Solid" ForeColor="White" Height="40px" /></td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align:left">
                        <asp:Label ID="LblMsg" runat="server" Font-Names="Arial" Font-Size="Medium"></asp:Label></td>                    
                </tr>
            </table>
    </center>
</asp:Content>

