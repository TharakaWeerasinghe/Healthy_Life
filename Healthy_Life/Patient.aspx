<%@ Page Title="" Language="C#" MasterPageFile="~/Healthy_LIfe_Master.Master" AutoEventWireup="true" CodeBehind="Patient.aspx.cs" Inherits="Healthy_Life.Patient" %>
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
        .auto-style35 {
            margin-bottom: 0px;
        }
     </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <div  style="font-family: 'Copperplate Gothic Bold'; " class="auto-style22" >
        
        <table  class="auto-style13"  >
            <tr>
                <td colspan="2" align="center" class="auto-style33"><h2>Register Patients</h2></td>
            </tr>
            <tr>
                <td class="auto-style34" ><b>Patient ID</b></td>
                <td class="auto-style30" >
                    <asp:TextBox ID="txt_pID" runat="server" Width="313px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Patient ID!" ForeColor="Red" ControlToValidate="txt_pID"></asp:RequiredFieldValidator>
                </td>
                

            </tr>
            <tr>
                <td class="auto-style32" ><b>Title</b></td>
                <td class="auto-style31" >
                    <asp:DropDownList ID="ddl_title" runat="server" CssClass="auto-style35" Width="321px">
                        <asp:ListItem>MR.</asp:ListItem>
                        <asp:ListItem>MRS.</asp:ListItem>
                    </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Title!" ForeColor="Red" ControlToValidate="ddl_title"></asp:RequiredFieldValidator>
                </td>  
            </tr>
            <tr>
                <td class="auto-style25" ><b>Full Name</b></td>
                <td class="auto-style31" >
                    <asp:TextBox ID="txt_name" runat="server" Width="313px"></asp:TextBox> 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Enter Name!" ForeColor="Red" ControlToValidate="txt_name"></asp:RequiredFieldValidator></td>
                
            </tr>
            <tr>
                <td class="auto-style29" ><b>D.O.B(YYYY/MM/DD)</b></td>
                <td class="auto-style30"> 
                    <asp:TextBox ID="txt_DOB" runat="server" Width="314px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please Enter D.O.B!" ForeColor="Red" ControlToValidate="txt_DOB"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style27" ><b>Gender</b></td>
                <td class="auto-style28">
                    <asp:DropDownList ID="ddl_gender" runat="server" Width="319px">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                        <asp:ListItem>Other</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please Enter Gender!" ForeColor="Red" ControlToValidate="ddl_gender"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style21" ><b>City</b></td>
                <td><asp:TextBox ID="txt_city" runat="server" Width="313px"></asp:TextBox> 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please Enter City!" ForeColor="Red" ControlToValidate="txt_city"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style32" ><b>Address</b></td>
                <td class="auto-style31">
                    <asp:TextBox ID="txt_Address" runat="server" Width="313px"></asp:TextBox> 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txt_Address" ErrorMessage="Please enter Address!" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style32" ><b>Mobile No</b></td>
                <td class="auto-style31">
                    <asp:TextBox ID="txt_MNO" runat="server" Width="313px"></asp:TextBox> 
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_MNO" ErrorMessage="Please enter a valid MNO!" ForeColor="Red" ValidationExpression="^\+?(0|[1-9]\d*)$"></asp:RegularExpressionValidator>
                    </td>
            </tr>
            <tr>
                <td class="auto-style32" ><b>Land No</b></td>
                <td class="auto-style31">
                    <asp:TextBox ID="txt_LNO" runat="server" Width="313px"></asp:TextBox> 
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txt_LNO" ErrorMessage="Please enter a valid land NO!" ForeColor="Red" ValidationExpression="^\+?(0|[1-9]\d*)$"></asp:RegularExpressionValidator>
                    </td>
            </tr>
            <tr>
                <td class="auto-style32" ><b>Symptom</b></td>
                <td class="auto-style31">
                    <asp:TextBox ID="txt_symptom" runat="server" Width="313px"></asp:TextBox> 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txt_Address" ErrorMessage="Please enter Symptom!" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
            </tr>
            <tr>
                <td class="auto-style29" ><b>Entry Date(YYYY/MM/DD)</b></td>
                <td class="auto-style30"> 
                    <asp:TextBox ID="txt_entry" runat="server" Width="314px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Please Enter entry Date!" ForeColor="Red" ControlToValidate="txt_DOB"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style27" ><b>Doctor ID</b></td>
                <td class="auto-style28">
                    <asp:DropDownList ID="dpl_DID" runat="server" Width="319px">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Please Enter Doctor ID!" ForeColor="Red" ControlToValidate="dpl_DID"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Button ID="btn_add" runat="server" Text="Add" Style="background-color: lightslategray; /* Green */border: none;color: white;padding: 10px 32px;text-align: center;text-decoration: none;display: inline-block;font-size: 16px;" Height="40px" Width="131px" Font-Bold="True" OnClick="btn_add_Click"   />
                    &nbsp;
                    <asp:Button ID="btn_update" runat="server" Text="Update" Style="background-color: lightslategray;  /* Green */border: none;color: white;padding: 10px 32px;text-align: center;text-decoration: none;display: inline-block;font-size: 16px;" Height="40px" Width="131px" Font-Bold="True" OnClick="btn_update_Click"   />
                    &nbsp;
                    <asp:Button ID="btn_delete" runat="server" Text="Delete" Style="background-color: lightslategray;  /* Green */border: none;color: white;padding: 10px 32px;text-align: center;text-decoration: none;display: inline-block;font-size: 16px;" Height="40px" Width="131px" Font-Bold="True" OnClick="btn_delete_Click"   />
                    &nbsp;
                    <asp:Button ID="btn_back" runat="server" Text="Back" Style="background-color: lightslategray;  /* Green */border: none;color: white;padding: 10px 32px;text-align: center;text-decoration: none;display: inline-block;font-size: 16px;" Height="40px" Width="131px" Font-Bold="True" CausesValidation="False" OnClick="btn_back_Click"   />
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
        
        
        <asp:GridView ID="gv_patients" runat="server" CellPadding="4" align="center" ForeColor="#333333" GridLines="None" Width="725px" AutoGenerateSelectButton="True" OnSelectedIndexChanged="gv_patients_SelectedIndexChanged"  >
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
