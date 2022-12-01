using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Healthy_Life
{
    public partial class Bill : System.Web.UI.Page
    {
        OracleDataManipulator odm = new OracleDataManipulator();
        DataTable dt_bill_doctor = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (ViewState["Records"] == null)
                {
                    dt_bill_doctor.Columns.Add("DOCTOR_ID");
                    dt_bill_doctor.Columns.Add("Bill_ID");
                    ViewState["Records"] = dt_bill_doctor;
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
                loadbill();
            }
        }
        protected void loadbill()
        {
            DataTable dt = odm.dispalyData("Select * from admin.BILL");
            gv_bill.DataSource = dt;
            gv_bill.DataBind();
        }

        protected void btn_addDoctor_Click(object sender, EventArgs e)
        {
            dt_bill_doctor = (DataTable)ViewState["Records"];
            dt_bill_doctor.Rows.Add(ddl_docID.Text, txt_BID.Text);
            gv_Bill_doctor.DataSource = dt_bill_doctor;
            gv_Bill_doctor.DataBind();
        }

        protected void btn_add_Click(object sender, EventArgs e)
        {
            try
            {
                odm.modifyData("insert into admin.BILL (BILL_ID,BILL_DATE,TEST_CHARGES,BLOOD_CHARGES,TOTAL,PATIENT_ID,ROOM_ID,TREATMENT_ID) values('"+txt_BID.Text+ "',DATE'"+txt_BDate.Text+ "','"+float.Parse(txt_testcharges.Text)+ "','"+float.Parse(txt_BloodCharges.Text)+ "','"+float.Parse(txt_total.Text)+ "','"+ddl_PID.Text+ "','"+ddl_RID.Text+ "','"+ddl_TID.Text+"')");
                
                foreach (GridViewRow row in gv_Bill_doctor.Rows)
                {
                    odm.modifyData("insert into admin.BILL_DOCTOR (DOCTOR_ID,Bill_ID) values('" + row.Cells[2].Text + "','" + txt_BID.Text + "')");

                }


                lbl_msg.Text = "Bill added successfully!";
                loadbill();
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
                odm.modifyData("Update admin.BILL set BILL_DATE=DATE'" + txt_BDate.Text + "',TEST_CHARGES='" + float.Parse(txt_testcharges.Text) + "',BLOOD_CHARGES='" + float.Parse(txt_BloodCharges.Text) + "',TOTAL='" + float.Parse(txt_total.Text) + "',PATIENT_ID='" + ddl_PID.Text + "',ROOM_ID='" + ddl_RID.Text + "',TREATMENT_ID='" + ddl_TID.Text + "' where BILL_ID='" + txt_BID.Text + "' ");
                foreach (GridViewRow row in gv_Bill_doctor.Rows)
                {
                    DataTable dt = odm.dispalyData("Select * from admin.BILL_DOCTOR where DOCTOR_ID='" + row.Cells[2].Text + "' and BILL_ID='" + row.Cells[3].Text + "' ");
                    if (dt.Rows.Count == 0)
                    {
                        odm.modifyData("insert into admin.BILL_DOCTOR (DOCTOR_ID,BILL_ID) values('" + row.Cells[2].Text + "','" + txt_BID.Text + "')");
                    }


                }
                lbl_msg.Text = "Record updated succesfully!";
                loadbill();
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
                foreach (GridViewRow row in gv_Bill_doctor.Rows)
                {
                    odm.modifyData("Delete from admin.BILL_DOCTOR where DOCTOR_ID='" + row.Cells[2].Text + "' and BILL_ID='" + row.Cells[3].Text + "'  ");
                }

                odm.modifyData("delete from admin.Bill where BILL_ID='" + txt_BID.Text + "' ");
                lbl_msg.Text = "Record deleted Successfully!";
                loadbill();
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

        protected void gv_Bill_doctor_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (gv_Bill_doctor.SelectedIndex != -1)
            {
                ddl_docID.Text = gv_Bill_doctor.SelectedRow.Cells[2].Text;

            }
        }

        protected void gv_bill_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (gv_bill.SelectedIndex != -1)
                {
                    txt_BID.Text = gv_bill.SelectedRow.Cells[1].Text;
                    txt_BDate.Text = gv_bill.SelectedRow.Cells[2].Text;
                    txt_testcharges.Text = gv_bill.SelectedRow.Cells[3].Text;
                    txt_BloodCharges.Text = gv_bill.SelectedRow.Cells[4].Text;
                    txt_total.Text = gv_bill.SelectedRow.Cells[5].Text;
                    ddl_PID.Text = gv_bill.SelectedRow.Cells[6].Text;
                    ddl_RID.Text = gv_bill.SelectedRow.Cells[7].Text;
                    ddl_TID.Text = gv_bill.SelectedRow.Cells[8].Text;
                }
                ViewState["Records"] = odm.dispalyData("select * from admin.BILL_DOCTOR where BILL_ID='" + txt_BID.Text + "'");
                gv_Bill_doctor.DataSource = ViewState["Records"];
                gv_Bill_doctor.DataBind();
            }
            catch (Exception ex)
            {

                lbl_msg.Text = ex.Message.ToString();
            }
            
        }

        protected void ddl_PID_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddl_RID.Items.Clear();
            ddl_TID.Items.Clear();
            DataTable dt1 = odm.dispalyData("select * from admin.ROOM where PATIENT_ID='" + ddl_PID.Text + "'");
            foreach (DataRow dr in dt1.Rows)
            {
                ddl_RID.Items.Add(dr[0].ToString());
            }


            DataTable dt2 = odm.dispalyData("select * from admin.TREATMENT where PATIENT_ID='" + ddl_PID.Text + "'");
            foreach (DataRow dr in dt2.Rows)
            {
                ddl_TID.Items.Add(dr[0].ToString());
            }
        }
        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = Convert.ToInt32(e.RowIndex);
            DataTable dt = ViewState["Records"] as DataTable;
            dt.Rows[index].Delete();
            ViewState["Records"] = dt;
            gv_Bill_doctor.DataSource = ViewState["Records"] as DataTable;
            gv_Bill_doctor.DataBind();
        }

     
    }
}