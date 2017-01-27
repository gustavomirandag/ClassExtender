<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="fck_ink.aspx.cs" Inherits="WebInterface.fckeditor.editor.dialog.fck_ink" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--
 * FCKeditor - The text editor for Internet - http://www.fckeditor.net
 * Copyright (C) 2003-2008 Frederico Caldeira Knabben
 *
 * == BEGIN LICENSE ==
 *
 * Licensed under the terms of any of the following licenses at your
 * choice:
 *
 *  - GNU General Public License Version 2 or later (the "GPL")
 *    http://www.gnu.org/licenses/gpl.html
 *
 *  - GNU Lesser General Public License Version 2.1 or later (the "LGPL")
 *    http://www.gnu.org/licenses/lgpl.html
 *
 *  - Mozilla Public License Version 1.1 or later (the "MPL")
 *    http://www.mozilla.org/MPL/MPL-1.1.html
 *
 * == END LICENSE ==
 *
 * Ink Properties dialog window.
-->
<html xmlns="http://www.w3.org/1999/xhtml" >    
<head id="Head1" runat="server">
	<title>Ink Properties</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="robots" content="noindex, nofollow" />
	<script src="common/fck_dialog_common.js" type="text/javascript"></script>
	<script src="fck_ink/fck_ink.js" type="text/javascript"></script>  
	<script type="text/javascript">
        document.write( FCKTools.GetStyleHtml( GetCommonDialogCss() ) ) ;
    </script>    
    
    <script type="text/javascript" language="javascript">
        
	    // Helper function that extracts the blog data from the
        // form and posts the result to the server.
        function uploadInk()
        {
            if (document.getElementById("bkgImgUrlReturn").value != "")
            {
                //formInkData.gifInkData.value = inkArea.gifInkData;
                //formInkData.isfInkData.value = inkArea.SerializeInkImageIsf;
            }
            else
            {
                formInkData.gifInkData.value = inkArea.gifInkData;
                formInkData.isfInkData.value = inkArea.isfInkData;
            }
            formInkData.submit();
        }

        // Helper function that releases resources held by the
        // ink controls
        function OnUnload()
        {        
            inkArea.disposeResources();        
        }    
	
		function parametroUrl( name )
		{  
			name = name.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
			var regexS = "[\\?&]"+name+"=([^&#]*)"; 
			var regex = new RegExp( regexS );
			var results = regex.exec( window.location.href );  
			if( results == null )    
				return "";  
			else    
				return results[1];
		}
	
		function carregaURLImagem()
		{
			var urlImagem = parametroUrl("urlImagem");
			
			if ((urlImagem != null) && (urlImagem != ""))
			{
			    txtUrl.value = urlImagem;
			    if (Ok())
			        window.parent.CloseDialog();
			}
		} 
		
		/*function carregaIsfInkData()
		{
		    //var formMemoria = document.forms[0].address.value;
		    alert('entrou: ' + document.getElementById('isfInkData').value);
		    alert('formMemoria ' + document.forms[0]);
		    alert('formMemoria2 ' + document.forms[1]);
		    alert('formMemoria3 ' + document.forms[3]);
		    //document.getElementById('isfInkData').value = formMemoria.isfInkData;
			//document.getElementById('isfInkData').value = parametroUrl("isfInkData");
		}*/ 
		
	</script> 
          
</head>
<body scroll="no" style="overflow: hidden" onunload="OnUnload()">
   
      <div id="divInk">
	    <table cellspacing="1" cellpadding="1" border="0" width="100%" height="100%">
		    <tr>
			    <td>
                    <OBJECT id="inkArea" classid="InkInput.dll#InkInput.InkArea" width="390px" height="330px" VIEWASTEXT="Your computer need the Microsoft Tablet PC SDK to view this component"></OBJECT>
                    <form id="formInkData" name="formInkData" action="http://localhost/classx/saveInk.aspx" method="post">
                        <input type="hidden" name="gifInkData" id="gifInkData" style="width: 2px; height: 1px">
                        <input type="hidden" name="isfInkData" id="isfInkData" style="width: 2px; height: 1px">
                        <input type="hidden" name="gifInkUrl" id="gifInkUrl" style="width: 2px; height: 1px">
                        <input type="hidden" name="imageUrl" id="Hidden1" style="width: 2px; height: 1px">
                    </form>
                    <form id="formServer" runat="server">
                        <input type="hidden" id="isfInkDataReturn" runat="server" value=""/>
                        <input type="hidden" id="bkgImgUrlReturn" runat="server" value=""/>
                    </form>
                </td>
                    
		    </tr>
	    </table>
    </div>
	    <div id="divInfo" style="display: none; visibility: hidden;">
		    <table cellspacing="1" cellpadding="1" border="0" width="100%" height="100%">
			    <tr>
				    <td>
					    <table cellspacing="0" cellpadding="0" width="100%" border="0">
						    <tr>
		]					    <td width="100%">
								    <span fcklang="DlgImgURL">URL</span>
							    </td>
							    <td id="tdBrowse" style="display: none" nowrap="nowrap" rowspan="2">
								    &nbsp;
								    <input id="btnBrowse" onClick="BrowseServer();" type="button" value="Browse Server"
									    fcklang="DlgBtnBrowseServer" />
							    </td>
						    </tr>
						    <tr>
							    <td valign="top">
								    <input name="txtUrl" id="txtUrl" style="width: 100%" type="text" onBlur="UpdatePreview();" />
							    </td>
						    </tr>
					    </table>
				    </td>
			    </tr>
			    <tr>
				    <td>
					    <span fcklang="DlgImgAlt">Short Description</span><br />
					    <input id="txtAlt" style="width: 100%" type="text" /><br />
				    </td>
			    </tr>
			    <tr height="100%">
				    <td valign="top">
					    <table cellspacing="0" cellpadding="0" width="100%" border="0" height="100%">
						    <tr>
							    <td valign="top">
								    <br />
								    <table cellspacing="0" cellpadding="0" border="0">
									    <tr>
										    <td nowrap="nowrap">
											    <span fcklang="DlgImgWidth">Width</span>&nbsp;</td>
										    <td>
											    <input type="text" size="3" id="txtWidth" onKeyUp="OnSizeChanged('Width',this.value);" /></td>
										    <td rowspan="2">
											    <div id="btnLockSizes" class="BtnLocked" onMouseOver="this.className = (bLockRatio ? 'BtnLocked' : 'BtnUnlocked' ) + ' BtnOver';"
												    onmouseout="this.className = (bLockRatio ? 'BtnLocked' : 'BtnUnlocked' );" title="Lock Sizes"
												    onclick="SwitchLock(this);">
											    </div>
										    </td>
										    <td rowspan="2">
											    <div id="btnResetSize" class="BtnReset" onMouseOver="this.className='BtnReset BtnOver';"
												    onmouseout="this.className='BtnReset';" title="Reset Size" onClick="ResetSizes();">
											    </div>
										    </td>
									    </tr>
									    <tr>
										    <td nowrap="nowrap">
											    <span fcklang="DlgImgHeight">Height</span>&nbsp;</td>
										    <td>
											    <input type="text" size="3" id="txtHeight" onKeyUp="OnSizeChanged('Height',this.value);" /></td>
									    </tr>
								    </table>
								    <br />
								    <table cellspacing="0" cellpadding="0" border="0">
									    <tr>
										    <td nowrap="nowrap">
											    <span fcklang="DlgImgBorder">Border</span>&nbsp;</td>
										    <td>
											    <input type="text" size="2" value="" id="txtBorder" onKeyUp="UpdatePreview();" /></td>
									    </tr>
									    <tr>
										    <td nowrap="nowrap">
											    <span fcklang="DlgImgHSpace">HSpace</span>&nbsp;</td>
										    <td>
											    <input type="text" size="2" id="txtHSpace" onKeyUp="UpdatePreview();" /></td>
									    </tr>
									    <tr>
										    <td nowrap="nowrap">
											    <span fcklang="DlgImgVSpace">VSpace</span>&nbsp;</td>
										    <td>
											    <input type="text" size="2" id="txtVSpace" onKeyUp="UpdatePreview();" /></td>
									    </tr>
									    <tr>
										    <td nowrap="nowrap">
											    <span fcklang="DlgImgAlign">Align</span>&nbsp;</td>
										    <td>
											    <select id="cmbAlign" onChange="UpdatePreview();">
												    <option value="" selected="selected"></option>
												    <option fcklang="DlgImgAlignLeft" value="left">Left</option>
												    <option fcklang="DlgImgAlignAbsBottom" value="absBottom">Abs Bottom</option>
												    <option fcklang="DlgImgAlignAbsMiddle" value="absMiddle">Abs Middle</option>
												    <option fcklang="DlgImgAlignBaseline" value="baseline">Baseline</option>
												    <option fcklang="DlgImgAlignBottom" value="bottom">Bottom</option>
												    <option fcklang="DlgImgAlignMiddle" value="middle">Middle</option>
												    <option fcklang="DlgImgAlignRight" value="right">Right</option>
												    <option fcklang="DlgImgAlignTextTop" value="textTop">Text Top</option>
												    <option fcklang="DlgImgAlignTop" value="top">Top</option>
											    </select>
										    </td>
									    </tr>
								    </table>
							    </td>
							    <td>
								    &nbsp;&nbsp;&nbsp;</td>
							    <td width="100%" valign="top">
								    <table cellpadding="0" cellspacing="0" width="100%" style="table-layout: fixed">
									    <tr>
										    <td>
											    <span fcklang="DlgImgPreview">Preview</span></td>
									    </tr>
									    <tr>
										    <td valign="top">
											    <iframe class="ImagePreviewArea" src="fck_ink/fck_ink_preview.html" frameborder="0"
												    marginheight="0" marginwidth="0"></iframe>
										    </td>
									    </tr>
								    </table>
							    </td>
						    </tr>
					    </table>
				    </td>
			    </tr>
		    </table>
	    </div>
	    <div id="divUpload" style="display: none; visibility: hidden;">
		    <form id="frmUpload" method="post" target="UploadWindow" enctype="multipart/form-data"
			    action="" onSubmit="return CheckUpload();">
			    <span fcklang="DlgLnkUpload">Upload</span><br />
			    <input id="txtUploadFile" style="width: 100%" type="file" size="40" name="NewFile" /><br />
			    <br />
			    <input id="btnUpload" type="submit" value="Send it to the Server" fcklang="DlgLnkBtnUpload" />
			    <script type="text/javascript">
				    document.write( '<iframe name="UploadWindow" style="display: none" src="' + FCKTools.GetVoidUrl() + '"><\/iframe>' ) ;
			    </script>
		    </form>
	    </div>
	    <div id="divLink" style="display: none">
		    <table cellspacing="1" cellpadding="1" border="0" width="100%">
			    <tr>
				    <td>
					    <div>
						    <span fcklang="DlgLnkURL">URL</span><br />
						    <input id="txtLnkUrl" style="width: 100%" type="text" onBlur="UpdatePreview();" />
					    </div>
					    <div id="divLnkBrowseServer" align="right">
						    <input type="button" value="Browse Server" fcklang="DlgBtnBrowseServer" onClick="LnkBrowseServer();" />
					    </div>
					    <div>
						    <span fcklang="DlgLnkTarget">Target</span><br />
						    <select id="cmbLnkTarget">
							    <option value="" fcklang="DlgGenNotSet" selected="selected">&lt;not set&gt;</option>
							    <option value="_blank" fcklang="DlgLnkTargetBlank">New Window (_blank)</option>
							    <option value="_top" fcklang="DlgLnkTargetTop">Topmost Window (_top)</option>
							    <option value="_self" fcklang="DlgLnkTargetSelf">Same Window (_self)</option>
							    <option value="_parent" fcklang="DlgLnkTargetParent">Parent Window (_parent)</option>
						    </select>
					    </div>
				    </td>
			    </tr>
		    </table>
	    </div>
	    <div id="divAdvanced" style="display: none">
		    <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
			    <tr>
				    <td valign="top" width="50%">
					    <span fcklang="DlgGenId">Id</span><br />
					    <input id="txtAttId" style="width: 100%" type="text" />
				    </td>
				    <td width="1">
					    &nbsp;&nbsp;</td>
				    <td valign="top">
					    <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
						    <tr>
							    <td width="60%">
								    <span fcklang="DlgGenLangDir">Language Direction</span><br />
								    <select id="cmbAttLangDir" style="width: 100%">
									    <option value="" fcklang="DlgGenNotSet" selected="selected">&lt;not set&gt;</option>
									    <option value="ltr" fcklang="DlgGenLangDirLtr">Left to Right (LTR)</option>
									    <option value="rtl" fcklang="DlgGenLangDirRtl">Right to Left (RTL)</option>
								    </select>
							    </td>
							    <td width="1%">
								    &nbsp;&nbsp;</td>
							    <td nowrap="nowrap">
								    <span fcklang="DlgGenLangCode">Language Code</span><br />
								    <input id="txtAttLangCode" style="width: 100%" type="text" />&nbsp;
							    </td>
						    </tr>
					    </table>
				    </td>
			    </tr>
			    <tr>
				    <td colspan="3">&nbsp;
					    </td>
			    </tr>
			    <tr>
				    <td colspan="3">
					    <span fcklang="DlgGenLongDescr">Long Description URL</span><br />
					    <input id="txtLongDesc" style="width: 100%" type="text" />
				    </td>
			    </tr>
			    <tr>
				    <td colspan="3">&nbsp;
					    </td>
			    </tr>
			    <tr>
				    <td valign="top">
					    <span fcklang="DlgGenClass">Stylesheet Classes</span><br />
					    <input id="txtAttClasses" style="width: 100%" type="text" />
				    </td>
				    <td>
				    </td>
				    <td valign="top">
					    &nbsp;<span fcklang="DlgGenTitle">Advisory Title</span><br />
					    <input id="txtAttTitle" style="width: 100%" type="text" />
				    </td>
			    </tr>
		    </table>
		    <span fcklang="DlgGenStyle">Style</span><br />
		    <input id="txtAttStyle" style="width: 100%" type="text" />
	    </div>
</body>
</html>

