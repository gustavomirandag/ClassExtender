<%@ Page Language="C#" MasterPageFile="~/top.Master" AutoEventWireup="true" CodeBehind="lesson.aspx.cs" Inherits="WebInterface._class" Title="Lesson" ValidateRequest="false" EnableViewStateMac="false" MaintainScrollPositionOnPostback="true" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:AccessDataSource ID="dbDataSourceMessages" runat="server" DataFile="~/data/db.mdb" 
            DeleteCommand="DELETE FROM [Messages] WHERE ([id] = ?)"
            InsertCommand="INSERT INTO Messages (recipient, sender, sentByTeacher, lesson_id, title, body) VALUES (?,?,?,?,?,?)"
            SelectCommand='SELECT * FROM [Messages] WHERE (lesson_id = ?) AND ((recipient = ?) OR (recipient = "Everybody"))ORDER BY Format(sentDateTime,"mm/dd/yyyy hh:nn:ss") ASC' 
            UpdateCommand="UPDATE [Messages] SET [title]=?, [body] = ?, [recipient]=? WHERE [id] = ?">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter DefaultValue="Everybody" Name="recipient" />
                <asp:SessionParameter DefaultValue="NULL" Name="sender" SessionField="userId" Type="String" />
                <asp:SessionParameter DefaultValue="" Name="sentByTeacher" SessionField="isTeacher"
                    Type="Boolean" />
                <asp:SessionParameter DefaultValue="" Name="lessonId" SessionField="lessonId" />
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
                <asp:SessionParameter Name="lessonId" SessionField="lessonId" Type="Int32" />
                <asp:SessionParameter Name="myUserId" SessionField="userId" />
            </SelectParameters>
        </asp:AccessDataSource>
    <asp:AccessDataSource ID="dbDataSourceTeachers" runat="server" SelectCommand="SELECT Users.user_name, Users.id FROM Users INNER JOIN User_Lesson ON (Users.id = User_Lesson.user_id) WHERE (User_Lesson.lesson_id = ?) AND (Users.is_teacher = True) AND (User_Lesson.finishDateTime IS NULL)" DataFile="~/data/db.mdb">
        <SelectParameters>
            <asp:SessionParameter Name="lessonId" SessionField="lessonId" Type="Int64" />
        </SelectParameters>
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="dbDataSourceStudents" runat="server" SelectCommand="SELECT Users.user_name, Users.id FROM Users INNER JOIN User_Lesson ON (Users.id = User_Lesson.user_id) WHERE (User_Lesson.lesson_id = ?) AND (Users.is_teacher = False) AND (User_Lesson.finishDateTime IS NULL)" DataFile="~/data/db.mdb">
        <SelectParameters>
            <asp:SessionParameter Name="lessonId" SessionField="lessonId" Type="Int64" />
        </SelectParameters>
    </asp:AccessDataSource>
    <asp:UpdatePanel ID="upTimeToUpdate" runat="server">
        <ContentTemplate>
    <asp:Timer ID="timeToUpdate" runat="server" Interval="1000" OnTick="timeToUpdate_Tick">
    </asp:Timer>
        </ContentTemplate>
    </asp:UpdatePanel>
		    <div id="menu">
			    <span class="title_menu">
				    <h3>Participants</h3>			
			    </span>
    			
			    <fieldset>
			        <legend>Teachers</legend>
                    <asp:UpdatePanel id="upTeachers" runat="server" UpdateMode="Conditional" RenderMode="Inline">
                        <ContentTemplate>
                            <asp:ListBox ID="lbTeachers" runat="server" CssClass="list_box" DataSourceID="dbDataSourceTeachers" DataTextField="user_name" DataValueField="id" ToolTip="Select a teacher to see the ID" OnSelectedIndexChanged="lbTeachers_SelectedIndexChanged" AutoPostBack="True">
                            </asp:ListBox>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </fieldset>
    			
			    <fieldset>
			        <legend>Students</legend>
			        <asp:UpdatePanel ID="upStudents" runat="server" RenderMode="Inline" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:ListBox ID="lbStudents" runat="server" CssClass="list_box" DataSourceID="dbDataSourceStudents" DataTextField="user_name" DataValueField="id" OnSelectedIndexChanged="lbStudents_SelectedIndexChanged" ToolTip="Select a student to see the ID" AutoPostBack="True">
                            </asp:ListBox>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </fieldset>
		    </div>
		
		    <div id="content">
			    <span class="title_content">
				    <h3 id="contentTitle" runat="server">Content of INF1347</h3>			
			    </span>
    			
			    <div id="main_content">
			        <asp:UpdatePanel ID="upMessages" runat="server" RenderMode="Inline" ChildrenAsTriggers="False" UpdateMode="Conditional">
                        <ContentTemplate>
                                       <asp:Repeater ID="repeaterMessages" DataSourceID="dbDataSourceMessages" runat="server">
                                          <ItemTemplate>
                                            <asp:FormView ID="fvMessage" runat="server" BackColor="White" BorderColor="White"
                                            BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1"
                                            DataSourceID="dbDataSourceMessages" PageIndex="<%# Container.ItemIndex %>" DataKeyNames="id"
                                            Width="100%" OnModeChanged="messageModeChanged" OnModeChanging="messageModeChanging" OnItemCreated="messageItemCreated">
                                                <ItemTemplate>
                                                    <div id="post_forum">
                                                        <span class='<%# (Convert.ToBoolean(Eval("sentByTeacher"))) ? "title_teacher" : "title_student" %>'>
                                                            <h2><asp:Label ID="lbTitle" runat="server" Text='<%# Eval("title") %>'/></h2>
                                                            <p>Recipient: <asp:Label ID="lbRecipient" runat="server"/></p>
                                                            <p>Sender: <asp:Label ID="lbSender" runat="server"/></p>
                                                            <p class="small">Date Time: <asp:Label ID="lbSentDateTime" runat="server" Text='<%# Eval("sentDateTime") %>'/></p>
                                                            <asp:Label ID="lbInvisibleId" runat="server" Text='<%# Eval("id") %>' Visible="false" />
                                                        </span>
                                                        <span class="box_forum">
                                                            <asp:Label ID="lbBody" runat="server" Text='<%# Eval("body") %>'/>
                                                            <span class="button_forum">
                                                                <asp:ImageButton ID="ibEdit" CssClass="bt_forum_edit" ImageUrl="img/bt_edit.gif" CommandName="Edit" Visible='<%# Eval("sender").ToString() == Session["userId"].ToString() %>' runat="server" />
                                                                <asp:ImageButton ID="ibDelete" CssClass="bt_forum_delete" ImageUrl="img/bt_delete.gif" CommandName="Delete" Visible='<%# Eval("sender").ToString() == Session["userId"].ToString() %>' runat="server" />
                                                            </span>
                                                        </span>
                                                    </div>
                                                 </ItemTemplate>
                                                 <EditItemTemplate>
                                                    <div id="post_forum">
                                                        <span class='<%# (Convert.ToBoolean(Session["isTeacher"])) ? "title_teacher" : "title_student" %>'>
                                                            <h2>Title (optional): <asp:TextBox ID="tbTitle" Text='<%# Bind("title") %>' runat="server" /></h2>
                                                            <p>Recipient: <asp:DropDownList ID="ddlRecipient" SelectedValue='<%# Bind("recipient") %>' runat="server"/></p>
                                                            <p class="small">Date Time: <asp:Label ID="lbsentDateTime" runat="server" Text='<%# Eval("sentDateTime") %>'/></p>
                                                            <asp:Label ID="lbInvisibleId" runat="server" Text='<%# Eval("id") %>' Visible="false" />
                                                        </span>
                                                        <span class="box_forum">
                                                            <FCKeditorV2:FCKeditor ID="htmlEditorBody" runat="server" Value='<%# Bind("body") %>'>
                                                            </FCKeditorV2:FCKeditor>
                                                            <span class="button_forum">
                                                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                                                                    Text="Update" ForeColor=Black>
                                                                                </asp:LinkButton>
                                                                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                                                    Text="Cancel" ForeColor=black>
                                                                                </asp:LinkButton>
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
                            <asp:PostBackTrigger ControlID="repeaterMessages" />
                        </Triggers>
                    </asp:UpdatePanel>
                    &nbsp;&nbsp;
                                       
                                       <asp:FormView id="fvInsertMessage" runat="server" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" Width="100%" OnModeChanged="messageModeChanged" OnModeChanging="messageModeChanging" OnItemCreated="messageItemCreated" DataSourceID="dbDataSourceMessages">
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
                                                <h2>Title (optional): <asp:TextBox ID="tbTitle" Text='<%# Bind("title") %>' runat="server" ></asp:TextBox></h2>
                                                <p>Recipient: <asp:DropDownList ID="ddlRecipient" SelectedValue='<%# Bind("recipient") %>' runat="server"></asp:DropDownList></p>
                                            </span>
                                            <span class="box_forum">       
                                                <FCKeditorV2:FCKeditor ID="htmlEditorBody" runat="server" Value='<%# Bind("body") %>'>
                                                </FCKeditorV2:FCKeditor>                                                                                             
                                                <span class="button_forum">                                                    
                                                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                                        Text="Insert" ForeColor=black>
                                                                    </asp:LinkButton>
                                                    <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                                        Text="Cancel" ForeColor=Black>
                                                                    </asp:LinkButton>
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
			    </div>	
		    </div>
</asp:Content>
