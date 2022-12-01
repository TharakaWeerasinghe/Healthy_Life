<%@ Page Title="" Language="C#" MasterPageFile="~/Healthy_LIfe_Master.Master" AutoEventWireup="true" CodeBehind="Doctor.aspx.cs" Inherits="Healthy_Life.Doctor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style13 {
            height: 238px;
            margin: 0 auto;
            
            
            width: 639px;
        }
        .auto-style21 {
            width: 274px;
        }
        .auto-style22 {
            width: 100%;
        }
        .auto-style25 {
            width: 277px;
            height: 96px;
        }
        .auto-style27 {
            width: 274px;
            height: 98px;
        }
        .auto-style28 {
            height: 98px;
        }
        .auto-style29 {
            width: 274px;
            height: 97px;
        }
        .auto-style30 {
            height: 97px;
        }
        .auto-style31 {
            height: 96px;
        }
        .auto-style32 {
            width: 274px;
            height: 96px;
        }
        .auto-style33 {
            height: 95px;
        }
        .auto-style34 {
            width: 277px;
            height: 97px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <div  style="font-family: 'Copperplate Gothic Bold'; " class="auto-style22" >
        
        <table  class="auto-style13"  >
            <tr>
                <td colspan="2" align="center" class="auto-style33"><h2>Manage Doctors</h2></td>
            </tr>
            <tr>
                <td class="auto-style34" ><b>Doctor ID</b></td>
                <td class="auto-style30" >
                    <asp:TextBox ID="txt_docID" runat="server" Width="313px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Doctor ID!" ForeColor="Red" ControlToValidate="txt_docID"></asp:RequiredFieldValidator>
                </td>
                

            </tr>
            <tr>
                <td class="auto-style32" ><b>Doctor Name</b></td>
                <td class="auto-style31" ><asp:TextBox ID="txt_Docname" runat="server" Width="313px"></asp:TextBox> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Doctor Name!" ForeColor="Red" ControlToValidate="txt_Docname"></asp:RequiredFieldValidator>
                </td>  
            </tr>
            <tr>
                <td class="auto-style25" ><b>Doctor Specialization</b></td>
                <td class="auto-style31" >
                    <asp:TextBox ID="txt_docSpecialization" runat="server" Width="313px"></asp:TextBox> 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Enter Doctor Specialization!" ForeColor="Red" ControlToValidate="txt_docSpecialization"></asp:RequiredFieldValidator></td>
                
            </tr>
            <tr>
                <td class="auto-style29" ><b>Doctor Address</b></td>
                <td class="auto-style30"><asp:TextBox ID="txt_docAddress" runat="server" Width="313px"></asp:TextBox> 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please Enter Doctor Address!" ForeColor="Red" ControlToValidate="txt_docAddress"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style27" ><b>Doctor CNO</b></td>
                <td class="auto-style28"><asp:TextBox ID="txt_docCNO" runat="server" Width="313px"></asp:TextBox> 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please Enter Doctor CNO!" ForeColor="Red" ControlToValidate="txt_docCNO"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txt_docCNO" ErrorMessage="Please enter a valid Phone number!" ForeColor="Red" ValidationExpression="^\+?(0|[1-9]\d*)$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style21" ><b>Doctor Fee</b></td>
                <td><asp:TextBox ID="txt_docFee" runat="server" Width="313px"></asp:TextBox> 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please Enter Doctor Fee!" ForeColor="Red" ControlToValidate="txt_docFee"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_docFee" ErrorMessage="Please enter a valid number!" ForeColor="Red" ValidationExpression="^[+]?\d+([.]\d+)?$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style32" ><b>Department ID</b></td>
                <td class="auto-style31">
                    <asp:DropDownList ID="DropDownList1" runat="server" Width="319px">
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
        
        
        <asp:GridView ID="gv_doctors" runat="server" CellPadding="4" align="center" ForeColor="#333333" GridLines="None" Width="725px" AutoGenerateSelectButton="True" OnSelectedIndexChanged="gv_doctors_SelectedIndexChanged" >
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
