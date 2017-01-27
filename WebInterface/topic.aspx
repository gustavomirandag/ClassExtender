<%@ Page Language="C#" MasterPageFile="~/top.Master" AutoEventWireup="true" CodeBehind="topic.aspx.cs" Inherits="WebInterface._class" Title="Topic" ValidateRequest="false" EnableViewStateMac="false" MaintainScrollPositionOnPostback="true" %>

<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"><asp:AccessDataSource ID="dbDataSourceMessages" runat="server" DataFile="~/data/db.mdb" 
            DeleteCommand="DELETE FROM [Messages] WHERE ([id] = ?)"
            InsertCommand="INSERT INTO Messages (recipient, sender, sentByTeacher, topic_id, title, body) VALUES (?,?,?,?,?,?)"
            SelectCommand='SELECT * FROM [Messages] WHERE (topic_id = ?) AND ((deletedByStudent=0) OR (?)) AND ((recipient = ?) OR (sender = ?) OR (recipient = "Everybody") OR (recipient="Teachers" AND isTeacher) OR (recipient="Students" AND NOT isTeacher))ORDER BY Format(sentDateTime,"mm/dd/yyyy hh:nn:ss") ASC' 
            UpdateCommand="UPDATE [Messages] SET [title]=?, [body] = ?, [recipient]=? WHERE [id] = ?"><DeleteParameters>
<asp:Parameter Name="id" Type="String" />
</DeleteParameters>
<InsertParameters>
<asp:Parameter DefaultValue="Everybody" Name="recipient" />
<asp:SessionParameter DefaultValue="NULL" Name="sender" SessionField="userId" Type="String" />
<asp:SessionParameter DefaultValue="" Name="sentByTeacher" SessionField="isTeacher"
                    Type="Boolean" />
<asp:SessionParameter DefaultValue="" Name="topicId" SessionField="topicId" />
<asp:Parameter Name="title" />
<asp:Parameter DefaultValue="" Name="body" />
</InsertParameters>
<UpdateParameters>
<asp:Parameter Name="title" />
<asp:Parameter DefaultValue="" Name="body" />
<asp:Parameter Name="recipient" />
<asp:Parameter Name="id" />
</UpdateParameters>
<SelectParameters>
<asp:SessionParameter Name="topicId" SessionField="topicId" Type="Int32" defaultvalue="" />
<asp:SessionParameter DefaultValue="0" Name="isTeacher" SessionField="isTeacher" />
<asp:SessionParameter Name="myUserId" SessionField="userId" defaultvalue="" />
<asp:SessionParameter Name="myUserId" SessionField="userId" />
    <asp:SessionParameter DefaultValue="0" Name="isTeacher" SessionField="isTeacher" />
    <asp:SessionParameter DefaultValue="0" Name="isTeacher" SessionField="isTeacher" />
</SelectParameters>
</asp:AccessDataSource> <asp:AccessDataSource ID="dbDataSourceTeachers" runat="server" SelectCommand="SELECT Users.user_name, Users.id FROM Users INNER JOIN User_Topic ON (Users.id = User_Topic.user_id) WHERE (User_Topic.topic_id = ?) AND (Users.is_teacher = True) AND (User_Topic.finishDateTime IS NULL)" DataFile="~/data/db.mdb">
        <SelectParameters>
            <asp:SessionParameter Name="topicId" SessionField="topicId" Type="Int64" />
        </SelectParameters>
    </asp:AccessDataSource> <asp:AccessDataSource ID="dbDataSourceStudents" runat="server" SelectCommand="SELECT Users.user_name, Users.id FROM Users INNER JOIN User_Topic ON (Users.id = User_Topic.user_id) WHERE (User_Topic.topic_id = ?) AND (Users.is_teacher = False) AND (User_Topic.finishDateTime IS NULL)" DataFile="~/data/db.mdb">
        <SelectParameters>
            <asp:SessionParameter Name="topicId" SessionField="topicId" Type="Int64" />
        </SelectParameters>
    </asp:AccessDataSource> <asp:UpdatePanel ID="upUpdateButtons" runat="server">
        <ContentTemplate>
            <asp:Button ID="btnUpdateMsgs" style="display:none;" runat="server" OnClick="btnUpdateMsgs_Click" Text="btnUpdateMsgs" />
        </ContentTemplate>
    </asp:UpdatePanel> <iframe id="iframeTopicCometUpdate" style="display:none;" src="topicCometUpdate.aspx"></iframe>&nbsp; <div id="menu"><span class="title_menu"><h3>Participants</h3></span><fieldset><legend>Teachers</legend><asp:UpdatePanel id="upTeachers" runat="server" UpdateMode="Conditional" RenderMode="Inline"><ContentTemplate>
<asp:ListBox id="lbTeachers" runat="server" CssClass="list_box_teachers" AutoPostBack="True" OnSelectedIndexChanged="lbTeachers_SelectedIndexChanged" ToolTip="Select a teacher to see the ID" DataValueField="id" DataTextField="user_name" DataSourceID="dbDataSourceTeachers"></asp:ListBox> 
</ContentTemplate>
</asp:UpdatePanel> </fieldset> <fieldset><legend>Students</legend><asp:UpdatePanel ID="upStudents" runat="server" RenderMode="Inline" UpdateMode="Conditional"><ContentTemplate>
<asp:ListBox id="lbStudents" runat="server" CssClass="list_box_students" AutoPostBack="True" OnSelectedIndexChanged="lbStudents_SelectedIndexChanged" ToolTip="Select a student to see the ID" DataValueField="id" DataTextField="user_name" DataSourceID="dbDataSourceStudents"></asp:ListBox> 
</ContentTemplate>
</asp:UpdatePanel> </fieldset> </div><div id="content"><span class="title_content"><h3 id="contentTitle" runat="server">Content of INF1347</h3></span><div id="main_content"><asp:UpdatePanel ID="upMessages" runat="server" RenderMode="Inline" ChildrenAsTriggers="False" UpdateMode="Conditional"><ContentTemplate>
                                       <asp:Repeater ID="repeaterMessages" DataSourceID="dbDataSourceMessages" runat="server">
                                          <ItemTemplate>
                                            <asp:FormView ID="fvMessage" runat="server" BackColor="White" BorderColor="White"
                                            BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1"
                                            DataSourceID="dbDataSourceMessages" PageIndex="<%# Container.ItemIndex %>" DataKeyNames="id"
                                            Width="100%" OnModeChanged="messageModeChanged" OnModeChanging="messageModeChanging" OnItemCreated="messageItemCreated" OnItemDeleted="messageItemDeleted" OnItemDeleting="fvMessage_ItemDeleting">
                                                <ItemTemplate>
                                                    <div id="post_forum">
                                                        <span class='<%# (Eval("sender") != null) ? ((Eval("sender").ToString() == Eval("recipient").ToString()) ? "title_note" : (Convert.ToBoolean(Session["isTeacher"]) ? (Convert.ToBoolean(Eval("deletedByStudent")) ? "title_teacher_deleted_student_msg" : ((Core.Control.DbControl.getInstance().getUser(Eval("sender").ToString()).isTeacher) ? "title_teacher" : "title_student")) : ((Core.Control.DbControl.getInstance().getUser(Eval("sender").ToString()).isTeacher) ? "title_teacher" : "title_student"))) : "" %>'>
                                                            <h2 class="post_forum_general"><asp:Label ID="lbTitle" runat="server" Text='<%# Eval("title") + (Convert.ToBoolean(Eval("deletedByStudent")) ? " (deleted by student)" : "") %>'/></h2>
                                                            <p class="post_forum_general">Recipient: <asp:Label ID="lbRecipient" runat="server"/></p>
                                                            <p class="post_forum_general">Sender: <asp:Label ID="lbSender" runat="server"/></p>
                                                            <p class="post_forum_general">Date Time: <asp:Label ID="lbSentDateTime" runat="server" Text='<%# Eval("sentDateTime") %>'/></p>
                                                            <asp:Label ID="lbInvisibleId" runat="server" Text='<%# Eval("id") %>' Visible="false" />
                                                        </span>

                                                        <span class="box_forum">
                                                            <asp:Label ID="lbBody" CssClass="post_forum_body" runat="server" Text='<%# Eval("body") %>'/>
                                                            <span class="button_forum">
                                                                <asp:ImageButton ID="ibEdit" CssClass="bt_forum_edit" ImageUrl="img/bt_edit.gif" CommandName="Edit" Visible='<%# Eval("sender").ToString() == Session["userId"].ToString() %>' runat="server" />
                                                                <asp:ImageButton ID="ibDelete" CssClass="bt_forum_delete" ImageUrl="img/bt_delete.gif" CommandName="Delete" OnClientClick='<%# Convert.ToBoolean(Session["isTeacher"]) ? "return confirm(\"Confirma a exclusão?\")" : "return confirm(\"Confirma a exclusão? (Your message will continue avaiable for the teacher)\")" %>' Visible='<%# (Eval("sender").ToString() == Session["userId"].ToString()) || Convert.ToBoolean(Session["isTeacher"]) %>' runat="server" />
                                                            </span>
                                                        </span>
                                                    </div>
                                                    
                                                 </ItemTemplate>
                                                 <EditItemTemplate>
                                                    <div id="post_forum">
                                                        <span class='<%# (Eval("sender") != null) ? ((Eval("sender").ToString() == Eval("recipient").ToString()) ? "title_note" : ((Convert.ToBoolean(Session["isTeacher"])) ? "title_teacher" : "title_student")) : "" %>'>
                                                            <h2 class="post_forum_general">Title (optional): <asp:TextBox ID="tbTitle" Text='<%# Bind("title") %>' Width="393px" runat="server" /></h2>
                                                            <p class="post_forum_general">Recipient: <asp:DropDownList ID="ddlRecipient" SelectedValue='<%# Bind("recipient") %>' runat="server"/></p>
                                                            <p class="post_forum_general">Date Time: <asp:Label ID="lbsentDateTime" runat="server" Text='<%# Eval("sentDateTime") %>'/></p>
                                                            <asp:Label ID="lbInvisibleId" runat="server" Text='<%# Eval("id") %>' Visible="false" />
                                                        </span>
                                                        <span class="box_forum">
                                                            <FCKeditorV2:FCKeditor ID="htmlEditorBody" runat="server" Value='<%# Bind("body") %>'>
                                                            </FCKeditorV2:FCKeditor>
                                                            <span class="button_forum">
                                                                <asp:ImageButton ID="ibUpdate" CssClass="bt_forum_update" ImageUrl="img/bt_update.gif" CommandName="Update" runat="server"    />                                                   
                                                                <asp:ImageButton ID="ibCancel" CssClass="bt_forum_cancel" ImageUrl="img/bt_cancel.gif" CommandName="Cancel" runat="server"    />                                                   
                                                            </span>
                                                        </span>
                                                    </div>
                                                  </EditItemTemplate>
                                                    <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                                                    <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                                                    <PagerStyle ForeColor="Black" HorizontalAlign="Right" BackColor="#C6C3C6" />
                                                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                                                    <EditRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                                                </asp:FormView>
                                          </ItemTemplate>
                                       </asp:Repeater>
                            &nbsp;
                        </ContentTemplate>
<Triggers>
                                <asp:AsyncPostBackTrigger ControlID="repeaterMessages" />
                            </Triggers>
</asp:UpdatePanel> <asp:UpdatePanel ID="upInsertMessage" runat="server"><ContentTemplate>
<asp:FormView id="fvInsertMessage" runat="server" DataSourceID="dbDataSourceMessages" OnItemInserted="fvInsertMessage_ItemInserted" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" Width="100%" OnModeChanged="messageModeChanged" OnModeChanging="messageModeChanging" OnItemCreated="messageItemCreated">
                                <ItemTemplate>
                                    <span class="box_forum">
                                        <span class="button_forum">
                                            <asp:ImageButton ID="ibNew" CssClass="bt_forum_new" ImageUrl="img/bt_new.gif" CommandName="New" runat="server"    />
                                        </span>
                                    </span>
                                 </ItemTemplate>
                                  <InsertItemTemplate>
                                      <div id="post_forum">
                                            <span class='<%# (Convert.ToBoolean(Session["isTeacher"])) ? "title_teacher" : "title_student" %>'>
                                                <h2 class="post_forum_general">Title (optional): <asp:TextBox ID="tbTitle" Text='<%# Bind("title") %>' runat="server" Width="393px" ></asp:TextBox></h2>
                                                <p class="post_forum_general">Recipient: <asp:DropDownList ID="ddlRecipient" SelectedValue='<%# Bind("recipient") %>' runat="server"></asp:DropDownList></p>
                                            </span>
                                            <span class="box_forum">       
                                                <FCKeditorV2:FCKeditor ID="htmlEditorBody" runat="server" Value='<%# Bind("body") %>'>
                                                </FCKeditorV2:FCKeditor>                                                                                             
                                                <span class="button_forum"> 
                                                    <asp:ImageButton ID="ibInsert" CssClass="bt_forum_insert" ImageUrl="img/bt_insert.gif" CommandName="Insert" runat="server"    />                                                   
                                                    <asp:ImageButton ID="ibCancel" CssClass="bt_forum_cancel" ImageUrl="img/bt_cancel.gif" CommandName="Cancel" runat="server"    />                                                   
                                                </span>
                                            </span>
                                        </div>
                                   </InsertItemTemplate>
                                   <EmptyDataTemplate>
                                    <span class="box_forum">
                                        <span class="button_forum">
                                            <asp:ImageButton ID="ibNew" CssClass="bt_forum_new" ImageUrl="img/bt_new.gif" CommandName="New" runat="server"    />
                                            <span class="startHere"><<< Click here to START POSTING!</span>
                                        </span>
                                    </span>
                                    </EmptyDataTemplate>
                                    <FooterStyle BackColor="#C6C3C6" ForeColor="Black"    />
                                    <RowStyle BackColor="#DEDFDE" ForeColor="Black"    />
                                    <PagerStyle ForeColor="Black" HorizontalAlign="Right" BackColor="#C6C3C6"    />
                                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF"    />
                                    <EditRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White"    />
                            </asp:FormView> 
</ContentTemplate>
</asp:UpdatePanel> </div></div><br />
</asp:Content>
