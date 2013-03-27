using System;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Microsoft.SharePoint;
using Microsoft.SharePoint.WebControls;
using System.Web.Security;
using Microsoft.SharePoint.ApplicationPages;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Account
{
	public class Login:Microsoft.SharePoint.ApplicationPages.LoginPage
	{
        protected Label FailureText;
		protected TextBox UserName;
		protected TextBox password;
		protected override void OnLoad(EventArgs e)
		{
			base.OnLoad(e);
			this.login.LoggingIn += new System.Web.UI.WebControls.LoginCancelEventHandler(login_LoggingIn);
			this.login.LoggedIn += new EventHandler(login_LoggedIn);
            
		}

		void login_LoggingIn(object sender, System.Web.UI.WebControls.LoginCancelEventArgs e)
		{
			string user = login.UserName;
			string pwrd = login.Password;
            SPSite site = SPContext.Current.Site;

            if (Membership.ValidateUser(user, pwrd))
            {
                
            }
            
		}
        		
        void login_LoggedIn(object sender, EventArgs e)
		{
            //SPSite site = SPContext.Current.Site;
            //login.RememberMeSet = false;
            //if (login.UserName != "jr139")
            //{

            //    if (IsRegistered())
            //    {
            //        Response.Redirect(site.Url + "/_layouts/Review/dash2.aspx");
            //    }
            //    else
            //        Response.Redirect(site.Url + "/_layouts/Review/Register.aspx");
            //}
		}        
	}
}
