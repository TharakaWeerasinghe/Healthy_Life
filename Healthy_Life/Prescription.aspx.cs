using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Healthy_Life
{
    public partial class Prescription : System.Web.UI.Page
    {
        OracleDataManipulator odm = new OracleDataManipulator();
        DataTable dt_drug_prescription = new DataTable();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (ViewState["Records"] == null)
                {
                    dt_drug_prescription.Columns.Add("Prescription_ID");
                    dt_drug_prescription.Columns.Add("Drug_ID");
                    dt_drug_prescription.Columns.Add("Prescription_Mode");
                    dt_drug_prescription.Columns.Add("Prescription_Duration");
                    ViewState["Records"] = dt_drug_prescription;
                }
            }

            if (!IsPostBack)
            {
                DataTable dt_Patient = odm.dispalyData("Select * from admin.PATIENT order by PATIENT_ID asc");
                foreach (DataRow dr in dt_Patient.Rows)
                {
                    ddl_PID.Items.Add(dr["PATIENT_ID"].ToString());
                }

                DataTable dt_doctor = odm.dispalyData("Select * from admin.DOCTOR order by DOCOTR_ID asc");
                foreach(DataRow dr in dt_doctor.Rows)
                {
                    ddl_DocD.Items.Add(dr["DOCOTR_ID"].ToString());
                }

                DataTable dt_drug = odm.dispalyData("Select * from admin.DRUG order by DRUG_ID asc");
                foreach (DataRow dr in dt_drug.Rows)
                {
                    ddl_drugID.Items.Add(dr["DRUG_ID"].ToString());
                }
                loadPrescriptions();
            }
        }

        protected void btn_addDrug_Click(object sender, EventArgs e)
        {
            dt_drug_prescription = (DataTable)ViewState["Records"];
            dt_drug_prescription.Rows.Add(txt_PresID.Text,ddl_drugID.Text,txt_DrugMode.Text,txt_Duration.Text);
            gv_drug_prescription.DataSource = dt_drug_prescription;
            gv_drug_prescription.DataBind();
        }

        protected void loadPrescriptions()
        {
            DataTable dt = odm.dispalyData("Select * from admin.Prescription");
            gv_prescriptions.DataSource = dt;
            gv_prescriptions.DataBind();
        }

        protected void gv_drug_prescription_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (gv_drug_prescription.SelectedIndex != -1)
            {
                ddl_drugID.Text = gv_drug_prescription.SelectedRow.Cells[3].Text;
                txt_DrugMode.Text = gv_drug_prescription.SelectedRow.Cells[4].Text;
                txt_Duration.Text = gv_drug_prescription.SelectedRow.Cells[5].Text;

            }
        }

        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = Convert.ToInt32(e.RowIndex);
            DataTable dt = ViewState["Records"] as DataTable;
            dt.Rows[index].Delete();
            ViewState["Records"] = dt;
            gv_drug_prescription.DataSource = ViewState["Records"] as DataTable;
            gv_drug_prescription.DataBind();
        }

        protected void btn_add_Click(object sender, EventArgs e)
        {
            try
            {
                odm.modifyData("insert into admin.PRESCRIPTION (PRESCRIPTION_ID,PRESCRIPTION_DESCRIPTION,DOCOTR_ID,PATIENT_ID) values('" + txt_PresID.Text + "','" + txt_PresDescription.Text + "','" + ddl_DocD.Text + "','" + ddl_PID.Text + "')");
                int count = gv_drug_prescription.Rows.Count;
                foreach(GridViewRow row in gv_drug_prescription.Rows)
                {
                    odm.modifyData("insert into admin.DRUG_PRESCRIPTION (PRESCRIPTION_ID,DRUG_ID,PRESCRIPTION_MODE,DURATION) values('" + txt_PresID.Text + "','" + row.Cells[3].Text + "','" + row.Cells[4].Text + "','" + row.Cells[5].Text + "')");
                    
                }


                lbl_msg.Text = "Prescription added successfully!";
                loadPrescriptions();
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
                odm.modifyData("Update admin.PRESCRIPTION set PRESCRIPTION_DESCRIPTION='"+txt_PresDescription.Text+ "',DOCOTR_ID='"+ddl_DocD.Text+ "',PATIENT_ID='"+ddl_PID.Text+ "' where PRESCRIPTION_ID='"+txt_PresID.Text+"'");
                foreach (GridViewRow row in gv_drug_prescription.Rows)
                {
                    DataTable dt = odm.dispalyData("Select * from admin.DRUG_PRESCRIPTION where DRUG_ID='" + row.Cells[3].Text + "' and PRESCRIPTION_ID='" + row.Cells[2].Text + "' ");
                    if (dt.Rows.Count == 0)
                    {
                        odm.modifyData("insert into admin.DRUG_PRESCRIPTION (PRESCRIPTION_ID,DRUG_ID,PRESCRIPTION_MODE,DURATION) values('" + txt_PresID.Text + "','" + row.Cells[3].Text + "','" + row.Cells[4].Text + "','" + row.Cells[5].Text + "')");
                    }
                    
                }
                lbl_msg.Text = "Update succesfull!";
                loadPrescriptions();
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
                foreach (GridViewRow row in gv_drug_prescription.Rows)
                {
                    odm.modifyData("Delete from admin.DRUG_PRESCRIPTION  where DRUG_ID='" + row.Cells[3].Text + "' and PRESCRIPTION_ID='" + row.Cells[2].Text + "' ");
                }
                odm.modifyData("delete from admin.PRESCRIPTION where PRESCRIPTION_ID='" + txt_PresID.Text + "' ");
                loadPrescriptions();
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

        protected void gv_prescriptions_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (gv_prescriptions.SelectedIndex != -1)
            {
                txt_PresID.Text = gv_prescriptions.SelectedRow.Cells[1].Text;
                txt_PresDescription.Text = gv_prescriptions.SelectedRow.Cells[2].Text;
                ddl_DocD.Text = gv_prescriptions.SelectedRow.Cells[3].Text;
                ddl_PID.Text = gv_prescriptions.SelectedRow.Cells[4].Text;


                

            }

            ViewState["Records"]= odm.dispalyData("select * from admin.DRUG_PRESCRIPTION where PRESCRIPTION_ID='" + txt_PresID.Text + "'");
            gv_drug_prescription.DataSource = ViewState["Records"];
            gv_drug_prescription.DataBind();

        }
    }
}