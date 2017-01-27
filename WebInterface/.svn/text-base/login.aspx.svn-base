<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebInterface.login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <title>CE :: Class Extender</title>
    <link href="styles/styles.css" rel="stylesheet" type="text/css">
        
    <script type="text/javascript">
        function setFocus()
        {
            if(document.getElementById('__EVENTTARGET').value == 'txtEmail')
                document.getElementById('txtEmail').focus();
            else
                document.getElementById('txtId').focus();
        }
    </script>
    
</head>
<body onload="setFocus();">
    <form id="form_global" runat="server">
	    <div id="global">
		    <div id="container">
			    <div id="side1">
			        <span>
			        <p>Logo do software Class Extender</p>
			        </span>
			        <h1>CE - Class Extender</h1>
			    </div>
    			
			    <div id="side2">
		            <div id="div_form_login">
			            <label for="lbId">ID</label>
			            <input type="text" name="txtId" class="field" id="txtId" runat="server">
			            <label for="lbPassword">PASSWORD</label>
			            <input type="password" name="txtPassword" class="field" id="txtPassword" runat="server">
			            <asp:LinkButton ID="lkbRecoverPassword" runat="server" OnClick="lkbRecoverPassword_Click">Forgot your id or password?</asp:LinkButton>       					    
			            <asp:Button ID="btnSignIn" CssClass="bt" runat="server" Text="Sign in" OnClick="bntSignIn_Click" />
		            </div>
            
                    <div id="div_form_recover_login_password" visible = "false" runat="server">
                        <label for="lbEnterMail">Please, type your registered mail account:</label>
                        <input type="text" name="txtEmail" class="field" id="txtEmail" runat="server">
                        <asp:Button ID="btnRecoverPassword" CssClass="btRecoverPassword" runat="server" Text="Send" OnClick="btnRecoverPassword_Click" />
                        <asp:Button ID="btnCancelRecoverPassword" CssClass="btCancelRecoverPassword" runat="server" Text="Cancel" OnClick="btnCancelRecoverPassword_Click" />
                    </div>
			    </div>
		    </div>
    		
		    <div id="footer">
		        <img src="img/logos_footer.gif" width="914" height="92" border="0" usemap="#Map">
                <map name="Map">
                  <area shape="rect" coords="2,6,346,86" href="http://www.puc-rio.br" target="_blank">
                  <area shape="rect" coords="370,8,485,85" href="http://www-nt.inf.puc-rio.br/cgilua/cgilua.exe/index.html" target="_blank">
                  <area shape="rect" coords="508,9,810,81" href="http://www.serg.inf.puc-rio.br/?&lng=br" target="_blank">
                  <area shape="rect" coords="833,10,911,80" href="http://www.dizainas.com.br" target="_blank">
                </map>
		    </div>
	    </div>
    </form>
</body>
</html>
