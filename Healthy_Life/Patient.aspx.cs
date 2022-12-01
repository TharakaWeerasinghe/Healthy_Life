using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Healthy_Life
{
    public partial class Patient : System.Web.UI.Page
    {
        OracleDataManipulator odm = new OracleDataManipulator();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt = odm.dispalyData("Select * from admin.DOCTOR order by DOCOTR_ID asc");
                foreach (DataRow dr in dt.Rows)
                {
                    dpl_DID.Items.Add(dr["DOCOTR_ID"].ToString());
                }
                loadPatients();
            }
        }

        protected void loadPatients()
        {
            DataTable dt = odm.dispalyData("Select * from admin.PATIENT");
            gv_patients.DataSource = dt;
            gv_patients.DataBind();
        }

        protected void btn_add_Click(object sender, EventArgs e)
        {
            try
            {
                odm.modifyData("insert into admin.PATIENT (PATIENT_ID,TITLE,FULL_NAME,DATE_OF_BIRTH,GENDER,CITY,ADDRESS,MOBILE_NO,LAND_NUMBER,SYMPTOM,ENTRY_DATE,DOCTOR_ID) values ('"+txt_pID.Text+"','"+ddl_title.Text+ "','"+txt_name.Text+ "',DATE'"+txt_DOB.Text+ "','"+ddl_gender.Text+ "','"+txt_city.Text+ "','"+txt_Address.Text+ "','"+txt_MNO.Text+ "','"+txt_LNO.Text+ "','"+txt_symptom.Text+ "',DATE'"+txt_entry.Text+ "','"+dpl_DID.Text+"')");
                lbl_msg.Text = "Registration Success!";
                loadPatients();
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
                odm.modifyData("update admin.PATIENT set TITLE='"+ddl_title.Text+ "',FULL_NAME='"+txt_name.Text+ "',DATE_OF_BIRTH=Date'"+txt_DOB.Text+ "',GENDER='"+ddl_gender.Text+ "',CITY='"+txt_city.Text+ "',ADDRESS='"+txt_Address.Text+ "',MOBILE_NO='"+txt_MNO.Text+ "',LAND_NUMBER='"+txt_LNO.Text+ "',SYMPTOM='"+txt_symptom.Text+ "',ENTRY_DATE=DATE'"+txt_entry.Text+ "',DOCTOR_ID='"+dpl_DID.Text+ "' where PATIENT_ID='"+txt_pID.Text+"'");
                lbl_msg.Text = "Update Success!";
                loadPatients();
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
                odm.modifyData("Delete from admin.PATIENT where PATIENT_ID='" + txt_pID.Text + "' ");
                lbl_msg.Text = "Delete Success!";
                loadPatients();
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

        protected void gv_patients_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (gv_patients.SelectedIndex != -1)
            {
                txt_pID.Text = gv_patients.SelectedRow.Cells[1].Text;
                ddl_title.Text = gv_patients.SelectedRow.Cells[2].Text;
                txt_name.Text = gv_patients.SelectedRow.Cells[3].Text;
                txt_DOB.Text = gv_patients.SelectedRow.Cells[4].Text;
                ddl_gender.Text = gv_patients.SelectedRow.Cells[5].Text;
                txt_city.Text = gv_patients.SelectedRow.Cells[6].Text;
                txt_Address.Text = gv_patients.SelectedRow.Cells[7].Text;
                txt_MNO.Text = gv_patients.SelectedRow.Cells[8].Text;
                txt_LNO.Text = gv_patients.SelectedRow.Cells[9].Text;
                txt_symptom.Text = gv_patients.SelectedRow.Cells[10].Text;
                txt_entry.Text = gv_patients.SelectedRow.Cells[11].Text;
                dpl_DID.Text = gv_patients.SelectedRow.Cells[12].Text;
            }
        }
    }
}