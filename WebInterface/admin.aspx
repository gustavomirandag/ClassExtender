<%@ Page Language="C#" MasterPageFile="~/top.Master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="Interface_Web.admin" Title="Untitled Page" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="mainContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"><asp:AccessDataSource id="dbDataSourceMessages" runat="server" UpdateCommand="UPDATE [Messages] SET [title]=?, [body] = ?, [recipient]=? WHERE [id] = ?" SelectCommand='SELECT * FROM [Messages] WHERE (topic_id = ?) AND ((recipient = ?) OR (recipient = "Everybody"))ORDER BY Format(sentDateTime,"mm/dd/yyyy hh:nn:ss") ASC' InsertCommand="INSERT INTO Messages (recipient, sender, sentByTeacher, topic_id, title, body) VALUES (?,?,?,?,?,?)" DeleteCommand="DELETE FROM [Messages] WHERE ([id] = ?)" DataFile="~/data/db.mdb">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="String"  />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter DefaultValue="Everybody" Name="recipient"  />
                <asp:SessionParameter DefaultValue="NULL" Name="sender" SessionField="userId" Type="String"  />
                <asp:SessionParameter DefaultValue="" Name="sentByTeacher" SessionField="isTeacher"
                    Type="Boolean"  />
                <asp:SessionParameter DefaultValue="" Name="topicId" SessionField="topicId"  />
                <asp:Parameter Name="title"  />
                <asp:Parameter DefaultValue="" Name="body"  />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="title"  />
                <asp:Parameter DefaultValue="" Name="body"  />
                <asp:Parameter Name="recipient"  />
                <asp:Parameter Name="id"  />
            </UpdateParameters>
            <SelectParameters>
                <asp:SessionParameter Name="topicId" SessionField="topicId" Type="Int32"  />
                <asp:SessionParameter Name="myUserId" SessionField="userId"  />
            </SelectParameters>
        </asp:AccessDataSource> <asp:AccessDataSource id="dbDataSourceUserCourse" runat="server" SelectCommand="SELECT * FROM [User_Course_Group]" DataFile="~/data/db.mdb" DeleteCommand="DELETE FROM [User_Course_Group] WHERE [user_id] = ? AND [group_id] = ? AND [course_id] = ?" InsertCommand="INSERT INTO [User_Course_Group] ([user_id], [group_id], [course_id], [is_current]) VALUES (?, ?, ?, ?)" UpdateCommand="UPDATE [User_Course_Group] SET [is_current] = ? WHERE [user_id] = ? AND [group_id] = ? AND [course_id] = ?">
        <DeleteParameters>
            <asp:Parameter Name="user_id" Type="String" />
            <asp:Parameter Name="group_id" Type="String" />
            <asp:Parameter Name="course_id" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="is_current" Type="Boolean" />
            <asp:Parameter Name="user_id" Type="String" />
            <asp:Parameter Name="group_id" Type="String" />
            <asp:Parameter Name="course_id" Type="String" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="user_id" Type="String" />
            <asp:Parameter Name="group_id" Type="String" />
            <asp:Parameter Name="course_id" Type="String" />
            <asp:Parameter Name="is_current" Type="Boolean" />
        </InsertParameters>
    </asp:AccessDataSource> <asp:AccessDataSource id="dbDataSourceCourses" runat="server" SelectCommand="SELECT * FROM [Courses]" DataFile="~/data/db.mdb" DeleteCommand="DELETE FROM [Courses] WHERE [id] = ?" InsertCommand="INSERT INTO [Courses] ([id], [course_name], [responsable_teacher]) VALUES (?, ?, ?)" UpdateCommand="UPDATE [Courses] SET [course_name] = ?, [responsable_teacher] = ? WHERE [id] = ?">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="course_name" Type="String" />
            <asp:Parameter Name="responsable_teacher" Type="String" />
            <asp:Parameter Name="id" Type="String" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="id" Type="String" />
            <asp:Parameter Name="course_name" Type="String" />
            <asp:Parameter Name="responsable_teacher" Type="String" />
        </InsertParameters>
    </asp:AccessDataSource><asp:AccessDataSource id="dbDataSourceUsers" runat="server" SelectCommand="SELECT * FROM [Users]" DataFile="~/data/db.mdb" DeleteCommand="DELETE FROM [Users] WHERE [id] = ?" InsertCommand="INSERT INTO [Users] ([id], [user_name], [email], [user_password], [is_teacher]) VALUES (?, ?, ?, ?, ?)" UpdateCommand="UPDATE [Users] SET [user_name] = ?, [email] = ?, [user_password] = ?, [is_teacher] = ? WHERE [id] = ?">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="user_name" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="user_password" Type="String" />
            <asp:Parameter Name="is_teacher" Type="Boolean" />
            <asp:Parameter Name="id" Type="String" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="id" Type="String" />
            <asp:Parameter Name="user_name" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="user_password" Type="String" />
            <asp:Parameter Name="is_teacher" Type="Boolean" />
        </InsertParameters>
    </asp:AccessDataSource> <div id="menu"><span class="title_menu"><h3>Administrate</h3></span><asp:UpdatePanel ID="upUpdateAdministrate" runat="server" RenderMode="Inline"><ContentTemplate>
    	        <center>
    	            <asp:Button ID="btnUsers" CssClass="bt" runat="server" Text="Users" OnClick="btnUsers_Click" Width="100px" />
    	            <br />
    	            <asp:Button ID="btnCourses" CssClass="bt" runat="server" Text="Courses" OnClick="btnCourses_Click" Width="100px" />
    	            <br />
    	            <asp:Button ID="btnUserCourse" CssClass="bt" runat="server" Text="User X Course" Width="100px" OnClick="btnUserCourse_Click" />
    	        </center>
    	    </ContentTemplate>
</asp:UpdatePanel> </div><div id="content"><span class="title_content"><h3>Options</h3></span><div id="main_content"><asp:UpdatePanel ID="upGeral" runat="server" RenderMode="Inline" OnPreRender="upGeral_PreRender"><ContentTemplate>
<DIV id="divStartHere" runat="server" visible="true"><SPAN class="startHere">&lt;&lt;&lt; SELECT an option at the MENU to START!</SPAN> </DIV><DIV id="divUsers" class="divInternalContent" runat="server" visible="false"><SPAN class="title_content2"><H4>Users</H4></SPAN><LABEL class="labelDefault">You can create, edit or delete users below:</LABEL><BR /><asp:GridView id="gvUsers" runat="server" AllowSorting="True" DataKeyNames="id" AutoGenerateColumns="False" AllowPaging="True" DataSourceID="dbDataSourceUsers" GridLines="None" ForeColor="#333333" CellPadding="4">
                                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                    <RowStyle BackColor="#E3EAEB" />
                                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                    <EditRowStyle BackColor="#D4D1C5" />
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:CommandField ShowEditButton="True" />
                                        <asp:BoundField DataField="id" HeaderText="Id" ReadOnly="True" SortExpression="id" />
                                        <asp:BoundField DataField="user_name" HeaderText="Name" SortExpression="user_name" />
                                        <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                                        <asp:BoundField DataField="user_password" DataFormatString="*******" HeaderText="Password"
                                            SortExpression="user_password" />
                                        <asp:CheckBoxField DataField="is_teacher" HeaderText="Is Teacher" SortExpression="is_teacher" />
                                        <asp:CommandField ShowDeleteButton="True" />
                                    </Columns>
                                </asp:GridView> <asp:DetailsView id="dvCreateUser" runat="server" CssClass="default_table" Width="276px" DataKeyNames="id" DataSourceID="dbDataSourceUsers" GridLines="None" ForeColor="#333333" CellPadding="4" OnModeChanging="dvCreateUser_ModeChanging" Visible="False" AutoGenerateRows="False" Height="50px">
                                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                    <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
                                    <RowStyle BackColor="#E3EAEB" />
                                    <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
                                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                    <EditRowStyle BackColor="#7C6F57" />
                                    <AlternatingRowStyle BackColor="White" />
                                    <Fields>
                                        <asp:BoundField DataField="id" HeaderText="Id" ReadOnly="True" SortExpression="id" />
                                        <asp:BoundField DataField="user_name" HeaderText="Name" SortExpression="user_name" />
                                        <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                                        <asp:BoundField DataField="user_password" HeaderText="Password" SortExpression="user_password" />
                                        <asp:CheckBoxField DataField="is_teacher" HeaderText="Is Teacher" SortExpression="is_teacher" />
                                        <asp:CommandField ShowInsertButton="True" />
                                    </Fields>
                                    <HeaderTemplate>
                                        Create a New User
                                    </HeaderTemplate>
                                </asp:DetailsView> <asp:Button id="btnCreateUser" onclick="btnCreateUser_Click" runat="server" Text="Create" CssClass="btInline" Width="125px"></asp:Button> <asp:Button id="btnCancelUser" onclick="btnCancelUser_Click" runat="server" Text="Cancel" CssClass="btCancel"></asp:Button> </DIV><DIV id="divCourses" class="divInternalContent" runat="server" visible="false"><SPAN class="title_content2"><H4>Courses</H4></SPAN><LABEL class="labelDefault">You can create, edit or delete courses below:</LABEL><BR /><asp:GridView id="gvCourses" runat="server" AllowSorting="True" DataKeyNames="id" AutoGenerateColumns="False" AllowPaging="True" DataSourceID="dbDataSourceCourses" GridLines="None" ForeColor="#333333" CellPadding="4">
                                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle BackColor="#E3EAEB" />
                                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <EditRowStyle BackColor="#D4D1C5" />
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:CommandField ShowEditButton="True" />
                                    <asp:BoundField DataField="id" HeaderText="Id" ReadOnly="True" SortExpression="id" />
                                    <asp:BoundField DataField="course_name" HeaderText="Name" SortExpression="course_name" />
                                    <asp:BoundField DataField="responsable_teacher" HeaderText="Responsable Teacher"
                                        SortExpression="responsable_teacher" />
                                    <asp:CommandField ShowDeleteButton="True" />
                                </Columns>
                            </asp:GridView> <asp:DetailsView id="dvCreateCourse" runat="server" CssClass="default_table" Width="125px" DataKeyNames="id" DataSourceID="dbDataSourceCourses" GridLines="None" ForeColor="#333333" CellPadding="4" OnModeChanging="dvCreateCourse_ModeChanging" Visible="False" AutoGenerateRows="False" Height="50px">
                                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
                                <RowStyle BackColor="#E3EAEB" />
                                <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
                                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <EditRowStyle BackColor="#7C6F57" />
                                <AlternatingRowStyle BackColor="White" />
                                <Fields>
                                    <asp:BoundField DataField="id" HeaderText="Id" ReadOnly="True" SortExpression="id" />
                                    <asp:BoundField DataField="course_name" HeaderText="Name" SortExpression="course_name" />
                                    <asp:BoundField DataField="responsable_teacher" HeaderText="Responsable Teacher"
                                        SortExpression="responsable_teacher" />
                                    <asp:CommandField ShowInsertButton="True" />
                                </Fields>
                                <HeaderTemplate>
                                    Create a New Course
                                </HeaderTemplate>
                            </asp:DetailsView> <asp:Button id="btnCreateCourse" onclick="btnCreateCourse_Click" runat="server" Text="Create" CssClass="btInline" Width="125px"></asp:Button> <asp:Button id="btnCancelCourse" onclick="btnCancelCourse_Click" runat="server" Text="Cancel" CssClass="btCancel"></asp:Button> </DIV><DIV id="divUserCourse" class="divInternalContent" runat="server" visible="false"><SPAN class="title_content2"><H4>User X Group X Course</H4></SPAN><LABEL class="labelDefault">You can create, edit or delete a relation between User, Group and a Course below:</LABEL><BR /><asp:GridView id="gvUserCourse" runat="server" AllowSorting="True" DataKeyNames="user_id,group_id,course_id" AutoGenerateColumns="False" AllowPaging="True" DataSourceID="dbDataSourceUserCourse" GridLines="None" ForeColor="#333333" CellPadding="4">
                                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <RowStyle BackColor="#E3EAEB" />
                                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <EditRowStyle BackColor="#D4D1C5" />
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:CommandField ShowEditButton="True" />
                                    <asp:BoundField DataField="user_id" HeaderText="User Id" ReadOnly="True" SortExpression="user_id" />
                                    <asp:BoundField DataField="group_id" HeaderText="Group Id" ReadOnly="True" SortExpression="group_id" />
                                    <asp:BoundField DataField="course_id" HeaderText="Course Id" ReadOnly="True" SortExpression="course_id" />
                                    <asp:CheckBoxField DataField="is_current" HeaderText="Is Current" SortExpression="is_current" />
                                    <asp:CommandField ShowDeleteButton="True" />
                                </Columns>
                            </asp:GridView> <asp:DetailsView id="dvCreateUserCourse" runat="server" CssClass="default_table" Width="256px" DataKeyNames="user_id,group_id,course_id" DataSourceID="dbDataSourceUserCourse" GridLines="None" ForeColor="#333333" CellPadding="4" OnModeChanging="dvCreateUserCourse_ModeChanging" Visible="False" AutoGenerateRows="False" Height="50px">
                                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
                                <RowStyle BackColor="#E3EAEB" />
                                <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
                                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <EditRowStyle BackColor="#7C6F57" />
                                <AlternatingRowStyle BackColor="White" />
                                <Fields>
                                    <asp:BoundField DataField="user_id" HeaderText="User Id" ReadOnly="True" SortExpression="user_id" />
                                    <asp:BoundField DataField="group_id" HeaderText="Group Id" ReadOnly="True" SortExpression="group_id" />
                                    <asp:BoundField DataField="course_id" HeaderText="Course Id" ReadOnly="True" SortExpression="course_id" />
                                    <asp:CheckBoxField DataField="is_current" HeaderText="Is Current" SortExpression="is_current" />
                                    <asp:CommandField ShowInsertButton="True" />
                                </Fields>
                                <HeaderTemplate>
                                    Create a New User X Course
                                </HeaderTemplate>
                            </asp:DetailsView> <asp:Button id="btnCreateUserCourse" onclick="btnCreateUserCourse_Click" runat="server" Text="Create" CssClass="btInline" Width="125px"></asp:Button> <asp:Button id="btnCancelUserCourse" onclick="btnCancelUserCourse_Click" runat="server" Text="Cancel" CssClass="btCancel"></asp:Button> </DIV>
</ContentTemplate>
</asp:UpdatePanel> </div></div>
</asp:Content>
