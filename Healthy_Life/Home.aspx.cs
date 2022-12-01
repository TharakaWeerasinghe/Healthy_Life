using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Healthy_Life
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Btn_logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }

        protected void btn_departments_Click(object sender, EventArgs e)
        {
            Response.Redirect("Department.aspx");
        }

        protected void btn_doctors_Click(object sender, EventArgs e)
        {
            Response.Redirect("Doctor.aspx");
        }

        protected void btn_customer_Click(object sender, EventArgs e)
        {
            Response.Redirect("Patient.aspx");
        }

        protected void btn_drugs_Click(object sender, EventArgs e)
        {
            Response.Redirect("Drug.aspx");
        }

        protected void btn_rooms_Click(object sender, EventArgs e)
        {
            Response.Redirect("Room.aspx");
        }

        protected void btn_prescription_Click(object sender, EventArgs e)
        {
            Response.Redirect("Prescription.aspx");
        }

        protected void btn_treatments_Click(object sender, EventArgs e)
        {
            Response.Redirect("Treatment.aspx");
        }

        protected void btn_bill_Click(object sender, EventArgs e)
        {
            Response.Redirect("Bill.aspx");
        }
    }
}