<%@ Page Title="" Language="C#" MasterPageFile="~/Healthy_LIfe_Master.Master" AutoEventWireup="true" CodeBehind="Drug.aspx.cs" Inherits="Healthy_Life.Drug" %>
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
        }
        .auto-style21 {
            width: 274px;
        }
        .auto-style22 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <div  style="font-family: 'Copperplate Gothic Bold'; " class="auto-style22" >
        
        <table  class="auto-style13"  >
            <tr>
                <td colspan="2" align="center" class="auto-style11"><h2>Manage Drugs</h2></td>
            </tr>
            <tr>
                <td class="auto-style20" ><b>Drug ID</b></td>
                <td >
                    <asp:TextBox ID="txt_drugID" runat="server" Width="313px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Drug ID!" ForeColor="Red" ControlToValidate="txt_drugID"></asp:RequiredFieldValidator>
                </td>
                

            </tr>
            <tr>
                <td class="auto-style21" ><b>Drug Name</b></td>
                <td ><asp:TextBox ID="txt_DrugName" runat="server" Width="313px"></asp:TextBox> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Drug Name!" ForeColor="Red" ControlToValidate="txt_DrugName"></asp:RequiredFieldValidator>
                </td>  
            </tr>
            <tr>
                <td class="auto-style20" ><b>Drug Description</b></td>
                <td >
                    <asp:TextBox ID="txt_drugdes" runat="server" Width="313px"></asp:TextBox> 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Enter Drug Description!" ForeColor="Red" ControlToValidate="txt_drugdes"></asp:RequiredFieldValidator></td>
                
            </tr>
            <tr>
                <td class="auto-style21" ><b>Stock</b></td>
                <td><asp:TextBox ID="txt_Stock" runat="server" Width="313px"></asp:TextBox> 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please Enter Stock!" ForeColor="Red" ControlToValidate="txt_Stock"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txt_Stock" ErrorMessage="Please enter a valid  number!" ForeColor="Red" ValidationExpression="^\+?(0|[1-9]\d*)$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style21" ><b>MFD(YYYY-MM-DD)</b></td>
                <td><asp:TextBox ID="txt_mfd" runat="server" Width="313px"></asp:TextBox> 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please Enter MFD!" ForeColor="Red" ControlToValidate="txt_mfd"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style21" ><b>EXP(YYYY-MM-DD)</b></td>
                <td><asp:TextBox ID="txt_exp" runat="server" Width="313px"></asp:TextBox> 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please Enter EXP!" ForeColor="Red" ControlToValidate="txt_exp"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Button ID="btn_add" runat="server" Text="Add" Style="background-color: lightslategray; /* Green */border: none;color: white;padding: 10px 32px;text-align: center;text-decoration: none;display: inline-block;font-size: 16px;" Height="40px" Width="131px" Font-Bold="True" OnClick="btn_add_Click" />
                    &nbsp;
                    <asp:Button ID="btn_update" runat="server" Text="Update" Style="background-color: lightslategray;  /* Green */border: none;color: white;padding: 10px 32px;text-align: center;text-decoration: none;display: inline-block;font-size: 16px;" Height="40px" Width="131px" Font-Bold="True" OnClick="btn_update_Click" />
                    &nbsp;
                    <asp:Button ID="btn_delete" runat="server" Text="Delete" Style="background-color: lightslategray;  /* Green */border: none;color: white;padding: 10px 32px;text-align: center;text-decoration: none;display: inline-block;font-size: 16px;" Height="40px" Width="131px" Font-Bold="True" OnClick="btn_delete_Click" />
                    &nbsp;
                    <asp:Button ID="btn_back" runat="server" Text="Back" Style="background-color: lightslategray;  /* Green */border: none;color: white;padding: 10px 32px;text-align: center;text-decoration: none;display: inline-block;font-size: 16px;" Height="40px" Width="131px" Font-Bold="True" OnClick="btn_back_Click" CausesValidation="False" />
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
        
        
        <asp:GridView ID="gv_drugs" runat="server" CellPadding="4" align="center" ForeColor="#333333" GridLines="None" Width="725px" AutoGenerateSelectButton="True" OnSelectedIndexChanged="gv_drugs_SelectedIndexChanged">
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
