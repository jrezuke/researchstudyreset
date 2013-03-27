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

namespace Account {

    public class ForgotPassword : UnsecuredLayoutsPageBase
    {
        protected override bool AllowAnonymousAccess
        {
            get
            {
                return base.AllowAnonymousAccess;
            }
        }

        protected TextBox txtEmail;
        protected Button btnSubmit;
        protected Label lblMessage;

        protected override void OnLoad(EventArgs e) {      
          // add code here
        }

        public void Submit_Click(object sender, EventArgs e)
        {
            SPSecurity.RunWithElevatedPrivileges(delegate()
                {
                    //lookup user by email
                    if (txtEmail.Text.Trim().Length == 0)
                        return;
                    string userName = Membership.GetUserNameByEmail(txtEmail.Text);
                    if (userName == null)
                    {
                        lblMessage.Text = "Could not find an account for this email address";
                        return;
                    }
                    lblMessage.Text = "Your password has been reset.  You should receive an email with your new password soon.";

                    MembershipUser user = Membership.GetUser(userName);
                    string password = user.ResetPassword();

                    string returnUrl = String.Empty;
                    if (HttpContext.Current.Request.QueryString["ReturnUrl"] != null)
                        returnUrl = HttpContext.Current.Request.QueryString["ReturnUrl"];

                    int pos = 0;
                    //get first occurance of /
                    pos = returnUrl.IndexOf("/");
                    //get second occurance of /
                    pos = returnUrl.IndexOf("/", pos+1);
                    //get third occurance of /
                    pos = returnUrl.IndexOf("/", pos + 1);
                    returnUrl = returnUrl.Substring(0, pos);
                    

                    StringBuilder sb = new StringBuilder();

                    // Send an email message            
                    MailMessage message = new MailMessage();
                    message.To.Add(txtEmail.Text);
                    message.From = new MailAddress("ResearchStudy@tch.harvard.edu");
                    message.Subject = "CHB Research Study Extranet: Account Password Reset";
                    // body
                    sb.Append("Your password has been reset.  Your new password is: " + password);
                    sb.Append(Environment.NewLine);
                    sb.Append(Environment.NewLine);
                    
                    sb.Append(@"After you log in you can reset your password at http://researchstudy.tch.harvard.edu" + returnUrl + "/_layouts/account/ResetPassword.aspx");
                    message.Body = sb.ToString();

                    SmtpClient emailClient = new SmtpClient();
                    emailClient.Host = "mail.childrenshospital.org";
                    emailClient.Port = 25;
                    emailClient.Send(message);
                });       
        }
  }
}
