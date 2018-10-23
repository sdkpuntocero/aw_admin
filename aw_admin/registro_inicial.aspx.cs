using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace aw_admin
{
    public partial class registro_inicial : System.Web.UI.Page
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
                            limp_txt_emp();
                        }
                        else
                        {
                            Response.Redirect("acceso.aspx");
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

        #region empresa

        protected void lkbtn_guardar_emp_Click(object sender, EventArgs e)
        {
            Guid guid_emp, guid_usr;

            string str_cod_usr, str_nom_emp, str_tel_emp, str_email_emp, str_callenum_emp, str_cp_emp, str_noms, str_apat, str_amat, str_code, str_clave;
            int int_col_emp;

            guid_emp = Guid.NewGuid();
            guid_usr = Guid.NewGuid();

            str_nom_emp = txt_nom_emp.Text.ToUpper().Trim();
            str_tel_emp = txt_telefono_emp.Text;
            str_email_emp = txt_email_emp.Text.Trim();
            str_callenum_emp = txt_callenum_emp.Text.ToUpper().Trim();
            str_cp_emp = txt_cp_emp.Text;
            int_col_emp = Convert.ToInt32(ddl_colonia_emp.SelectedValue);

            str_noms = txt_noms_usr.Text.ToUpper().Trim();
            str_apat = txt_apat_usr.Text.ToUpper().Trim();
            str_amat = txt_amat_usr.Text.ToUpper().Trim();
            str_code = txt_code_usr.Text.ToLower().Trim();
            str_clave = encrypta.Encrypt(txt_clave_usr.Text.ToLower().Trim());

            using (db_admEntities edm_nemp = new db_admEntities())
            {
                var i_nemp = (from c in edm_nemp.inf_emp
                              where c.nom.Contains(str_nom_emp)
                              select c).ToList();

                if (i_nemp.Count == 0)
                {
                    var i_emp = (from c in edm_nemp.inf_emp
                                 select c).ToList();

                    if (i_emp.Count == 0)
                    {
                        str_cod_usr = "USR-" + string.Format("{0:000}", (object)(i_emp.Count + 1));
                        var md_nemp = new inf_emp

                        {
                            empID = guid_emp,
                            est_empID = 1,
                            nom = str_nom_emp,
                            tel = str_tel_emp,
                            email = str_email_emp,
                            calle_num = str_callenum_emp,
                            d_codigo = str_cp_emp,
                            id_asenta_cpcons = int_col_emp,
                            fech_reg = DateTime.Now,
                        };

                        edm_nemp.inf_emp.Add(md_nemp);
                        edm_nemp.SaveChanges();

                        var md_nusr = new inf_usr

                        {
                            usrID = guid_usr,
                            est_usrID = 1,
                            tipo_usrID = 2,
                            code_usr = str_cod_usr,
                            noms = str_noms,
                            apat = str_apat,
                            amat = str_amat,
                            usr = str_code,
                            clave = str_clave,
                            fech_reg = DateTime.Now,
                            empID = guid_emp
                        };

                        edm_nemp.inf_usr.Add(md_nusr);
                        edm_nemp.SaveChanges();
                        limp_txt_emp();
                        rfv_nom_emp.Enabled = false;
                        rfv_callenum_emp.Enabled = false;
                        rfv_cp_emp.Enabled = false;
                        rfv_colonia_emp.Enabled = false;
                        rfv_noms_usr.Enabled = false;
                        rfv_code_usr.Enabled = false;
                        rfv_apat_usr.Enabled = false;
                        rfv_clave_usr.Enabled = false;
                        rfv_amat_usr.Enabled = false;
                        Mensaje("Datos de empresa y administrador agregados con éxito.");
                    }
                }
            }
        }

        private void limp_txt_emp()
        {
            ddl_colonia_emp.Items.Clear();
            ddl_colonia_emp.Items.Insert(0, new ListItem("Seleccionar", "0"));

            txt_nom_emp.Text = null;
            txt_telefono_emp.Text = null;
            txt_email_emp.Text = null;
            txt_callenum_emp.Text = null;
            txt_cp_emp.Text = null;

            txt_municipio_emp.Text = null;
            txt_estado_emp.Text = null;

            txt_noms_usr.Text = null;
            txt_apat_usr.Text = null;
            txt_amat_usr.Text = null;
            txt_code_usr.Text = null;
            txt_clave_usr.Text = null;
        }

        protected void btn_cp_emp_Click(object sender, EventArgs e)
        {
            string str_cp = txt_cp_emp.Text;

            datos_sepomex(str_cp);

            ddl_colonia_emp.Focus();
        }

        private void datos_sepomex(string str_codigo)
        {
            using (db_admEntities db_sepomex = new db_admEntities())
            {
                var tbl_sepomex = (from c in db_sepomex.inf_sepomex
                                   where c.d_codigo == str_codigo
                                   select c).ToList();

                ddl_colonia_emp.DataSource = tbl_sepomex;
                ddl_colonia_emp.DataTextField = "d_asenta";
                ddl_colonia_emp.DataValueField = "id_asenta_cpcons";
                ddl_colonia_emp.DataBind();

                if (tbl_sepomex.Count == 1)
                {
                    txt_municipio_emp.Text = tbl_sepomex[0].d_mnpio;
                    txt_estado_emp.Text = tbl_sepomex[0].d_estado;
                    rfv_colonia_emp.Enabled = true;
                    rfv_noms_usr.Enabled = true;
                    rfv_code_usr.Enabled = true;
                    rfv_apat_usr.Enabled = true;
                    rfv_clave_usr.Enabled = true;
                    rfv_amat_usr.Enabled = true;
                }
                if (tbl_sepomex.Count > 1)
                {
                    ddl_colonia_emp.Items.Insert(0, new ListItem("Seleccionar", "0"));

                    txt_municipio_emp.Text = tbl_sepomex[0].d_mnpio;
                    txt_estado_emp.Text = tbl_sepomex[0].d_estado;
                    rfv_colonia_emp.Enabled = true;
                    rfv_noms_usr.Enabled = true;
                    rfv_code_usr.Enabled = true;
                    rfv_apat_usr.Enabled = true;
                    rfv_clave_usr.Enabled = true;
                    rfv_amat_usr.Enabled = true;
                }
                else if (tbl_sepomex.Count == 0)
                {
                    ddl_colonia_emp.Items.Clear();
                    ddl_colonia_emp.Items.Insert(0, new ListItem("Seleccionar", "0"));
                    txt_municipio_emp.Text = null;
                    txt_estado_emp.Text = null;
                    rfv_colonia_emp.Enabled = false;
                    rfv_noms_usr.Enabled = false;
                    rfv_code_usr.Enabled = false;
                    rfv_apat_usr.Enabled = false;
                    rfv_clave_usr.Enabled = false;
                    rfv_amat_usr.Enabled = false;
                }
            }
            up_emp.Update();
        }

        #endregion empresa

        protected void lkbtn_modal_Click(object sender, EventArgs e)
        {
            Response.Redirect("acceso.aspx");
        }
    }
}