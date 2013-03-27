using System;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Microsoft.SharePoint;
using Microsoft.SharePoint.WebControls;
using System.Net.Mail;
using System.Web.Security;

namespace Account
{

    public class ResetPassword : LayoutsPageBase
    {
        protected TextBox txtOldPw;
        protected TextBox txtNewPw;
        protected Button btnSubmit;
        protected Label lblMessage;

        public void Submit_Click(object sender, EventArgs e)
        {
            string userName = User.Identity.Name;
            MembershipUser user = Membership.GetUser(userName);

            if(user.ChangePassword(txtOldPw.Text, txtNewPw.Text))
            {
                lblMessage.Text = "Your password has been changed!";
            }
            else
                lblMessage.Text = "Could not change your password";

        }
	}
    
}
