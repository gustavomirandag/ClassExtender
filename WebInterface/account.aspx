<%@ Page Language="C#" MasterPageFile="~/top.Master" AutoEventWireup="true" CodeBehind="account.aspx.cs" Inherits="Interface_Web.account" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<span class="title_content">
    <h3>&nbsp;</h3>
</span>
<div id="menu">
    <span class="title_menu">
        <h3>You</h3>
     </span>
    <asp:UpdatePanel ID="upUpdateUser" runat="server" RenderMode="Inline">
        <ContentTemplate>   
            <center>
                <IMG id="imgAvatar" src="img/ico_classer.gif" runat="server" />
                <br />
                <asp:Button id="btnEditProfile" onclick="btnEditProfile_Click" runat="server" Text="Edit Profile" CssClass="bt" Width="142px"></asp:Button>
                <br />
                <asp:Button id="btnChangePassword" onclick="btnUsers_Click" runat="server" Text="Change Password" CssClass="bt" Width="142px"></asp:Button>
            </center>
        </ContentTemplate>
    </asp:UpdatePanel> 
</div>

<div id="content">
    <span class="title_content">
        <h3>My Account</h3>
    </span>
    <div id="main_content">
        <asp:UpdatePanel id="upUpdateYou" runat="server" OnPreRender="upUpdateYou_PreRender">
            <ContentTemplate>
                <DIV id="divStartHere" runat="server" visible="true"><SPAN class="startHere">&lt;&lt;&lt; SELECT an option at the MENU to START!</SPAN> </DIV>
                <DIV id="divEditProfile" class="divInternalContent" runat="server" visible="false"><SPAN class="title_content2"><H4>Profile</H4></SPAN><LABEL class="labelDefault">You can edit your profile below:</LABEL><BR />&nbsp;&nbsp;<TABLE style="WIDTH: 302px; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; HEIGHT: 113px; BORDER-BOTTOM-STYLE: none"><TBODY><TR><TD style="FONT-WEIGHT: bold; COLOR: #ffffff; HEIGHT: 18px; BACKGROUND-COLOR: #1c5e55" colSpan=2>Edit Profile</TD></TR><TR><TD style="FONT-WEIGHT: bold; WIDTH: 1px; COLOR: #000000; BACKGROUND-COLOR: #d0d0d0">Name</TD><TD style="WIDTH: 3px; BACKGROUND-COLOR: #e3eaeb"><asp:TextBox id="txtName" runat="server" Width="320px"></asp:TextBox></TD></TR><TR><TD style="FONT-WEIGHT: bold; WIDTH: 1px; COLOR: #000000; BACKGROUND-COLOR: #d0d0d0">Email</TD><TD style="WIDTH: 3px; BACKGROUND-COLOR: #e3eaeb"><asp:TextBox id="txtEmail" runat="server" Width="279px"></asp:TextBox></TD></TR></TBODY></TABLE><asp:Button id="btnUpdateProfile" onclick="btnUpdateProfile_Click" runat="server" Text="Update" CssClass="btInline" Width="125px"></asp:Button> <asp:Button id="btnCancelEditProfile" onclick="btnCancelEditProfile_Click" runat="server" Text="Cancel" CssClass="btCancel"></asp:Button></DIV>
                <DIV id="divChangePassword" class="divInternalContent" runat="server" visible="false"><SPAN class="title_content2"><H4>Change Password</H4></SPAN><LABEL class="labelDefault">You can change your password below:</LABEL><BR />&nbsp; <TABLE style="WIDTH: 302px; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; HEIGHT: 161px; BORDER-BOTTOM-STYLE: none"><TBODY><TR><TD style="FONT-WEIGHT: bold; COLOR: #ffffff; HEIGHT: 18px; BACKGROUND-COLOR: #1c5e55" colSpan=2>Change password</TD></TR><TR><TD style="FONT-WEIGHT: bold; WIDTH: 1px; COLOR: #000000; BACKGROUND-COLOR: #d0d0d0">Old password</TD><TD style="WIDTH: 3px; BACKGROUND-COLOR: #e3eaeb"><asp:TextBox id="txtOldPassword" runat="server" TextMode="Password"></asp:TextBox></TD></TR><TR><TD style="FONT-WEIGHT: bold; WIDTH: 1px; COLOR: #000000; BACKGROUND-COLOR: #d0d0d0">New password</TD><TD style="WIDTH: 3px; BACKGROUND-COLOR: #e3eaeb"><asp:TextBox id="txtNewPassword" runat="server" TextMode="Password"></asp:TextBox></TD></TR><TR><TD style="FONT-WEIGHT: bold; WIDTH: 1px; COLOR: #000000; HEIGHT: 43px; BACKGROUND-COLOR: #d0d0d0">Repeat new password</TD><TD style="WIDTH: 3px; HEIGHT: 43px; BACKGROUND-COLOR: #e3eaeb"><asp:TextBox id="txtNewPassword2" runat="server" TextMode="Password"></asp:TextBox></TD></TR></TBODY></TABLE><BR /><asp:Label id="errorMsgChangePassword" runat="server" ForeColor="DarkRed" Font-Size="15px"></asp:Label>&nbsp; <asp:Button id="btnOkChangePassword" onclick="btnOkChangePassword_Click" runat="server" Text="Ok" CssClass="btInline" Width="125px"></asp:Button> <asp:Button id="btnCancelChangePassword" onclick="btnCancelChangePassword_Click" runat="server" Text="Cancel" CssClass="btCancel"></asp:Button></DIV>
            </ContentTemplate>
            <triggers>
                <asp:PostBackTrigger ControlID="btnUpdateProfile"></asp:PostBackTrigger>
                <asp:PostBackTrigger ControlID="btnOkChangePassword"></asp:PostBackTrigger>
            </triggers>
        </asp:UpdatePanel>
     </div>
</div> 
</asp:Content>
