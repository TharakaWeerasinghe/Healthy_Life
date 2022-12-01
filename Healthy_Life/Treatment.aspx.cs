using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Healthy_Life
{
    public partial class Treatment : System.Web.UI.Page
    {
        OracleDataManipulator odm = new OracleDataManipulator();
        DataTable dt_treatment_doctor = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (ViewState["Records"] == null)
                {
                    dt_treatment_doctor.Columns.Add("DOCTOR_ID");
                    dt_treatment_doctor.Columns.Add("TREATMENT_ID");
                    ViewState["Records"] = dt_treatment_doctor;
                }

                DataTable dt_Patient = odm.dispalyData("Select * from admin.PATIENT order by PATIENT_ID asc");
                foreach (DataRow dr in dt_Patient.Rows)
                {
                    ddl_PID.Items.Add(dr["PATIENT_ID"].ToString());
                }
                DataTable dt_doctor = odm.dispalyData("Select * from admin.DOCTOR order by DOCOTR_ID asc");
                foreach (DataRow dr in dt_doctor.Rows)
                {
                    ddl_docID.Items.Add(dr["DOCOTR_ID"].ToString());
                }
            }
            loadTreatment();
        }
        protected void loadTreatment()
        {
            DataTable dt = odm.dispalyData("Select * from admin.TREATMENT");
            gv_Treatment.DataSource = dt;
            gv_Treatment.DataBind();
        }

        protected void btn_addDrug_Click(object sender, EventArgs e)
        {
            dt_treatment_doctor = (DataTable)ViewState["Records"];
            dt_treatment_doctor.Rows.Add(ddl_docID.Text, txt_TID.Text);
            gv_treatement_doctor.DataSource = dt_treatment_doctor;
            gv_treatement_doctor.DataBind();
        }

        protected void gv_drug_prescription_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (gv_treatement_doctor.SelectedIndex != -1)
            {
                ddl_docID.Text = gv_treatement_doctor.SelectedRow.Cells[2].Text;
                
            }
        }
        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = Convert.ToInt32(e.RowIndex);
            DataTable dt = ViewState["Records"] as DataTable;
            dt.Rows[index].Delete();
            ViewState["Records"] = dt;
            gv_treatement_doctor.DataSource = ViewState["Records"] as DataTable;
            gv_treatement_doctor.DataBind();
        }

        protected void btn_add_Click(object sender, EventArgs e)
        {
            try
            {
                odm.modifyData("insert into admin.TREATMENT (TREATMENT_ID,ADMISSION_DATE,TREATMENT_TYPE,PATIENT_CONDITION_BEFORE,TREATMENT_ADVICE,NUM_OF_OBSERVING_DOCTORS,PATIENT_CONDITION_AFTER,DISCHARGE_DATE,PATIENT_ID) values('"+txt_TID.Text+ "',DATE'"+txt_admission_Date.Text+ "','"+txt_Ttype.Text+ "','"+txt_PconditionBefore.Text+ "','"+txt_treatmentAdvice.Text+ "','"+int.Parse(txt_NumofDoctors.Text)+ "','"+txt_ConditionAfter.Text+ "',DATE'"+txt_discharge_date.Text+ "','"+ddl_PID.Text+"')");
                int count = gv_treatement_doctor.Rows.Count;
                foreach (GridViewRow row in gv_treatement_doctor.Rows)
                {
                    odm.modifyData("insert into admin.TREATMENT_DOCTOR (DOCTOR_ID,TREATMNT_ID) values('" + row.Cells[2].Text + "','" + txt_TID.Text + "')");

                }


                lbl_msg.Text = "Treatment added successfully!";
                loadTreatment();
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
                odm.modifyData("Update admin.TREATMENT set ADMISSION_DATE=DATE'"+txt_admission_Date.Text+ "',TREATMENT_TYPE='"+txt_Ttype.Text+ "',PATIENT_CONDITION_BEFORE='"+txt_PconditionBefore.Text+ "',TREATMENT_ADVICE='"+txt_treatmentAdvice.Text+ "',NUM_OF_OBSERVING_DOCTORS='"+int.Parse(txt_NumofDoctors.Text)+ "',PATIENT_CONDITION_AFTER='"+txt_ConditionAfter.Text+ "',DISCHARGE_DATE=DATE'"+txt_discharge_date.Text+ "',PATIENT_ID='"+ddl_PID.Text+ "' where TREATMENT_ID='" + txt_TID.Text + "'");
                foreach (GridViewRow row in gv_treatement_doctor.Rows)
                {
                    DataTable dt=odm.dispalyData("Select * from admin.TREATMENT_DOCTOR where DOCTOR_ID='"+row.Cells[2].Text+ "' and TREATMNT_ID='" + row.Cells[3].Text + "' ");
                    if (dt.Rows.Count==0)
                    {
                        odm.modifyData("insert into admin.TREATMENT_DOCTOR (DOCTOR_ID,TREATMNT_ID) values('" + row.Cells[2].Text + "','" + txt_TID.Text + "')");
                    }
                    

                }
                lbl_msg.Text = "Record updated succesfully!";
                loadTreatment();
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
                foreach (GridViewRow row in gv_treatement_doctor.Rows)
                {
                    odm.modifyData("Delete from admin.TREATMENT_DOCTOR where DOCTOR_ID='" + row.Cells[2].Text + "' and TREATMNT_ID='" + row.Cells[3].Text + "'  ");
                }

                odm.modifyData("delete from admin.TREATMENT where TREATMENT_ID='" + txt_TID.Text + "' ");
                lbl_msg.Text = "Record deleted Successfully!";
                loadTreatment();
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
            if (gv_Treatment.SelectedIndex != -1)
            {
                txt_TID.Text = gv_Treatment.SelectedRow.Cells[1].Text;
                txt_admission_Date.Text = gv_Treatment.SelectedRow.Cells[2].Text;
                txt_Ttype.Text = gv_Treatment.SelectedRow.Cells[3].Text;
                txt_PconditionBefore.Text = gv_Treatment.SelectedRow.Cells[4].Text;
                txt_treatmentAdvice.Text = gv_Treatment.SelectedRow.Cells[5].Text;
                txt_NumofDoctors.Text = gv_Treatment.SelectedRow.Cells[6].Text;
                txt_ConditionAfter.Text = gv_Treatment.SelectedRow.Cells[7].Text;
                txt_discharge_date.Text = gv_Treatment.SelectedRow.Cells[8].Text;
                ddl_PID.Text = gv_Treatment.SelectedRow.Cells[9].Text;
            }


            ViewState["Records"] = odm.dispalyData("select * from admin.TREATMENT_DOCTOR where TREATMNT_ID='"+txt_TID.Text+"'");
            gv_treatement_doctor.DataSource = ViewState["Records"];
            gv_treatement_doctor.DataBind();
        }
    }
}