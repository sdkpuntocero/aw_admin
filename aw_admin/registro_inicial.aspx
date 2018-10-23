<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registro_inicial.aspx.cs" Inherits="aw_admin.registro_inicial" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0" />
    <!-- Bootstrap -->

    <link href="Content/bootstrap.min.css" rel="stylesheet" />
 

    <link href="Content/fontawesome/all.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.3.1.min.js"></script>

    <script src="Scripts/bootstrap.min.js"></script>

    <link rel="shortcut icon" href="img/app_ico.png" type="image/png" />
    <title>/ Registro</title>
</head>
<body>
    <script>
        function CheckOne(obj) {
            var grid = obj.parentNode.parentNode.parentNode;
            var inputs = grid.getElementsByTagName("input");
            for (var i = 0; i < inputs.length; i++) {
                if (inputs[i].type == "checkbox") {
                    if (obj.checked && inputs[i] != obj && inputs[i].checked) {
                        inputs[i].checked = false;
                    }
                }
            }
        }
    </script>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="container">
            <br />
            <div class="row">

                <asp:UpdatePanel ID="up_emp" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="col-lg-12">
                            <div class="col-lg-12 ">
                                <div class="row">
                                    <div class="panel panel-default" id="pnl_emp" runat="server">
                                        <div class="panel-body">
                                            <h5>DATOS EMPRESA</h5>
                                            <hr />
                                            <div class="row">

                                                <div class="col-lg-6">

                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_nom_emp" runat="server" Text="*Nombre de la Empresa"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_nom_emp" runat="server" placeholder="letras/números" ToolTip="letras/números" TabIndex="1"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_nom_emp" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_nom_emp" ForeColor="DarkRed"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-lg-6">
                                                            <div class="form-group text-left">

                                                                <asp:Label CssClass="control-label fuente_css02" ID="lbl_telefono_emp" runat="server" Text="Teléfono"></asp:Label>

                                                                <asp:TextBox CssClass="form-control input-box" ID="txt_telefono_emp" runat="server" MaxLength="16" placeholder="000-000-00000000" TextMode="Phone" ToolTip="Un número de teléfono válido consiste en un código de lada de 3 dígitos, un guión (-),un código de área de 3 dígitos, un guión (-) y el número telefónico con valores del 0 al 9" TabIndex="2"></asp:TextBox>
                                                                <div class="text-right">
                                                                    <asp:RegularExpressionValidator ID="revPhone" runat="server"
                                                                        ErrorMessage="Formato Invalido" ControlToValidate="txt_telefono_emp"
                                                                        ValidationExpression="[0-9]{3}[-][0-9]{3}[-][0-9]{8}" ForeColor="DarkRed">
                                                                    </asp:RegularExpressionValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6">
                                                            <div class="form-group text-left">

                                                                <div class="form-group text-left">

                                                                    <asp:Label CssClass="control-label fuente_css02" ID="lbl_email_emp" runat="server" Text="e-mail"></asp:Label>

                                                                    <asp:TextBox CssClass="form-control input-box" ID="txt_email_emp" runat="server" placeholder="xxxx@xxxx.xxx" TextMode="Email" ToolTip="xxxx@xxxx.xxx" TabIndex="3"></asp:TextBox>
                                                                    <br />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-lg-6">
                                                            <div class="form-group text-left">

                                                                <asp:Label CssClass="control-label fuente_css02" ID="lbl_callenum_emp" runat="server" Text="*Calle y número"></asp:Label>

                                                                <asp:TextBox CssClass="form-control input-box" ID="txt_callenum_emp" runat="server" placeholder="letras/números" ToolTip="letras/números" TextMode="MultiLine" TabIndex="4"></asp:TextBox>
                                                                <div class="text-right">
                                                                    <asp:RequiredFieldValidator ID="rfv_callenum_emp" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_callenum_emp" ForeColor="DarkRed"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6">
                                                            <div class="form-group text-left">

                                                                <asp:Label CssClass="control-label fuente_css02" ID="lbl_cp_emp" runat="server" Text="*Código Postal"></asp:Label>

                                                                <div class="input-group">
                                                                    <asp:TextBox CssClass="form-control input-box" ID="txt_cp_emp" runat="server" placeholder="5 números (0-9)" MaxLength="5" ToolTip="Un código postal valido consiste en 5 numeros con valores del 0-9" TabIndex="5"></asp:TextBox>
                                                                    <ajaxToolkit:MaskedEditExtender ID="mee_cp_emp" runat="server" TargetControlID="txt_cp_emp" Mask="99999" />
                                                                    <span class="input-group-btn">
                                                                        <asp:Button CssClass="btn btn02" ID="btn_cp_emp" runat="server" Text="VALIDAR" OnClick="btn_cp_emp_Click" TabIndex="6" />
                                                                    </span>
                                                                </div>
                                                                <div class="text-right">
                                                                    <asp:RequiredFieldValidator ID="rfv_cp_emp" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_cp_emp" ForeColor="DarkRed"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">

                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_colonia_emp" runat="server" Text="*Colonia"></asp:Label>

                                                        <asp:DropDownList CssClass="form-control input-box" ID="ddl_colonia_emp" runat="server" TabIndex="7"></asp:DropDownList>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_colonia_emp" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="ddl_colonia_emp" InitialValue="0" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-6">
                                                            <div class="form-group text-left">

                                                                <asp:Label CssClass="control-label fuente_css02" ID="lbl_municipio_emp" runat="server" Text="Municipio"></asp:Label>

                                                                <asp:TextBox CssClass="form-control input-box" ID="txt_municipio_emp" runat="server" placeholder="letras/números" TabIndex="8" Enabled="false"></asp:TextBox>
                                                                <br />
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6">
                                                            <div class="form-group text-left">

                                                                <asp:Label CssClass="control-label fuente_css02" ID="lbl_estado_emp" runat="server" Text="Estado"></asp:Label>

                                                                <asp:TextBox CssClass="form-control input-box" ID="txt_estado_emp" runat="server" placeholder="letras/números" TabIndex="9" Enabled="false"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <h5>DATOS ADMINISTRADOR</h5>
                                            <hr />
                                            <div class="row">

                                                <div class="col-lg-4">

                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label " ID="lbl_noms_usr" runat="server" Text="*Nombres"></asp:Label>

                                                        <asp:TextBox CssClass="form-control " ID="txt_noms_usr" runat="server" placeholder="letras/números" ToolTip="letras/números" TabIndex="10"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_noms_usr" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_noms_usr" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label " ID="lbl_code_usr" runat="server" Text="*Usuario"></asp:Label>

                                                        <asp:TextBox CssClass="form-control " ID="txt_code_usr" runat="server" placeholder="letras/números" ToolTip="letras/números" TabIndex="13"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_code_usr" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_code_usr" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4">
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label " ID="lbl_apat_usr" runat="server" Text="*Apellido Paterno"></asp:Label>

                                                        <asp:TextBox CssClass="form-control " ID="txt_apat_usr" runat="server" placeholder="letras/números" ToolTip="letras/números" TabIndex="11"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_apat_usr" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_apat_usr" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label " ID="lbl_clave_usr" runat="server" Text="*Clave"></asp:Label>

                                                        <asp:TextBox CssClass="form-control " ID="txt_clave_usr" runat="server" placeholder="letras/números" ToolTip="letras/números" TabIndex="14" TextMode="Password"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_clave_usr" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_clave_usr" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4">
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label " ID="lbl_amat_usr" runat="server" Text="*Apellido Materno"></asp:Label>

                                                        <asp:TextBox CssClass="form-control " ID="txt_amat_usr" runat="server" placeholder="letras/números" ToolTip="letras/números" TabIndex="12"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_amat_usr" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_amat_usr" ForeColor="DarkRed" Enabled="false"> </asp:RequiredFieldValidator>
                                                        </div>
                                                        <br />
                                                        <br />
                                                        <div class="text-right">

                                                            <asp:LinkButton ID="lkbtn_guardar_emp" runat="server" CssClass="btn btn-primary" OnClick="lkbtn_guardar_emp_Click" TabIndex="15"><i class="far fa-save"></i> Guardar</asp:LinkButton>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btn_cp_emp" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
        <div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel"
            aria-hidden="true">
            <div class="modal-dialog">
                <asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="modal-content">
                            <div class="modal-header encabezado001">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-window-close-o"></i></button>
                                <h4 class="modal-title">
                                    <asp:Label ID="lblModalTitle" runat="server" Text=""></asp:Label>
                                </h4>
                            </div>
                            <div class="modal-body">
                                <asp:Label CssClass="fuente_css02" ID="lblModalBody" runat="server" Text=""></asp:Label>
                            </div>
                            <div class="modal-footer">
                                <asp:LinkButton ID="lkbtn_modal" runat="server" CssClass="btn btn-primary" OnClick="lkbtn_modal_Click" TabIndex="1"><i class="fas fa-check"></i> OK</asp:LinkButton>
                                <%--<button class="btn btn01" data-dismiss="modal" aria-hidden="true">OK <i class="fa fa-check-circle-o"></i></button>--%>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </form>
</body>
</html>