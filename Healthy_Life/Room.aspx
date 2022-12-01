<%@ Page Title="" Language="C#" MasterPageFile="~/Healthy_LIfe_Master.Master" AutoEventWireup="true" CodeBehind="Room.aspx.cs" Inherits="Healthy_Life.Room" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style11 {
            height: 38px;
        }
        .auto-style13 {
            height: 238px;
            margin: 0 auto;
            
            
            width: 639px;
        }
        .auto-style20 {
            width: 277px;
            height: 60px;
        }
        .auto-style22 {
            width: 100%;
        }
        .auto-style23 {
            width: 274px;
            height: 60px;
        }
        .auto-style27 {
            height: 60px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <form id="form1" runat="server">
    <div  style="font-family: 'Copperplate Gothic Bold'; " class="auto-style22" >
        
        <table  class="auto-style13"  >
            <tr>
                <td colspan="2" align="center" class="auto-style11"><h2>Manage Rooms</h2></td>
            </tr>
            <tr>
                <td class="auto-style20" ><b>Room ID</b></td>
                <td class="auto-style27" >
                    <asp:TextBox ID="txt_RID" runat="server" Width="313px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Room ID!" ForeColor="Red" ControlToValidate="txt_RID"></asp:RequiredFieldValidator>
                </td>
                

            </tr>
            <tr>
                <td class="auto-style23" ><b>Room Status</b></td>
                <td class="auto-style27" >
                    <asp:DropDownList ID="ddl_status" runat="server" Width="316px">
                        <asp:ListItem>Occupied</asp:ListItem>
                        <asp:ListItem>Vacant</asp:ListItem>
                    </asp:DropDownList>
                </td>  
            </tr>
            <tr>
                <td class="auto-style20" ><b>Room Type</b></td>
                <td class="auto-style27" >
                    <asp:DropDownList ID="ddl_type" runat="server" Width="316px">
                        <asp:ListItem>Private</asp:ListItem>
                        <asp:ListItem>Normal</asp:ListItem>
                    </asp:DropDownList>
                </td>
                
            </tr>
            <tr>
                <td class="auto-style23" ><b>Room Charge</b></td>
                <td class="auto-style27"><asp:TextBox ID="txt_charge" runat="server" Width="313px"></asp:TextBox> 
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_charge" ErrorMessage="Please enter a valid number!" ForeColor="Red" ValidationExpression="^[+]?\d+([.]\d+)?$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style23" ><b>Department ID</b></td>
                <td class="auto-style27">
                    <asp:DropDownList ID="ddl_DID" runat="server" Width="316px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style23" ><b>Patient ID</b></td>
                <td class="auto-style27">
                    <asp:DropDownList ID="ddl_PID" runat="server" Width="316px">
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Button ID="btn_add" runat="server" Text="Add" Style="background-color: lightslategray; /* Green */border: none;color: white;padding: 10px 32px;text-align: center;text-decoration: none;display: inline-block;font-size: 16px;" Height="40px" Width="131px" Font-Bold="True" OnClick="btn_add_Click"  />
                    &nbsp;
                    <asp:Button ID="btn_update" runat="server" Text="Update" Style="background-color: lightslategray;  /* Green */border: none;color: white;padding: 10px 32px;text-align: center;text-decoration: none;display: inline-block;font-size: 16px;" Height="40px" Width="131px" Font-Bold="True" OnClick="btn_update_Click"  />
                    &nbsp;
                    <asp:Button ID="btn_delete" runat="server" Text="Delete" Style="background-color: lightslategray;  /* Green */border: none;color: white;padding: 10px 32px;text-align: center;text-decoration: none;display: inline-block;font-size: 16px;" Height="40px" Width="131px" Font-Bold="True" OnClick="btn_delete_Click"  />
                    &nbsp;
                    <asp:Button ID="btn_back" runat="server" Text="Back" Style="background-color: lightslategray;  /* Green */border: none;color: white;padding: 10px 32px;text-align: center;text-decoration: none;display: inline-block;font-size: 16px;" Height="40px" Width="131px" Font-Bold="True" CausesValidation="False" OnClick="btn_back_Click"  />
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Label ID="lbl_msg" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    <div algin="center">
        
        
        <asp:GridView ID="gv_Rooms" runat="server" CellPadding="4" align="center" ForeColor="#333333" GridLines="None" Width="725px" AutoGenerateSelectButton="True" OnSelectedIndexChanged="gv_Rooms_SelectedIndexChanged" >
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        
    </div>
    </form>
</asp:Content>
