<%@ Page Language="C#" AutoEventWireup="true" Async="true" AsyncTimeout="20" CodeBehind="topicCometUpdate.aspx.cs" Inherits="Interface_Web.topicCometUpdate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>TOPIC COMET UPDATE</title>
    
    <script>
        function pageLoad()
        {        
            Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(PageLoaded) 
        }
 
        function PageLoaded(sender, args) { 
            
            if(document.getElementById('divStatus').innerHTML == "updateMsgsAndPart")
            {         
                //alert('Atualizado!');     
                document.getElementById('divStatus').innerHTML = "ok";
                parent.document.getElementById('ctl00_ContentPlaceHolder1_btnUpdateMsgs').click(); //btnUpdateMsgs
            }
        } 
    </script>
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="scriptManager" runat="server" AsyncPostBackTimeout="0">
        </asp:ScriptManager>
        <asp:UpdatePanel id="upTimeToUpdate" runat="server"><ContentTemplate>
<DIV id="divStatus" runat="server"></DIV><asp:Timer id="timerStartCOMET" runat="server" Interval="1000" OnTick="timerStartCOMET_Tick"></asp:Timer> <asp:Timer id="timerExpireCOMET" runat="server" Interval="900000" OnTick="timerExpireCOMET_Tick" Enabled="False"></asp:Timer> 
</ContentTemplate>
</asp:UpdatePanel>
    
    </div>
    </form>
</body>
</html>
