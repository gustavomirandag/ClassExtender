<%@ Page Language="C#" MasterPageFile="~/top.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="WebInterface.home" Title="CE :: Class Extender" ValidateRequest="false" EnableViewStateMac="false" MaintainScrollPositionOnPostback="true" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="columns">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
            <fieldset style="margin:0 5px 5px 5px; border-bottom-width:medium;">
                     <cc1:ReorderList ID="reorderListContentItems" style="margin:0" runat="server" DragHandleAlignment="Left" SortOrderField="position" DataSourceID="dbDataSourceContentItems" DataKeyField="id" PostBackOnReorder="False" ItemInsertLocation="End" ShowInsertItem="false" OnItemCreated="reorderList_contentItemCreated" OnItemReorder="reorderListContentItems_ItemReorder">
                        <ItemTemplate>
                            <div id="Div1">
                                <span class="box_forum">
                                    <h2 class="post_forum">
                                        <asp:Label ID="lbTitle" runat="server" Text='<%# Eval("title") %>'></asp:Label></h2>
                                    <p class="post_forum_body">
                                    <asp:Label ID="lbInvisibleId" runat="server" Text='<%# Eval("privacy") %>' Visible="false"></asp:Label>
                                    <asp:Label ID="lbPosition" runat="server" Text='<%# Eval("position") %>' Visible="false"></asp:Label>
                                    <asp:Label ID="lbContent" runat="server" Text='<%# Eval("content") %>'></asp:Label>
                                    <span class="button_forum">
                                        <asp:ImageButton ID="ibEdit" runat="server" CommandName="Edit" CssClass="bt_forum_edit"
                                            ImageUrl="img/bt_edit.gif" Visible='<%# Eval("owner").ToString() == Session["userId"].ToString() %>' />
                                        <asp:ImageButton ID="ibDelete" runat="server" CommandName="Delete" CssClass="bt_forum_delete"
                                            ImageUrl="img/bt_delete.gif" Visible='<%# (Eval("owner").ToString() == Session["userId"].ToString()) || Convert.ToBoolean(Session["isTeacher"]) %>' />
                                    </span>
                                </span></P></div>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <div id="post_forum">
                                <span class="box_forum">
                                            <h2 class="post_forum_content_item">
                                                Title (optional):
                                                <asp:TextBox ID="tbTitle" runat="server" Text='<%# Bind("title") %>' Width="393px"></asp:TextBox>
                                            </h2>
                                            
                                             <h2 class="post_forum_content_item">
                                                Privacy:
                                                <asp:DropDownList ID="ddlPrivacy" runat="server" SelectedValue='<%# Bind("privacy") %>'>
                                                    <asp:ListItem Selected="True" Value="public_internet">Public (all internet users)</asp:ListItem>
                                                    <asp:ListItem Value="private_classx">Private - all classX users</asp:ListItem>
                                                    <asp:ListItem Value="private_classes">Private - my classes (students &amp; teachers of my classes)</asp:ListItem>
                                                    <asp:ListItem Value="private_me">Private - only me</asp:ListItem>
                                                </asp:DropDownList>
                                             </h2>
                                             <br />
                                             <br />
                                   <asp:Label ID="lbInvisibleId" runat="server" Text='<%# Bind("id") %>' Visible="false"></asp:Label>
                                   <asp:Label ID="lbPosition" runat="server" Text='<%# Bind("position") %>' Visible="false"></asp:Label>
                                    <span class="box_forum">
                                    <FCKeditorV2:FCKeditor ID="htmlEditorBody" runat="server" Value='<%# Bind("content") %>'>
                                    </FCKeditorV2:FCKeditor>
                                    <span class="button_forum">
                                        <asp:ImageButton ID="ibUpdate" runat="server" CommandName="Update" CssClass="bt_forum_update"
                                            ImageUrl="img/bt_update.gif" />
                                        <asp:ImageButton ID="ibCancel" runat="server" CommandName="Cancel" CssClass="bt_forum_cancel"
                                            ImageUrl="img/bt_cancel.gif" />
                                    </span></span></span></div>
                        </EditItemTemplate>
                        <ReorderTemplate>
                            <asp:Panel ID="Panel1" runat="server" style="border: dashed thin black; width: 100%; height: 100%;" >
                            </asp:Panel>
                        </ReorderTemplate>
                        <DragHandleTemplate>
                            <div style="width: 17px;height: 60px; margin:0 7px 3px 0; background-color: teal;cursor: move;border: outset thin white; font-weight: bold; font-size: 13px; color: white; font-family: 'Times New Roman';">
                                &nbsp;M<br />
                                &nbsp;O<br />
                                &nbsp;V<br />
                                &nbsp;E<br />
                            </div>
                        </DragHandleTemplate>
                    </cc1:ReorderList><asp:UpdatePanel ID="upInsertItem" runat="server">
                        <ContentTemplate>
                            <asp:FormView id="fvInsertItem" runat="server" Width="100%" DataSourceID="dbDataSourceContentItems" CellSpacing="1" CellPadding="3" BorderWidth="2px" BorderStyle="Ridge" BorderColor="White" BackColor="White" OnItemCreated="formView_contentItemCreated">
                                <ItemTemplate>
                                    <span class="box_forum"><span class="button_forum">
                                        <asp:ImageButton ID="ibNew" runat="server" CommandName="New" CssClass="bt_forum_new"
                                        ImageUrl="img/bt_new.gif" />
                                    </span></span>
                                </ItemTemplate>
                                <InsertItemTemplate>
                                    <div id="post_forum">
                                        <span class="box_forum">
                                            <h2 class="post_forum_content_item">
                                                Title (optional):
                                                <asp:TextBox ID="tbTitle" runat="server" Text='<%# Bind("title") %>' Width="393px"></asp:TextBox>
                                            </h2>
                                            
                                             <h2 class="post_forum_content_item">
                                                Privacy:
                                                <asp:DropDownList ID="ddlPrivacy" runat="server" SelectedValue='<%# Bind("privacy") %>'>
                                                    <asp:ListItem Selected="True" Value="public_internet">Public (all internet users)</asp:ListItem>
                                                    <asp:ListItem Value="private_classx">Private - all classX users</asp:ListItem>
                                                    <asp:ListItem Value="private_classes">Private - my classes (students &amp; teachers of my classes)</asp:ListItem>
                                                    <asp:ListItem Value="private_me">Private - only me</asp:ListItem>
                                                </asp:DropDownList>
                                             </h2>
                                        
                                             <br />
                                             <br />
                                        <span class="box_forum">
                                            <FCKeditorV2:FCKeditor ID="htmlEditorBody" runat="server" Value='<%# Bind("content") %>'>
                                            </FCKeditorV2:FCKeditor>
                                            <span class="button_forum">
                                                <asp:ImageButton ID="ibInsert" runat="server" CommandName="Insert" CssClass="bt_forum_insert"
                                                ImageUrl="img/bt_insert.gif" />
                                                <asp:ImageButton ID="ibCancel" runat="server" CommandName="Cancel" CssClass="bt_forum_cancel"
                                                ImageUrl="img/bt_cancel.gif" />
                                            </span></span></span>
                                    </div>
                                </InsertItemTemplate>
                                <EmptyDataTemplate>
                                    <span class="box_forum"><span class="button_forum">
                                        <asp:ImageButton ID="ibNew" runat="server" CommandName="New" CssClass="bt_forum_new"
                                        ImageUrl="img/bt_new.gif" />
                                        <span class="startHere"><<< Click here to CREATE CONTENT ITEMS!</span> </span></span>
                                </EmptyDataTemplate>
                                <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                                <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                                <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                                <EditRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                            </asp:FormView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
        </fieldset>
            </ContentTemplate>
        </asp:UpdatePanel>
        
    </div>








    <asp:AccessDataSource ID="dbDataSourceMessages" runat="server" DataFile="~/data/db.mdb"
        DeleteCommand="DELETE FROM [Messages] WHERE ([id] = ?)" InsertCommand="INSERT INTO Messages (recipient, sender, sentByTeacher, title, body) VALUES (?,?,?,?,?)"
        SelectCommand='SELECT * FROM [Messages] WHERE (((recipient = ?) OR (sender = ?) OR (recipient = "Everybody")) AND (topic_id IS NULL)) ORDER BY Format(sentDateTime,"mm/dd/yyyy hh:nn:ss") DESC'
        UpdateCommand="UPDATE [Messages] SET [title]=?, [body] = ?, [recipient]=? WHERE [id] = ?">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="recipient" />
            <asp:SessionParameter DefaultValue="NULL" Name="sender" SessionField="userId" Type="String" />
            <asp:SessionParameter DefaultValue="" Name="sentByTeacher" SessionField="isTeacher"
                Type="Boolean" />
            <asp:Parameter Name="title" DefaultValue="" />
            <asp:Parameter DefaultValue="" Name="body" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="title" />
            <asp:Parameter DefaultValue="" Name="body" />
            <asp:Parameter Name="recipient" />
            <asp:Parameter Name="id" />
        </UpdateParameters>
        <SelectParameters>
            <asp:SessionParameter Name="myUserId" SessionField="userId" />
            <asp:SessionParameter Name="myUserId" SessionField="userId" />
        </SelectParameters>
    </asp:AccessDataSource> 
    <asp:AccessDataSource ID="dbDataSourceContentItems" runat="server" DataFile="~/data/db.mdb"
        DeleteCommand="DELETE FROM [ContentItems] WHERE [id] = ?" InsertCommand="INSERT INTO [ContentItems] ([content], [title], [privacy], [owner]) VALUES (?, ?, ?, ?)"
        SelectCommand="SELECT [content], [title], [position], [id], [privacy], [owner] FROM [ContentItems] WHERE [item_group]='A' AND [owner]=? ORDER BY [position]"
        UpdateCommand="UPDATE [ContentItems] SET [position] = ?, [title]=?, [privacy]=?, [content]=? WHERE [id] = ? AND [item_group]='A'" OnInserted="dbDataSourceContentItems_Inserted">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="position" Type="Int32" />
            <asp:Parameter Name="title" />
            <asp:Parameter Name="privacy" />
            <asp:Parameter Name="content" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="content" Type="String" />
            <asp:Parameter Name="title" Type="String" />
            <asp:Parameter Name="privacy" />
            <asp:SessionParameter DefaultValue="NULL" Name="owner" SessionField="userId" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="NULL" Name="owner" SessionField="userId" />
        </SelectParameters>
    </asp:AccessDataSource>
    <div id="menu"><span class="title_menu"><h3>Courses</h3></span><fieldset><legend>Current</legend><asp:UpdatePanel ID="UpdatePanelCurrentCourses" runat="server" RenderMode="Inline">
                <ContentTemplate>
                    <asp:ListBox ID="lbCurrentCourses" runat="server" CssClass="list_box" AutoPostBack="True" OnSelectedIndexChanged="lbSelectedIndexChanged"></asp:ListBox>        
                </ContentTemplate>
            </asp:UpdatePanel> <asp:Button ID="btnCreateTopic" CssClass="bt" runat="server" Text="Create Topic" OnClick="btnCreateTopic_Click" /> </fieldset> <fieldset><legend>Past</legend><asp:UpdatePanel ID="upPastCourses" runat="server" RenderMode="Inline">
                <ContentTemplate>
                    <asp:ListBox ID="lbPastCourses" CssClass="list_box" runat="server" AutoPostBack="true" OnSelectedIndexChanged="lbSelectedIndexChanged"></asp:ListBox>
                </ContentTemplate>
            </asp:UpdatePanel> </fieldset> </div><div id="content"><span class="title_content"><h3>Alerts</h3></span><div id="main_content"><asp:UpdatePanel ID="upUpdateStartTopic" runat="server" RenderMode="Inline">
                        <ContentTemplate>
                            <div id="divStartTopic" class="divInternalContent" runat="server" visible="false">
                                <span class="title_content2">
                                    <h4>
                                        Create a Topic</h4>			
                                </span>
                                <label class="labelDefault">Please, enter a topic title:</label><br />
                                <asp:TextBox ID="tbTopicTitle" runat="server" CssClass="textBoxDefault" Width="447px"></asp:TextBox>
                                <asp:Button ID="btnJustStartTopic" CssClass="btInline" runat="server" Text="Create" OnClick="btnJustStartTopic_Click" Width="125px" />
                                <asp:Button ID="btnStartAndEnterTopic" CssClass="btInline" runat="server" Text="Create & Enter" OnClick="btnStartAndEnterTopic_Click" Width="144px" />
                                <asp:Button ID="btnCancelTopic" CssClass="btCancel" runat="server" Text="Cancel" OnClick="btnCancelTopic_Click" />
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel> <div class="divInternalContent"><span class="title_content2"><h4>Ative Topics</h4></span><asp:UpdatePanel ID="upUpdateStartedTopics" runat="server" RenderMode="Inline"><ContentTemplate>
<asp:ListBox id="lbStartedTopics" runat="server" Width="100%" Height="123px"></asp:ListBox> 
</ContentTemplate>
</asp:UpdatePanel> &nbsp; <asp:Button ID="btnEnterStartedTopic" CssClass="bt" runat="server" Text="Enter Topic" OnClick="btnEnterStartedTopic_Click" /> </div><asp:UpdatePanel ID="upArchivedTopics" runat="server" RenderMode="Inline"><ContentTemplate>
                            <div id="divArchivedTopics" class="divInternalContent" runat="server" visible="false">
                                <div class="divInternalContent">
                                    <span class="title_content2">
                                        <h4 id="h4ArchivedTopics" runat="server">Archived Topics of INF1347</h4>			
                                    </span>

                                    <asp:ListBox ID="lbArchivedTopics" runat="server" Width="100%" Height="123px"></asp:ListBox>
                                    &nbsp;
                                    <asp:Button ID="btnEnterTopic" CssClass="bt" runat="server" Text="Enter Topic" OnClick="btnEnterArchivedTopic_Click" />&nbsp;
                                    <asp:Button ID="btnActiveTopic" CssClass="bt" runat="server" Text="Active Topic" OnClick="btnActiveTopic_Click" />
                                </div>  
                            </div>  
                        </ContentTemplate>
</asp:UpdatePanel> <div class="divInternalContent"><span class="title_content2"><h4>Messages for me and Annotations</h4></span><asp:UpdatePanel ID="upMessages" runat="server" ChildrenAsTriggers="False" RenderMode="Inline"
                            UpdateMode="Conditional"><ContentTemplate>
                                <asp:Repeater ID="repeaterMessages" runat="server" DataSourceID="dbDataSourceMessages">
                                    <ItemTemplate>
                                        <asp:FormView ID="fvMessage" runat="server" BackColor="White" BorderColor="White"
                                            BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataKeyNames="id"
                                            DataSourceID="dbDataSourceMessages" OnItemCreated="messageItemCreated" OnModeChanged="messageModeChanged"
                                            OnModeChanging="messageModeChanging" PageIndex="<%# Container.ItemIndex %>" Width="100%">
                                            <ItemTemplate>
                                                <div id="post_forum">
                                                    <span class='<%# (Eval("sender") != null) ? ((Eval("sender").ToString() == Eval("recipient").ToString()) ? "title_note" : ((Core.Control.DbControl.getInstance().getUser(Eval("sender").ToString()).isTeacher) ? "title_teacher" : "title_student")) : "" %>'>
                                                        <h2 class="post_forum_general">
                                                            <asp:Label ID="lbTitle" runat="server" Text='<%# Eval("title") %>'></asp:Label></h2>
                                                        <p class="post_forum_general">
                                                            Recipient:
                                                            <asp:Label ID="lbRecipient" runat="server"></asp:Label></p>
                                                        <p class="post_forum_general">
                                                            Sender: 
                                                            <asp:Label ID="lbSender" runat="server"></asp:Label></p>
                                                        <p class="post_forum_general">
                                                            Date Time:
                                                            <asp:Label ID="lbSentDateTime" runat="server" Text='<%# Eval("sentDateTime") %>'></asp:Label></p>
                                                        <asp:Label ID="lbInvisibleId" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>
                                                    </span><span class="box_forum">
                                                        <asp:Label ID="lbBody" CssClass="post_forum_body" runat="server" Text='<%# Eval("body") %>'></asp:Label>
                                                        <span class="button_forum">
                                                            <asp:ImageButton ID="ibEdit" runat="server" CommandName="Edit" CssClass="bt_forum_edit"
                                                                ImageUrl="img/bt_edit.gif" Visible='<%# Eval("sender").ToString() == Session["userId"].ToString() %>' />
                                                            <asp:ImageButton ID="ibDelete" runat="server" CommandName="Delete" CssClass="bt_forum_delete"
                                                                ImageUrl="img/bt_delete.gif" Visible='<%# (Eval("sender").ToString() == Session["userId"].ToString()) || Convert.ToBoolean(Session["isTeacher"]) %>' />
                                                        </span></span>
                                                </div>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <div id="post_forum">
                                                    <span class='<%# (Eval("sender") != null) ? ((Eval("sender").ToString() == Eval("recipient").ToString()) ? "title_note" : ((Convert.ToBoolean(Session["isTeacher"])) ? "title_teacher" : "title_student")) : "" %>'>
                                                        <h2 class="post_forum_general">
                                                            Title (optional):
                                                            <asp:TextBox ID="tbTitle" runat="server" Text='<%# Bind("title") %>' Width="393px"></asp:TextBox></h2>
                                                        <p class="post_forum_general">
                                                            Recipient:
                                                            <asp:DropDownList ID="ddlRecipient" runat="server" SelectedValue='<%# Bind("recipient") %>'>
                                                            </asp:DropDownList></p>
                                                        <p class="post_forum_general">
                                                            Date Time:
                                                            <asp:Label ID="lbsentDateTime" runat="server" Text='<%# Eval("sentDateTime") %>'></asp:Label></p>
                                                        <asp:Label ID="lbInvisibleId" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>
                                                    </span><span class="box_forum">
                                                        <FCKeditorV2:FCKeditor ID="htmlEditorBody" runat="server" Value='<%# Bind("body") %>'>
                                                        </FCKeditorV2:FCKeditor>
                                                        <span class="button_forum">
                                                            <asp:ImageButton ID="ibUpdate" runat="server" CommandName="Update" CssClass="bt_forum_update"
                                                                ImageUrl="img/bt_update.gif" />
                                                            <asp:ImageButton ID="ibCancel" runat="server" CommandName="Cancel" CssClass="bt_forum_cancel"
                                                                ImageUrl="img/bt_cancel.gif" />
                                                        </span></span>
                                                </div>
                                            </EditItemTemplate>
                                            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                                            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                                            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
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
<asp:FormView id="fvInsertMessage" runat="server" Width="100%" DataSourceID="dbDataSourceMessages" OnModeChanging="messageModeChanging" OnModeChanged="messageModeChanged" OnItemCreated="messageItemCreated" CellSpacing="1" CellPadding="3" BorderWidth="2px" BorderStyle="Ridge" BorderColor="White" BackColor="White" OnItemInserted="fvInsertMessage_ItemInserted">
                            <ItemTemplate>
                                <span class="box_forum"><span class="button_forum">
                                    <asp:ImageButton ID="ibNew" runat="server" CommandName="New" CssClass="bt_forum_new"
                                        ImageUrl="img/bt_new.gif" />
                                </span></span>
                            </ItemTemplate>
                            <InsertItemTemplate>
                                <div id="post_forum">
                                    <span class='<%# (Convert.ToBoolean(Session["isTeacher"])) ? "title_teacher" : "title_student" %>'>
                                        <h2 class="post_forum_general">
                                            Title (optional):
                                            <asp:TextBox ID="tbTitle" runat="server" Text='<%# Bind("title") %>' Width="393px"></asp:TextBox></h2>
                                        <p class="post_forum_general">
                                            Recipient:
                                            <asp:DropDownList ID="ddlRecipient" runat="server" SelectedValue='<%# Bind("recipient") %>'>
                                            </asp:DropDownList></p>
                                    </span><span class="box_forum">
                                        <FCKeditorV2:FCKeditor ID="htmlEditorBody" runat="server" Value='<%# Bind("body") %>'>
                                        </FCKeditorV2:FCKeditor>
                                        <span class="button_forum">
                                            <asp:ImageButton ID="ibInsert" runat="server" CommandName="Insert" CssClass="bt_forum_insert"
                                                ImageUrl="img/bt_insert.gif" />
                                            <asp:ImageButton ID="ibCancel" runat="server" CommandName="Cancel" CssClass="bt_forum_cancel"
                                                ImageUrl="img/bt_cancel.gif" />
                                        </span></span>
                                </div>
                            </InsertItemTemplate>
                            <EmptyDataTemplate>
                                <span class="box_forum"><span class="button_forum">
                                    <asp:ImageButton ID="ibNew" runat="server" CommandName="New" CssClass="bt_forum_new"
                                        ImageUrl="img/bt_new.gif" />
                                    <span class="startHere"><<< Click here to START POSTING!</span> </span></span>
                            </EmptyDataTemplate>
                            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                            <EditRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                        </asp:FormView> 
</ContentTemplate>
</asp:UpdatePanel> </div></div></div>
</asp:Content>
