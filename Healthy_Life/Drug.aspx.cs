using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Healthy_Life
{
    public partial class Drug : System.Web.UI.Page
    {
        OracleDataManipulator odm = new OracleDataManipulator();
        protected void Page_Load(object sender, EventArgs e)
        {
            loadDrugs();
        }

        protected void loadDrugs()
        {
            DataTable dt = odm.dispalyData("Select * from admin.DRUG");
            gv_drugs.DataSource = dt;
            gv_drugs.DataBind();
        }

        protected void btn_add_Click(object sender, EventArgs e)
        {
            try
            {
                odm.modifyData("insert into admin.DRUG (DRUG_ID,DRUG_NAME,DRUG_DESCRIPTION,STOCK,MFD,EXP) values ('" + txt_drugID.Text + "','" + txt_DrugName.Text + "','" + txt_drugdes.Text + "','" + int.Parse(txt_Stock.Text) + "',DATE'" + txt_mfd.Text + "',DATE'" + txt_exp.Text + "')");
                lbl_msg.Text = "Drug Added Successfully!";
                loadDrugs();
            }
            catch (Exception ex)
            {

                lbl_msg.Text = ex.Message.ToString();
            }
            
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            try
            {
                odm.modifyData("Update admin.DRUG set DRUG_NAME='"+txt_DrugName.Text+ "', DRUG_DESCRIPTION='"+txt_drugdes.Text+ "',STOCK='"+int.Parse(txt_Stock.Text)+ "',MFD=DATE'"+txt_mfd.Text+ "',EXP=DATE'"+txt_exp.Text+ "' where DRUG_ID='" + txt_drugID.Text + "'");
                lbl_msg.Text = "Update Success!";
                loadDrugs();
            }
            catch (Exception ex)
            {

                lbl_msg.Text = ex.Message.ToString();
            }
        }

        protected void btn_delete_Click(object sender, EventArgs e)
        {
            try
            {
                odm.modifyData("delete from admin.DRUG where DRUG_ID='" + txt_drugID.Text + "'");
                lbl_msg.Text = "Delete Success!";
                loadDrugs();
            }
            catch (Exception ex)
            {

                lbl_msg.Text = ex.Message.ToString();
            }
        }

        protected void btn_back_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void gv_drugs_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (gv_drugs.SelectedIndex != -1)
            {
                txt_drugID.Text = gv_drugs.SelectedRow.Cells[1].Text;
                txt_DrugName.Text = gv_drugs.SelectedRow.Cells[2].Text;
                txt_drugdes.Text = gv_drugs.SelectedRow.Cells[3].Text;
                txt_Stock.Text = gv_drugs.SelectedRow.Cells[4].Text;
                txt_mfd.Text = gv_drugs.SelectedRow.Cells[5].Text;
                txt_exp.Text = gv_drugs.SelectedRow.Cells[6].Text;
            }
        }
    }
}