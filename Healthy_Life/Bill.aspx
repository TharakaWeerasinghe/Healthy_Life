<%@ Page Title="" Language="C#" MasterPageFile="~/Healthy_LIfe_Master.Master" AutoEventWireup="true" CodeBehind="Bill.aspx.cs" Inherits="Healthy_Life.Bill" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style type="text/css">
        .auto-style11 {
            height: 38px;
        }
        .auto-style13 {
            height: 238px;
            margin: 0 auto;
            
            
            width: 691px;
        }
        .auto-style20 {
            width: 316px;
            height: 60px;
        }
        .auto-style22 {
            width: 100%;
        }
        .auto-style27 {
            height: 60px;
        }
        .auto-style36 {
            height: 60px;
            margin-left: auto;
            margin-right: auto;
            
            
            width: 282px;
        }
        .auto-style37 {
            height: 60px;
            
            width: 349px;
        }
        .auto-style38 {
            width: 634px;
            margin: 0 auto;
        }
        .auto-style39 {
            height: 60px;
            
            width: 282px;
            text-align: center;
        }
        .auto-style40 {
            width: 634px;
            margin: 0 auto;
            height: 59px;
        }
        .auto-style41 {
            height: 41px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <div  style="font-family: 'Copperplate Gothic Bold'; " class="auto-style22" >
        
        <table  class="auto-style13"  >
            <tr>
                <td colspan="2" align="center" class="auto-style11"><h2>Bill</h2></td>
            </tr>
            <tr>
                <td class="auto-style20" ><b>Bill ID</b></td>
                <td class="auto-style27" >
                    <asp:TextBox ID="txt_BID" runat="server" Width="313px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Bill ID!" ForeColor="Red" ControlToValidate="txt_BID"></asp:RequiredFieldValidator>
                </td>
                

            </tr>
            <tr>
                <td class="auto-style20" ><strong>Bill Date(yyyy-mm-DD)</strong></td>
                <td class="auto-style27" >
                    <asp:TextBox ID="txt_BDate" runat="server" Width="313px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Bill Date!" ForeColor="Red" ControlToValidate="txt_BDate"></asp:RequiredFieldValidator>
                </td>  
            </tr>
            <tr>
                <td class="auto-style20" ><b>Patient ID</b></td>
                <td class="auto-style27">
                    <asp:DropDownList ID="ddl_PID" runat="server" Width="316px" AutoPostBack="True" OnSelectedIndexChanged="ddl_PID_SelectedIndexChanged">
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            
            <tr>
                <td class="auto-style20" ><strong>Room ID</strong></td>
                <td class="auto-style27">
                    <asp:DropDownList ID="ddl_RID" runat="server" Width="316px" AutoPostBack="True">
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            
            <tr>
                <td class="auto-style20" ><strong>Treatemnt ID</strong></td>
                <td class="auto-style27">
                    <asp:DropDownList ID="ddl_TID" runat="server" Width="316px" AutoPostBack="True">
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            
            <tr>
                <td class="auto-style20" ><strong>Test Charges</strong></td>
                <td class="auto-style27">
                    <asp:TextBox ID="txt_testcharges" runat="server" Width="313px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_testcharges" ErrorMessage="Please enter a valid Number!" ForeColor="Red" ValidationExpression="^\s*?[0-9]{1,10}\s*$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            
            <tr>
                <td class="auto-style20" ><strong>Blood Charges</strong></td>
                <td class="auto-style27">
                    <asp:TextBox ID="txt_BloodCharges" runat="server" Width="313px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txt_BloodCharges" ErrorMessage="Please enter a valid Number!" ForeColor="Red" ValidationExpression="^\s*?[0-9]{1,10}\s*$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            
            <tr>
                <td class="auto-style20" ><strong>Total</strong></td>
                <td class="auto-style27">
                    <asp:TextBox ID="txt_total" runat="server" Width="313px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txt_total" ErrorMessage="Please enter a valid Number!" ForeColor="Red" ValidationExpression="^\s*?[0-9]{1,10}\s*$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            
        </table>
        <table class="auto-style38" border="4" style="border-color: #000000">
            <tr>
               <td colspan="2" align="center" class="auto-style11"><h4>Add Doctors</h4>

                </td>
                
            </tr>

            <tr>
                <td class="auto-style36">

                    <strong>Doctor ID</strong></td>
                <td class="auto-style37">

                    <asp:DropDownList ID="ddl_docID" runat="server" Width="316px">
                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <td colspan="2" class="auto-style39">
                    <asp:Button ID="btn_addDrug" runat="server" Text="Add" Style="background-color: lightslategray; /* Green */border: none;color: white;padding: 10px 32px;text-align: center;text-decoration: none;display: inline-block;font-size: 16px;" Height="40px" Width="131px" Font-Bold="True" OnClick="btn_addDoctor_Click" CausesValidation="False"   />
                    &nbsp
                    
                    </td>
                
            </tr>

            <tr>
                <td colspan="2" align="center" class="auto-style36">

                
                    <asp:GridView ID="gv_Bill_doctor" runat="server" AutoGenerateSelectButton="True" CellPadding="4" ForeColor="#333333" GridLines="None" Width="628px" OnSelectedIndexChanged="gv_Bill_doctor_SelectedIndexChanged" OnRowDeleting="OnRowDeleting" >
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ButtonType="Button" />
                        </Columns>
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

                
            </tr>

        </table>

        <table class="auto-style40" >
            <tr>
                <td align="center">
                    <asp:Button ID="btn_add" runat="server" Text="Add" Style="background-color: lightslategray; /* Green */border: none;color: white;padding: 10px 32px;text-align: center;text-decoration: none;display: inline-block;font-size: 16px;" Height="40px" Width="131px" Font-Bold="True" OnClick="btn_add_Click"   />
                    &nbsp;
                    <asp:Button ID="btn_update" runat="server" Text="Update" Style="background-color: lightslategray;  /* Green */border: none;color: white;padding: 10px 32px;text-align: center;text-decoration: none;display: inline-block;font-size: 16px;" Height="40px" Width="131px" Font-Bold="True" OnClick="btn_update_Click" CausesValidation="False"   />
                    &nbsp;
                    <asp:Button ID="btn_delete" runat="server" Text="Delete" Style="background-color: lightslategray;  /* Green */border: none;color: white;padding: 10px 32px;text-align: center;text-decoration: none;display: inline-block;font-size: 16px;" Height="40px" Width="131px" Font-Bold="True" CausesValidation="False" OnClick="btn_delete_Click"  />
                    &nbsp;
                    <asp:Button ID="btn_back" runat="server" Text="Back" Style="background-color: lightslategray;  /* Green */border: none;color: white;padding: 10px 32px;text-align: center;text-decoration: none;display: inline-block;font-size: 16px;" Height="40px" Width="131px" Font-Bold="True" CausesValidation="False" OnClick="btn_back_Click"   />

                </td>
            </tr>
            <tr>
                <td align="center" class="auto-style41">
                    <asp:Label ID="lbl_msg" runat="server"></asp:Label>

                </td>
            </tr>
        </table>
    </div>
    <div algin="center">
         <asp:GridView ID="gv_bill" runat="server" CellPadding="4" align="center" ForeColor="#333333" GridLines="None" Width="725px" AutoGenerateSelectButton="True" OnSelectedIndexChanged="gv_bill_SelectedIndexChanged"  >
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
