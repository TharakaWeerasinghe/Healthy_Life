using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Healthy_Life
{
    public partial class Department : System.Web.UI.Page
    {
        OracleDataManipulator odm = new OracleDataManipulator();
        protected void Page_Load(object sender, EventArgs e)
        {
            load_departments();
        }

        // method for loading the data from department table of the database to the gridview
        protected void load_departments()
        {
            DataTable dt = odm.dispalyData("Select * from admin.Departments");
            gv_departments.DataSource = dt;
            gv_departments.DataBind();
        }

        protected void btn_add_Click(object sender, EventArgs e)
        {
            try
            {
                //add a new department to the database
                odm.modifyData("Insert into admin.Departments (Department_ID,Department_name,Department_location,Department_facilites) values('" + txt_dID.Text + "','" + txt_Dname.Text + "','" + txt_dlocation.Text + "','" + txt_dfacilities.Text + "')");
                load_departments();
                lbl_msg.Text = "Department Added succesfully!";
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
                odm.modifyData("Update admin.Departments set Department_name='" + txt_Dname.Text + "',Department_location='" + txt_dlocation.Text + "', Department_facilites='" + txt_dfacilities.Text + "' where Department_ID='" + txt_dID.Text + "' ");
                load_departments();
                lbl_msg.Text = "Department updated succesfully!";
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
                odm.modifyData("Delete from admin.Departments where Department_ID='" + txt_dID.Text + "' ");
                load_departments();
                lbl_msg.Text = "Department Deleted!";
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

        protected void gv_departments_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (gv_departments.SelectedIndex != -1)
            {
                txt_dID.Text = gv_departments.SelectedRow.Cells[1].Text;
                txt_Dname.Text = gv_departments.SelectedRow.Cells[2].Text;
                txt_dlocation.Text = gv_departments.SelectedRow.Cells[3].Text;
                txt_dfacilities.Text = gv_departments.SelectedRow.Cells[4].Text;
            }
        }
    }
}