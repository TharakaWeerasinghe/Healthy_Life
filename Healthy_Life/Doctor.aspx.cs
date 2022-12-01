using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Healthy_Life
{
    public partial class Doctor : System.Web.UI.Page
    {
        OracleDataManipulator odm = new OracleDataManipulator();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt = odm.dispalyData("Select * from admin.DEPARTMENTS order by DEPARTMENT_ID asc");
                foreach (DataRow dr in dt.Rows)
                {
                    DropDownList1.Items.Add(dr["DEPARTMENT_ID"].ToString());
                }
                load_Doctors();
            }
            

        }
        protected void load_Doctors()
        {
            DataTable dt = odm.dispalyData("Select * from admin.DOCTOR");
            gv_doctors.DataSource = dt;
            gv_doctors.DataBind();
        }

        protected void btn_add_Click(object sender, EventArgs e)
        {
            try
            {
                odm.modifyData("Insert into admin.DOCTOR (DOCOTR_ID,DOCTOR_NAME,DOCTOR_SPECIALIZATION,DOCTOR_ADDRESS,DOCTOR_CNO,CONSULTATION_FEE,DEPARTMENT_ID) values('" + txt_docID.Text + "','" + txt_Docname.Text + "','" + txt_docSpecialization.Text + "','" + txt_docAddress.Text + "','" + txt_docCNO.Text + "','" + float.Parse(txt_docFee.Text) + "','" + DropDownList1.Text + "')");
                load_Doctors();
                lbl_msg.Text = "Doctor added successfully!";
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
                odm.modifyData("update admin.DOCTOR set DOCTOR_NAME='"+txt_Docname.Text+ "', DOCTOR_SPECIALIZATION='"+txt_docSpecialization.Text+ "',DOCTOR_ADDRESS='"+txt_docAddress.Text+ "',DOCTOR_CNO='"+txt_docCNO.Text+ "',CONSULTATION_FEE='"+float.Parse(txt_docFee.Text)+ "' where  DOCOTR_ID='"+txt_docID.Text+"'");
                lbl_msg.Text = "Doctor updated successfully!";
                load_Doctors();
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
                odm.modifyData("Delete from admin.DOCTOR where DOCOTR_ID='" + txt_docID.Text + "' ");
                lbl_msg.Text = "Doctor Deleted successfully!";
                load_Doctors();
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

        protected void gv_doctors_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (gv_doctors.SelectedIndex != -1)
            {
                txt_docID.Text = gv_doctors.SelectedRow.Cells[1].Text;
                txt_Docname.Text = gv_doctors.SelectedRow.Cells[2].Text;
                txt_docSpecialization.Text = gv_doctors.SelectedRow.Cells[3].Text;
                txt_docAddress.Text = gv_doctors.SelectedRow.Cells[4].Text;
                txt_docCNO.Text = gv_doctors.SelectedRow.Cells[5].Text;
                txt_docFee.Text = gv_doctors.SelectedRow.Cells[6].Text;
                DropDownList1.Text = gv_doctors.SelectedRow.Cells[7].Text;
            }
        }
    }
}