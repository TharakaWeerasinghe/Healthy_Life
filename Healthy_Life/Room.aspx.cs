using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Healthy_Life
{
    public partial class Room : System.Web.UI.Page
    {
        OracleDataManipulator odm = new OracleDataManipulator();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt = odm.dispalyData("Select * from admin.DEPARTMENTS order by DEPARTMENT_ID asc");
                foreach (DataRow dr in dt.Rows)
                {
                    ddl_DID.Items.Add(dr["DEPARTMENT_ID"].ToString());
                }
                
            }
            if (!IsPostBack)
            {
                DataTable dt = odm.dispalyData("Select * from admin.PATIENT order by PATIENT_ID asc");
                foreach (DataRow dr in dt.Rows)
                {
                    ddl_PID.Items.Add(dr["PATIENT_ID"].ToString());
                }

            }
            loadRooms();
        }

        protected void loadRooms()
        {
            DataTable dt = odm.dispalyData("Select * from admin.ROOM");
            gv_Rooms.DataSource = dt;
            gv_Rooms.DataBind();
        }

        protected void btn_add_Click(object sender, EventArgs e)
        {
            try
            {
                
               
                odm.modifyData("insert into admin.ROOM (ROOM_ID,ROOM_STATUS,ROOM_TYPE,ROOM_CHARGE,DEPARTMENT_ID,PATIENT_ID) values ('"+txt_RID.Text+ "','"+ddl_status.Text+ "','"+ddl_type.Text+ "','"+float.Parse(txt_charge.Text)+ "','"+ddl_DID.Text+ "','"+ddl_PID.Text+"')");
                lbl_msg.Text = "Room Added Successfully!";
                loadRooms();
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
                odm.modifyData("update admin.Room set ROOM_STATUS='"+ddl_status.Text+ "', ROOM_TYPE='"+ddl_type.Text+ "', ROOM_CHARGE='"+float.Parse(txt_charge.Text)+ "', DEPARTMENT_ID='"+ddl_DID.Text+ "', PATIENT_ID='"+ddl_PID.Text+ "' where ROOM_ID='"+txt_RID.Text+"' ");
                lbl_msg.Text = "Room Upadated Successfully!";
                loadRooms();

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
                odm.modifyData("delete from admin.ROOM where ROOM_ID='" + txt_RID.Text + "'");
                lbl_msg.Text = "Room Deleted Successfully!";
                loadRooms();

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

        protected void gv_Rooms_SelectedIndexChanged(object sender, EventArgs e)
        {
            string v = "";
            if (gv_Rooms.SelectedIndex != -1)
            {
                txt_RID.Text = gv_Rooms.SelectedRow.Cells[1].Text;
                ddl_status.Text = gv_Rooms.SelectedRow.Cells[2].Text;
                ddl_type.Text = gv_Rooms.SelectedRow.Cells[3].Text;
                txt_charge.Text = gv_Rooms.SelectedRow.Cells[4].Text;
                ddl_DID.Text = gv_Rooms.SelectedRow.Cells[5].Text;


                if (gv_Rooms.SelectedRow.Cells[6].Text.Equals("&nbsp;"))
                {
                    ddl_PID.Text = "";
                }
                else
                {
                    ddl_PID.Text = gv_Rooms.SelectedRow.Cells[6].Text;
                }

            }
        }
    }
}