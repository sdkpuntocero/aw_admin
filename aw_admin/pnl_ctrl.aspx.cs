using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace aw_admin
{
    public partial class pnl_ctrl : System.Web.UI.Page
    {
        private static int int_usr, int_pnlID, int_idperf, int_clte, int_fisc, int_prov, int_inv_prod;
        private static Guid guid_emp = Guid.Empty, guid_idusr = Guid.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    inf_usr_oper();
                }
                else
                {
                }
            }
            catch
            {
                Response.Redirect("acceso.aspx");
            }
        }

        private void inf_usr_oper()
        {
            guid_idusr = (Guid)(Session["ss_idusr"]);

            using (db_admEntities m_usuario = new db_admEntities())
            {
                var i_usuario = (from i_u in m_usuario.inf_usr
                                 join i_tu in m_usuario.fact_tipo_usr on i_u.tipo_usrID equals i_tu.tipo_usrID
                                 join i_c in m_usuario.inf_emp on i_u.empID equals i_c.empID

                                 where i_u.usrID == guid_idusr
                                 select new
                                 {
                                     i_u.noms,
                                     i_u.apat,
                                     i_u.amat,
                                     i_tu.desc_tipo_usr,
                                     i_tu.tipo_usrID,
                                     i_c.nom,
                                     i_c.empID
                                 }).FirstOrDefault();

                lbl_usr_oper.Text = i_usuario.noms + " " + i_usuario.apat + " " + i_usuario.amat;
                lbl_tusr.Text = i_usuario.desc_tipo_usr;
                int_idperf = i_usuario.tipo_usrID;
                lbl_emp_oper.Text = i_usuario.nom;
                guid_emp = i_usuario.empID;

                switch (int_idperf)
                {
                    case 1:

                        break;

                    case 2:

                        break;

                    default:

                        break;
                }
            }
        }

        #region menu

        protected void lkbtn_inv_Click(object sender, EventArgs e)
        {
            int_inv_prod = 0;
            int_pnlID = 5;

            div_busc_inv_prod.Visible = false;
            i_agr_inv_prod.Attributes["style"] = "color:blue";
            i_edit_inv_prod.Attributes["style"] = "color:blue";
            gv_inv_prod.Visible = false;
            limpia_txt_inv_prod();

            pnl_inv_prod.Visible = true;
            up_inv_prod.Update();
            pnl_prov.Visible = false;
            up_prov.Update();
            pnl_clte.Visible = false;
            up_clte.Update();
            pnl_fisc.Visible = false;
            up_fisc.Update();
            pnl_usrs.Visible = false;
            up_usrs.Update();
        }

        protected void lkbtn_prov_Click(object sender, EventArgs e)
        {
            int_pnlID = 4;
            int_prov = 0;
            i_prov.Attributes["style"] = "color:#104D8d";
            lbl_prov.Attributes["style"] = "color:#104D8d";

            i_agregar_prov.Attributes["style"] = "color:blue";
            i_editar_prov.Attributes["style"] = "color:blue";

            limp_txt_prov();
            txt_buscar_prov.Text = null;
            gv_prov.Visible = false;

            pnl_inv_prod.Visible = false;
            up_inv_prod.Update();
            pnl_prov.Visible = true;
            up_prov.Update();
            pnl_clte.Visible = false;
            up_clte.Update();
            pnl_fisc.Visible = false;
            up_fisc.Update();
            pnl_usrs.Visible = false;
            up_usrs.Update();
        }

        protected void lkbtn_clte_Click(object sender, EventArgs e)
        {
            int_pnlID = 3;
            int_clte = 0;
            i_clte.Attributes["style"] = "color:#104D8d";
            lbl_clte.Attributes["style"] = "color:#104D8d";

            i_agregar_clte.Attributes["style"] = "color:blue";
            i_editar_clte.Attributes["style"] = "color:blue";

            limp_txt_clte();
            txt_buscar_clte.Text = null;
            gv_clte.Visible = false;

            pnl_inv_prod.Visible = false;
            up_inv_prod.Update();
            pnl_prov.Visible = false;
            up_prov.Update();
            pnl_clte.Visible = true;
            up_clte.Update();
            pnl_fisc.Visible = false;
            up_fisc.Update();
            pnl_usrs.Visible = false;
            up_usrs.Update();
        }

        protected void lkbtn_fisc_Click(object sender, EventArgs e)
        {
            int_pnlID = 2;
            int_fisc = 0;
            i_fisc.Attributes["style"] = "color:#104D8d";
            lbl_fisc.Attributes["style"] = "color:#104D8d";

            i_agregar_fisc.Attributes["style"] = "color:blue";
            i_editar_fisc.Attributes["style"] = "color:blue";

            limp_txt_fisc();
            txt_buscar_fisc.Text = null;
            gv_fisc.Visible = false;

            pnl_inv_prod.Visible = false;
            up_inv_prod.Update();
            pnl_prov.Visible = false;
            up_prov.Update();
            pnl_clte.Visible = false;
            up_clte.Update();
            pnl_fisc.Visible = true;
            up_fisc.Update();
            pnl_usrs.Visible = false;
            up_usrs.Update();
        }

        protected void lkbtn_usrs_Click(object sender, EventArgs e)
        {
            int_usr = 0;
            int_pnlID = 1;

            i_usrs.Attributes["style"] = "color:#104D8d";
            lbl_usrs.Attributes["style"] = "color:#104D8d";

            i_agregar_usrs.Attributes["style"] = "color:blue";
            i_editar_usrs.Attributes["style"] = "color:blue";
            limp_txt_usr();
            div_busc_usr.Visible = false;

            pnl_inv_prod.Visible = false;
            up_inv_prod.Update();
            pnl_prov.Visible = false;
            up_prov.Update();
            pnl_clte.Visible = false;
            up_clte.Update();
            pnl_fisc.Visible = false;
            up_fisc.Update();
            pnl_usrs.Visible = true;
            up_usrs.Update();
        }

        #endregion menu

        #region funciones

        private void Mensaje(string contenido)
        {
            lblModalTitle.Text = "Admin";
            lblModalBody.Text = contenido;
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
            upModal.Update();
        }

        [ScriptMethod()]
        [WebMethod]
        public static List<string> SearchCustomers(string prefixText, int count)
        {
            List<String> columnData = new List<String>();
            string d_rub = prefixText.ToUpper();

            if (int_pnlID == 1)
            {
                string f_rub = prefixText.ToUpper();
                using (db_admEntities m_rub = new db_admEntities())
                {
                    var i_rub = (from i_u in m_rub.inf_usr
                                 where i_u.noms.Contains(d_rub)
                                 select new
                                 {
                                     nom_com = i_u.noms + " " + i_u.apat + " " + i_u.apat,
                                     i_u.code_usr,
                                 }).ToList();

                    foreach (var ff_rub in i_rub)
                    {
                        columnData.Add(ff_rub.nom_com + " | " + ff_rub.code_usr);
                    }
                }
            }
            else if (int_pnlID == 2)
            {
                string f_rub = prefixText.ToUpper();
                using (db_admEntities m_rub = new db_admEntities())
                {
                    var i_rub = (from i_u in m_rub.inf_fisc
                                 where i_u.rs.Contains(d_rub)
                                 select new
                                 {
                                     i_u.rs,
                                     i_u.cod_fisc,

                                 }).ToList();

                    foreach (var ff_rub in i_rub)
                    {
                        columnData.Add(ff_rub.rs + " | " + ff_rub.cod_fisc);
                    }
                }
            }
            else if (int_pnlID == 3)
            {
                string f_rub = prefixText.ToUpper();
                using (db_admEntities m_rub = new db_admEntities())
                {
                    var i_rub = (from i_u in m_rub.inf_clte
                                 where i_u.rs.Contains(d_rub)
                                 select new
                                 {
                                     i_u.rs,
                                     i_u.cod_clte,

                                 }).ToList();

                    foreach (var ff_rub in i_rub)
                    {
                        columnData.Add(ff_rub.rs + " | " + ff_rub.cod_clte);
                    }
                }
            }
            else if (int_pnlID == 4)
            {
                string f_rub = prefixText.ToUpper();
                using (db_admEntities m_rub = new db_admEntities())
                {
                    var i_rub = (from i_u in m_rub.inf_prov
                                 where i_u.rs.Contains(d_rub)
                                 select new
                                 {
                                     i_u.rs,
                                     i_u.cod_prov,

                                 }).ToList();

                    foreach (var ff_rub in i_rub)
                    {
                        columnData.Add(ff_rub.rs + " | " + ff_rub.cod_prov);
                    }
                }
            }
            else if (int_pnlID == 5)
            {
                string f_rub = prefixText.ToUpper();
                using (db_admEntities m_rub = new db_admEntities())
                {
                    var i_rub = (from i_u in m_rub.inf_inv
                                 where i_u.desc_inv_prod.Contains(d_rub)
                                 select new
                                 {
                                     i_u.desc_inv_prod,
                                     i_u.cod_inv_prod,

                                 }).ToList();

                    foreach (var ff_rub in i_rub)
                    {
                        columnData.Add(ff_rub.desc_inv_prod + " | " + ff_rub.cod_inv_prod);
                    }
                }
            }

            return columnData;
        }

        #endregion funciones

        #region inv_prod

        protected void btn_agr_inv_prod_Click(object sender, EventArgs e)
        {
            int_inv_prod = 1;

            div_busc_inv_prod.Visible = false;

            gv_inv_prod.Visible = false;

            limpia_txt_inv_prod();

            i_agr_inv_prod.Attributes["style"] = "color:#E34C0E";
            i_edit_inv_prod.Attributes["style"] = "color:blue";

            rfv_cat_inv_prod.Enabled = true;
            rfv_marca_inv_prod.Enabled = true;
            rfv_linea_inv_prod.Enabled = true;
            rfv_desc_inv_prod.Enabled = true;
            rfv_cod_prod_inv_prod.Enabled = true;
            rfv_desc_inv_prod.Enabled = true;
            rfv_cant_inv_prod.Enabled = true;
            rfv_mont_inv_prod.Enabled = true;
            rfv_margen_inv_prod.Enabled = true;
            rfv_minimo_inv_prod.Enabled = true;
        }

        protected void btn_edit_inv_prod_Click(object sender, EventArgs e)
        {
            int_inv_prod = 2;

            div_busc_inv_prod.Visible = true;

            rfv_buscar_inv_prod.Enabled = true;

            limpia_txt_inv_prod();

            i_agr_inv_prod.Attributes["style"] = "color:blue";
            i_edit_inv_prod.Attributes["style"] = "color:#E34C0E";

            rfv_cat_inv_prod.Enabled = false;
            rfv_marca_inv_prod.Enabled = false;
            rfv_linea_inv_prod.Enabled = false;
            rfv_cod_prod_inv_prod.Enabled = false;
            rfv_desc_inv_prod.Enabled = false;
            rfv_cant_inv_prod.Enabled = false;
            rfv_mont_inv_prod.Enabled = false;
            rfv_margen_inv_prod.Enabled = false;
            rfv_minimo_inv_prod.Enabled = false;
        }

        protected void chkb_des_inv_prod_CheckedChanged(object sender, EventArgs e)
        {
            int_inv_prod = 0;

            rfv_buscar_inv_prod.Enabled = false;
            rfv_cat_inv_prod.Enabled = false;
            rfv_marca_inv_prod.Enabled = false;
            rfv_linea_inv_prod.Enabled = false;
            rfv_cod_prod_inv_prod.Enabled = false;
            rfv_desc_inv_prod.Enabled = false;
            rfv_cant_inv_prod.Enabled = false;
            rfv_mont_inv_prod.Enabled = false;
            rfv_margen_inv_prod.Enabled = false;
            rfv_minimo_inv_prod.Enabled = false;
        }

        protected void mont_inv_prod_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(mont_inv_prod.Text))
            {
                rfv_minimo_inv_prod.Enabled = true;
            }
            else
            {
                string stringTest = mont_inv_prod.Text.Trim().Replace("$", "").Replace(",", "");

                try
                {
                    decimal moneyvalue = decimal.Parse(stringTest);
                    string html = String.Format("{0:C}", moneyvalue);

                    mont_inv_prod.Text = html;
                    mont_inv_prod.Focus();
                }
                catch
                {
                    mont_inv_prod.Text = null;
                }
            }
        }

        protected void btn_guardar_inv_prod_Click(object sender, EventArgs e)
        {
            Guid guid_ncat, guid_nmarc, guid_nlin, guid_ninvp, guid_finvp;
            string code_invp, desc_invp, str_cod_invp;
            int int_cant, int_marg, int_cantmin;
            decimal monto_invp;

            if (int_inv_prod == 0)
            {
                Mensaje("Favor de seleccionar una acción");
            }
            else
            {
                if (int_inv_prod == 2)
                {
                    int int_estatusID = 0;
                    string f_inv_prod = null;
                    foreach (GridViewRow row in gv_inv_prod.Rows)
                    {
                        // int key = (int)GridView1.DataKeys[row.RowIndex].Value;
                        if (row.RowType == DataControlRowType.DataRow)
                        {
                            CheckBox chkRow = (row.Cells[0].FindControl("chk_inv_prod") as CheckBox);
                            if (chkRow.Checked)
                            {
                                int_estatusID = int_estatusID + 1;
                                break;
                            }
                            else
                            {
                                int_estatusID = 0;
                            }
                        }
                    }

                    if (int_estatusID >= 1)
                    {
                        //guid_nrubro = Guid.NewGuid();
                        //guid_nrubrom = Guid.NewGuid();

                        //s_desc_inv_prod = desc_inv_prod.Text.Trim().ToUpper();
                        //min_inv_prod = int.Parse(minimo_inv_prod.Text);

                        //d_mont_fijo = decimal.Parse(mont_inv_prod.Text.Replace("$", ""));

                        //if ((min_inv_prod + max_inv_prod) == 0 || (min_inv_prod + max_inv_prod) > 100 || (min_inv_prod + max_inv_prod) < 100)
                        //{
                        //    minimo_inv_prod.Text = null;

                        //    Mensaje("suma de minimo y máximo debe ser igual 100");
                        //}
                        //else
                        //{
                        //    Guid guid_idrubro;
                        //    int int_ddl, int_f_inv_prod = 0;

                        //    foreach (GridViewRow row in gv_inv_prod.Rows)
                        //    {
                        //        // int key = (int)GridView1.DataKeys[row.RowIndex].Value;
                        //        if (row.RowType == DataControlRowType.DataRow)
                        //        {
                        //            CheckBox chkRow = (row.Cells[0].FindControl("chk_inv_prod") as CheckBox);
                        //            if (chkRow.Checked)
                        //            {
                        //                int_f_inv_prod = int_f_inv_prod + 1;
                        //                f_inv_prod = row.Cells[1].Text;

                        //                DropDownList dl = (DropDownList)row.FindControl("ddl_inv_prod_est");

                        //                int_ddl = int.Parse(dl.SelectedValue);
                        //                if (int_ddl == 1)
                        //                {
                        //                    int_estatusID = 1;
                        //                    break;
                        //                }
                        //                else if (int_ddl == 2)
                        //                {
                        //                    int_estatusID = 2;
                        //                    break;
                        //                }
                        //                break;
                        //            }
                        //        }
                        //    }
                        //    using (db_admEntities data_user = new db_admEntities())
                        //    {
                        //        var items_user = (from c in data_user.inf_inv
                        //                          where c.cod_inv_prod == f_inv_prod
                        //                          select c).FirstOrDefault();

                        //        guid_idrubro = items_user.inv_prodID;
                        //    }

                        //    using (var m_nrubro = new db_admEntities())
                        //    {
                        //        var i_nrubro = (from c in m_nrubro.inf_inv
                        //                        where c.inv_prodID == guid_idrubro
                        //                        select c).FirstOrDefault();

                        //        m_nrubro.SaveChanges();

                        //    }

                        //    limpia_txt_inv_prod();

                        //    rfv_desc_inv_prod.Enabled = false;

                        //    rfv_mont_inv_prod.Enabled = false;
                        //    rfv_minimo_inv_prod.Enabled = false;

                        //    gv_inv_prod.Visible = false;
                        //    Mensaje("Datos actualizados con éxito.");
                        //}
                    }
                    else
                    {
                        Mensaje("Favor de seleccionar una un rubro");
                    }
                }
                else
                {
                    guid_ninvp = Guid.NewGuid();
                    guid_ncat = Guid.Parse(ddl_cat_inv_prod.Text);
                    guid_nmarc = Guid.Parse(ddl_marca_inv_prod.Text);
                    guid_nlin = Guid.Parse(ddl_linea_inv_prod.Text);
                    code_invp = cod_prod_inv_prod.Text.Trim().ToUpper();
                    desc_invp = desc_inv_prod.Text.Trim().ToUpper();
                    int_cant = int.Parse(cant_inv_prod.Text);
                    int_marg = int.Parse(margen_extra.Text);
                    int_cantmin = int.Parse(minimo_inv_prod.Text);
                    monto_invp = decimal.Parse(mont_inv_prod.Text.Replace("$", ""));

                    using (db_admEntities edm_inv_prod = new db_admEntities())
                    {
              

                      
                            var c_inv_prod = (from c in edm_inv_prod.inf_inv
                                              select c).ToList();
                            if (c_inv_prod.Count == 0)
                            {
                                str_cod_invp = "PROD-" + string.Format("{0:000}", c_inv_prod.Count + 1);

                                var i_nrub = new inf_inv
                                {
                                    inv_prodID = guid_ninvp,
                                    est_inv_prodID = 1,
                                    catID = guid_ncat,
                                    marcaID = guid_nmarc,
                                    lineaID = guid_nlin,
                                    cod_inv_prod = str_cod_invp,
                                    desc_inv_prod = desc_invp,
                                    code = code_invp,
                                    cantidad = int_cant,
                                    cant_min = int_cantmin,
                                    cost_compra = monto_invp,
                                    margen = int_marg,
                                    empID = guid_emp,
                                    usrID = guid_idusr,
                                    fech_reg = DateTime.Now
                                };

                                edm_inv_prod.inf_inv.Add(i_nrub);
                                edm_inv_prod.SaveChanges();

                                limpia_txt_inv_prod();
                                Mensaje("Datos agregados con éxito.");
                            }
                            else
                            {
                                str_cod_invp = "PROD-" + string.Format("{0:000}", c_inv_prod.Count + 1);

                                var i_nrub = new inf_inv
                                {
                                    inv_prodID = guid_ninvp,
                                    est_inv_prodID = 1,
                                    catID = guid_ncat,
                                    marcaID = guid_nmarc,
                                    lineaID = guid_nlin,
                                    cod_inv_prod = str_cod_invp,
                                    desc_inv_prod = desc_invp,
                                    code = code_invp,
                                    cantidad = int_cant,
                                    cant_min = int_cantmin,
                                    cost_compra = monto_invp,
                                    margen = int_marg,
                                    empID = guid_emp,
                                    usrID = guid_idusr,
                                    fech_reg = DateTime.Now
                                };

                                edm_inv_prod.inf_inv.Add(i_nrub);
                                edm_inv_prod.SaveChanges();

                                limpia_txt_inv_prod();
                                Mensaje("Datos agregados con éxito.");
                            }
                   
                    }
                }
            }
        }

        protected void btn_buscar_inv_prod_Click(object sender, EventArgs e)
        {
            limpia_txt_inv_prod();
            string str_inv_prod = txt_buscar_inv_prod.Text.ToUpper().Trim();

            if (str_inv_prod == "TODO")
            {
                using (db_admEntities data_user = new db_admEntities())
                {
                    using (db_admEntities data_prov = new db_admEntities())
                    {
                        var i_prov = (from t_prov in data_prov.inf_inv
                                      select new
                                      {
                                          t_prov.cod_inv_prod,
                                          t_prov.desc_inv_prod,
                                          t_prov.fech_reg
                                      }).OrderBy(x => x.cod_inv_prod).ToList();

                        gv_inv_prod.DataSource = i_prov;
                        gv_inv_prod.DataBind();
                        gv_inv_prod.Visible = true;
                    }
                }
            }
            else
            {
                try
                {
                    string n_inv_prod;
                    Guid guid_fclte;
                    Char char_s = '|';
                    string d_inv_prod = txt_buscar_inv_prod.Text.Trim();
                    String[] de_inv_prod = d_inv_prod.Trim().Split(char_s);

                    n_inv_prod = de_inv_prod[1].Trim();

                    using (db_admEntities edm_nclte = new db_admEntities())
                    {
                        var i_fisc = (from t_fisc in edm_nclte.inf_inv
                                      where t_fisc.cod_inv_prod == n_inv_prod
                                      select new
                                      {
                                          t_fisc.cod_inv_prod,
                                          t_fisc.desc_inv_prod,
                                          t_fisc.fech_reg
                                      }).OrderBy(x => x.cod_inv_prod).ToList();

                        gv_inv_prod.DataSource = i_fisc;
                        gv_inv_prod.DataBind();
                        gv_inv_prod.Visible = true;


                    }
                    
                }
                catch
                {
                    limpia_txt_inv_prod();
                    Mensaje("Rubro no encontrado.");
                }
            }
        }

        protected void gv_inv_prod_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string str_clteID = e.Row.Cells[1].Text;
                int int_estatusID = 0;

                using (db_admEntities data_clte = new db_admEntities())
                {
                    var i_clte = (from t_clte in data_clte.inf_inv

                                  select new
                                  {
                                  }).FirstOrDefault();
                }

                DropDownList DropDownList1 = (e.Row.FindControl("ddl_inv_prod_est") as DropDownList);

                using (db_admEntities db_sepomex = new db_admEntities())
                {
                    var tbl_sepomex = (from c in db_sepomex.fact_est_inv_prod
                                       select c).ToList();

                    DropDownList1.DataSource = tbl_sepomex;

                    DropDownList1.DataTextField = "desc_est_inv_prod";
                    DropDownList1.DataValueField = "est_inv_prodID";
                    DropDownList1.DataBind();
                    DropDownList1.Items.Insert(0, new ListItem("Seleccionar", "0"));
                    DropDownList1.SelectedValue = int_estatusID.ToString();
                }
            }
        }

        protected void chk_inv_prod_CheckedChanged(object sender, EventArgs e)
        {
            Guid guid_inv_prod;
            string str_inv_prod;

            foreach (GridViewRow row in gv_inv_prod.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("chk_inv_prod") as CheckBox);
                    if (chkRow.Checked)
                    {
                        row.BackColor = Color.LightGray;
                        str_inv_prod = row.Cells[1].Text;

                        using (db_admEntities edm_inv_prod = new db_admEntities())
                        {
                            var i_inv_prod = (from c in edm_inv_prod.inf_inv

                                              select c).FirstOrDefault();

                            var f_inv_prod = (from r in edm_inv_prod.inf_inv

                                              select new
                                              {
                                              }).FirstOrDefault();

                            var f_inv_prodm = (from r in edm_inv_prod.inf_inv

                                               select new
                                               {
                                               }).FirstOrDefault();
                        }
                    }
                    else
                    {
                        row.BackColor = Color.White;
                    }
                }
            }
        }

        protected void gv_inv_prod_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gv_inv_prod.PageIndex = e.NewPageIndex;

            string str_inv_prod = txt_buscar_inv_prod.Text.ToUpper().Trim();

            if (str_inv_prod == "TODOS")
            {
                using (db_admEntities data_user = new db_admEntities())
                {
                }
            }
            else
            {
                using (db_admEntities data_user = new db_admEntities())
                {
                }
            }
        }

        protected void ddl_inv_prod_est_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        private void limpia_txt_inv_prod()
        {
            ddl_cat_inv_prod.Items.Clear();

            using (db_admEntities db_sepomex = new db_admEntities())
            {
                var tbl_sepomex = (from c in db_sepomex.fact_cat
                                   select c).ToList();

                ddl_cat_inv_prod.DataSource = tbl_sepomex;
                ddl_cat_inv_prod.DataTextField = "desc_cat";
                ddl_cat_inv_prod.DataValueField = "catID";
                ddl_cat_inv_prod.DataBind();
            }
            ddl_cat_inv_prod.Items.Insert(0, new ListItem("Seleccionar", "0"));

            ddl_marca_inv_prod.Items.Clear();

            using (db_admEntities db_sepomex = new db_admEntities())
            {
                var tbl_sepomex = (from c in db_sepomex.fact_marca
                                   select c).ToList();

                ddl_marca_inv_prod.DataSource = tbl_sepomex;
                ddl_marca_inv_prod.DataTextField = "desc_marca";
                ddl_marca_inv_prod.DataValueField = "marcaID";
                ddl_marca_inv_prod.DataBind();
            }
            ddl_marca_inv_prod.Items.Insert(0, new ListItem("Seleccionar", "0"));

            ddl_linea_inv_prod.Items.Clear();

            using (db_admEntities db_sepomex = new db_admEntities())
            {
                var tbl_sepomex = (from c in db_sepomex.fact_linea
                                   select c).ToList();

                ddl_linea_inv_prod.DataSource = tbl_sepomex;
                ddl_linea_inv_prod.DataTextField = "desc_linea";
                ddl_linea_inv_prod.DataValueField = "lineaID";
                ddl_linea_inv_prod.DataBind();
            }
            ddl_linea_inv_prod.Items.Insert(0, new ListItem("Seleccionar", "0"));

            cod_prod_inv_prod.Text = null;
            desc_inv_prod.Text = null;
            cant_inv_prod.Text = null;
            margen_extra.Text = null;
            minimo_inv_prod.Text = null;
            mont_inv_prod.Text = null;
        }

        #endregion inv_prod

        #region prov

        protected void btn_agregar_prov_Click(object sender, EventArgs e)
        {
            int_prov = 1;

            i_agregar_prov.Attributes["style"] = "color:#E34C0E";
            i_editar_prov.Attributes["style"] = "color:blue";

            rfv_trfc_prov.Enabled = true;
            rfv_rfc_prov.Enabled = true;
            rfv_rs_prov.Enabled = true;
            rfv_callenum_prov.Enabled = true;
            rfv_cp_prov.Enabled = true;

            div_busc_prov.Visible = false;

            gv_prov.Visible = false;

            limp_txt_prov();
        }

        protected void btn_editar_prov_Click(object sender, EventArgs e)
        {
            int_prov = 2;
            txt_buscar_prov.Text = null;
            i_agregar_prov.Attributes["style"] = "color:blue";
            i_editar_prov.Attributes["style"] = "color:#E34C0E";

            rfv_trfc_prov.Enabled = false;
            rfv_rfc_prov.Enabled = false;
            rfv_rs_prov.Enabled = false;
            rfv_callenum_prov.Enabled = false;
            rfv_cp_prov.Enabled = false;
            rfv_colonia_prov.Enabled = false;

            div_busc_prov.Visible = true;

            rfv_buscar_prov.Enabled = true;

            limp_txt_prov();
        }

        private void limp_txt_prov()
        {
            ddl_trfc_prov.Items.Clear();

            using (db_admEntities db_sepomex = new db_admEntities())
            {
                var tbl_sepomex = (from c in db_sepomex.fact_tipo_rfc
                                   select c).ToList();

                ddl_trfc_prov.DataSource = tbl_sepomex;
                ddl_trfc_prov.DataTextField = "desc_tipo_rfc";
                ddl_trfc_prov.DataValueField = "tipo_rfcID";
                ddl_trfc_prov.DataBind();
            }
            ddl_trfc_prov.Items.Insert(0, new ListItem("Seleccionar", "0"));

            ddl_colonia_prov.Items.Clear();
            ddl_colonia_prov.Items.Insert(0, new ListItem("Seleccionar", "0"));
            txt_rfc_prov.Text = null;
            rfv_rs_prov.Text = null;
            txt_telefono_prov.Text = null;
            txt_email_prov.Text = null;
            txt_callenum_prov.Text = null;
            txt_cp_prov.Text = null;
            txt_prov_coment.Text = null;
            txt_municipio_prov.Text = null;
            txt_estado_prov.Text = null;
        }

        private void guarda_prov()
        {
            try
            {
                Guid guid_prov = Guid.NewGuid();

                string str_cod_prov, str_nom_prov;
                int int_trfc = int.Parse(ddl_trfc_prov.SelectedValue);
                string str_rfc = txt_rfc_prov.Text.Trim().ToUpper();
                string str_razon_social = txt_rs_prov.Text.ToUpper().Trim();
                string str_telefono = txt_telefono_prov.Text;
                string str_email = txt_email_prov.Text.Trim();
                string str_callenum = txt_callenum_prov.Text.ToUpper().Trim();
                string str_cp = txt_cp_prov.Text;
                string str_coment;
                int int_colony = Convert.ToInt32(ddl_colonia_prov.SelectedValue);

                if (int_prov == 2)
                {
                    int int_ddl, int_f_prov = 0;
                    int int_estatusID = 0;
                    string str_fclte = null;
                    foreach (GridViewRow row in gv_prov.Rows)
                    {
                        // int key = (int)GridView1.DataKeys[row.RowIndex].Value;
                        if (row.RowType == DataControlRowType.DataRow)
                        {
                            CheckBox chkRow = (row.Cells[0].FindControl("chk_prov") as CheckBox);
                            if (chkRow.Checked)
                            {
                                int_f_prov = int_f_prov + 1;
                                str_fclte = row.Cells[1].Text;
                                str_nom_prov = row.Cells[2].Text;
                                DropDownList dl = (DropDownList)row.FindControl("ddl_prov_estatus");

                                int_ddl = int.Parse(dl.SelectedValue);
                                if (int_ddl == 1)
                                {
                                    int_estatusID = 1;
                                    break;
                                }
                                else if (int_ddl == 2)
                                {
                                    int_estatusID = 2;
                                    break;
                                }
                                else if (int_ddl == 3)
                                {
                                    int_estatusID = 3;
                                    break;
                                }
                                break;
                            }
                        }
                    }

                    if (int_estatusID == 0)
                    {
                        limp_txt_prov();
                        Mensaje("Favor de seleccionar un cliente.");
                    }
                    else
                    {
                        str_coment = txt_prov_coment.Text;

                        using (var m_prov = new db_admEntities())
                        {
                            var i_prov = (from c in m_prov.inf_prov
                                          where c.cod_prov == str_fclte
                                          select c).FirstOrDefault();

                            i_prov.tipo_rfcID = int_trfc;
                            i_prov.rfc = str_rfc;
                            i_prov.est_provID = int_estatusID;
                            i_prov.rs = str_razon_social;
                            i_prov.tel = str_telefono;
                            i_prov.email = str_email;
                            i_prov.callenum = str_callenum;
                            i_prov.d_codigo = str_cp;
                            i_prov.id_asenta_cpcons = int_colony;
                            i_prov.coment = str_coment;
                            i_prov.usrID = guid_idusr;

                            m_prov.SaveChanges();
                        }

                        rfv_rs_prov.Enabled = false;
                        rfv_callenum_prov.Enabled = false;
                        rfv_cp_prov.Enabled = false;
                        rfv_colonia_prov.Enabled = false;
                        rfv_prov_coment.Enabled = false;
                        int_prov = 0;
                        limp_txt_prov();
                        gv_prov.Visible = false;
                        i_agregar_prov.Attributes["style"] = "color:white";
                        i_editar_prov.Attributes["style"] = "color:white";
                        Mensaje("Datos actualizados con éxito.");
                    }
                }
                else if (int_prov == 1)
                {
                    using (db_admEntities edm_nclte = new db_admEntities())
                    {
                        var i_nclte = (from c in edm_nclte.inf_prov
                                       where c.rs.Contains(str_razon_social)
                                       select c).ToList();

                        if (i_nclte.Count == 0)
                        {
                            using (db_admEntities edm_fclte = new db_admEntities())
                            {
                                var i_fclte = (from c in edm_fclte.inf_prov
                                               select c).ToList();

                                if (i_fclte.Count == 0)
                                {
                                    str_cod_prov = "PROV-" + string.Format("{0:000}", (object)(i_nclte.Count + 1));

                                    using (var m_prov = new db_admEntities())
                                    {
                                        var i_prov = new inf_prov

                                        {
                                            provID = guid_prov,
                                            est_provID = 1,
                                            tipo_rfcID = int_trfc,
                                            rfc = str_rfc,
                                            cod_prov = str_cod_prov,
                                            rs = str_razon_social,
                                            tel = str_telefono,
                                            email = str_email,
                                            callenum = str_callenum,
                                            d_codigo = str_cp,
                                            id_asenta_cpcons = int_colony,
                                            fech_reg = DateTime.Now,
                                            empID = guid_emp,
                                            usrID = guid_idusr
                                        };

                                        m_prov.inf_prov.Add(i_prov);
                                        m_prov.SaveChanges();
                                    }
                                    limp_txt_prov();
                                    Mensaje("Datos agregados con éxito.");
                                }
                                else
                                {
                                    str_cod_prov = "PROV-" + string.Format("{0:000}", (object)(i_fclte.Count + 1));

                                    using (var m_prov = new db_admEntities())
                                    {
                                        var i_prov = new inf_prov

                                        {
                                            provID = guid_prov,
                                            est_provID = 1,
                                            tipo_rfcID = int_trfc,
                                            rfc = str_rfc,
                                            cod_prov = str_cod_prov,
                                            rs = str_razon_social,
                                            tel = str_telefono,
                                            email = str_email,
                                            callenum = str_callenum,
                                            d_codigo = str_cp,
                                            id_asenta_cpcons = int_colony,
                                            fech_reg = DateTime.Now,
                                            empID = guid_emp,
                                            usrID = guid_idusr
                                        };

                                        m_prov.inf_prov.Add(i_prov);
                                        m_prov.SaveChanges();
                                    }
                                    limp_txt_prov();
                                    Mensaje("Datos agregados con éxito.");
                                }
                            }
                        }
                        else
                        {
                            limp_txt_prov();
                            rfv_rs_prov.Enabled = false;
                            rfv_callenum_prov.Enabled = false;
                            rfv_cp_prov.Enabled = false;
                            rfv_colonia_prov.Enabled = false;
                            Mensaje("Cliente existe en la base de datos, favor de revisar.");
                        }
                    }
                }
            }
            catch
            { }
        }

        protected void btn_cp_prov_Click(object sender, EventArgs e)
        {
            string str_cp = txt_cp_prov.Text;

            using (db_admEntities db_sepomex = new db_admEntities())
            {
                var tbl_sepomex = (from c in db_sepomex.inf_sepomex
                                   where c.d_codigo == str_cp
                                   select c).ToList();

                ddl_colonia_prov.DataSource = tbl_sepomex;
                ddl_colonia_prov.DataTextField = "d_asenta";
                ddl_colonia_prov.DataValueField = "id_asenta_cpcons";
                ddl_colonia_prov.DataBind();

                if (tbl_sepomex.Count == 1)
                {
                    txt_municipio_prov.Text = tbl_sepomex[0].d_mnpio;
                    txt_estado_prov.Text = tbl_sepomex[0].d_estado;
                    rfv_colonia_prov.Enabled = true;
                }
                if (tbl_sepomex.Count > 1)
                {
                    ddl_colonia_prov.Items.Insert(0, new ListItem("Seleccionar", "0"));

                    txt_municipio_prov.Text = tbl_sepomex[0].d_mnpio;
                    txt_estado_prov.Text = tbl_sepomex[0].d_estado;
                    rfv_colonia_prov.Enabled = true;
                }
                else if (tbl_sepomex.Count == 0)
                {
                    ddl_colonia_prov.Items.Clear();
                    ddl_colonia_prov.Items.Insert(0, new ListItem("Seleccionar", "0"));
                    txt_municipio_prov.Text = null;
                    txt_estado_prov.Text = null;
                    rfv_colonia_prov.Enabled = false;
                }
            }
            up_prov.Update();
            ddl_colonia_prov.Focus();
        }

        protected void btn_guardar_prov_Click(object sender, EventArgs e)
        {
            if (int_prov == 0)
            {
                Mensaje("Favor de seleccionar una acción");
            }
            else
            {
                guarda_prov();
            }
        }

        protected void chkb_desactivar_prov_CheckedChanged(object sender, EventArgs e)
        {
            int_prov = 0;
            i_agregar_prov.Attributes["style"] = "color:blue";
            i_editar_prov.Attributes["style"] = "color:blue";

            rfv_buscar_prov.Enabled = false;

            rfv_trfc_prov.Enabled = false;
            rfv_rfc_prov.Enabled = false;
            rfv_rs_prov.Enabled = false;
            rfv_callenum_prov.Enabled = false;
            rfv_cp_prov.Enabled = false;
            rfv_colonia_prov.Enabled = false;
            rfv_prov_coment.Enabled = false;
            limp_txt_prov();
            gv_prov.Visible = false;
        }

        protected void btn_buscar_prov_Click(object sender, EventArgs e)
        {
            string str_prov = txt_buscar_prov.Text.ToUpper().Trim();

            if (str_prov == "TODO")
            {
                using (db_admEntities data_prov = new db_admEntities())
                {
                    var i_prov = (from t_prov in data_prov.inf_prov
                                  select new
                                  {
                                      t_prov.cod_prov,
                                      t_prov.rs,
                                      t_prov.fech_reg
                                  }).OrderBy(x => x.cod_prov).ToList();

                    gv_prov.DataSource = i_prov;
                    gv_prov.DataBind();
                    gv_prov.Visible = true;
                }
            }
            else
            {
                string n_rub;
                Char char_s = '|';
                string d_rub = txt_buscar_prov.Text.Trim();
                String[] de_rub = d_rub.Trim().Split(char_s);
                n_rub = de_rub[1].Trim();
                limp_txt_prov();
                using (db_admEntities data_fisc = new db_admEntities())
                {
                    var i_fisc = (from t_fisc in data_fisc.inf_prov
                                  where t_fisc.cod_prov == n_rub
                                  select new
                                  {
                                      t_fisc.cod_prov,
                                      t_fisc.rs,
                                      t_fisc.fech_reg
                                  }).OrderBy(x => x.cod_prov).ToList();

                    gv_prov.DataSource = i_fisc;
                    gv_prov.DataBind();
                    gv_prov.Visible = true;
                }
            }

            limp_txt_prov();
        }

        protected void chk_prov_CheckedChanged(object sender, EventArgs e)
        {
            Guid guid_prov;
            int int_estatusID = 0;
            string str_prov;

            foreach (GridViewRow row in gv_prov.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("chk_prov") as CheckBox);
                    if (chkRow.Checked)
                    {
                        int_estatusID = int_estatusID + 1;
                        row.BackColor = Color.LightGray; ;
                        str_prov = row.Cells[1].Text;

                        using (db_admEntities edm_prov = new db_admEntities())
                        {
                            var i_prov = (from c in edm_prov.inf_prov
                                          where c.cod_prov == str_prov
                                          select c).FirstOrDefault();

                            guid_prov = i_prov.provID;
                        }

                        using (db_admEntities edm_prov = new db_admEntities())
                        {
                            var i_prov = (from t_prov in edm_prov.inf_prov
                                          where t_prov.provID == guid_prov
                                          select new
                                          {
                                              t_prov.tipo_rfcID,
                                              t_prov.rfc,
                                              t_prov.rs,
                                              t_prov.tel,
                                              t_prov.email,
                                              t_prov.callenum,
                                              t_prov.d_codigo,
                                              t_prov.id_asenta_cpcons,
                                              t_prov.coment
                                          }).FirstOrDefault();

                            ddl_trfc_prov.SelectedValue = i_prov.tipo_rfcID.ToString();
                            txt_rfc_prov.Text = i_prov.rfc;
                            txt_rs_prov.Text = i_prov.rs;
                            txt_telefono_prov.Text = i_prov.tel;
                            txt_email_prov.Text = i_prov.email;
                            txt_callenum_prov.Text = i_prov.callenum;
                            txt_cp_prov.Text = i_prov.d_codigo;
                            txt_prov_coment.Text = i_prov.coment;

                            try
                            {
                                int int_col = int.Parse(i_prov.id_asenta_cpcons.ToString());

                                using (db_admEntities db_sepomex = new db_admEntities())
                                {
                                    var tbl_sepomex = (from c in db_sepomex.inf_sepomex
                                                       where c.id_asenta_cpcons == int_col
                                                       where c.d_codigo == i_prov.d_codigo
                                                       select c).ToList();

                                    ddl_colonia_prov.DataSource = tbl_sepomex;
                                    ddl_colonia_prov.DataTextField = "d_asenta";
                                    ddl_colonia_prov.DataValueField = "id_asenta_cpcons";
                                    ddl_colonia_prov.DataBind();

                                    txt_municipio_prov.Text = tbl_sepomex[0].d_mnpio;
                                    txt_estado_prov.Text = tbl_sepomex[0].d_estado;
                                }
                            }
                            catch
                            { }
                            rfv_rs_prov.Enabled = true;
                            rfv_callenum_prov.Enabled = true;
                            rfv_cp_prov.Enabled = true;
                        }
                    }
                    else
                    {
                        row.BackColor = Color.White;
                    }
                }
            }
            if (int_estatusID == 0)
            {
                limp_txt_prov();
            }
        }

        protected void gv_prov_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gv_prov.PageIndex = e.NewPageIndex;

            string str_prov = txt_buscar_prov.Text.ToUpper().Trim();

            if (str_prov == "TODO")
            {
                using (db_admEntities data_prov = new db_admEntities())
                {
                    var i_prov = (from t_prov in data_prov.inf_prov

                                  select new
                                  {
                                      t_prov.cod_prov,

                                      t_prov.rs,
                                      t_prov.fech_reg
                                  }).OrderBy(x => x.cod_prov).ToList();

                    gv_prov.DataSource = i_prov;
                    gv_prov.DataBind();
                    gv_prov.Visible = true;
                }
            }
            else
            {
                using (db_admEntities data_prov = new db_admEntities())
                {
                    var i_prov = (from t_prov in data_prov.inf_prov

                                  where str_prov.Contains(t_prov.rs)
                                  select new
                                  {
                                      t_prov.cod_prov,

                                      t_prov.rs,
                                      t_prov.fech_reg
                                  }).ToList();

                    gv_prov.DataSource = i_prov;
                    gv_prov.DataBind();
                    gv_prov.Visible = true;
                }
            }
        }

        protected void ddl_prov_estatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            string str_ddl;

            GridViewRow gvr = (GridViewRow)(((Control)sender).NamingContainer);
            DropDownList duty = (DropDownList)gvr.FindControl("ddl_prov_estatus");
            str_ddl = duty.SelectedItem.Value;

            if (str_ddl == "2" || str_ddl == "3")
            {
                txt_prov_coment.Enabled = true;
                rfv_prov_coment.Enabled = true;
            }
            else
            {
                txt_prov_coment.Enabled = false;
                rfv_prov_coment.Enabled = false;
            }
        }

        protected void gv_prov_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string str_provID = e.Row.Cells[1].Text;
                int int_estatusID;

                using (db_admEntities data_prov = new db_admEntities())
                {
                    var i_prov = (from t_prov in data_prov.inf_prov
                                  where t_prov.cod_prov == str_provID
                                  select new
                                  {
                                      t_prov.est_provID,
                                  }).FirstOrDefault();

                    int_estatusID = int.Parse(i_prov.est_provID.ToString());
                }

                DropDownList DropDownList1 = (e.Row.FindControl("ddl_prov_estatus") as DropDownList);

                using (db_admEntities db_sepomex = new db_admEntities())
                {
                    var tbl_sepomex = (from c in db_sepomex.fact_est_prov
                                       select c).ToList();

                    DropDownList1.DataSource = tbl_sepomex;

                    DropDownList1.DataTextField = "desc_est_prov";
                    DropDownList1.DataValueField = "est_provID";
                    DropDownList1.DataBind();
                    DropDownList1.Items.Insert(0, new ListItem("Seleccionar", "0"));
                    DropDownList1.SelectedValue = int_estatusID.ToString();
                }
            }
        }

        #endregion prov

        #region clte

        protected void btn_agregar_clte_Click(object sender, EventArgs e)
        {
            int_clte = 1;

            i_agregar_clte.Attributes["style"] = "color:#E34C0E";
            i_editar_clte.Attributes["style"] = "color:blue";

            rfv_trfc_clte.Enabled = true;
            rfv_rfc_clte_fisc.Enabled = true;
            rfv_rs_clte.Enabled = true;
            rfv_callenum_clte.Enabled = true;
            rfv_cp_clte.Enabled = true;

            div_busc_clte.Visible = false;

            gv_clte.Visible = false;

            limp_txt_clte();
        }

        protected void btn_editar_clte_Click(object sender, EventArgs e)
        {
            int_clte = 2;
            txt_buscar_clte.Text = null;
            i_agregar_clte.Attributes["style"] = "color:blue";
            i_editar_clte.Attributes["style"] = "color:#E34C0E";

            rfv_trfc_clte.Enabled = false;
            rfv_rfc_clte_fisc.Enabled = false;
            rfv_rs_clte.Enabled = false;
            rfv_callenum_clte.Enabled = false;
            rfv_cp_clte.Enabled = false;
            rfv_colonia_clte.Enabled = false;

            div_busc_clte.Visible = true;

            rfv_buscar_clte.Enabled = true;

            limp_txt_clte();
        }

        private void limp_txt_clte()
        {
            ddl_trfc_clte.Items.Clear();

            using (db_admEntities db_sepomex = new db_admEntities())
            {
                var tbl_sepomex = (from c in db_sepomex.fact_tipo_rfc
                                   select c).ToList();

                ddl_trfc_clte.DataSource = tbl_sepomex;
                ddl_trfc_clte.DataTextField = "desc_tipo_rfc";
                ddl_trfc_clte.DataValueField = "tipo_rfcID";
                ddl_trfc_clte.DataBind();
            }
            ddl_trfc_clte.Items.Insert(0, new ListItem("Seleccionar", "0"));

            ddl_colonia_clte.Items.Clear();
            ddl_colonia_clte.Items.Insert(0, new ListItem("Seleccionar", "0"));
            txt_rfc_clte_fisc.Text = null;
            txt_rs_clte.Text = null;
            txt_telefono_clte.Text = null;
            txt_email_clte.Text = null;
            txt_callenum_clte.Text = null;
            txt_cp_clte.Text = null;
            txt_clte_coment.Text = null;
            txt_municipio_clte.Text = null;
            txt_estado_clte.Text = null;
        }

        private void guarda_clte()
        {
            try
            {
                Guid guid_clte = Guid.NewGuid();

                string str_cod_clte, str_nom_clte;
                int int_trfc = int.Parse(ddl_trfc_clte.SelectedValue);
                string str_rfc = txt_rfc_clte_fisc.Text.Trim().ToUpper();
                string str_razon_social = txt_rs_clte.Text.ToUpper().Trim();
                string str_telefono = txt_telefono_clte.Text;
                string str_email = txt_email_clte.Text.Trim();
                string str_callenum = txt_callenum_clte.Text.ToUpper().Trim();
                string str_cp = txt_cp_clte.Text;
                string str_coment;
                int int_colony = Convert.ToInt32(ddl_colonia_clte.SelectedValue);

                if (int_clte == 2)
                {
                    int int_ddl, int_f_clte = 0;
                    int int_estatusID = 0;
                    string str_fclte = null;
                    foreach (GridViewRow row in gv_clte.Rows)
                    {
                        // int key = (int)GridView1.DataKeys[row.RowIndex].Value;
                        if (row.RowType == DataControlRowType.DataRow)
                        {
                            CheckBox chkRow = (row.Cells[0].FindControl("chk_clte") as CheckBox);
                            if (chkRow.Checked)
                            {
                                int_f_clte = int_f_clte + 1;
                                str_fclte = row.Cells[1].Text;
                                str_nom_clte = row.Cells[2].Text;
                                DropDownList dl = (DropDownList)row.FindControl("ddl_clte_estatus");

                                int_ddl = int.Parse(dl.SelectedValue);
                                if (int_ddl == 1)
                                {
                                    int_estatusID = 1;
                                    break;
                                }
                                else if (int_ddl == 2)
                                {
                                    int_estatusID = 2;
                                    break;
                                }
                                else if (int_ddl == 3)
                                {
                                    int_estatusID = 3;
                                    break;
                                }
                                break;
                            }
                        }
                    }

                    if (int_estatusID == 0)
                    {
                        limp_txt_clte();
                        Mensaje("Favor de seleccionar un cliente.");
                    }
                    else
                    {
                        str_coment = txt_clte_coment.Text;

                        using (var m_clte = new db_admEntities())
                        {
                            var i_clte = (from c in m_clte.inf_clte
                                          where c.cod_clte == str_fclte
                                          select c).FirstOrDefault();

                            i_clte.tipo_rfcID = int_trfc;
                            i_clte.rfc = str_rfc;
                            i_clte.est_clteID = int_estatusID;
                            i_clte.rs = str_razon_social;
                            i_clte.tel = str_telefono;
                            i_clte.email = str_email;
                            i_clte.callenum = str_callenum;
                            i_clte.d_codigo = str_cp;
                            i_clte.id_asenta_cpcons = int_colony;
                            i_clte.coment = str_coment;
                            i_clte.usrID = guid_idusr;

                            m_clte.SaveChanges();
                        }

                        rfv_rs_clte.Enabled = false;
                        rfv_callenum_clte.Enabled = false;
                        rfv_cp_clte.Enabled = false;
                        rfv_colonia_clte.Enabled = false;
                        rfv_clte_coment.Enabled = false;
                        int_clte = 0;
                        limp_txt_clte();
                        gv_clte.Visible = false;
                        i_agregar_clte.Attributes["style"] = "color:white";
                        i_editar_clte.Attributes["style"] = "color:white";
                        Mensaje("Datos actualizados con éxito.");
                    }
                }
                else if (int_clte == 1)
                {
                    using (db_admEntities edm_nclte = new db_admEntities())
                    {
                        var i_nclte = (from c in edm_nclte.inf_clte
                                       where c.rs.Contains(str_razon_social)
                                       select c).ToList();

                        if (i_nclte.Count == 0)
                        {
                            using (db_admEntities edm_fclte = new db_admEntities())
                            {
                                var i_fclte = (from c in edm_fclte.inf_clte
                                               select c).ToList();

                                if (i_fclte.Count == 0)
                                {
                                    str_cod_clte = "CLTE-" + string.Format("{0:000}", (object)(i_nclte.Count + 1));

                                    using (var m_clte = new db_admEntities())
                                    {
                                        var i_clte = new inf_clte

                                        {
                                            clteID = guid_clte,
                                            est_clteID = 1,
                                            tipo_rfcID = int_trfc,
                                            rfc = str_rfc,
                                            cod_clte = str_cod_clte,
                                            rs = str_razon_social,
                                            tel = str_telefono,
                                            email = str_email,
                                            callenum = str_callenum,
                                            d_codigo = str_cp,
                                            id_asenta_cpcons = int_colony,
                                            fech_reg = DateTime.Now,
                                            empID = guid_emp,
                                            usrID = guid_idusr
                                        };

                                        m_clte.inf_clte.Add(i_clte);
                                        m_clte.SaveChanges();
                                    }
                                    limp_txt_clte();
                                    Mensaje("Datos agregados con éxito.");
                                }
                                else
                                {
                                    str_cod_clte = "CLTE-" + string.Format("{0:000}", (object)(i_fclte.Count + 1));

                                    using (var m_clte = new db_admEntities())
                                    {
                                        var i_clte = new inf_clte

                                        {
                                            clteID = guid_clte,
                                            est_clteID = 1,
                                            tipo_rfcID = int_trfc,
                                            rfc = str_rfc,
                                            cod_clte = str_cod_clte,
                                            rs = str_razon_social,
                                            tel = str_telefono,
                                            email = str_email,
                                            callenum = str_callenum,
                                            d_codigo = str_cp,
                                            id_asenta_cpcons = int_colony,
                                            fech_reg = DateTime.Now,
                                            empID = guid_emp,
                                            usrID = guid_idusr
                                        };

                                        m_clte.inf_clte.Add(i_clte);
                                        m_clte.SaveChanges();
                                    }
                                    limp_txt_clte();
                                    Mensaje("Datos agregados con éxito.");
                                }
                            }
                        }
                        else
                        {
                            limp_txt_clte();
                            rfv_rs_clte.Enabled = false;
                            rfv_callenum_clte.Enabled = false;
                            rfv_cp_clte.Enabled = false;
                            rfv_colonia_clte.Enabled = false;
                            Mensaje("Cliente existe en la base de datos, favor de revisar.");
                        }
                    }
                }
            }
            catch
            { }
        }

        protected void btn_cp_clte_Click(object sender, EventArgs e)
        {
            string str_cp = txt_cp_clte.Text;

            datos_sepomex(str_cp);

            ddl_colonia_clte.Focus();
        }

        private void datos_sepomex(string str_codigo)
        {
            using (db_admEntities db_sepomex = new db_admEntities())
            {
                var tbl_sepomex = (from c in db_sepomex.inf_sepomex
                                   where c.d_codigo == str_codigo
                                   select c).ToList();

                ddl_colonia_clte.DataSource = tbl_sepomex;
                ddl_colonia_clte.DataTextField = "d_asenta";
                ddl_colonia_clte.DataValueField = "id_asenta_cpcons";
                ddl_colonia_clte.DataBind();

                if (tbl_sepomex.Count == 1)
                {
                    txt_municipio_clte.Text = tbl_sepomex[0].d_mnpio;
                    txt_estado_clte.Text = tbl_sepomex[0].d_estado;
                    rfv_colonia_clte.Enabled = true;
                }
                if (tbl_sepomex.Count > 1)
                {
                    ddl_colonia_clte.Items.Insert(0, new ListItem("Seleccionar", "0"));

                    txt_municipio_clte.Text = tbl_sepomex[0].d_mnpio;
                    txt_estado_clte.Text = tbl_sepomex[0].d_estado;
                    rfv_colonia_clte.Enabled = true;
                }
                else if (tbl_sepomex.Count == 0)
                {
                    ddl_colonia_clte.Items.Clear();
                    ddl_colonia_clte.Items.Insert(0, new ListItem("Seleccionar", "0"));
                    txt_municipio_clte.Text = null;
                    txt_estado_clte.Text = null;
                    rfv_colonia_clte.Enabled = false;
                }
            }
            up_clte.Update();
        }

        protected void btn_guardar_clte_Click(object sender, EventArgs e)
        {
            if (int_clte == 0)
            {
                Mensaje("Favor de seleccionar una acción");
            }
            else
            {
                guarda_clte();
            }
        }

        protected void chkb_desactivar_clte_CheckedChanged(object sender, EventArgs e)
        {
            int_clte = 0;
            i_agregar_clte.Attributes["style"] = "color:blue";
            i_editar_clte.Attributes["style"] = "color:blue";

            rfv_buscar_clte.Enabled = false;

            rfv_trfc_clte.Enabled = false;
            rfv_rfc_clte_fisc.Enabled = false;
            rfv_rs_clte.Enabled = false;
            rfv_callenum_clte.Enabled = false;
            rfv_cp_clte.Enabled = false;
            rfv_colonia_clte.Enabled = false;
            rfv_clte_coment.Enabled = false;
            limp_txt_clte();
            gv_clte.Visible = false;
        }

        protected void btn_buscar_clte_Click(object sender, EventArgs e)
        {
            string str_clte = txt_buscar_clte.Text.ToUpper().Trim();

            if (str_clte == "TODO")
            {
                using (db_admEntities data_clte = new db_admEntities())
                {
                    var i_clte = (from t_clte in data_clte.inf_clte
                                  select new
                                  {
                                      t_clte.cod_clte,
                                      t_clte.rs,
                                      t_clte.fech_reg
                                  }).OrderBy(x => x.cod_clte).ToList();

                    gv_clte.DataSource = i_clte;
                    gv_clte.DataBind();
                    gv_clte.Visible = true;
                }
            }
            else
            {
                string n_rub;
                Char char_s = '|';
                string d_rub = txt_buscar_clte.Text.Trim();
                String[] de_rub = d_rub.Trim().Split(char_s);
                n_rub = de_rub[1].Trim();
                limp_txt_clte();
                using (db_admEntities data_fisc = new db_admEntities())
                {
                    var i_fisc = (from t_fisc in data_fisc.inf_clte
                                  where t_fisc.cod_clte == n_rub
                                  select new
                                  {
                                      t_fisc.cod_clte,
                                      t_fisc.rs,
                                      t_fisc.fech_reg
                                  }).OrderBy(x => x.cod_clte).ToList();

                    gv_clte.DataSource = i_fisc;
                    gv_clte.DataBind();
                    gv_clte.Visible = true;
                }
            }

            limp_txt_clte();
        }

        protected void chk_clte_CheckedChanged(object sender, EventArgs e)
        {
            Guid guid_clte;
            int int_estatusID = 0;
            string str_clte;

            foreach (GridViewRow row in gv_clte.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("chk_clte") as CheckBox);
                    if (chkRow.Checked)
                    {
                        int_estatusID = int_estatusID + 1;
                        row.BackColor = Color.LightGray; ;
                        str_clte = row.Cells[1].Text;

                        using (db_admEntities edm_clte = new db_admEntities())
                        {
                            var i_clte = (from c in edm_clte.inf_clte
                                          where c.cod_clte == str_clte
                                          select c).FirstOrDefault();

                            guid_clte = i_clte.clteID;
                        }

                        using (db_admEntities edm_clte = new db_admEntities())
                        {
                            var i_clte = (from t_clte in edm_clte.inf_clte
                                          where t_clte.clteID == guid_clte
                                          select new
                                          {
                                              t_clte.tipo_rfcID,
                                              t_clte.rfc,
                                              t_clte.rs,
                                              t_clte.tel,
                                              t_clte.email,
                                              t_clte.callenum,
                                              t_clte.d_codigo,
                                              t_clte.id_asenta_cpcons,
                                              t_clte.coment
                                          }).FirstOrDefault();

                            ddl_trfc_clte.SelectedValue = i_clte.tipo_rfcID.ToString();
                            txt_rfc_clte_fisc.Text = i_clte.rfc;
                            txt_rs_clte.Text = i_clte.rs;
                            txt_telefono_clte.Text = i_clte.tel;
                            txt_email_clte.Text = i_clte.email;
                            txt_callenum_clte.Text = i_clte.callenum;
                            txt_cp_clte.Text = i_clte.d_codigo;
                            txt_clte_coment.Text = i_clte.coment;

                            try
                            {
                                int int_col = int.Parse(i_clte.id_asenta_cpcons.ToString());

                                using (db_admEntities db_sepomex = new db_admEntities())
                                {
                                    var tbl_sepomex = (from c in db_sepomex.inf_sepomex
                                                       where c.id_asenta_cpcons == int_col
                                                       where c.d_codigo == i_clte.d_codigo
                                                       select c).ToList();

                                    ddl_colonia_clte.DataSource = tbl_sepomex;
                                    ddl_colonia_clte.DataTextField = "d_asenta";
                                    ddl_colonia_clte.DataValueField = "id_asenta_cpcons";
                                    ddl_colonia_clte.DataBind();

                                    txt_municipio_clte.Text = tbl_sepomex[0].d_mnpio;
                                    txt_estado_clte.Text = tbl_sepomex[0].d_estado;
                                }
                            }
                            catch
                            { }
                            rfv_rs_clte.Enabled = true;
                            rfv_callenum_clte.Enabled = true;
                            rfv_cp_clte.Enabled = true;
                        }
                    }
                    else
                    {
                        row.BackColor = Color.White;
                    }
                }
            }
            if (int_estatusID == 0)
            {
                limp_txt_clte();
            }
        }

        protected void gv_clte_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gv_clte.PageIndex = e.NewPageIndex;

            string str_clte = txt_buscar_clte.Text.ToUpper().Trim();

            if (str_clte == "TODO")
            {
                using (db_admEntities data_clte = new db_admEntities())
                {
                    var i_clte = (from t_clte in data_clte.inf_clte

                                  select new
                                  {
                                      t_clte.cod_clte,

                                      t_clte.rs,
                                      t_clte.fech_reg
                                  }).OrderBy(x => x.cod_clte).ToList();

                    gv_clte.DataSource = i_clte;
                    gv_clte.DataBind();
                    gv_clte.Visible = true;
                }
            }
            else
            {
                using (db_admEntities data_clte = new db_admEntities())
                {
                    var i_clte = (from t_clte in data_clte.inf_clte

                                  where str_clte.Contains(t_clte.rs)
                                  select new
                                  {
                                      t_clte.cod_clte,

                                      t_clte.rs,
                                      t_clte.fech_reg
                                  }).ToList();

                    gv_clte.DataSource = i_clte;
                    gv_clte.DataBind();
                    gv_clte.Visible = true;
                }
            }
        }

        protected void ddl_clte_estatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            string str_ddl;

            GridViewRow gvr = (GridViewRow)(((Control)sender).NamingContainer);
            DropDownList duty = (DropDownList)gvr.FindControl("ddl_clte_estatus");
            str_ddl = duty.SelectedItem.Value;

            if (str_ddl == "2" || str_ddl == "3")
            {
                txt_clte_coment.Enabled = true;
                rfv_clte_coment.Enabled = true;
            }
            else
            {
                txt_clte_coment.Enabled = false;
                rfv_clte_coment.Enabled = false;
            }
        }

        protected void gv_clte_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string str_clteID = e.Row.Cells[1].Text;
                int int_estatusID;

                using (db_admEntities data_clte = new db_admEntities())
                {
                    var i_clte = (from t_clte in data_clte.inf_clte
                                  where t_clte.cod_clte == str_clteID
                                  select new
                                  {
                                      t_clte.est_clteID,
                                  }).FirstOrDefault();

                    int_estatusID = int.Parse(i_clte.est_clteID.ToString());
                }

                DropDownList DropDownList1 = (e.Row.FindControl("ddl_clte_estatus") as DropDownList);

                using (db_admEntities db_sepomex = new db_admEntities())
                {
                    var tbl_sepomex = (from c in db_sepomex.fact_est_clte
                                       select c).ToList();

                    DropDownList1.DataSource = tbl_sepomex;

                    DropDownList1.DataTextField = "desc_est_clte";
                    DropDownList1.DataValueField = "est_clteID";
                    DropDownList1.DataBind();
                    DropDownList1.Items.Insert(0, new ListItem("Seleccionar", "0"));
                    DropDownList1.SelectedValue = int_estatusID.ToString();
                }
            }
        }

        #endregion clte

        #region fisc

        protected void btn_agregar_fisc_Click(object sender, EventArgs e)
        {
            int_fisc = 1;

            i_agregar_fisc.Attributes["style"] = "color:#E34C0E";
            i_editar_fisc.Attributes["style"] = "color:blue";

            rfv_trfc_fisc.Enabled = true;
            rfv_rfc_fisc.Enabled = true;
            rfv_rs_fisc.Enabled = true;
            rfv_callenum_fisc.Enabled = true;
            rfv_cp_fisc.Enabled = true;

            div_busc_fisc.Visible = false;

            gv_fisc.Visible = false;

            limp_txt_fisc();
        }

        protected void btn_editar_fisc_Click(object sender, EventArgs e)
        {
            int_fisc = 2;
            txt_buscar_fisc.Text = null;
            i_agregar_fisc.Attributes["style"] = "color:blue";
            i_editar_fisc.Attributes["style"] = "color:#E34C0E";

            rfv_trfc_fisc.Enabled = false;
            rfv_rfc_fisc.Enabled = false;
            rfv_rs_fisc.Enabled = false;
            rfv_callenum_fisc.Enabled = false;
            rfv_cp_fisc.Enabled = false;
            rfv_colonia_fisc.Enabled = false;

            div_busc_fisc.Visible = true;

            rfv_buscar_fisc.Enabled = true;

            limp_txt_fisc();
        }

        private void limp_txt_fisc()
        {
            ddl_trfc_fisc.Items.Clear();

            using (db_admEntities db_sepomex = new db_admEntities())
            {
                var tbl_sepomex = (from c in db_sepomex.fact_tipo_rfc
                                   select c).ToList();

                ddl_trfc_fisc.DataSource = tbl_sepomex;
                ddl_trfc_fisc.DataTextField = "desc_tipo_rfc";
                ddl_trfc_fisc.DataValueField = "tipo_rfcID";
                ddl_trfc_fisc.DataBind();
            }
            ddl_trfc_fisc.Items.Insert(0, new ListItem("Seleccionar", "0"));

            ddl_colonia_fisc.Items.Clear();
            ddl_colonia_fisc.Items.Insert(0, new ListItem("Seleccionar", "0"));
            txt_rfc_fisc.Text = null;
            txt_rs_fisc.Text = null;
            txt_telefono_fisc.Text = null;
            txt_email_fisc.Text = null;
            txt_callenum_fisc.Text = null;
            txt_cp_fisc.Text = null;
            txt_fisc_coment.Text = null;
            txt_municipio_fisc.Text = null;
            txt_estado_fisc.Text = null;
        }

        private void guarda_fisc()
        {
            try
            {
                Guid guid_fisc = Guid.NewGuid();

                string str_cod_fisc, str_nom_fisc;
                int int_trfc = int.Parse(ddl_trfc_fisc.SelectedValue);
                string str_rfc = txt_rfc_fisc.Text.Trim().ToUpper();
                string str_razon_social = txt_rs_fisc.Text.ToUpper().Trim();
                string str_telefono = txt_telefono_fisc.Text;
                string str_email = txt_email_fisc.Text.Trim();
                string str_callenum = txt_callenum_fisc.Text.ToUpper().Trim();
                string str_cp = txt_cp_fisc.Text;
                string str_coment;
                int int_colony = Convert.ToInt32(ddl_colonia_fisc.SelectedValue);

                if (int_fisc == 2)
                {
                    int int_ddl, int_f_fisc = 0;
                    int int_estatusID = 0;
                    string str_fclte = null;
                    foreach (GridViewRow row in gv_fisc.Rows)
                    {
                        // int key = (int)GridView1.DataKeys[row.RowIndex].Value;
                        if (row.RowType == DataControlRowType.DataRow)
                        {
                            CheckBox chkRow = (row.Cells[0].FindControl("chk_fisc") as CheckBox);
                            if (chkRow.Checked)
                            {
                                int_f_fisc = int_f_fisc + 1;
                                str_fclte = row.Cells[1].Text;
                                str_nom_fisc = row.Cells[2].Text;
                                DropDownList dl = (DropDownList)row.FindControl("ddl_fisc_estatus");

                                int_ddl = int.Parse(dl.SelectedValue);
                                if (int_ddl == 1)
                                {
                                    int_estatusID = 1;
                                    break;
                                }
                                else if (int_ddl == 2)
                                {
                                    int_estatusID = 2;
                                    break;
                                }
                                else if (int_ddl == 3)
                                {
                                    int_estatusID = 3;
                                    break;
                                }
                                break;
                            }
                        }
                    }

                    if (int_estatusID == 0)
                    {
                        limp_txt_fisc();
                        Mensaje("Favor de seleccionar un cliente.");
                    }
                    else
                    {
                        str_coment = txt_fisc_coment.Text;

                        using (var m_fisc = new db_admEntities())
                        {
                            var i_fisc = (from c in m_fisc.inf_fisc
                                          where c.cod_fisc == str_fclte
                                          select c).FirstOrDefault();

                            i_fisc.tipo_rfcID = int_trfc;
                            i_fisc.rfc = str_rfc;
                            i_fisc.est_fiscID = int_estatusID;
                            i_fisc.rs = str_razon_social;
                            i_fisc.tel = str_telefono;
                            i_fisc.email = str_email;
                            i_fisc.callenum = str_callenum;
                            i_fisc.d_codigo = str_cp;
                            i_fisc.id_asenta_cpcons = int_colony;
                            i_fisc.coment = str_coment;
                            i_fisc.usrID = guid_idusr;

                            m_fisc.SaveChanges();
                        }

                        rfv_rs_fisc.Enabled = false;
                        rfv_callenum_fisc.Enabled = false;
                        rfv_cp_fisc.Enabled = false;
                        rfv_colonia_fisc.Enabled = false;
                        rfv_fisc_coment.Enabled = false;
                        int_fisc = 0;
                        limp_txt_fisc();
                        gv_fisc.Visible = false;
                        i_agregar_fisc.Attributes["style"] = "color:white";
                        i_editar_fisc.Attributes["style"] = "color:white";
                        Mensaje("Datos actualizados con éxito.");
                    }
                }
                else if (int_fisc == 1)
                {
                    using (db_admEntities edm_nclte = new db_admEntities())
                    {
                        var i_nclte = (from c in edm_nclte.inf_fisc
                                       where c.rs.Contains(str_razon_social)
                                       select c).ToList();

                        if (i_nclte.Count == 0)
                        {
                            using (db_admEntities edm_fclte = new db_admEntities())
                            {
                                var i_fclte = (from c in edm_fclte.inf_fisc
                                               select c).ToList();

                                if (i_fclte.Count == 0)
                                {
                                    str_cod_fisc = "FISC-" + string.Format("{0:000}", (object)(i_nclte.Count + 1));

                                    using (var m_fisc = new db_admEntities())
                                    {
                                        var i_fisc = new inf_fisc

                                        {
                                            fiscID = guid_fisc,
                                            est_fiscID = 1,
                                            tipo_rfcID = int_trfc,
                                            rfc = str_rfc,
                                            cod_fisc = str_cod_fisc,
                                            rs = str_razon_social,
                                            tel = str_telefono,
                                            email = str_email,
                                            callenum = str_callenum,
                                            d_codigo = str_cp,
                                            id_asenta_cpcons = int_colony,
                                            fech_reg = DateTime.Now,
                                            empID = guid_emp,
                                            usrID = guid_idusr
                                        };

                                        m_fisc.inf_fisc.Add(i_fisc);
                                        m_fisc.SaveChanges();
                                    }
                                    limp_txt_fisc();
                                    Mensaje("Datos agregados con éxito.");
                                }
                                else
                                {
                                    str_cod_fisc = "FISC-" + string.Format("{0:000}", (object)(i_fclte.Count + 1));

                                    using (var m_fisc = new db_admEntities())
                                    {
                                        var i_fisc = new inf_fisc

                                        {
                                            fiscID = guid_fisc,
                                            est_fiscID = 1,
                                            tipo_rfcID = int_trfc,
                                            rfc = str_rfc,
                                            cod_fisc = str_cod_fisc,
                                            rs = str_razon_social,
                                            tel = str_telefono,
                                            email = str_email,
                                            callenum = str_callenum,
                                            d_codigo = str_cp,
                                            id_asenta_cpcons = int_colony,
                                            fech_reg = DateTime.Now,
                                            empID = guid_emp,
                                            usrID = guid_idusr
                                        };

                                        m_fisc.inf_fisc.Add(i_fisc);
                                        m_fisc.SaveChanges();
                                    }
                                    limp_txt_fisc();
                                    Mensaje("Datos agregados con éxito.");
                                }
                            }
                        }
                        else
                        {
                            limp_txt_fisc();
                            rfv_rs_fisc.Enabled = false;
                            rfv_callenum_fisc.Enabled = false;
                            rfv_cp_fisc.Enabled = false;
                            rfv_colonia_fisc.Enabled = false;
                            Mensaje("Cliente existe en la base de datos, favor de revisar.");
                        }
                    }
                }
            }
            catch
            { }
        }

        protected void btn_cp_fisc_Click(object sender, EventArgs e)
        {
            string str_cp = txt_cp_fisc.Text;

            using (db_admEntities db_sepomex = new db_admEntities())
            {
                var tbl_sepomex = (from c in db_sepomex.inf_sepomex
                                   where c.d_codigo == str_cp
                                   select c).ToList();

                ddl_colonia_fisc.DataSource = tbl_sepomex;
                ddl_colonia_fisc.DataTextField = "d_asenta";
                ddl_colonia_fisc.DataValueField = "id_asenta_cpcons";
                ddl_colonia_fisc.DataBind();

                if (tbl_sepomex.Count == 1)
                {
                    txt_municipio_fisc.Text = tbl_sepomex[0].d_mnpio;
                    txt_estado_fisc.Text = tbl_sepomex[0].d_estado;
                    rfv_colonia_fisc.Enabled = true;
                }
                if (tbl_sepomex.Count > 1)
                {
                    ddl_colonia_fisc.Items.Insert(0, new ListItem("Seleccionar", "0"));

                    txt_municipio_fisc.Text = tbl_sepomex[0].d_mnpio;
                    txt_estado_fisc.Text = tbl_sepomex[0].d_estado;
                    rfv_colonia_fisc.Enabled = true;
                }
                else if (tbl_sepomex.Count == 0)
                {
                    ddl_colonia_fisc.Items.Clear();
                    ddl_colonia_fisc.Items.Insert(0, new ListItem("Seleccionar", "0"));
                    txt_municipio_fisc.Text = null;
                    txt_estado_fisc.Text = null;
                    rfv_colonia_fisc.Enabled = false;
                }
            }
            up_fisc.Update();

            ddl_colonia_fisc.Focus();
        }

        protected void btn_guardar_fisc_Click(object sender, EventArgs e)
        {
            if (int_fisc == 0)
            {
                Mensaje("Favor de seleccionar una acción");
            }
            else
            {
                guarda_fisc();
            }
        }

        protected void chkb_desactivar_fisc_CheckedChanged(object sender, EventArgs e)
        {
            int_fisc = 0;
            i_agregar_fisc.Attributes["style"] = "color:blue";
            i_editar_fisc.Attributes["style"] = "color:blue";

            rfv_buscar_fisc.Enabled = false;

            rfv_trfc_fisc.Enabled = false;
            rfv_rfc_fisc.Enabled = false;
            rfv_rs_fisc.Enabled = false;
            rfv_callenum_fisc.Enabled = false;
            rfv_cp_fisc.Enabled = false;
            rfv_colonia_fisc.Enabled = false;
            rfv_fisc_coment.Enabled = false;
            limp_txt_fisc();
            gv_fisc.Visible = false;
        }

        protected void btn_buscar_fisc_Click(object sender, EventArgs e)
        {
            string str_fisc = txt_buscar_fisc.Text.ToUpper().Trim();

            if (str_fisc == "TODO")
            {
                using (db_admEntities data_fisc = new db_admEntities())
                {
                    var i_fisc = (from t_fisc in data_fisc.inf_fisc
                                  select new
                                  {
                                      t_fisc.cod_fisc,
                                      t_fisc.rs,
                                      t_fisc.fech_reg
                                  }).OrderBy(x => x.cod_fisc).ToList();

                    gv_fisc.DataSource = i_fisc;
                    gv_fisc.DataBind();
                    gv_fisc.Visible = true;
                }
            }
            else
            {
                string n_rub;
                Char char_s = '|';
                string d_rub = txt_buscar_fisc.Text.Trim();
                String[] de_rub = d_rub.Trim().Split(char_s);
                n_rub = de_rub[1].Trim();
                limp_txt_fisc();
                using (db_admEntities data_fisc = new db_admEntities())
                {
                    var i_fisc = (from t_fisc in data_fisc.inf_fisc
                                   where t_fisc.cod_fisc == n_rub
                                   select new
                                   {
                                       t_fisc.cod_fisc,
                                       t_fisc.rs,
                                       t_fisc.fech_reg
                                   }).OrderBy(x => x.cod_fisc).ToList();

                    gv_fisc.DataSource = i_fisc;
                    gv_fisc.DataBind();
                    gv_fisc.Visible = true;
                }
            }

            limp_txt_fisc();
        }

        protected void chk_fisc_CheckedChanged(object sender, EventArgs e)
        {
            Guid guid_fisc;
            int int_estatusID = 0;
            string str_fisc;

            foreach (GridViewRow row in gv_fisc.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("chk_fisc") as CheckBox);
                    if (chkRow.Checked)
                    {
                        int_estatusID = int_estatusID + 1;
                        row.BackColor = Color.LightGray; ;
                        str_fisc = row.Cells[1].Text;

                        using (db_admEntities edm_fisc = new db_admEntities())
                        {
                            var i_fisc = (from c in edm_fisc.inf_fisc
                                          where c.cod_fisc == str_fisc
                                          select c).FirstOrDefault();

                            guid_fisc = i_fisc.fiscID;
                        }

                        using (db_admEntities edm_fisc = new db_admEntities())
                        {
                            var i_fisc = (from t_fisc in edm_fisc.inf_fisc
                                          where t_fisc.fiscID == guid_fisc
                                          select new
                                          {
                                              t_fisc.tipo_rfcID,
                                              t_fisc.rfc,
                                              t_fisc.rs,
                                              t_fisc.tel,
                                              t_fisc.email,
                                              t_fisc.callenum,
                                              t_fisc.d_codigo,
                                              t_fisc.id_asenta_cpcons,
                                              t_fisc.coment
                                          }).FirstOrDefault();

                            ddl_trfc_fisc.SelectedValue = i_fisc.tipo_rfcID.ToString();
                            txt_rfc_fisc.Text = i_fisc.rfc;
                            txt_rs_fisc.Text = i_fisc.rs;
                            txt_telefono_fisc.Text = i_fisc.tel;
                            txt_email_fisc.Text = i_fisc.email;
                            txt_callenum_fisc.Text = i_fisc.callenum;
                            txt_cp_fisc.Text = i_fisc.d_codigo;
                            txt_fisc_coment.Text = i_fisc.coment;

                            try
                            {
                                int int_col = int.Parse(i_fisc.id_asenta_cpcons.ToString());

                                using (db_admEntities db_sepomex = new db_admEntities())
                                {
                                    var tbl_sepomex = (from c in db_sepomex.inf_sepomex
                                                       where c.id_asenta_cpcons == int_col
                                                       where c.d_codigo == i_fisc.d_codigo
                                                       select c).ToList();

                                    ddl_colonia_fisc.DataSource = tbl_sepomex;
                                    ddl_colonia_fisc.DataTextField = "d_asenta";
                                    ddl_colonia_fisc.DataValueField = "id_asenta_cpcons";
                                    ddl_colonia_fisc.DataBind();

                                    txt_municipio_fisc.Text = tbl_sepomex[0].d_mnpio;
                                    txt_estado_fisc.Text = tbl_sepomex[0].d_estado;
                                }
                            }
                            catch
                            { }
                            rfv_rs_fisc.Enabled = true;
                            rfv_callenum_fisc.Enabled = true;
                            rfv_cp_fisc.Enabled = true;
                        }
                    }
                    else
                    {
                        row.BackColor = Color.White;
                    }
                }
            }
            if (int_estatusID == 0)
            {
                limp_txt_fisc();
            }
        }

        protected void gv_fisc_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gv_fisc.PageIndex = e.NewPageIndex;

            string str_fisc = txt_buscar_fisc.Text.ToUpper().Trim();

            if (str_fisc == "TODO")
            {
                using (db_admEntities data_fisc = new db_admEntities())
                {
                    var i_fisc = (from t_fisc in data_fisc.inf_fisc

                                  select new
                                  {
                                      t_fisc.cod_fisc,

                                      t_fisc.rs,
                                      t_fisc.fech_reg
                                  }).OrderBy(x => x.cod_fisc).ToList();

                    gv_fisc.DataSource = i_fisc;
                    gv_fisc.DataBind();
                    gv_fisc.Visible = true;
                }
            }
            else
            {
                using (db_admEntities data_fisc = new db_admEntities())
                {
                    var i_fisc = (from t_fisc in data_fisc.inf_fisc

                                  where str_fisc.Contains(t_fisc.rs)
                                  select new
                                  {
                                      t_fisc.cod_fisc,

                                      t_fisc.rs,
                                      t_fisc.fech_reg
                                  }).ToList();

                    gv_fisc.DataSource = i_fisc;
                    gv_fisc.DataBind();
                    gv_fisc.Visible = true;
                }
            }
        }

        protected void ddl_fisc_estatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            string str_ddl;

            GridViewRow gvr = (GridViewRow)(((Control)sender).NamingContainer);
            DropDownList duty = (DropDownList)gvr.FindControl("ddl_fisc_estatus");
            str_ddl = duty.SelectedItem.Value;

            if (str_ddl == "2" || str_ddl == "3")
            {
                txt_fisc_coment.Enabled = true;
                rfv_fisc_coment.Enabled = true;
            }
            else
            {
                txt_fisc_coment.Enabled = false;
                rfv_fisc_coment.Enabled = false;
            }
        }

        protected void gv_fisc_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string str_fiscID = e.Row.Cells[1].Text;
                int int_estatusID;

                using (db_admEntities data_fisc = new db_admEntities())
                {
                    var i_fisc = (from t_fisc in data_fisc.inf_fisc
                                  where t_fisc.cod_fisc == str_fiscID
                                  select new
                                  {
                                      t_fisc.est_fiscID,
                                  }).FirstOrDefault();

                    int_estatusID = int.Parse(i_fisc.est_fiscID.ToString());
                }

                DropDownList DropDownList1 = (e.Row.FindControl("ddl_fisc_estatus") as DropDownList);

                using (db_admEntities db_sepomex = new db_admEntities())
                {
                    var tbl_sepomex = (from c in db_sepomex.fact_est_fisc
                                       select c).ToList();

                    DropDownList1.DataSource = tbl_sepomex;

                    DropDownList1.DataTextField = "desc_est_fisc";
                    DropDownList1.DataValueField = "est_fiscID";
                    DropDownList1.DataBind();
                    DropDownList1.Items.Insert(0, new ListItem("Seleccionar", "0"));
                    DropDownList1.SelectedValue = int_estatusID.ToString();
                }
            }
        }

        #endregion fisc

        #region usuarios

        protected void btn_agregar_usrs_Click(object sender, EventArgs e)
        {
            int_usr = 1;

            i_agregar_usrs.Attributes["style"] = "color:#E34C0E";
            i_editar_usrs.Attributes["style"] = "color:blue";
            div_busc_usr.Visible = false;

            rfv_perfil_usr.Enabled = true;

            rfv_nombre_usr.Enabled = true;
            rfv_apaterno_usr.Enabled = true;
            rfv_amaterno_usr.Enabled = true;
            rfv_code_usr.Enabled = true;
            rfv_clave_usr.Enabled = true;
            rfv_usr_coment.Enabled = false;
            rfv_callenum_usr.Enabled = false;
            rfv_col_usr.Enabled = false;
            gv_usrs.Visible = false;
            limp_txt_usr();
        }

        protected void btn_editar_usrs_Click(object sender, EventArgs e)
        {
            int_usr = 2;

            i_agregar_usrs.Attributes["style"] = "color:blue";
            i_editar_usrs.Attributes["style"] = "color:#E34C0E";
            div_busc_usr.Visible = true;
            rfv_buscar_usrs.Enabled = true;

            rfv_perfil_usr.Enabled = false;

            rfv_nombre_usr.Enabled = false;
            rfv_apaterno_usr.Enabled = false;
            rfv_amaterno_usr.Enabled = false;
            rfv_code_usr.Enabled = false;
            rfv_clave_usr.Enabled = false;
            rfv_callenum_usr.Enabled = false;
            rfv_cp_usr.Enabled = false;
            rfv_usr_coment.Enabled = false;
            rfv_callenum_usr.Enabled = false;
            rfv_col_usr.Enabled = false;
            gv_usrs.Visible = false;
            limp_txt_usr();
        }

        protected void btn_guardar_usrs_Click(object sender, EventArgs e)
        {
            if (int_usr == 0)
            {
                Mensaje("Favor de seleccionar una acción");
            }
            else
            {
                try
                {
                    int idper_usr, idcol_usr, idest_usr;
                    string cod_usr, nom_usr, apater_usr, amater_usr, code_sur, clave_usr, e_user, tel_usr, email_usr, callenum_usr, cp_usr;

                    idper_usr = int.Parse(ddl_perfil_usr.SelectedValue);
                    e_user = txt_email_usr.Text.Trim();
                    nom_usr = txt_nombre_usr.Text.Trim().ToUpper();
                    apater_usr = txt_apaterno_usr.Text.Trim().ToUpper();
                    amater_usr = txt_amaterno_usr.Text.Trim().ToUpper();
                    code_sur = txt_code_usr.Text.Trim().ToLower();
                    clave_usr = encrypta.Encrypt(txt_clave_usr.Text.Trim().ToLower());
                    tel_usr = txt_tel_usr.Text.Trim();
                    email_usr = txt_email_usr.Text.Trim();
                    callenum_usr = txt_callenum_usr.Text.Trim().ToUpper();
                    cp_usr = txt_cp_usr.Text.Trim();
                    idcol_usr = int.Parse(ddl_col_usr.SelectedValue);
                    idest_usr = int.Parse(ddl_perfil_usr.SelectedValue);

                    if (int_usr == 2)
                    {
                        int int_ddl, int_f_clte = 0;
                        int int_estatusID = 0;
                        string str_fclte = null;
                        string v_usrs = null;
                        foreach (GridViewRow row in gv_usrs.Rows)
                        {
                            // int key = (int)GridView1.DataKeys[row.RowIndex].Value;
                            if (row.RowType == DataControlRowType.DataRow)
                            {
                                CheckBox chkRow = (row.Cells[0].FindControl("chk_usrs") as CheckBox);
                                if (chkRow.Checked)
                                {
                                    int_f_clte = int_f_clte + 1;
                                    str_fclte = row.Cells[1].Text;
                                    v_usrs = row.Cells[2].Text;
                                    DropDownList dl = (DropDownList)row.FindControl("ddl_usrs_estatus");

                                    int_ddl = int.Parse(dl.SelectedValue);
                                    if (int_ddl == 1)
                                    {
                                        int_estatusID = 1;
                                        break;
                                    }
                                    else if (int_ddl == 2)
                                    {
                                        int_estatusID = 2;
                                        break;
                                    }
                                    break;
                                }
                            }
                        }

                        if (int_f_clte == 0)
                        {
                            Mensaje("Favor de seleccionar una registro.");
                        }
                        else
                        {
                            using (var m_clte = new db_admEntities())
                            {
                                var i_clte = (from c in m_clte.inf_usr
                                              where c.code_usr == str_fclte
                                              select c).FirstOrDefault();

                                if (code_sur == i_clte.usr)
                                {
                                    var i_usrs = (from c in m_clte.inf_usr
                                                  where c.code_usr == str_fclte
                                                  select c).FirstOrDefault();

                                    i_usrs.est_usrID = int_estatusID;
                                    i_usrs.tipo_usrID = idest_usr;
                                    i_usrs.noms = nom_usr;
                                    i_usrs.apat = apater_usr;
                                    i_usrs.amat = amater_usr;
                                    i_usrs.usr = code_sur;
                                    i_usrs.clave = clave_usr;
                                    i_usrs.tel = tel_usr;
                                    i_usrs.email = email_usr;
                                    i_usrs.calle_num = callenum_usr;
                                    i_usrs.d_codigo = cp_usr;
                                    i_usrs.id_asenta_cpcons = idcol_usr;

                                    m_clte.SaveChanges();

                                    rfv_buscar_usrs.Enabled = false;
                                    rfv_usr_coment.Enabled = false;
                                    limp_txt_usr();
                                    Mensaje("Datos de usuario actualizados con éxito.");
                                }
                                else
                                {
                                    var i_nclte = (from c in m_clte.inf_usr
                                                   where c.usr == code_sur
                                                   select c).ToList();

                                    if (i_nclte.Count == 0)
                                    {
                                        var i_usrs = (from c in m_clte.inf_usr
                                                      where c.code_usr == str_fclte
                                                      select c).FirstOrDefault();

                                        i_usrs.est_usrID = int_estatusID;
                                        i_usrs.tipo_usrID = idest_usr;
                                        i_usrs.noms = nom_usr;
                                        i_usrs.apat = apater_usr;
                                        i_usrs.amat = amater_usr;
                                        i_usrs.usr = code_sur;
                                        i_usrs.clave = clave_usr;
                                        i_usrs.tel = tel_usr;
                                        i_usrs.email = email_usr;
                                        i_usrs.calle_num = callenum_usr;
                                        i_usrs.d_codigo = cp_usr;
                                        i_usrs.id_asenta_cpcons = idcol_usr;

                                        m_clte.SaveChanges();

                                        rfv_buscar_usrs.Enabled = false;
                                        rfv_usr_coment.Enabled = false;
                                        limp_txt_usr();
                                        Mensaje("Datos de usuario actualizados con éxito.");
                                    }
                                    else
                                    {
                                        limp_txt_usr();
                                        Mensaje("Usuario ya existe en la base de datos, favor de revisar.");
                                    }
                                }
                            }
                        }
                    }
                    else if (int_usr == 1)
                    {
                        Guid guid_nidusr = Guid.NewGuid();
                        using (db_admEntities edm_fusr = new db_admEntities())
                        {
                            var i_fusr = (from c in edm_fusr.inf_usr
                                          where c.noms == nom_usr
                                          where c.apat == apater_usr
                                          where c.amat == amater_usr
                                          select c).ToList();

                            if (i_fusr.Count == 0)
                            {
                                var i_usr = (from c in edm_fusr.inf_usr
                                             select c).ToList();

                                if (i_usr.Count == 0)
                                {
                                    cod_usr = "USR-" + string.Format("{0:000}", (object)(i_usr.Count + 1));

                                    var a_usr = new inf_usr

                                    {
                                        usrID = guid_nidusr,
                                        est_usrID = 1,
                                        tipo_usrID = idper_usr,
                                        code_usr = cod_usr,
                                        noms = nom_usr,
                                        apat = apater_usr,
                                        amat = amater_usr,
                                        usr = code_sur,
                                        clave = clave_usr,
                                        tel = tel_usr,
                                        email = email_usr,
                                        calle_num = callenum_usr,
                                        d_codigo = cp_usr,
                                        id_asenta_cpcons = idcol_usr,
                                        empID = guid_emp,
                                        fech_reg = DateTime.Now
                                    };

                                    edm_fusr.inf_usr.Add(a_usr);

                                    edm_fusr.SaveChanges();

                                    limp_txt_usr();
                                    Mensaje("Datos de usuario agregados con éxito.");
                                }
                                else
                                {
                                    cod_usr = "USR-" + string.Format("{0:000}", (object)(i_usr.Count + 1));

                                    var a_usr = new inf_usr

                                    {
                                        usrID = guid_nidusr,
                                        est_usrID = 1,
                                        tipo_usrID = idper_usr,
                                        code_usr = cod_usr,
                                        noms = nom_usr,
                                        apat = apater_usr,
                                        amat = amater_usr,
                                        usr = code_sur,
                                        clave = clave_usr,
                                        tel = tel_usr,
                                        email = email_usr,
                                        calle_num = callenum_usr,
                                        d_codigo = cp_usr,
                                        id_asenta_cpcons = idcol_usr,
                                        empID = guid_emp,
                                        fech_reg = DateTime.Now
                                    };

                                    edm_fusr.inf_usr.Add(a_usr);

                                    edm_fusr.SaveChanges();

                                    limp_txt_usr();
                                    Mensaje("Datos de usuario agregados con éxito.");
                                }
                            }
                            else
                            {
                                limp_txt_usr();
                                rfv_usr_coment.Enabled = false;
                                Mensaje("Usuario existe en la base de datos, favor de revisar.");
                            }
                        }
                    }
                }
                catch
                { }
            }
        }

        protected void gv_usrs_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gv_usrs.PageIndex = e.NewPageIndex;
            string str_clte = txt_buscar_usrs.Text.ToUpper().Trim();
            try
            {
                if (str_clte == "TODOS")
                {
                    using (db_admEntities data_areas = new db_admEntities())
                    {
                        var i_areas = (from t_areas in data_areas.inf_usr
                                       select new
                                       {
                                           t_areas.code_usr,
                                           nom_cmpleto = t_areas.noms + " " + t_areas.apat + " " + t_areas.amat,
                                           t_areas.fech_reg
                                       }).OrderBy(x => x.code_usr).ToList();

                        gv_usrs.DataSource = i_areas;
                        gv_usrs.DataBind();
                        gv_usrs.Visible = true;
                    }
                }
                else
                {
                    string n_rub;
                    Char char_s = '|';
                    string d_rub = txt_buscar_usrs.Text.Trim();
                    String[] de_rub = d_rub.Trim().Split(char_s);
                    n_rub = de_rub[1].Trim();

                    using (db_admEntities data_areas = new db_admEntities())
                    {
                        var i_areas = (from t_areas in data_areas.inf_usr
                                       where t_areas.code_usr == n_rub
                                       select new
                                       {
                                           t_areas.code_usr,
                                           nom_cmpleto = t_areas.noms + " " + t_areas.apat + " " + t_areas.amat,
                                           t_areas.fech_reg
                                       }).OrderBy(x => x.code_usr).ToList();

                        gv_usrs.DataSource = i_areas;
                        gv_usrs.DataBind();
                        gv_usrs.Visible = true;
                    }
                }
            }
            catch
            {
                txt_usr_coment.Text = null;
                txt_buscar_usrs.Text = null;
                Mensaje("Área no existe, favor de revisar.");
            }
        }

        protected void gv_usrs_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string str_clteID = e.Row.Cells[1].Text;
                int int_estatusID;

                using (db_admEntities data_clte = new db_admEntities())
                {
                    var i_clte = (from t_clte in data_clte.inf_usr
                                  where t_clte.code_usr == str_clteID
                                  select new
                                  {
                                      t_clte.est_usrID,
                                  }).FirstOrDefault();

                    int_estatusID = int.Parse(i_clte.est_usrID.ToString());
                }

                DropDownList DropDownList1 = (e.Row.FindControl("ddl_usrs_estatus") as DropDownList);

                using (db_admEntities db_sepomex = new db_admEntities())
                {
                    var tbl_sepomex = (from c in db_sepomex.fact_est_usr
                                       select c).ToList();

                    DropDownList1.DataSource = tbl_sepomex;

                    DropDownList1.DataTextField = "desc_est_usr";
                    DropDownList1.DataValueField = "est_usrID";
                    DropDownList1.DataBind();
                    DropDownList1.Items.Insert(0, new ListItem("Seleccionar", "0"));
                    DropDownList1.SelectedValue = int_estatusID.ToString();
                }
            }
        }

        protected void chk_usrs_CheckedChanged(object sender, EventArgs e)
        {
            string str_rub;
            Guid guid_rub;

            foreach (GridViewRow row in gv_usrs.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("chk_usrs") as CheckBox);
                    if (chkRow.Checked)
                    {
                        row.BackColor = Color.LightGray;
                        str_rub = row.Cells[1].Text;

                        using (db_admEntities edm_rub = new db_admEntities())
                        {
                            var i_rub = (from c in edm_rub.inf_usr
                                         where c.code_usr == str_rub
                                         select c).FirstOrDefault();

                            guid_rub = i_rub.usrID;

                            var f_rub = (from r in edm_rub.inf_usr
                                         where r.usrID == guid_rub
                                         select new
                                         {
                                             r.tipo_usrID,
                                             r.noms,
                                             r.apat,
                                             r.amat,
                                             r.tel,
                                             r.email,
                                             r.usr,
                                             r.clave,
                                             r.calle_num,
                                             r.d_codigo,
                                             r.id_asenta_cpcons,
                                         }).FirstOrDefault();

                            ddl_perfil_usr.SelectedValue = f_rub.tipo_usrID.ToString();

                            txt_nombre_usr.Text = f_rub.noms;
                            txt_apaterno_usr.Text = f_rub.apat;
                            txt_amaterno_usr.Text = f_rub.amat;
                            txt_email_usr.Text = f_rub.email;
                            txt_tel_usr.Text = f_rub.tel;
                            txt_code_usr.Text = f_rub.usr;
                            txt_clave_usr.Text = f_rub.clave;
                            txt_callenum_usr.Text = f_rub.calle_num;
                            txt_cp_usr.Text = f_rub.d_codigo;
                            txt_municipio_usr.Text = null;
                            txt_estado_usr.Text = null;

                            try
                            {
                                ddl_col_usr.Items.Clear();
                                using (db_admEntities db_sepomex = new db_admEntities())
                                {
                                    var tbl_sepomex = (from c in db_sepomex.inf_sepomex
                                                       where c.d_codigo == f_rub.d_codigo
                                                       select c).ToList();

                                    ddl_col_usr.DataSource = tbl_sepomex;
                                    ddl_col_usr.DataTextField = "d_asenta";
                                    ddl_col_usr.DataValueField = "id_asenta_cpcons";
                                    ddl_col_usr.DataBind();
                                    ddl_col_usr.Items.Insert(0, new ListItem("Seleccionar", "0"));
                                    ddl_col_usr.SelectedValue = tbl_sepomex[0].id_asenta_cpcons.ToString();
                                    txt_municipio_usr.Text = tbl_sepomex[0].d_mnpio;
                                    txt_estado_usr.Text = tbl_sepomex[0].d_estado;
                                }
                            }
                            catch
                            { }
                            txt_usr_coment.Text = null;
                            rfv_nombre_usr.Enabled = true;
                            rfv_apaterno_usr.Enabled = true;
                            rfv_amaterno_usr.Enabled = true;
                            rfv_perfil_usr.Enabled = true;
                            rfv_code_usr.Enabled = true;
                            rfv_clave_usr.Enabled = true;
                        }
                    }
                    else
                    {
                        row.BackColor = Color.White;
                    }
                }
            }
        }

        protected void ddl_usrs_estatus_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void btn_buscar_usrs_Click(object sender, EventArgs e)
        {
            gv_usrs.Visible = false;
            string str_clte = txt_buscar_usrs.Text.ToUpper().Trim();
            try
            {
                if (str_clte == "TODO")
                {
                    limp_txt_usr();
                    using (db_admEntities data_areas = new db_admEntities())
                    {
                        var i_areas = (from t_areas in data_areas.inf_usr
                                       select new
                                       {
                                           t_areas.code_usr,
                                           nom_cmpleto = t_areas.noms + " " + t_areas.apat + " " + t_areas.amat,

                                           t_areas.fech_reg
                                       }).OrderBy(x => x.code_usr).ToList();

                        if (i_areas.Count == 0)
                        {
                            gv_usrs.Visible = false;
                            limp_txt_usr();
                            Mensaje("Sin registros, favor de agregar.");
                        }
                        else
                        {
                            gv_usrs.DataSource = i_areas;
                            gv_usrs.DataBind();
                            gv_usrs.Visible = true;
                        }
                    }
                }
                else
                {
                    string n_rub;
                    Char char_s = '|';
                    string d_rub = txt_buscar_usrs.Text.Trim();
                    String[] de_rub = d_rub.Trim().Split(char_s);
                    n_rub = de_rub[1].Trim();
                    limp_txt_usr();
                    using (db_admEntities data_areas = new db_admEntities())
                    {
                        var i_areas = (from t_areas in data_areas.inf_usr
                                       where t_areas.code_usr == n_rub
                                       select new
                                       {
                                           t_areas.code_usr,
                                           nom_cmpleto = t_areas.noms + " " + t_areas.apat + " " + t_areas.amat,
                                           t_areas.fech_reg
                                       }).OrderBy(x => x.code_usr).ToList();

                        gv_usrs.DataSource = i_areas;
                        gv_usrs.DataBind();
                        gv_usrs.Visible = true;
                    }
                }
            }
            catch
            {
                gv_usrs.Visible = false;
                limp_txt_usr();
                Mensaje("Usuario no existe, favor de revisar.");
            }
        }

        protected void btn_cp_usr_Click(object sender, EventArgs e)
        {
            string str_codcp = txt_cp_usr.Text.Trim();

            using (db_admEntities db_sepomex = new db_admEntities())
            {
                var tbl_sepomex = (from c in db_sepomex.inf_sepomex
                                   where c.d_codigo == str_codcp
                                   select c).ToList();

                ddl_col_usr.DataSource = tbl_sepomex;
                ddl_col_usr.DataTextField = "d_asenta";
                ddl_col_usr.DataValueField = "id_asenta_cpcons";
                ddl_col_usr.DataBind();

                if (tbl_sepomex.Count == 1)
                {
                    txt_municipio_usr.Text = tbl_sepomex[0].d_mnpio;
                    txt_estado_usr.Text = tbl_sepomex[0].d_estado;

                    rfv_callenum_usr.Enabled = true;
                    rfv_col_usr.Enabled = true;
                }
                if (tbl_sepomex.Count > 1)
                {
                    ddl_col_usr.Items.Insert(0, new ListItem("Seleccionar", "0"));

                    txt_municipio_usr.Text = tbl_sepomex[0].d_mnpio;
                    txt_estado_usr.Text = tbl_sepomex[0].d_estado;

                    rfv_callenum_usr.Enabled = true;
                    rfv_col_usr.Enabled = true;
                }
                else if (tbl_sepomex.Count == 0)
                {
                    ddl_col_usr.Items.Clear();
                    ddl_col_usr.Items.Insert(0, new ListItem("Seleccionar", "0"));
                    txt_municipio_usr.Text = null;
                    txt_estado_usr.Text = null;
                    txt_cp_usr.Focus();
                }
            }
            up_usrs.Update();
        }

        protected void chkb_desactivar_usrs_CheckedChanged(object sender, EventArgs e)
        {
            rfv_buscar_usrs.Enabled = false;

            rfv_nombre_usr.Enabled = false;
            rfv_apaterno_usr.Enabled = false;
            rfv_amaterno_usr.Enabled = false;
            rfv_perfil_usr.Enabled = false;
            rfv_code_usr.Enabled = false;
            rfv_clave_usr.Enabled = false;
            rfv_callenum_usr.Enabled = false;
            rfv_cp_usr.Enabled = false;
            rfv_col_usr.Enabled = false;
            rfv_usr_coment.Enabled = false;
        }

        private void limp_txt_usr()
        {
            using (db_admEntities m_area = new db_admEntities())
            {
                var i_area = (from c in m_area.fact_tipo_usr
                              select c).ToList();

                ddl_perfil_usr.Items.Clear();

                ddl_perfil_usr.DataSource = i_area;
                ddl_perfil_usr.DataTextField = "desc_tipo_usr";
                ddl_perfil_usr.DataValueField = "tipo_usrID";
                ddl_perfil_usr.DataBind();

                ddl_perfil_usr.Items.Insert(0, new ListItem("Seleccionar", "0"));
            }
            ddl_col_usr.Items.Clear();
            ddl_col_usr.Items.Insert(0, new ListItem("Seleccionar", "0"));

            txt_nombre_usr.Text = null;
            txt_apaterno_usr.Text = null;
            txt_amaterno_usr.Text = null;
            txt_email_usr.Text = null;
            txt_tel_usr.Text = null;
            txt_code_usr.Text = null;
            txt_clave_usr.Text = null;
            txt_callenum_usr.Text = null;
            txt_cp_usr.Text = null;
            txt_municipio_usr.Text = null;
            txt_estado_usr.Text = null;
        }

        #endregion usuarios
    }
}