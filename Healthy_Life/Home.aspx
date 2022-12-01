<%@ Page Title="" Language="C#" MasterPageFile="~/Healthy_LIfe_Master.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Healthy_Life.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style4 {
            width: 100%;
        }
        .auto-style5 {
            height: 38px;
        }
        .auto-style6 {
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <form id="form1" runat="server">

    <table class="auto-style4">
        <tr>
            <td style="text-align:center"><b><label style="font-family: 'Copperplate Gothic Bold'; font-size: x-large;"> Main Menu</label></b></td>
        </tr>
        <tr>
            <td class="auto-style5" align="center">
                <asp:Button ID="btn_customer" runat="server" Height="48px" Text="Patient Registration"  Width="317px" style="background-color: lightslategray; font-family: 'Copperplate Gothic Bold'; border: none;color: white;padding: 15px 32px;text-align: center;text-decoration: none;display: inline-block;font-size: 16px;" CausesValidation="False" Font-Bold="True" OnClick="btn_customer_Click" />
            </td>
        </tr>
        <tr>
            <td class="auto-style5" align="center">
                <asp:Button ID="btn_drugs" runat="server" Height="48px" Text="Manage Drugs"  Width="317px" style="background-color: lightslategray; font-family: 'Copperplate Gothic Bold'; border: none;color: white;padding: 15px 32px;text-align: center;text-decoration: none;display: inline-block;font-size: 16px;" CausesValidation="False" Font-Bold="True" OnClick="btn_drugs_Click" />
            </td>
        </tr>
        <tr>
            <td class="auto-style5" align="center">
                <asp:Button ID="btn_treatments" runat="server" Height="48px" Text="Manage Treatments"  Width="317px" style="background-color: lightslategray; font-family: 'Copperplate Gothic Bold'; border: none;color: white;padding: 15px 32px;text-align: center;text-decoration: none;display: inline-block;font-size: 16px;" CausesValidation="False" Font-Bold="True" OnClick="btn_treatments_Click" />
            </td>
        </tr>
        <tr>
            <td class="auto-style5" align="center">
                <asp:Button ID="btn_prescription" runat="server" Height="48px" Text="Manage Prescriptions"  Width="317px" style="background-color: lightslategray; font-family: 'Copperplate Gothic Bold'; border: none;color: white;padding: 15px 32px;text-align: center;text-decoration: none;display: inline-block;font-size: 16px;" CausesValidation="False" Font-Bold="True" OnClick="btn_prescription_Click" />
            </td>
        </tr>
        <tr>
            <td class="auto-style5" align="center">
                <asp:Button ID="btn_bill" runat="server" Height="48px" Text="Bill"  Width="317px" style="background-color: lightslategray; font-family: 'Copperplate Gothic Bold'; border: none;color: white;padding: 15px 32px;text-align: center;text-decoration: none;display: inline-block;font-size: 16px;" CausesValidation="False" Font-Bold="True" OnClick="btn_bill_Click" />
            </td>
        </tr>
        <tr>
            <td class="auto-style5" align="center">
                <asp:Button ID="btn_rooms" runat="server" Height="48px" Text="Manage Rooms"  Width="317px" style="background-color: lightslategray; font-family: 'Copperplate Gothic Bold'; border: none;color: white;padding: 15px 32px;text-align: center;text-decoration: none;display: inline-block;font-size: 16px;" CausesValidation="False" Font-Bold="True" OnClick="btn_rooms_Click" />
            </td>
        </tr>
        <tr>
            <td class="auto-style5" align="center">
                <asp:Button ID="btn_doctors" runat="server" Height="48px" Text="Manage Doctors"  Width="317px" style="background-color: lightslategray; font-family: 'Copperplate Gothic Bold'; border: none;color: white;padding: 15px 32px;text-align: center;text-decoration: none;display: inline-block;font-size: 16px;" CausesValidation="False" Font-Bold="True" OnClick="btn_doctors_Click" />
            </td>
        </tr>
        <tr>
            <td class="auto-style5" align="center">
                <asp:Button ID="btn_departments" runat="server" Height="48px" Text="Manage Departments"  Width="317px" style="background-color: lightslategray; font-family: 'Copperplate Gothic Bold'; border: none;color: white;padding: 15px 32px;text-align: center;text-decoration: none;display: inline-block;font-size: 16px;" CausesValidation="False" Font-Bold="True" OnClick="btn_departments_Click"  />
            </td>
        </tr>
        <tr>
            <td class="auto-style5" align="center">
                <asp:Button ID="Btn_logout" runat="server" Height="48px" Text="Logout"  Width="317px" style="background-color: lightslategray; font-family: 'Copperplate Gothic Bold'; border: none;color: white;padding: 15px 32px;text-align: center;text-decoration: none;display: inline-block;font-size: 16px;" CausesValidation="False" Font-Bold="True" OnClick="Btn_logout_Click"  />
            </td>
        </tr>
    </table>

    </form>
</asp:Content>
