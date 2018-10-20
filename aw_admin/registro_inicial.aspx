﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registro_inicial.aspx.cs" Inherits="aw_admin.registro_inicial" %>

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
    <link href="styles/estilos_liec.css" rel="stylesheet" />

    <link href="Content/fontawesome/all.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.3.1.min.js"></script>

    <script src="Scripts/bootstrap.min.js"></script>

    <link rel="shortcut icon" href="img/ico_liec.png" type="image/png" />
    <title>/ CAPTURA</title>
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

            <div class="row">

                <asp:UpdatePanel ID="up_clte" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="col-lg-10">
                            <div class="col-lg-12 ">
                                <div class="row">
                                    <div class="panel panel-default" id="pnl_clte" runat="server" visible="false">
                                        <div class="panel-heading">
                                            <p class="text-right">
                                                REGISTRO DE CLIENTES
                                            </p>
                                        </div>
                                        <div class="panel-body">
                                            <div class="row">

                                                <div class="col-lg-6">
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_trfc_clte_fisc" runat="server" Text="*Tipo RFC"></asp:Label>

                                                        <asp:DropDownList CssClass="form-control input-box" ID="ddl_trfc_clte_fisc" runat="server" TabIndex="7" BackColor="LightGray" ForeColor="#104D8D"></asp:DropDownList>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_trfc_clte_fisc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="ddl_trfc_clte_fisc" InitialValue="0" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>

                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_rfc_clte_fisc" runat="server" Text="*RFC"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_rfc_clte_fisc" runat="server" placeholder="letras/números" ToolTip="letras/números" TabIndex="8"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                                                ErrorMessage="Formato Invalido" ControlToValidate="txt_rfc_clte_fisc"
                                                                ValidationExpression="[A-ZÑ&]{3,4}\d{6}[A-V1-9][A-Z1-9][0-9A]" ForeColor="DarkRed">
                                                            </asp:RegularExpressionValidator>
                                                            <asp:RequiredFieldValidator ID="rfv_rfc_clte_fisc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_rfc_clte_fisc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_rs" runat="server" Text="*Razón Social"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_rs" runat="server" placeholder="letras/números" ToolTip="letras/números" TabIndex="9"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_rs" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_rs" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_telefono_clte" runat="server" Text="Teléfono"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_telefono_clte" runat="server" MaxLength="16" placeholder="000-000-00000000" TextMode="Phone" ToolTip="Un número de teléfono válido consiste en un código de lada de 3 dígitos, un guión (-),un código de área de 3 dígitos, un guión (-) y el número telefónico con valores del 0 al 9" TabIndex="10"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RegularExpressionValidator ID="revPhone" runat="server"
                                                                ErrorMessage="Formato Invalido" ControlToValidate="txt_telefono_clte"
                                                                ValidationExpression="[0-9]{3}[-][0-9]{3}[-][0-9]{8}" ForeColor="DarkRed">
                                                            </asp:RegularExpressionValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_email_clte" runat="server" Text="e-mail"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_email_clte" runat="server" placeholder="xxxx@xxxx.xxx" TextMode="Email" ToolTip="xxxx@xxxx.xxx" TabIndex="11"></asp:TextBox>
                                                        <br />
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_callenum_clte" runat="server" Text="*Calle ý número"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_callenum_clte" runat="server" placeholder="letras/números" ToolTip="letras/números" TextMode="MultiLine" BackColor="LightGray" ForeColor="#104D8D" TabIndex="12"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_callenum_clte" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_callenum_clte" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_cp_clte" runat="server" Text="*Código Postal"></asp:Label>

                                                        <div class="input-group">
                                                            <asp:TextBox CssClass="form-control input-box" ID="txt_cp_clte" runat="server" placeholder="5 números (0-9)" MaxLength="5" ToolTip="Un código postal valido consiste en 5 numeros con valores del 0-9" TabIndex="13"></asp:TextBox>
                                                            <ajaxToolkit:MaskedEditExtender ID="mee_cp_clte" runat="server" TargetControlID="txt_cp_clte" Mask="99999" />
                                                            <span class="input-group-btn">
                                                                <asp:Button CssClass="btn btn02" ID="btn_cp_clte" runat="server" Text="VALIDAR" OnClick="btn_cp_clte_Click" TabIndex="14" />
                                                            </span>
                                                        </div>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_cp_clte" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_cp_clte" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_colonia_clte" runat="server" Text="*Colonia"></asp:Label>

                                                        <asp:DropDownList CssClass="form-control input-box" ID="ddl_colonia_clte" runat="server" TabIndex="15" BackColor="LightGray" ForeColor="#104D8D"></asp:DropDownList>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_colonia_clte" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="ddl_colonia_clte" InitialValue="0" ForeColor="DarkRed" Enabled="false" TabIndex="14"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_municipio_clte" runat="server" Text="Municipio"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_municipio_clte" runat="server" placeholder="letras/números" Enabled="false" BackColor="LightGray" TabIndex="16"></asp:TextBox>
                                                        <br />
                                                    </div>
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_estado_clte" runat="server" Text="Estado"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_estado_clte" runat="server" placeholder="letras/números" Enabled="false" BackColor="LightGray" TabIndex="17"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-lg-10">

                                                    <asp:Label CssClass="control-label fuente_css02" ID="lbl_clte_coment" runat="server" Text="Comentarios"></asp:Label>

                                                    <asp:TextBox CssClass="form-control input-box" ID="txt_clte_coment" runat="server" placeholder="letras/números" TextMode="MultiLine" Enabled="false" BackColor="LightGray" ForeColor="#104D8D" TabIndex="18"></asp:TextBox>
                                                    <div class="text-right">
                                                        <asp:RequiredFieldValidator ID="rfv_clte_coment" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_clte_coment" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="col-lg-2">
                                                    <br />
                                                    <br />
                                                    <div class="text-right">
                                                        <asp:Button CssClass="btn btn02" ID="btn_guardar_clte" runat="server" Text="GUARDAR" OnClick="btn_guardar_clte_Click" TabIndex="19" />
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
                        <asp:AsyncPostBackTrigger ControlID="btn_cp_clte" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
                <asp:UpdatePanel ID="up_clte_obras" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="col-lg-10">
                            <div class="col-lg-12 ">
                                <div class="row">
                                    <div class="panel panel-default" id="pnl_clte_obras" runat="server" visible="false">
                                        <div class="panel-heading">
                                            <p class="text-left">
                                                <div class="input-group">
                                                    <span class="input-group-addon">
                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_buscar_clte_obras" runat="server" Text="*BUSCAR CLIENTE:"></asp:Label>
                                                    </span>
                                                    <asp:TextBox CssClass="form-control input-box" ID="txt_buscar_clte_obras" runat="server" placeholder="letras/números" TextMode="Search" TabIndex="1"></asp:TextBox>

                                                    <ajaxToolkit:AutoCompleteExtender ID="ace_buscar_clte_obras" runat="server" ServiceMethod="SearchCustomers" MinimumPrefixLength="2" CompletionInterval="100" EnableCaching="true" CompletionSetCount="10" TargetControlID="txt_buscar_clte_obras" FirstRowSelected="false"></ajaxToolkit:AutoCompleteExtender>
                                                </div>
                                                <div class="text-right">
                                                    <asp:RequiredFieldValidator ID="rfv_buscar_clte_obras" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_buscar_clte_obras" ForeColor="white" Enabled="false"></asp:RequiredFieldValidator>
                                                </div>
                                            </p>
                                            <p class="text-right">
                                                REGISTRO DE OBRAS
                                        <span>
                                            <asp:LinkButton CssClass="btn btn02" ID="btn_agregar_clte_obras" runat="server" ToolTip="AGREGAR OBRA" OnClick="btn_agregar_clte_obras_Click" TabIndex="2">
                                                <i class="fas fa-plus" id="i_agregar_clte_obras" runat="server"></i>
                                            </asp:LinkButton>
                                            <asp:LinkButton CssClass="btn btn02" ID="btn_editar_clte_obras" runat="server" ToolTip="EDITAR OBRA" OnClick="btn_editar_clte_obras_Click" TabIndex="3">
                                                <i class="far fa-edit" id="i_editar_clte_obras" runat="server"></i>
                                            </asp:LinkButton>
                                        </span>
                                                <br />
                                                <asp:CheckBox ID="chkb_desactivar_clte_obras" runat="server" AutoPostBack="true" Text="Desactivar validaciones" OnCheckedChanged="chkb_desactivar_clte_obras_CheckedChanged" TabIndex="4" />
                                            </p>
                                        </div>
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <asp:GridView CssClass="table" ID="gv_clte_obras" runat="server" AutoGenerateColumns="False" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" TabIndex="5" OnRowDataBound="gv_clte_obras_RowDataBound">
                                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                        <Columns>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="chk_clte_obras" runat="server" onclick="CheckOne(this)" AutoPostBack="true" OnCheckedChanged="chk_clte_obras_CheckedChanged" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="clave_obra" HeaderText="CLAVE" SortExpression="clave_obra" Visible="true" />
                                                            <asp:BoundField DataField="desc_obra" HeaderText="DESCRIPCIÓN" SortExpression="desc_obra" />
                                                            <asp:BoundField DataField="fecha_registro" HeaderText="REGISTRO" SortExpression="fecha_registro" DataFormatString="{0:dd-MM-yyyy}" HtmlEncode="false" />
                                                            <asp:TemplateField HeaderText="Estatus">
                                                                <ItemTemplate>
                                                                    <asp:DropDownList ID="ddl_clteobra_estatus" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_clteobra_estatus_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                        <EditRowStyle BackColor="#999999" />
                                                        <FooterStyle BackColor="#5D7B9D" ForeColor="White" />
                                                        <HeaderStyle BackColor="#104D8d" ForeColor="White" />
                                                        <PagerSettings Mode="NumericFirstLast" FirstPageText="Inicio" LastPageText="Final" />
                                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                                    </asp:GridView>
                                                </div>
                                            </div>
                                            <div class="row">

                                                <div class="col-lg-6">
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_clte_clave_obra" runat="server" Text="*Clave de Obra"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_clte_clave_obra" runat="server" placeholder="letras/números" ToolTip="Una clave de obra valida se conforma de dos letras A hasta Z, un guión (-), y dos números del 0 al 9, sin espacios" TabIndex="6"></asp:TextBox>
                                                        <div class="text-right">

                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                                                ErrorMessage="Formato Invalido" ControlToValidate="txt_clte_clave_obra"
                                                                ValidationExpression="[a-zA-Z]{2}[-][0-9]{2}" ForeColor="DarkRed">
                                                            </asp:RegularExpressionValidator>

                                                            <asp:RequiredFieldValidator ID="rfv_clte_clave_obra" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_clte_clave_obra" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_clte_desc_obra" runat="server" Text="*Nombre de Obra"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_clte_desc_obra" runat="server" placeholder="letras/números" ToolTip="letras/números" TabIndex="7" TextMode="MultiLine" BackColor="LightGray" ForeColor="#104D8D"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_clte_desc_obra" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_clte_desc_obra" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_clte_tservicio" runat="server" Text="*Tipo de Servicio"></asp:Label>

                                                        <asp:DropDownList CssClass="form-control input-box" ID="ddl_clte_tservicio" runat="server" TabIndex="8" BackColor="LightGray" ForeColor="#104D8D"></asp:DropDownList>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_clte_tservicio" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="ddl_clte_tservicio" InitialValue="0" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_clte_coordinador" runat="server" Text="*Coordinador"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_clte_coordinador" runat="server" placeholder="letras/números" ToolTip="letras/números" TabIndex="9" BackColor="LightGray" ForeColor="#104D8D"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_clte_coordinador" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_clte_coordinador" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_clte_contobra" runat="server" Text="*Con atención:"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_clte_contobra" runat="server" placeholder="letras/números" ToolTip="letras/números" TabIndex="10" TextMode="MultiLine" BackColor="LightGray" ForeColor="#104D8D"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_clte_contobra" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_clte_contobra" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_coment_obras" runat="server" Text="Comentarios"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="txt_coment_obras" runat="server" placeholder="letras/números" TextMode="MultiLine" Enabled="false" BackColor="LightGray" ForeColor="#104D8D" TabIndex="11"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_coment_obras" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_coment_obras" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <div class="form-group text-left">
                                                            <div class="text-right">
                                                                <asp:Button CssClass="btn btn02" ID="btn_guardar_clte_obras" runat="server" Text="GUARDAR" TabIndex="12" OnClick="btn_guardar_clte_obras_Click" />
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
                    </Triggers>
                </asp:UpdatePanel>
                <asp:UpdatePanel ID="up_rppc" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="col-lg-10">
                            <div class="col-lg-12 ">
                                <div class="row">
                                    <div class="panel panel-default" id="pnl_rppc" runat="server" visible="false">
                                        <div class="panel-heading">
                                            <p class="text-left">
                                                <div class="input-group" id="div_rppc" runat="server" visible="true">
                                                    <span class="input-group-addon">
                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_buscar_rppc" runat="server" Text="*BUSCAR OBRA:"></asp:Label>
                                                    </span>
                                                    <asp:TextBox CssClass="form-control input-box" ID="txt_buscar_rppc" runat="server" placeholder="letras/números" TextMode="Search" TabIndex="3"></asp:TextBox>

                                                    <ajaxToolkit:AutoCompleteExtender ID="ace_buscar_rppc" runat="server" ServiceMethod="SearchCustomers" MinimumPrefixLength="2" CompletionInterval="100" EnableCaching="true" CompletionSetCount="10" TargetControlID="txt_buscar_rppc" FirstRowSelected="false"></ajaxToolkit:AutoCompleteExtender>
                                                </div>
                                                <div class="text-right">
                                                    <asp:RequiredFieldValidator ID="rfv_buscar_rppc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_buscar_rppc" ForeColor="white" Enabled="true"></asp:RequiredFieldValidator>
                                                </div>
                                            </p>
                                            <p class="text-right">
                                                RECEPCIÓN Y PROGRAMACIÓN DE CONCRETO
                                        <span>
                                            <asp:LinkButton CssClass="btn btn02" ID="btn_agregar_rppc" runat="server" ToolTip="AGREGAR MUESTRA" OnClick="btn_agregar_rppc_Click" TabIndex="1">
                                                <i class="fas fa-plus" id="i_agregar_rppc" runat="server"></i>
                                            </asp:LinkButton>
                                            <asp:LinkButton CssClass="btn btn02" ID="btn_editar_rppc" runat="server" ToolTip="EDITAR MUESTRA" OnClick="btn_editar_rppc_Click" TabIndex="2">
                                                <i class="far fa-edit" id="i_editar_rppc" runat="server"></i>
                                            </asp:LinkButton>
                                        </span>
                                                <br />
                                                <asp:CheckBox ID="chkb_desactivar_rppc" runat="server" AutoPostBack="true" Text="Desactivar validaciones" OnCheckedChanged="chkb_desactivar_rppc_CheckedChanged" />
                                            </p>
                                        </div>
                                        <div class="panel-body">

                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <p class="text-left">
                                                        <div class="input-group" id="div_rpc" runat="server" visible="false">
                                                            <span class="input-group-addon">
                                                                <asp:Label CssClass="control-label fuente_css02" ID="lbl_buscar_rpc" runat="server" Text="*BUSCAR # MUESTRA:"></asp:Label>
                                                            </span>
                                                            <asp:TextBox CssClass="form-control input-box" ID="txt_buscar_rpc" runat="server" placeholder="letras/números" TextMode="Search" TabIndex="1"></asp:TextBox>
                                                            <span class="input-group-btn">
                                                                <asp:Button CssClass="btn btn02" ID="btn_buscar_rpc" runat="server" Text="ACEPTAR" OnClick="btn_buscar_rpc_Click" TabIndex="2" />
                                                            </span>
                                                        </div>
                                                        <div class="text-right">
                                                            <ajaxToolkit:AutoCompleteExtender ID="ace_buscar_rpc" runat="server" ServiceMethod="SearchCustomers" MinimumPrefixLength="2" CompletionInterval="100" EnableCaching="true" CompletionSetCount="10" TargetControlID="txt_buscar_rpc" FirstRowSelected="false"></ajaxToolkit:AutoCompleteExtender>
                                                            <asp:RequiredFieldValidator ID="rfv_buscar_rpc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_buscar_rpc" ForeColor="white" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </p>
                                                </div>
                                                <div class="col-lg-12">
                                                    <asp:GridView CssClass="table" ID="gv_rppc" runat="server" AutoGenerateColumns="False" AllowPaging="True" CellPadding="4" PageSize="5" ForeColor="#333333" GridLines="None" TabIndex="5" OnPageIndexChanging="gv_rppc_PageIndexChanging" OnRowDataBound="gv_rppc_RowDataBound">
                                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                        <Columns>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="chk_rppc" runat="server" onclick="CheckOne(this)" AutoPostBack="true" OnCheckedChanged="chk_rppc_CheckedChanged" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="no_muesra" HeaderText="# MUESTRA" SortExpression="no_muesra" Visible="true" />
                                                            <asp:BoundField DataField="fecha_registro" HeaderText="REGISTRO" SortExpression="fecha_registro" DataFormatString="{0:dd-MM-yyyy}" HtmlEncode="false" />
                                                            <asp:TemplateField HeaderText="ESTATUS">
                                                                <ItemTemplate>
                                                                    <asp:DropDownList ID="ddl_rppc_est" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_rppc_est_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                        <EditRowStyle BackColor="#999999" />
                                                        <FooterStyle BackColor="#5D7B9D" ForeColor="White" />
                                                        <HeaderStyle BackColor="#104D8d" ForeColor="White" />
                                                        <PagerSettings Mode="NumericFirstLast" FirstPageText="Inicio" LastPageText="Final" />
                                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                                    </asp:GridView>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-lg-2">
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_nmue_rppc" runat="server" Text="*No. de Muestra:"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="nmue_rppc" runat="server" placeholder="letras/números"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_nmue_rppc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="nmue_rppc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-2">
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_fcol_rppc" runat="server" Text="*Colado"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="fcol_rppc" runat="server" TextMode="Date"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_fcol_rppc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="fcol_rppc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-2">

                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_frec_rppc" runat="server" Text="Recepción"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="frec_rppc" runat="server" TextMode="Date"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_frec_rppc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="frec_rppc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-lg-3">
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_entrega_rppc" runat="server" Text="Entrega"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="entrega_rppc" runat="server" placeholder="letras/números"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_entrega_rppc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="entrega_rppc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3">
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_recibe_rppc" runat="server" Text="Recibe"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="recibe_rppc" runat="server" placeholder="letras/números"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_recibe_rppc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="recibe_rppc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-3">
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_r_rppc" runat="server" Text="f’c=kgf/cm2"></asp:Label>

                                                        <asp:TextBox CssClass="form-control input-box" ID="r_rppc" runat="server" placeholder="[0-9]"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_r_rppc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="r_rppc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3">
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_tesp_rppc" runat="server" Text="Tipo de Especímen"></asp:Label>

                                                        <asp:DropDownList CssClass="form-control input-box" ID="ddl_tesp_rppc" runat="server" AutoPostBack="true" BackColor="LightGray" ForeColor="#104D8D"></asp:DropDownList>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_tesp_rppc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="ddl_tesp_rppc" InitialValue="0" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3">
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_tconc_rppc" runat="server" Text="Tipo de Concreto (N,RR,RT,UR)"></asp:Label>

                                                        <asp:DropDownList CssClass="form-control input-box" ID="ddl_tconc_rppc" runat="server" AutoPostBack="true" BackColor="LightGray" ForeColor="#104D8D"></asp:DropDownList>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_tconc_rppc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="ddl_tconc_rppc" InitialValue="0" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3">
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_sit_rppc" runat="server" Text="Situación (Documento)"></asp:Label>

                                                        <asp:DropDownList CssClass="form-control input-box" ID="ddl_sit_rppc" runat="server" AutoPostBack="true" BackColor="LightGray" ForeColor="#104D8D" OnSelectedIndexChanged="ddl_sit_rppc_SelectedIndexChanged"></asp:DropDownList>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_sit_rppc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="ddl_sit_rppc" InitialValue="0" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div runat="server" id="div_doc" visible="false">
                                                <div class="row">
                                                    <div class="col-lg-2">
                                                        <div class="form-group text-left">

                                                            <asp:Label CssClass="control-label fuente_css02" ID="lbl_proce_rppc" runat="server" Text="*Procedencia:"></asp:Label>

                                                            <asp:TextBox CssClass="form-control input-box" ID="txt_proce_rppc" runat="server" placeholder="letras/números"></asp:TextBox>
                                                            <div class="text-right">
                                                                <asp:RequiredFieldValidator ID="rfv_proce_rppc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_proce_rppc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-2">
                                                        <div class="form-group text-left">

                                                            <asp:Label CssClass="control-label fuente_css02" ID="lbl_elem_rppc" runat="server" Text="*Elemento:"></asp:Label>

                                                            <asp:TextBox CssClass="form-control input-box" ID="txt_elem_rppc" runat="server" placeholder="letras/números"></asp:TextBox>
                                                            <div class="text-right">
                                                                <asp:RequiredFieldValidator ID="rfv_elem_rppc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_elem_rppc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-2">
                                                        <div class="form-group text-left">

                                                            <asp:Label CssClass="control-label fuente_css02" ID="lbl_dosi_rppc" runat="server" Text="*Dosificación:"></asp:Label>

                                                            <asp:TextBox CssClass="form-control input-box" ID="txt_dosi_rppc" runat="server" placeholder="letras/números"></asp:TextBox>
                                                            <div class="text-right">
                                                                <asp:RequiredFieldValidator ID="rfv_dosi_rppc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_dosi_rppc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-2">
                                                        <div class="form-group text-left">

                                                            <asp:Label CssClass="control-label fuente_css02" ID="lbl_resis_rppc" runat="server" Text="*Resistencia:"></asp:Label>

                                                            <asp:TextBox CssClass="form-control input-box" ID="txt_resis_rppc" runat="server" placeholder="letras/números"></asp:TextBox>
                                                            <div class="text-right">
                                                                <asp:RequiredFieldValidator ID="rfv_resis_rppc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_resis_rppc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-2">
                                                        <div class="form-group text-left">

                                                            <asp:Label CssClass="control-label fuente_css02" ID="lbl_clase_rppc" runat="server" Text="*Clase:"></asp:Label>

                                                            <asp:TextBox CssClass="form-control input-box" ID="txt_clase_rppc" runat="server" placeholder="letras/números"></asp:TextBox>
                                                            <div class="text-right">
                                                                <asp:RequiredFieldValidator ID="rfv_clase_rppc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_clase_rppc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-2">
                                                        <div class="form-group text-left">

                                                            <asp:Label CssClass="control-label fuente_css02" ID="lbl_rev_rrpc" runat="server" Text="*REV. cm:"></asp:Label>

                                                            <asp:TextBox CssClass="form-control input-box" ID="txt_rev_rrpc" runat="server" placeholder="letras/números"></asp:TextBox>
                                                            <div class="text-right">
                                                                <asp:RequiredFieldValidator ID="rfv_rev_rrpc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_rev_rrpc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-2">
                                                        <div class="form-group text-left">

                                                            <asp:Label CssClass="control-label fuente_css02" ID="lbl_tma_rrpc" runat="server" Text="*T.M.A. mm:"></asp:Label>

                                                            <asp:TextBox CssClass="form-control input-box" ID="txt_tma_rrpc" runat="server" placeholder="letras/números"></asp:TextBox>
                                                            <div class="text-right">
                                                                <asp:RequiredFieldValidator ID="rfv_tma_rrpc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_tma_rrpc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-2">
                                                        <div class="form-group text-left">

                                                            <asp:Label CssClass="control-label fuente_css02" ID="lbl_olla_rrpc" runat="server" Text="*OLLA:"></asp:Label>

                                                            <asp:TextBox CssClass="form-control input-box" ID="txt_olla_rrpc" runat="server" placeholder="letras/números"></asp:TextBox>
                                                            <div class="text-right">
                                                                <asp:RequiredFieldValidator ID="rfv_olla_rrpc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_olla_rrpc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-2">
                                                        <div class="form-group text-left">

                                                            <asp:Label CssClass="control-label fuente_css02" ID="lbl_remi_rppc" runat="server" Text="*Remisión:"></asp:Label>

                                                            <asp:TextBox CssClass="form-control input-box" ID="txt_remi_rppc" runat="server" placeholder="letras/números"></asp:TextBox>
                                                            <div class="text-right">
                                                                <asp:RequiredFieldValidator ID="rfv_remi_rppc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_remi_rppc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-2">
                                                        <div class="form-group text-left">

                                                            <asp:Label CssClass="control-label fuente_css02" ID="lbl_splata_rrpc" runat="server" Text="*Salida planta:"></asp:Label>

                                                            <asp:TextBox CssClass="form-control input-box" ID="txt_splata_rrpc" runat="server" placeholder="letras/números" TextMode="Time"></asp:TextBox>
                                                            <div class="text-right">
                                                                <asp:RequiredFieldValidator ID="rfv_splata_rrpc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_splata_rrpc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-2">
                                                        <div class="form-group text-left">

                                                            <asp:Label CssClass="control-label fuente_css02" ID="lbl_llobra_rrpc" runat="server" Text="*Llegada a obra:"></asp:Label>

                                                            <asp:TextBox CssClass="form-control input-box" ID="txt_llobra_rrpc" runat="server" placeholder="letras/números" TextMode="Time"></asp:TextBox>
                                                            <div class="text-right">
                                                                <asp:RequiredFieldValidator ID="rfv_llobra_rrpc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_llobra_rrpc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-2">
                                                        <div class="form-group text-left">

                                                            <asp:Label CssClass="control-label fuente_css02" ID="lbl_inic_rrpc" runat="server" Text="*Descarga Inicia:"></asp:Label>

                                                            <asp:TextBox CssClass="form-control input-box" ID="txt_inic_rrpc" runat="server" placeholder="letras/números" TextMode="Time"></asp:TextBox>
                                                            <div class="text-right">
                                                                <asp:RequiredFieldValidator ID="rfvl_inic_rrpc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_inic_rrpc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-2">
                                                        <div class="form-group text-left">

                                                            <asp:Label CssClass="control-label fuente_css02" ID="lbl_term_rrpc" runat="server" Text="*Descarga Termina:"></asp:Label>

                                                            <asp:TextBox CssClass="form-control input-box" ID="txt_term_rrpc" runat="server" placeholder="letras/números" TextMode="Time"></asp:TextBox>
                                                            <div class="text-right">
                                                                <asp:RequiredFieldValidator ID="rfv_term_rrpc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_term_rrpc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-2">
                                                        <div class="form-group text-left">

                                                            <asp:Label CssClass="control-label fuente_css02" ID="lbl_vol_rppc" runat="server" Text="*VOL m3:"></asp:Label>

                                                            <asp:TextBox CssClass="form-control input-box" ID="txt_vol_rppc" runat="server" placeholder="letras/números"></asp:TextBox>
                                                            <div class="text-right">
                                                                <asp:RequiredFieldValidator ID="rfv_vol_rppc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_vol_rppc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-2">
                                                        <div class="form-group text-left">

                                                            <asp:Label CssClass="control-label fuente_css02" ID="lbl_revb_rppc" runat="server" Text="*REV. cm:"></asp:Label>

                                                            <asp:TextBox CssClass="form-control input-box" ID="txt_revb_rppc" runat="server" placeholder="letras/números"></asp:TextBox>
                                                            <div class="text-right">
                                                                <asp:RequiredFieldValidator ID="rfv_revb_rppc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_revb_rppc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <div class="form-group text-left">

                                                            <asp:Label CssClass="control-label fuente_css02" ID="lbl_loca_rppc" runat="server" Text="*Localización:"></asp:Label>

                                                            <asp:TextBox CssClass="form-control input-box" ID="txt_loca_rppc" runat="server" placeholder="letras/números" TextMode="MultiLine"></asp:TextBox>
                                                            <div class="text-right">
                                                                <asp:RequiredFieldValidator ID="rfv_loca_rppc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_loca_rppc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <h4 class="text-center">Programación fechas de ensaye</h4>
                                                <br />
                                                <asp:Label CssClass="control-label fuente_css02" ID="lbl_fmaxe" runat="server" Text=""></asp:Label>
                                                <div class="col-lg-6">

                                                    <div class="input-group">
                                                        <span class="input-group-addon text-left">
                                                            <asp:CheckBox ID="chkb_1_rppc" runat="server" AutoPostBack="true" Text="1 Día : " OnCheckedChanged="chkb_1_rppc_CheckedChanged" />
                                                        </span>
                                                        <span class="input-group-addon">
                                                            <asp:TextBox CssClass="form-control input-box" ID="txt_cant1_rppc" runat="server" TextMode="Number"></asp:TextBox>
                                                        </span>
                                                        <span class="input-group-addon">
                                                            <asp:TextBox CssClass="form-control input-box" ID="txt_f1_rppc" runat="server" TextMode="Date"></asp:TextBox>
                                                        </span>
                                                    </div>
                                                    <div class="text-right">
                                                        <asp:RequiredFieldValidator ID="rfv_f1_rppc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_cant1_rppc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <div class="input-group">
                                                        <span class="input-group-addon">

                                                            <asp:CheckBox ID="chkb_3_rppc" runat="server" AutoPostBack="true" Text="3 Días:" OnCheckedChanged="chkb_3_rppc_CheckedChanged" />
                                                        </span>
                                                        <span class="input-group-addon">
                                                            <asp:TextBox CssClass="form-control input-box" ID="txt_cant3_rppc" runat="server" TextMode="Number"></asp:TextBox>
                                                        </span>
                                                        <span class="input-group-addon">
                                                            <asp:TextBox CssClass="form-control input-box" ID="txt_f3_rppc" runat="server" TextMode="Date"></asp:TextBox>
                                                        </span>
                                                    </div>
                                                    <div class="text-right">
                                                        <asp:RequiredFieldValidator ID="rfv_f3_rppc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_cant3_rppc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <div class="input-group">
                                                        <span class="input-group-addon">

                                                            <asp:CheckBox ID="chkb_7_rppc" runat="server" AutoPostBack="true" Text="7 Días:" OnCheckedChanged="chkb_7_rppc_CheckedChanged" />
                                                        </span>
                                                        <span class="input-group-addon">
                                                            <asp:TextBox CssClass="form-control input-box" ID="txt_cant7_rppc" runat="server" TextMode="Number"></asp:TextBox>
                                                        </span>
                                                        <span class="input-group-addon">
                                                            <asp:TextBox CssClass="form-control input-box" ID="txt_f7_rppc" runat="server" TextMode="Date"></asp:TextBox>
                                                        </span>
                                                    </div>
                                                    <div class="text-right">
                                                        <asp:RequiredFieldValidator ID="rfv_f7_rppc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_cant7_rppc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">

                                                    <div class="input-group">
                                                        <span class="input-group-addon">
                                                            <asp:CheckBox ID="chkb_14_rppc" runat="server" AutoPostBack="true" Text="14 Días:" OnCheckedChanged="chkb_14_rppc_CheckedChanged" />
                                                        </span>
                                                        <span class="input-group-addon">
                                                            <asp:TextBox CssClass="form-control input-box" ID="txt_cant14_rppc" runat="server" TextMode="Number"></asp:TextBox>
                                                        </span>
                                                        <span class="input-group-addon">
                                                            <asp:TextBox CssClass="form-control input-box" ID="txt_f14_rppc" runat="server" TextMode="Date"></asp:TextBox>
                                                        </span>
                                                    </div>
                                                    <div class="text-right">
                                                        <asp:RequiredFieldValidator ID="rfv_f14_rppc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_cant14_rppc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <div class="input-group">
                                                        <span class="input-group-addon">

                                                            <asp:CheckBox ID="chkb_28_rppc" runat="server" AutoPostBack="true" Text="28 Días:" OnCheckedChanged="chkb_28_rppc_CheckedChanged" />
                                                        </span>
                                                        <span class="input-group-addon">
                                                            <asp:TextBox CssClass="form-control input-box" ID="txt_cant28_rppc" runat="server" TextMode="Number"></asp:TextBox>
                                                        </span>
                                                        <span class="input-group-addon">
                                                            <asp:TextBox CssClass="form-control input-box" ID="txt_f28_rppc" runat="server" TextMode="Date"></asp:TextBox>
                                                        </span>
                                                    </div>
                                                    <div class="text-right">
                                                        <asp:RequiredFieldValidator ID="rfv_f28_rppc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_cant28_rppc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <div class="input-group">
                                                        <span class="input-group-addon">

                                                            <asp:CheckBox ID="chkb_otro_rppc" runat="server" AutoPostBack="true" Text="Otro     : " OnCheckedChanged="chkb_otro_rppc_CheckedChanged" />
                                                        </span>
                                                        <span class="input-group-addon">
                                                            <asp:TextBox CssClass="form-control input-box" ID="txt_cantotro_rppc" runat="server" TextMode="Number"></asp:TextBox>
                                                        </span>
                                                        <span class="input-group-addon">
                                                            <asp:TextBox CssClass="form-control input-box" ID="txt_fotro_rppc" runat="server" TextMode="Date"></asp:TextBox>
                                                        </span>
                                                    </div>
                                                    <div class="text-right">
                                                        <asp:RequiredFieldValidator ID="rfv_ftro_rppc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_cantotro_rppc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <br />
                                                    <div class="text-right">
                                                        <asp:Button CssClass="btn btn02" ID="btn_guardar_rppc" runat="server" Text="GUARDAR" TabIndex="13" OnClick="btn_guardar_rppc_Click" />
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
                    </Triggers>
                </asp:UpdatePanel>
                <asp:UpdatePanel ID="up_ensa_comp" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="col-lg-10">
                            <div class="col-lg-12 ">
                                <div class="row">
                                    <div class="panel panel-default" id="pnl_ensa_comp" runat="server" visible="false">
                                        <div class="panel-heading">
                                            <p class="text-left">
                                                <div class="input-group" id="div_ensa_comp" runat="server" visible="true">
                                                    <span class="input-group-addon">
                                                        <asp:Label CssClass="control-label fuente_css02" ID="lbl_buscar_ensa_comp" runat="server" Text="*BUSCAR # MUESTRAS:"></asp:Label>
                                                    </span>
                                                    <asp:TextBox CssClass="form-control input-box" ID="txt_buscar_ensa_comp" runat="server" placeholder="letras/números" TextMode="Date" TabIndex="3"></asp:TextBox>
                                                    <span class="input-group-btn">
                                                        <asp:Button CssClass="btn btn01" ID="btn_buscar_ensa_comp" runat="server" Text="ACEPTAR" TabIndex="4" OnClick="btn_buscar_ensa_comp_Click" />
                                                    </span>
                                                </div>
                                                <div class="text-right">
                                                    <ajaxToolkit:AutoCompleteExtender ID="ace_buscar_ensa_comp" runat="server" ServiceMethod="SearchCustomers" MinimumPrefixLength="2" CompletionInterval="100" EnableCaching="true" CompletionSetCount="10" TargetControlID="txt_buscar_ensa_comp" FirstRowSelected="false"></ajaxToolkit:AutoCompleteExtender>
                                                    <asp:RequiredFieldValidator ID="rfv_buscar_ensa_comp" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_buscar_ensa_comp" ForeColor="white" Enabled="false"></asp:RequiredFieldValidator>
                                                </div>
                                            </p>
                                            <p class="text-right">
                                                ENSAYE A COMPRESIÓN

                                        <span>
                                            <asp:LinkButton CssClass="btn btn02" ID="btn_agregar_ensa_comp" runat="server" ToolTip="AGREGAR ÁREA" TabIndex="5" OnClick="btn_agregar_ensa_comp_Click">
                                                <i class="fas fa-plus" id="i_agregar_ensa_comp" runat="server"></i>
                                            </asp:LinkButton>
                                            <asp:LinkButton CssClass="btn btn02" ID="btn_editar_ensa_comp" runat="server" ToolTip="EDITAR ÁREA" TabIndex="6" OnClick="btn_editar_ensa_comp_Click">
                                                <i class="far fa-edit" id="i_editar_ensa_comp" runat="server"></i>
                                            </asp:LinkButton>
                                        </span>
                                                <br />
                                                <asp:CheckBox ID="chkb_desacensa_comp" runat="server" AutoPostBack="true" Text="Desactivar validaciones" OnCheckedChanged="chkb_desacensa_comp_CheckedChanged" TabIndex="7" />
                                            </p>
                                        </div>
                                        <div class="panel-body">
                                            <div class="col-lg-12">
                                                <asp:GridView CssClass="table" ID="gv_ensa_comp" runat="server" AutoGenerateColumns="False" AllowPaging="True" CellPadding="4" PageSize="5" ForeColor="#333333" GridLines="None" TabIndex="8" OnPageIndexChanging="gv_ensa_comp_PageIndexChanging" OnRowDataBound="gv_ensa_comp_RowDataBound">
                                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                    <Columns>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="chk_ensa_comp" runat="server" onclick="CheckOne(this)" AutoPostBack="true" OnCheckedChanged="chk_ensa_comp_CheckedChanged" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:BoundField DataField="no_muesra" HeaderText="# MUESTRA" SortExpression="no_muesra" Visible="true" />
                                                        <asp:BoundField DataField="fecha_colado" HeaderText="COLADO" SortExpression="fecha_colado" DataFormatString="{0:dd-MM-yyyy}" HtmlEncode="false" />
                                                        <asp:BoundField DataField="uno" HeaderText="1D" SortExpression="uno" Visible="true" />
                                                        <asp:BoundField DataField="tres" HeaderText="3D" SortExpression="tres" Visible="true" />
                                                        <asp:BoundField DataField="siete" HeaderText="7D" SortExpression="siete" Visible="true" />
                                                        <asp:BoundField DataField="catorce" HeaderText="14D" SortExpression="catorce" Visible="true" />
                                                        <asp:BoundField DataField="vienteocho" HeaderText="28D" SortExpression="vienteocho" Visible="true" />
                                                        <asp:BoundField DataField="cero" HeaderText="OD" SortExpression="cero" Visible="true" />
                                                        <asp:TemplateField HeaderText="ESTATUS">
                                                            <ItemTemplate>
                                                                <asp:DropDownList ID="ddl_ensa_comp_est" runat="server" AutoPostBack="true" TabIndex="9">
                                                                </asp:DropDownList>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <EditRowStyle BackColor="#999999" />
                                                    <FooterStyle BackColor="#5D7B9D" ForeColor="White" />
                                                    <HeaderStyle BackColor="#104D8d" ForeColor="White" />
                                                    <PagerSettings Mode="NumericFirstLast" FirstPageText="Inicio" LastPageText="Final" />
                                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                                </asp:GridView>
                                            </div>
                                            <h6>
                                                <div id="div_eca" runat="server" visible="true">
                                                    <div class="row">

                                                        <div class="col-md-2">
                                                            <div class="form-group">
                                                                <asp:Label CssClass="control-label fuente_css02" ID="lbl_clavensa_a" runat="server" Text="Clave"></asp:Label>
                                                                <asp:TextBox CssClass="form-control input-box" ID="txt_clavensa_a" runat="server" placeholder="[0-9]" TabIndex="10" TextMode="Number"></asp:TextBox>
                                                                <div class="text-right">
                                                                    <asp:RequiredFieldValidator ID="rfv_clavensa_a" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_clavensa_a" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <div class="form-group">
                                                                <asp:Label CssClass="control-label fuente_css02" ID="lbl_masa_a" runat="server" Text="Masa (kg)"></asp:Label>
                                                                <asp:TextBox CssClass="form-control input-box" ID="txt_masa_a" runat="server" placeholder="[0-9]" TabIndex="11"></asp:TextBox>
                                                                <div class="text-right">
                                                                    <asp:RequiredFieldValidator ID="rfv_masa_a" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_masa_a" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <div class="form-group">
                                                                <asp:Label CssClass="control-label fuente_css02" ID="lbl_dire_a" runat="server" Text="Directo"></asp:Label>
                                                                <asp:TextBox CssClass="form-control input-box" ID="txt_dire_a" runat="server" placeholder="[0-9]" TabIndex="12"></asp:TextBox>
                                                                <div class="text-right">
                                                                    <asp:RequiredFieldValidator ID="rfv_dire_a" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_dire_a" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <div class="form-group">
                                                                <asp:Label CssClass="control-label fuente_css02" ID="lbl_inte_a" runat="server" Text="Intensidad"></asp:Label>
                                                                <asp:TextBox CssClass="form-control input-box" ID="txt_inte_a" runat="server" placeholder="[0-9]" TabIndex="13"></asp:TextBox>
                                                                <div class="text-right">
                                                                    <asp:RequiredFieldValidator ID="rfv_inte_a" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_inte_a" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-4"></div>
                                                        <div class="col-md-6 text-center">
                                                            <asp:Label CssClass="control-label fuente_css02" ID="Label1" runat="server" Text="Altura (mm)"></asp:Label>
                                                        </div>
                                                        <div class="col-md-6 text-center">
                                                            <asp:Label CssClass="control-label fuente_css02" ID="Label2" runat="server" Text="Lados (mm)"></asp:Label>
                                                        </div>
                                                        <div class="col-md-2">

                                                            <div class="form-group">
                                                                <asp:Label CssClass="control-label fuente_css02" ID="lbl_altu_aa" runat="server" Text="1"></asp:Label>
                                                                <asp:TextBox CssClass="form-control input-box" ID="txt_altu_aa" runat="server" TabIndex="14" placeholder="[0-9]"></asp:TextBox>
                                                                <div class="text-right">
                                                                    <asp:RequiredFieldValidator ID="rfv_altu_aa" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_altu_aa" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-2">

                                                            <div class="form-group">
                                                                <asp:Label CssClass="control-label fuente_css02" ID="lbl_altu_ab" runat="server" Text="2"></asp:Label>
                                                                <asp:TextBox CssClass="form-control input-box" ID="txt_altu_ab" runat="server" TabIndex="15" placeholder="[0-9]" AutoPostBack="true" OnTextChanged="txt_altu_ab_TextChanged"></asp:TextBox>
                                                                <div class="text-right">
                                                                    <asp:RequiredFieldValidator ID="rfv_altu_ab" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_altu_ab" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-2">

                                                            <div class="form-group">
                                                                <asp:Label CssClass="control-label fuente_css02" ID="lbl_altu_ap" runat="server" Text="Promedio"></asp:Label>
                                                                <asp:TextBox CssClass="form-control input-box" ID="txt_altu_ap" runat="server" TabIndex="16" placeholder="[0-9]" Enabled="false"></asp:TextBox>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-2">
                                                            <div class="form-group">
                                                                <asp:Label CssClass="control-label fuente_css02" ID="lbl_lad_aa" runat="server" Text="1"></asp:Label>
                                                                <asp:TextBox CssClass="form-control input-box" ID="txt_lad_aa" runat="server" TabIndex="17" placeholder="[0-9]"></asp:TextBox>
                                                                <div class="text-right">
                                                                    <asp:RequiredFieldValidator ID="rfv_lad_ab" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_lad_aa" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <div class="form-group">
                                                                <asp:Label CssClass="control-label fuente_css02" ID="lbl_lad_ab" runat="server" Text="2"></asp:Label>
                                                                <asp:TextBox CssClass="form-control input-box" ID="txt_lad_ab" runat="server" TabIndex="18" placeholder="[0-9]" AutoPostBack="true" OnTextChanged="txt_lad_ab_TextChanged"></asp:TextBox>
                                                                <div class="text-right">
                                                                    <asp:RequiredFieldValidator ID="rfv_lad_aa" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_lad_ab" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <div class="form-group">
                                                                <asp:Label CssClass="control-label fuente_css02" ID="lbl_lad_ap" runat="server" Text="Promedio"></asp:Label>
                                                                <asp:TextBox CssClass="form-control input-box" ID="txt_lad_ap" runat="server" TabIndex="190" placeholder="[0-9]" Enabled="false"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-2">
                                                            <div class="form-group">
                                                                <asp:Label CssClass="control-label fuente_css02" ID="lbl_area_a" runat="server" Text="Área (mm2)"></asp:Label>
                                                                <asp:TextBox CssClass="form-control input-box" ID="txt_area_a" runat="server" placeholder="[0-9]" TabIndex="20" Enabled="false"></asp:TextBox>
                                                            </div>
                                                            <br />
                                                            <div class="form-group">
                                                                <asp:Label CssClass="control-label fuente_css02" ID="lbl_tf_a" runat="server" Text="Tipo de Falla"></asp:Label>
                                                                <asp:TextBox CssClass="form-control input-box" ID="txt_tf_a" runat="server" placeholder="[0-9]" TabIndex="26"></asp:TextBox>
                                                                <div class="text-right">
                                                                    <asp:RequiredFieldValidator ID="rfv_tf_a" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_tf_a" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <div class="form-group">
                                                                <asp:Label CssClass="control-label fuente_css02" ID="lbl_pres_a" runat="server" Text="Presión (kN)"></asp:Label>
                                                                <asp:TextBox CssClass="form-control input-box" ID="txt_pres_a" runat="server" placeholder="[0-9]" TabIndex="21" AutoPostBack="true" OnTextChanged="txt_pres_a_TextChanged"></asp:TextBox>
                                                                <div class="text-right">
                                                                    <asp:RequiredFieldValidator ID="rfv_pres_a" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_pres_a" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <asp:Label CssClass="control-label fuente_css02" ID="lbl_dif_ab_a" runat="server" Text="Diferencia"></asp:Label>

                                                                <asp:TextBox CssClass="form-control input-box" ID="txt_dif_ab_a" runat="server" placeholder="[0-9]" TabIndex="27" Enabled="false"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <div class="form-group">
                                                                <asp:Label CssClass="control-label fuente_css02" ID="lbl_esfu_a" runat="server" Text="Esfuerzo (kgf/cm2)"></asp:Label>

                                                                <asp:TextBox CssClass="form-control input-box" ID="txt_esfu_a" runat="server" placeholder="[0-9]" TabIndex="22" Enabled="false"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <div class="form-group">
                                                                <asp:Label CssClass="control-label fuente_css02" ID="lbl_esfuprom_a" runat="server" Text="Promedio (Kg/cm2)"></asp:Label>
                                                                <asp:TextBox CssClass="form-control input-box" ID="txt_esfuprom_a" runat="server" placeholder="[0-9]" TabIndex="23" Enabled="false"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <div class="form-group">
                                                                <asp:Label CssClass="control-label fuente_css02" ID="lbl_masavol_a" runat="server" Text="Masa Vol. (kg/m³)"></asp:Label>

                                                                <asp:TextBox CssClass="form-control input-box" ID="txt_masavol_a" runat="server" placeholder="[0-9]" TabIndex="24" Enabled="false"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <div class="form-group">
                                                                <asp:Label CssClass="control-label fuente_css02" ID="lbl_masavolprom_a" runat="server" Text="Promedio (kg/m3)"></asp:Label>

                                                                <asp:TextBox CssClass="form-control input-box" ID="txt_masavolprom_a" runat="server" placeholder="[0-9]" TabIndex="25" Enabled="false"></asp:TextBox>
                                                            </div>
                                                            <br />
                                                            <br />

                                                            <div class="text-right">

                                                                <asp:Button CssClass="btn btn02" ID="btn_guardar_eca" runat="server" Text="GUARDAR" TabIndex="28" OnClick="btn_guardar_ensa_comp_Click" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <hr />
                                            </h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="col-lg-10">
                            <div class="col-lg-12 ">
                                <div class="row">
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>
                <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="col-lg-10">
                            <div class="col-lg-12 ">
                                <div class="row">
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>
                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="col-lg-10">
                            <div class="col-lg-12 ">
                                <div class="row">
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>
                <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="col-lg-10">
                            <div class="col-lg-12 ">
                                <div class="row">
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
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
                                <button class="btn btn01" data-dismiss="modal" aria-hidden="true">OK <i class="fa fa-check-circle-o"></i></button>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </form>
</body>
</html>