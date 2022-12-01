using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Healthy_Life
{
    public partial class Register : System.Web.UI.Page
    {
        OracleDataManipulator odm = new OracleDataManipulator();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void btn_register_Click(object sender, EventArgs e)
        {
            try
            {
                odm.modifyData("insert into admin.REGISTER (USERNAME,FNAME,LNAME,PASSWORD,AGE,EMAIL,ADDRESS) values ('" + Username.Text + "','" + Fname.Text + "','" + Lname.Text + "','" + password.Text + "','" + int.Parse(Age.Text) + "','" + Email.Text + "','" + Address.Text + "')");
                lbl_msg.Text = "Registration Succesful!";
            }
            catch (Exception ex)
            {
                lbl_msg.Text = ex.Message.ToString();

            }
        }
    }
}