using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace aw_admin
{
    public partial class acceso : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    using (db_admEntities edm_nemp = new db_admEntities())
                    {
                        var i_nemp = (from c in edm_nemp.inf_emp
                                      select c).ToList();

                        if (i_nemp.Count == 0)
                        {
                            rfv_usuario.Enabled = false;
                            rfv_clave.Enabled = false;
                            lkb_registro.Visible = true;
                        }
                        else
                        {
                            rfv_usuario.Enabled = true;
                            rfv_clave.Enabled = true;
                            lkb_registro.Visible = false;
                        }
                    }
                }
            }
            catch
            {
                Response.Redirect("acceso.aspx");
            }
        }

        #region funciones

        private void Mensaje(string contenido)
        {
            lblModalTitle.Text = "Admin";
            lblModalBody.Text = contenido;
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
            upModal.Update();
        }

        #endregion funciones

        protected void lkb_registro_Click(object sender, EventArgs e)
        {
            Response.Redirect("registro_inicial.aspx");
        }

        protected void btn_acceso_Click(object sender, EventArgs e)
        {
            Guid guid_usrID;
            string str_code, str_clave;

            str_code = txt_usuario.Text.Trim().ToLower();
            str_clave = encrypta.Encrypt(txt_clave.Text.Trim().ToLower());

            using (db_admEntities edm_fusr = new db_admEntities())
            {
                var i_fusr = (from c in edm_fusr.inf_usr
                              where c.usr == str_code
                              select c).ToList();

                if (i_fusr.Count == 0)
                {
                    Mensaje("Usuario incorrecto favor de reintentar");
                    txt_clave.Text = null;
                }
                else
                {
                    if (i_fusr[0].clave == str_clave)
                    {
                        guid_usrID = i_fusr[0].usrID;

                        Session["ss_idusr"] = guid_usrID;
                        Response.Redirect("pnl_ctrl.aspx");
                    }
                    else
                    {
                        Mensaje("Clave incorrecto favor de reintentar");
                        txt_clave.Text = null;
                    }
                }
            }
        }
    }
}