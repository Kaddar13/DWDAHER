using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.Web.Security;
    using System.Web.SessionState;
    using DevExpress.Web;

using DevExpress.XtraReports.Native;
using DevExpress.XtraReports.Web.ReportDesigner;
using DX_DAHERCMS.ToolBox.Etiquette;
using System.Configuration;
using DevExpress.Xpo;
using DevExpress.Xpo.DB;


    namespace DX_DAHERCMS {
        public class Global_asax : System.Web.HttpApplication {
            void Application_Start(object sender, EventArgs e) {
                
               
                DevExpress.Web.ASPxWebControl.CallbackError += new EventHandler(Application_Error);
                SerializationService.RegisterSerializer(MyDataSerializer.Name, new MyDataSerializer());
                DevExpress.XtraReports.Web.Extensions.ReportStorageWebExtension.RegisterExtensionGlobal(new CustomReportStorageWebExtension());
                //DefaultReportDesignerContainer.RegisterDataSourceWizardConfigFileConnectionStringsProvider();
                DefaultReportDesignerContainer.RegisterDataSourceWizardConnectionStringsProvider<MyDataSourceWizardConnectionStringsProvider>();
                //DevExpress.Web.ASPxClasses.ASPxWebControl.CallbackError += new EventHandler(Application_Error);             



              
            }

            void Application_End(object sender, EventArgs e) {
                // Code that runs on application shutdown
            }

            void Application_Error(object sender, EventArgs e) {
                // Code that runs when an unhandled error occurs
            }

            void Session_Start(object sender, EventArgs e) {
                // Code that runs when a new session is started
            }

            void Session_End(object sender, EventArgs e) {
                // Code that runs when a session ends. 
                // Note: The Session_End event is raised only when the sessionstate mode
                // is set to InProc in the Web.config file. If session mode is set to StateServer 
                // or SQLServer, the event is not raised.
            }
        }
    }