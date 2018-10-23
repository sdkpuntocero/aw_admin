<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pnl_ctrl.aspx.cs" Inherits="aw_admin.pnl_ctrl" %>

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
    <title>/ PANEL DE CONTROL </title>
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
            <asp:UpdatePanel ID="up_gastos_bienvenida" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <br />
                    <div class="row">

                        <div class="col-lg-6">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/img/nophoto.svg" Width="64" Height="64" CssClass="img-thumbnail" />
                        </div>

                        <div class="col-lg-6">
                            <div>
                                <p class="text-right">

                                    <label class="control-label ">BIENVENID@:</label>
                                    <asp:LinkButton CssClass="buttonClass" ID="lkb_usr_oper" runat="server">
                                        <asp:Label CssClass="buttonClass" ID="lbl_usr_oper" runat="server" Text=""></asp:Label>&nbsp;<i class="fas fa-user-cog" id="i_usr_oper" runat="server"></i>
                                    </asp:LinkButton>

                                    <br />

                                    <label class="control-label ">PERFIL:</label>
                                    <asp:Label CssClass="" ID="lbl_tusr" runat="server" Text=""></asp:Label>&nbsp;<i class="fas fa-user-shield " id="i1" runat="server"></i>

                                    <br />

                                    <label class="control-label ">EMPRESA:</label>
                                    <asp:LinkButton CssClass="buttonClass" ID="lkb_emp_oper" runat="server">
                                        <asp:Label CssClass="buttonClass" ID="lbl_emp_oper" runat="server" Text=""></asp:Label>&nbsp;<i class="fas fa-building" id="i_emp_oper" runat="server"></i>
                                    </asp:LinkButton>
                                </p>
                            </div>
                        </div>
                    </div>
                    <hr />
                </ContentTemplate>
                <Triggers>
                </Triggers>
            </asp:UpdatePanel>

            <div class="row">
                <asp:UpdatePanel ID="up_admin_menu" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="col-lg-3">
                            <div class="sidebar-nav">
                                <div class="navbar-default" role="navigation">
                                    <div class="navbar-header">
                                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-navbar-collapse"><span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
                                        <span class="visible-xs navbar-brand">Menú Panel</span>
                                    </div>
                                    <div class="navbar-collapse collapse sidebar-navbar-collapse">
                                        <br />
                                        <div class="sidebar" style="display: block;">
                                            <ul class="nav">
                                                <li>
                                                    <asp:LinkButton CssClass="" ID="lkbtn_resumen" runat="server">
                                                        <i class="fas fa-pencil-alt" id="i_resumen" runat="server"></i>
                                                        <asp:Label CssClass="buttonClass" ID="lbl_resumen" runat="server" Text=" Resumen"></asp:Label>
                                                    </asp:LinkButton>
                                                </li>
                                                <li>
                                                    <asp:LinkButton CssClass="" ID="lkbtn_cot" runat="server">
                                                        <i class="fas fa-pencil-alt" id="i_cot" runat="server"></i>
                                                        <asp:Label CssClass="buttonClass" ID="lbl_cot" runat="server" Text=" Cotización"></asp:Label>
                                                    </asp:LinkButton>
                                                </li>
                                                <li>
                                                    <asp:LinkButton CssClass="" ID="lkbtn_ordc" runat="server">
                                                        <i class="fas fa-pencil-alt" id="i_ordc" runat="server"></i>
                                                        <asp:Label CssClass="buttonClass" ID="lbl_ordc" runat="server" Text=" Orden de Compra"></asp:Label>
                                                    </asp:LinkButton>
                                                </li>
                                                <li>
                                                    <asp:LinkButton CssClass="" ID="lkbtn_inv" runat="server" OnClick="lkbtn_inv_Click">
                                                        <i class="fas fa-pencil-alt" id="i_inv" runat="server"></i>
                                                        <asp:Label CssClass="buttonClass" ID="lbl_inv" runat="server" Text=" Inventario"></asp:Label>
                                                    </asp:LinkButton>
                                                </li>
                                                <li>
                                                    <asp:LinkButton CssClass="" ID="lkbtn_prov" runat="server" OnClick="lkbtn_prov_Click">
                                                        <i class="fas fa-pencil-alt" id="i_prov" runat="server"></i>
                                                        <asp:Label CssClass="buttonClass" ID="lbl_prov" runat="server" Text=" Proveedores"></asp:Label>
                                                    </asp:LinkButton>
                                                </li>
                                                <li>
                                                    <asp:LinkButton CssClass="" ID="lkbtn_clte" runat="server" OnClick="lkbtn_clte_Click">
                                                        <i class="fas fa-pencil-alt" id="i_clte" runat="server"></i>
                                                        <asp:Label CssClass="buttonClass" ID="lbl_clte" runat="server" Text=" Clientes"></asp:Label>
                                                    </asp:LinkButton>
                                                </li>
                                                <li>
                                                    <asp:LinkButton CssClass="" ID="lkbtn_fisc" runat="server" OnClick="lkbtn_fisc_Click">
                                                        <i class="fas fa-pencil-alt" id="i_fisc" runat="server"></i>
                                                        <asp:Label CssClass="buttonClass" ID="lbl_fisc" runat="server" Text=" Fiscales"></asp:Label>
                                                    </asp:LinkButton>
                                                </li>
                                                <li>
                                                    <asp:LinkButton CssClass="" ID="lkbtn_usrs" runat="server" OnClick="lkbtn_usrs_Click">
                                                        <i class="fas fa-pencil-alt" id="i_usrs" runat="server"></i>
                                                        <asp:Label CssClass="buttonClass" ID="lbl_usrs" runat="server" Text=" Usuarios"></asp:Label>
                                                    </asp:LinkButton>
                                                </li>
                                                <br />
                                                <li>
                                                    <asp:LinkButton CssClass="" ID="lkb_salir" runat="server">
                                                        <i class="fas fa-power-off" id="i_salir" runat="server"></i>
                                                        <asp:Label CssClass="buttonClass" ID="lbl_salir" runat="server" Text=" Salir"></asp:Label>
                                                    </asp:LinkButton>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!--/.nav-collapse -->
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdatePanel ID="up_inv_prod" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="col-lg-9">
                            <div class="col-lg-12 ">
                                <div class="row">
                                    <div class="panel panel-default" id="pnl_inv_prod" runat="server" visible="false">
                                        <div class="panel-heading">
                                            <p class="text-left">
                                                <div class="input-group" id="div_busc_inv_prod" runat="server" visible="false">
                                                    <span class="input-group-addon">
                                                        <asp:Label CssClass="control-label " ID="lbl_buscar_inv_prod" runat="server" Text="*BUSCAR PRODUCTO:"></asp:Label>
                                                    </span>
                                                    <asp:TextBox CssClass="form-control " ID="txt_buscar_inv_prod" runat="server" placeholder="letras/numeros" TextMode="Search" TabIndex="1"></asp:TextBox>
                                                    <span class="input-group-btn">
                                                        <asp:Button CssClass="btn btn01" ID="btn_buscar_inv_prod" runat="server" Text="ACEPTAR" OnClick="btn_buscar_inv_prod_Click" TabIndex="2" />
                                                    </span>
                                                </div>
                                                <div class="text-right">
                                                    <ajaxToolkit:AutoCompleteExtender ID="ace_buscar_inv_prod" runat="server" ServiceMethod="SearchCustomers" MinimumPrefixLength="2" CompletionInterval="100" EnableCaching="true" CompletionSetCount="10" TargetControlID="txt_buscar_inv_prod" FirstRowSelected="false"></ajaxToolkit:AutoCompleteExtender>
                                                    <asp:RequiredFieldValidator ID="rfv_buscar_inv_prod" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_buscar_inv_prod" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                </div>
                                                <p>
                                                </p>
                                                <p class="text-right">
                                                    REGISTRO DE PRODUCTOS <span>
                                                        <asp:LinkButton ID="btn_agr_inv_prod" runat="server" CssClass="btn btn02" OnClick="btn_agr_inv_prod_Click" TabIndex="3" ToolTip="AGREGAR RUBRO">
                                                            <i class="fas fa-plus" id="i_agr_inv_prod" runat="server"></i>
                                                        </asp:LinkButton>
                                                        <asp:LinkButton ID="btn_edit_inv_prod" runat="server" CssClass="btn btn02" OnClick="btn_edit_inv_prod_Click" TabIndex="4" ToolTip="EDITAR RUBRO">
                                                            <i class="far fa-edit" id="i_edit_inv_prod" runat="server"></i>
                                                        </asp:LinkButton>
                                                    </span>
                                                    <br />
                                                    <asp:CheckBox ID="chkb_des_inv_prod" runat="server" AutoPostBack="true" OnCheckedChanged="chkb_des_inv_prod_CheckedChanged" Text="Desactivar validaciones" />
                                                </p>
                                                <p>
                                                </p>
                                            </p>
                                        </div>
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <asp:GridView CssClass="table" ID="gv_inv_prod" runat="server" AutoGenerateColumns="False" AllowPaging="true" PageSize="10" OnPageIndexChanging="gv_inv_prod_PageIndexChanging" OnRowDataBound="gv_inv_prod_RowDataBound" TabIndex="5" >
                                                        <Columns>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="chk_inv_prod" runat="server" onclick="CheckOne(this)" AutoPostBack="true" OnCheckedChanged="chk_inv_prod_CheckedChanged" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="cod_inv_prod" HeaderText="ID" SortExpression="cod_inv_prod" Visible="true" />
                                                            <asp:BoundField DataField="desc_inv_prod" HeaderText="Descripción Producto" SortExpression="desc_inv_prod" />
                                                      
                                                            <asp:BoundField DataField="fech_reg" HeaderText="Registro" SortExpression="fech_reg" DataFormatString="{0:dd-MM-yyyy}" HtmlEncode="false" />
                                                            <asp:TemplateField HeaderText="Estatus">
                                                                <ItemTemplate>
                                                                    <asp:DropDownList ID="ddl_inv_prod_est" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_inv_prod_est_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                        <EditRowStyle BackColor="#999999" />
                                                        <FooterStyle BackColor="#5D7B9D" ForeColor="DarkRed" />
                                                        <HeaderStyle BackColor="#104D8d" ForeColor="DarkRed" />
                                                        <PagerSettings Mode="NumericFirstLast" FirstPageText="Inicio" LastPageText="Final" />
                                                        <PagerStyle BackColor="#284775" ForeColor="DarkRed" HorizontalAlign="Center" />
                                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                                    </asp:GridView>
                                                    <br />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-3">
                                                    <div class="form-group">
                                                        <asp:Label CssClass="control-label " runat="server" Text="*Categoria"></asp:Label>

                                                        <asp:DropDownList CssClass="form-control " ID="ddl_cat_inv_prod" runat="server" TabIndex="6"></asp:DropDownList>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_cat_inv_prod" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="ddl_cat_inv_prod" InitialValue="0" ForeColor="DarkRed " Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3">
                                                    <div class="form-group">
                                                        <asp:Label CssClass="control-label " runat="server" Text="*Marca"></asp:Label>

                                                        <asp:DropDownList CssClass="form-control " ID="ddl_marca_inv_prod" runat="server" TabIndex="7"></asp:DropDownList>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_marca_inv_prod" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="ddl_marca_inv_prod" InitialValue="0" ForeColor="DarkRed " Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3">
                                                    <div class="form-group">
                                                        <asp:Label CssClass="control-label " runat="server" Text="*Linea"></asp:Label>

                                                        <asp:DropDownList CssClass="form-control " ID="ddl_linea_inv_prod" runat="server" TabIndex="8"></asp:DropDownList>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_linea_inv_prod" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="ddl_linea_inv_prod" InitialValue="0" ForeColor="DarkRed " Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3">
                                                    <div class="form-group text-left">
                                                        <asp:Label CssClass="control-label " runat="server" Text="*Codigo producto"></asp:Label>

                                                        <div class="input-group">
                                                            <asp:TextBox CssClass="form-control " ID="cod_prod_inv_prod" runat="server" AutoPostBack="true" placeholder="[a-z/0-9]"  TabIndex="9"></asp:TextBox>
                                                            <div class="text-right">
                                                                <asp:RequiredFieldValidator ID="rfv_cod_prod_inv_prod" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="cod_prod_inv_prod" ForeColor="DarkRed" Enabled="false" placeholder="[0-9]"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-4">
                                                    <div class="form-group">
                                                        <asp:Label CssClass="control-label " runat="server" Text="*Descripción producto"></asp:Label>

                                                        <asp:TextBox CssClass="form-control " ID="desc_inv_prod" runat="server" TextMode="MultiLine" placeholder="letras/números" TabIndex="10"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_desc_inv_prod" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="desc_inv_prod" ForeColor="DarkRed" Enabled="false" ></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="col-lg-2">
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label " runat="server" Text="*Cantidad"></asp:Label>

                                                        <asp:TextBox CssClass="form-control  " ID="cant_inv_prod" runat="server" TextMode="Number" placeholder="[0-9]" TabIndex="11"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_cant_inv_prod" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="cant_inv_prod" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="col-lg-2">
                                                    <div class="form-group text-left">
                                                        <asp:Label CssClass="control-label " runat="server" Text="*Monto"></asp:Label>

                                                        <div class="input-group">
                                                            <asp:TextBox CssClass="form-control " ID="mont_inv_prod" runat="server" AutoPostBack="true" OnTextChanged="mont_inv_prod_TextChanged" placeholder="[0-9]" TabIndex="12" ></asp:TextBox>
                                                            <div class="text-right">
                                                                <asp:RequiredFieldValidator ID="rfv_mont_inv_prod" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="mont_inv_prod" ForeColor="DarkRed " Enabled="false"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-2">
                                                    <div class="form-group text-left">
                                                        <asp:Label CssClass="control-label " runat="server" Text="*Margen"></asp:Label>

                                                        <div class="input-group">
                                                            <asp:TextBox CssClass="form-control " ID="margen_extra" runat="server" AutoPostBack="true"  placeholder="[0-9]" TabIndex="13" TextMode="Number"></asp:TextBox>
                                                            <div class="text-right">
                                                                <asp:RequiredFieldValidator ID="rfv_margen_inv_prod" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="margen_extra" ForeColor="DarkRed" Enabled="false" placeholder="[0-9]"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-2">
                                                    <div class="form-group text-left">
                                                        <asp:Label CssClass="control-label " runat="server" Text="*Cantidad minima"></asp:Label>

                                                        <asp:TextBox CssClass="form-control " ID="minimo_inv_prod" runat="server" TextMode="Number" placeholder="[0-9]" TabIndex="14"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_minimo_inv_prod" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="minimo_inv_prod" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>

                                                    </div>
                                                    <div class="text-right">

                                                    <br />
                                                    <asp:Button CssClass="btn btn02" ID="btn_guardar_inv_prod" runat="server" Text="GUARDAR" OnClick="btn_guardar_inv_prod_Click" TabIndex="15" />
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
                <asp:UpdatePanel ID="up_prov" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="col-lg-9">
                            <div class="col-lg-12 ">
                                <div class="row">
                                    <div class="panel panel-default" id="pnl_prov" runat="server" visible="false">
                                        <div class="panel-heading">
                                            <p class="text-left">
                                                <div class="input-group" id="div_busc_prov" runat="server" visible="false">
                                                    <span class="input-group-addon">
                                                        <asp:Label CssClass="control-label " ID="lbl_buscar_prov" runat="server" Text="*BUSCAR PROVEEDOR:"></asp:Label>
                                                    </span>
                                                    <asp:TextBox CssClass="form-control " ID="txt_buscar_prov" runat="server" placeholder="letras/números" TextMode="Search" TabIndex="1"></asp:TextBox>
                                                    <span class="input-group-btn">
                                                        <asp:Button CssClass="btn btn01" ID="btn_buscar_prov" runat="server" Text="ACEPTAR" OnClick="btn_buscar_prov_Click" TabIndex="2" />
                                                    </span>
                                                </div>
                                                <div class="text-right">
                                                    <ajaxToolkit:AutoCompleteExtender ID="ace_buscar_prov" runat="server" ServiceMethod="SearchCustomers" MinimumPrefixLength="2" CompletionInterval="100" EnableCaching="true" CompletionSetCount="10" TargetControlID="txt_buscar_prov" FirstRowSelected="false"></ajaxToolkit:AutoCompleteExtender>
                                                    <asp:RequiredFieldValidator ID="rfv_buscar_prov" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_buscar_prov" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                </div>
                                            </p>
                                            <p class="text-right">
                                                REGISTRO DE PROVEEDORES

        <span>
            <asp:LinkButton CssClass="btn btn02" ID="btn_agregar_prov" runat="server" ToolTip="AGREGAR CLIENTE" OnClick="btn_agregar_prov_Click" TabIndex="3">
                <i class="fas fa-plus" id="i_agregar_prov" runat="server"></i>
            </asp:LinkButton>
            <asp:LinkButton CssClass="btn btn02" ID="btn_editar_prov" runat="server" ToolTip="EDITAR CLIENTE" OnClick="btn_editar_prov_Click" TabIndex="4">
                <i class="far fa-edit" id="i_editar_prov" runat="server"></i>
            </asp:LinkButton>
        </span>
                                                <br />
                                                <asp:CheckBox ID="chkb_desactivar_prov" runat="server" AutoPostBack="true" Text="Desactivar validaciones" OnCheckedChanged="chkb_desactivar_prov_CheckedChanged" TabIndex="5" />
                                            </p>
                                        </div>
                                        <div class="panel-body">
                                            <div class="row">

                                                <div class="col-lg-12">
                                                    <asp:GridView CssClass="table" ID="gv_prov" runat="server" AutoGenerateColumns="False" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" TabIndex="6" PageSize="5" OnPageIndexChanging="gv_prov_PageIndexChanging" OnRowDataBound="gv_prov_RowDataBound">
                                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                        <Columns>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="chk_prov" runat="server" onclick="CheckOne(this)" AutoPostBack="true" OnCheckedChanged="chk_prov_CheckedChanged" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="cod_prov" HeaderText="ID" SortExpression="cod_prov" Visible="true" />

                                                            <asp:BoundField DataField="rs" HeaderText="RAZÓN SOCIAL" SortExpression="rs" />
                                                            <asp:BoundField DataField="fech_reg" HeaderText="REGISTRO" SortExpression="fech_reg" DataFormatString="{0:dd-MM-yyyy}" HtmlEncode="false" />
                                                            <asp:TemplateField HeaderText="ESTATUS">
                                                                <ItemTemplate>
                                                                    <asp:DropDownList ID="ddl_prov_estatus" runat="server" OnSelectedIndexChanged="ddl_prov_estatus_SelectedIndexChanged" AutoPostBack="true">
                                                                    </asp:DropDownList>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                        <EditRowStyle BackColor="#999999" />
                                                        <FooterStyle BackColor="#5D7B9D" ForeColor="DarkRed" />
                                                        <HeaderStyle BackColor="#104D8d" ForeColor="DarkRed" />
                                                        <PagerSettings Mode="NumericFirstLast" FirstPageText="Inicio" LastPageText="Final" />
                                                        <PagerStyle BackColor="#284775" ForeColor="DarkRed" HorizontalAlign="Center" />
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

                                                        <asp:Label CssClass="control-label " ID="lbl_trfc_prov" runat="server" Text="*Tipo RFC"></asp:Label>

                                                        <asp:DropDownList CssClass="form-control " ID="ddl_trfc_prov" runat="server" TabIndex="7"></asp:DropDownList>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_trfc_prov" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="ddl_trfc_prov" InitialValue="0" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>

                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label " ID="lbl_rfc_prov" runat="server" Text="*RFC"></asp:Label>

                                                        <asp:TextBox CssClass="form-control " ID="txt_rfc_prov" runat="server" placeholder="letras/números" ToolTip="letras/números" TabIndex="8"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server"
                                                                ErrorMessage="Formato Invalido" ControlToValidate="txt_rfc_prov"
                                                                ValidationExpression="[A-ZÑ&]{3,4}\d{6}[A-V1-9][A-Z1-9][0-9A]" ForeColor="DarkRed">
                                                            </asp:RegularExpressionValidator>
                                                            <asp:RequiredFieldValidator ID="rfv_rfc_prov" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_rfc_prov" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label " ID="lbl_rs_prov" runat="server" Text="*Razón Social"></asp:Label>

                                                        <asp:TextBox CssClass="form-control " ID="txt_rs_prov" runat="server" placeholder="letras/números" ToolTip="letras/números" TabIndex="9"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_rs_prov" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_rs_prov" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label " ID="lbl_telefono_prov" runat="server" Text="Teléfono"></asp:Label>

                                                        <asp:TextBox CssClass="form-control " ID="txt_telefono_prov" runat="server" MaxLength="16" placeholder="000-000-00000000" TextMode="Phone" ToolTip="Un número de teléfono válido consiste en un código de lada de 3 dígitos, un guión (-),un código de área de 3 dígitos, un guión (-) y el número telefónico con valores del 0 al 9" TabIndex="10"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server"
                                                                ErrorMessage="Formato Invalido" ControlToValidate="txt_telefono_prov"
                                                                ValidationExpression="[0-9]{3}[-][0-9]{3}[-][0-9]{8}" ForeColor="DarkRed">
                                                            </asp:RegularExpressionValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label " ID="lbl_email_prov" runat="server" Text="e-mail"></asp:Label>

                                                        <asp:TextBox CssClass="form-control " ID="txt_email_prov" runat="server" placeholder="xxxx@xxxx.xxx" TextMode="Email" ToolTip="xxxx@xxxx.xxx" TabIndex="11"></asp:TextBox>
                                                        <br />
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label " ID="lbl_callenum_prov" runat="server" Text="*Calle ý número"></asp:Label>

                                                        <asp:TextBox CssClass="form-control " ID="txt_callenum_prov" runat="server" placeholder="letras/números" ToolTip="letras/números" TextMode="MultiLine" TabIndex="12"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_callenum_prov" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_callenum_prov" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label " ID="lbl_cp_prov" runat="server" Text="*Código Postal"></asp:Label>

                                                        <div class="input-group">
                                                            <asp:TextBox CssClass="form-control " ID="txt_cp_prov" runat="server" placeholder="5 números (0-9)" MaxLength="5" ToolTip="Un código postal valido consiste en 5 numeros con valores del 0-9" TabIndex="13"></asp:TextBox>
                                                            <ajaxToolkit:MaskedEditExtender ID="mee_cp_prov" runat="server" TargetControlID="txt_cp_prov" Mask="99999" />
                                                            <span class="input-group-btn">
                                                                <asp:Button CssClass="btn btn02" ID="btn_cp_prov" runat="server" Text="VALIDAR" OnClick="btn_cp_prov_Click" TabIndex="14" />
                                                            </span>
                                                        </div>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_cp_prov" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_cp_prov" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label " ID="lbl_colonia_prov" runat="server" Text="*Colonia"></asp:Label>

                                                        <asp:DropDownList CssClass="form-control " ID="ddl_colonia_prov" runat="server" TabIndex="15"></asp:DropDownList>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_colonia_prov" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="ddl_colonia_prov" InitialValue="0" ForeColor="DarkRed" Enabled="false" TabIndex="14"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label " ID="lbl_municipio_prov" runat="server" Text="Municipio"></asp:Label>

                                                        <asp:TextBox CssClass="form-control " ID="txt_municipio_prov" runat="server" placeholder="letras/números" Enabled="false" TabIndex="16"></asp:TextBox>
                                                        <br />
                                                    </div>
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label " ID="lbl_estado_prov" runat="server" Text="Estado"></asp:Label>

                                                        <asp:TextBox CssClass="form-control " ID="txt_estado_prov" runat="server" placeholder="letras/números" Enabled="false" TabIndex="17"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-lg-10">

                                                    <asp:Label CssClass="control-label " ID="lbl_prov_coment" runat="server" Text="Comentarios"></asp:Label>

                                                    <asp:TextBox CssClass="form-control " ID="txt_prov_coment" runat="server" placeholder="letras/números" TextMode="MultiLine" Enabled="false" TabIndex="18"></asp:TextBox>
                                                    <div class="text-right">
                                                        <asp:RequiredFieldValidator ID="rfv_prov_coment" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_prov_coment" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="col-lg-2">
                                                    <br />
                                                    <br />
                                                    <div class="text-right">
                                                        <asp:Button CssClass="btn btn02" ID="btn_guardar_prov" runat="server" Text="GUARDAR" OnClick="btn_guardar_prov_Click" TabIndex="19" />
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
                        <asp:AsyncPostBackTrigger ControlID="btn_cp_prov" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
                <asp:UpdatePanel ID="up_clte" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="col-lg-9">
                            <div class="col-lg-12 ">
                                <div class="row">
                                    <div class="panel panel-default" id="pnl_clte" runat="server" visible="false">
                                        <div class="panel-heading">
                                            <p class="text-left">
                                                <div class="input-group" id="div_busc_clte" runat="server" visible="false">
                                                    <span class="input-group-addon">
                                                        <asp:Label CssClass="control-label " ID="lbl_buscar_clte" runat="server" Text="*BUSCAR CLIENTE:"></asp:Label>
                                                    </span>
                                                    <asp:TextBox CssClass="form-control " ID="txt_buscar_clte" runat="server" placeholder="letras/números" TextMode="Search" TabIndex="1"></asp:TextBox>
                                                    <span class="input-group-btn">
                                                        <asp:Button CssClass="btn btn01" ID="btn_buscar_clte" runat="server" Text="ACEPTAR" OnClick="btn_buscar_clte_Click" TabIndex="2" />
                                                    </span>
                                                </div>
                                                <div class="text-right">
                                                    <ajaxToolkit:AutoCompleteExtender ID="ace_buscar_clte" runat="server" ServiceMethod="SearchCustomers" MinimumPrefixLength="2" CompletionInterval="100" EnableCaching="true" CompletionSetCount="10" TargetControlID="txt_buscar_clte" FirstRowSelected="false"></ajaxToolkit:AutoCompleteExtender>
                                                    <asp:RequiredFieldValidator ID="rfv_buscar_clte" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_buscar_clte" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                </div>
                                            </p>
                                            <p class="text-right">
                                                REGISTRO DE CLIENTES

                        <span>
                            <asp:LinkButton CssClass="btn btn02" ID="btn_agregar_clte" runat="server" ToolTip="AGREGAR CLIENTE" OnClick="btn_agregar_clte_Click" TabIndex="3">
                                <i class="fas fa-plus" id="i_agregar_clte" runat="server"></i>
                            </asp:LinkButton>
                            <asp:LinkButton CssClass="btn btn02" ID="btn_editar_clte" runat="server" ToolTip="EDITAR CLIENTE" OnClick="btn_editar_clte_Click" TabIndex="4">
                                <i class="far fa-edit" id="i_editar_clte" runat="server"></i>
                            </asp:LinkButton>
                        </span>
                                                <br />
                                                <asp:CheckBox ID="chkb_desactivar_clte" runat="server" AutoPostBack="true" Text="Desactivar validaciones" OnCheckedChanged="chkb_desactivar_clte_CheckedChanged" TabIndex="5" />
                                            </p>
                                        </div>
                                        <div class="panel-body">
                                            <div class="row">

                                                <div class="col-lg-12">
                                                    <asp:GridView CssClass="table" ID="gv_clte" runat="server" AutoGenerateColumns="False" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" TabIndex="6" PageSize="5" OnPageIndexChanging="gv_clte_PageIndexChanging" OnRowDataBound="gv_clte_RowDataBound">
                                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                        <Columns>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="chk_clte" runat="server" onclick="CheckOne(this)" AutoPostBack="true" OnCheckedChanged="chk_clte_CheckedChanged" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="cod_clte" HeaderText="ID" SortExpression="cod_clte" Visible="true" />

                                                            <asp:BoundField DataField="rs" HeaderText="RAZÓN SOCIAL" SortExpression="rs" />
                                                            <asp:BoundField DataField="fech_reg" HeaderText="REGISTRO" SortExpression="fech_reg" DataFormatString="{0:dd-MM-yyyy}" HtmlEncode="false" />
                                                            <asp:TemplateField HeaderText="ESTATUS">
                                                                <ItemTemplate>
                                                                    <asp:DropDownList ID="ddl_clte_estatus" runat="server" OnSelectedIndexChanged="ddl_clte_estatus_SelectedIndexChanged" AutoPostBack="true">
                                                                    </asp:DropDownList>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                        <EditRowStyle BackColor="#999999" />
                                                        <FooterStyle BackColor="#5D7B9D" ForeColor="DarkRed" />
                                                        <HeaderStyle BackColor="#104D8d" ForeColor="DarkRed" />
                                                        <PagerSettings Mode="NumericFirstLast" FirstPageText="Inicio" LastPageText="Final" />
                                                        <PagerStyle BackColor="#284775" ForeColor="DarkRed" HorizontalAlign="Center" />
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

                                                        <asp:Label CssClass="control-label " ID="lbl_trfc_clte" runat="server" Text="*Tipo RFC"></asp:Label>

                                                        <asp:DropDownList CssClass="form-control " ID="ddl_trfc_clte" runat="server" TabIndex="7"></asp:DropDownList>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_trfc_clte" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="ddl_trfc_clte" InitialValue="0" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>

                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label " ID="lbl_rfc_clte_fisc" runat="server" Text="*RFC"></asp:Label>

                                                        <asp:TextBox CssClass="form-control " ID="txt_rfc_clte_fisc" runat="server" placeholder="letras/números" ToolTip="letras/números" TabIndex="8"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                                                ErrorMessage="Formato Invalido" ControlToValidate="txt_rfc_clte_fisc"
                                                                ValidationExpression="[A-ZÑ&]{3,4}\d{6}[A-V1-9][A-Z1-9][0-9A]" ForeColor="DarkRed">
                                                            </asp:RegularExpressionValidator>
                                                            <asp:RequiredFieldValidator ID="rfv_rfc_clte_fisc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_rfc_clte_fisc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label " ID="lbl_rs_clte" runat="server" Text="*Razón Social"></asp:Label>

                                                        <asp:TextBox CssClass="form-control " ID="txt_rs_clte" runat="server" placeholder="letras/números" ToolTip="letras/números" TabIndex="9"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_rs_clte" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_rs_clte" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label " ID="lbl_telefono_clte" runat="server" Text="Teléfono"></asp:Label>

                                                        <asp:TextBox CssClass="form-control " ID="txt_telefono_clte" runat="server" MaxLength="16" placeholder="000-000-00000000" TextMode="Phone" ToolTip="Un número de teléfono válido consiste en un código de lada de 3 dígitos, un guión (-),un código de área de 3 dígitos, un guión (-) y el número telefónico con valores del 0 al 9" TabIndex="10"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                                                ErrorMessage="Formato Invalido" ControlToValidate="txt_telefono_clte"
                                                                ValidationExpression="[0-9]{3}[-][0-9]{3}[-][0-9]{8}" ForeColor="DarkRed">
                                                            </asp:RegularExpressionValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label " ID="lbl_email_clte" runat="server" Text="e-mail"></asp:Label>

                                                        <asp:TextBox CssClass="form-control " ID="txt_email_clte" runat="server" placeholder="xxxx@xxxx.xxx" TextMode="Email" ToolTip="xxxx@xxxx.xxx" TabIndex="11"></asp:TextBox>
                                                        <br />
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label " ID="lbl_callenum_clte" runat="server" Text="*Calle ý número"></asp:Label>

                                                        <asp:TextBox CssClass="form-control " ID="txt_callenum_clte" runat="server" placeholder="letras/números" ToolTip="letras/números" TextMode="MultiLine" TabIndex="12"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_callenum_clte" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_callenum_clte" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label " ID="lbl_cp_clte" runat="server" Text="*Código Postal"></asp:Label>

                                                        <div class="input-group">
                                                            <asp:TextBox CssClass="form-control " ID="txt_cp_clte" runat="server" placeholder="5 números (0-9)" MaxLength="5" ToolTip="Un código postal valido consiste en 5 numeros con valores del 0-9" TabIndex="13"></asp:TextBox>
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

                                                        <asp:Label CssClass="control-label " ID="lbl_colonia_clte" runat="server" Text="*Colonia"></asp:Label>

                                                        <asp:DropDownList CssClass="form-control " ID="ddl_colonia_clte" runat="server" TabIndex="15"></asp:DropDownList>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_colonia_clte" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="ddl_colonia_clte" InitialValue="0" ForeColor="DarkRed" Enabled="false" TabIndex="14"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label " ID="lbl_municipio_clte" runat="server" Text="Municipio"></asp:Label>

                                                        <asp:TextBox CssClass="form-control " ID="txt_municipio_clte" runat="server" placeholder="letras/números" Enabled="false" TabIndex="16"></asp:TextBox>
                                                        <br />
                                                    </div>
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label " ID="lbl_estado_clte" runat="server" Text="Estado"></asp:Label>

                                                        <asp:TextBox CssClass="form-control " ID="txt_estado_clte" runat="server" placeholder="letras/números" Enabled="false" TabIndex="17"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-lg-10">

                                                    <asp:Label CssClass="control-label " ID="lbl_clte_coment" runat="server" Text="Comentarios"></asp:Label>

                                                    <asp:TextBox CssClass="form-control " ID="txt_clte_coment" runat="server" placeholder="letras/números" TextMode="MultiLine" Enabled="false" TabIndex="18"></asp:TextBox>
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
                <asp:UpdatePanel ID="up_fisc" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="col-lg-9">
                            <div class="col-lg-12 ">
                                <div class="row">
                                    <div class="panel panel-default" id="pnl_fisc" runat="server" visible="false">
                                        <div class="panel-heading">
                                            <p class="text-left">
                                                <div class="input-group" id="div_busc_fisc" runat="server" visible="false">
                                                    <span class="input-group-addon">
                                                        <asp:Label CssClass="control-label " ID="lbl_buscar_fisc" runat="server" Text="*BUSCAR FISCAL:"></asp:Label>
                                                    </span>
                                                    <asp:TextBox CssClass="form-control " ID="txt_buscar_fisc" runat="server" placeholder="letras/números" TextMode="Search" TabIndex="1"></asp:TextBox>
                                                    <span class="input-group-btn">
                                                        <asp:Button CssClass="btn btn01" ID="btn_buscar_fisc" runat="server" Text="ACEPTAR" OnClick="btn_buscar_fisc_Click" TabIndex="2" />
                                                    </span>
                                                </div>
                                                <div class="text-right">
                                                    <ajaxToolkit:AutoCompleteExtender ID="ace_buscar_fisc" runat="server" ServiceMethod="SearchCustomers" MinimumPrefixLength="2" CompletionInterval="100" EnableCaching="true" CompletionSetCount="10" TargetControlID="txt_buscar_fisc" FirstRowSelected="false"></ajaxToolkit:AutoCompleteExtender>
                                                    <asp:RequiredFieldValidator ID="rfv_buscar_fisc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_buscar_fisc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                </div>
                                            </p>
                                            <p class="text-right">
                                                REGISTRO DE DATOS FISCALES

        <span>
            <asp:LinkButton CssClass="btn btn02" ID="btn_agregar_fisc" runat="server" ToolTip="AGREGAR CLIENTE" OnClick="btn_agregar_fisc_Click" TabIndex="3">
                <i class="fas fa-plus" id="i_agregar_fisc" runat="server"></i>
            </asp:LinkButton>
            <asp:LinkButton CssClass="btn btn02" ID="btn_editar_fisc" runat="server" ToolTip="EDITAR CLIENTE" OnClick="btn_editar_fisc_Click" TabIndex="4">
                <i class="far fa-edit" id="i_editar_fisc" runat="server"></i>
            </asp:LinkButton>
        </span>
                                                <br />
                                                <asp:CheckBox ID="chkb_desactivar_fisc" runat="server" AutoPostBack="true" Text="Desactivar validaciones" OnCheckedChanged="chkb_desactivar_fisc_CheckedChanged" TabIndex="5" />
                                            </p>
                                        </div>
                                        <div class="panel-body">
                                            <div class="row">

                                                <div class="col-lg-12">
                                                    <asp:GridView CssClass="table" ID="gv_fisc" runat="server" AutoGenerateColumns="False" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" TabIndex="6" PageSize="5" OnPageIndexChanging="gv_fisc_PageIndexChanging" OnRowDataBound="gv_fisc_RowDataBound">
                                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                        <Columns>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="chk_fisc" runat="server" onclick="CheckOne(this)" AutoPostBack="true" OnCheckedChanged="chk_fisc_CheckedChanged" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="cod_fisc" HeaderText="ID" SortExpression="cod_fisc" Visible="true" />

                                                            <asp:BoundField DataField="rs" HeaderText="RAZÓN SOCIAL" SortExpression="rs" />
                                                            <asp:BoundField DataField="fech_reg" HeaderText="REGISTRO" SortExpression="fech_reg" DataFormatString="{0:dd-MM-yyyy}" HtmlEncode="false" />
                                                            <asp:TemplateField HeaderText="ESTATUS">
                                                                <ItemTemplate>
                                                                    <asp:DropDownList ID="ddl_fisc_estatus" runat="server" OnSelectedIndexChanged="ddl_fisc_estatus_SelectedIndexChanged" AutoPostBack="true">
                                                                    </asp:DropDownList>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                        <EditRowStyle BackColor="#999999" />
                                                        <FooterStyle BackColor="#5D7B9D" ForeColor="DarkRed" />
                                                        <HeaderStyle BackColor="#104D8d" ForeColor="DarkRed" />
                                                        <PagerSettings Mode="NumericFirstLast" FirstPageText="Inicio" LastPageText="Final" />
                                                        <PagerStyle BackColor="#284775" ForeColor="DarkRed" HorizontalAlign="Center" />
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

                                                        <asp:Label CssClass="control-label " ID="lbl_trfc_fisc" runat="server" Text="*Tipo RFC"></asp:Label>

                                                        <asp:DropDownList CssClass="form-control " ID="ddl_trfc_fisc" runat="server" TabIndex="7"></asp:DropDownList>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_trfc_fisc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="ddl_trfc_fisc" InitialValue="0" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>

                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label " ID="lbl_rfc_fisc" runat="server" Text="*RFC"></asp:Label>

                                                        <asp:TextBox CssClass="form-control " ID="txt_rfc_fisc" runat="server" placeholder="letras/números" ToolTip="letras/números" TabIndex="8"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                                                                ErrorMessage="Formato Invalido" ControlToValidate="txt_rfc_fisc"
                                                                ValidationExpression="[A-ZÑ&]{3,4}\d{6}[A-V1-9][A-Z1-9][0-9A]" ForeColor="DarkRed">
                                                            </asp:RegularExpressionValidator>
                                                            <asp:RequiredFieldValidator ID="rfv_rfc_fisc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_rfc_fisc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label " ID="lbl_rs_fisc" runat="server" Text="*Razón Social"></asp:Label>

                                                        <asp:TextBox CssClass="form-control " ID="txt_rs_fisc" runat="server" placeholder="letras/números" ToolTip="letras/números" TabIndex="9"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_rs_fisc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_rs_fisc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label " ID="lbl_telefono_fisc" runat="server" Text="Teléfono"></asp:Label>

                                                        <asp:TextBox CssClass="form-control " ID="txt_telefono_fisc" runat="server" MaxLength="16" placeholder="000-000-00000000" TextMode="Phone" ToolTip="Un número de teléfono válido consiste en un código de lada de 3 dígitos, un guión (-),un código de área de 3 dígitos, un guión (-) y el número telefónico con valores del 0 al 9" TabIndex="10"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
                                                                ErrorMessage="Formato Invalido" ControlToValidate="txt_telefono_fisc"
                                                                ValidationExpression="[0-9]{3}[-][0-9]{3}[-][0-9]{8}" ForeColor="DarkRed">
                                                            </asp:RegularExpressionValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label " ID="lbl_email_fisc" runat="server" Text="e-mail"></asp:Label>

                                                        <asp:TextBox CssClass="form-control " ID="txt_email_fisc" runat="server" placeholder="xxxx@xxxx.xxx" TextMode="Email" ToolTip="xxxx@xxxx.xxx" TabIndex="11"></asp:TextBox>
                                                        <br />
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label " ID="lbl_callenum_fisc" runat="server" Text="*Calle ý número"></asp:Label>

                                                        <asp:TextBox CssClass="form-control " ID="txt_callenum_fisc" runat="server" placeholder="letras/números" ToolTip="letras/números" TextMode="MultiLine" TabIndex="12"></asp:TextBox>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_callenum_fisc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_callenum_fisc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label " ID="lbl_cp_fisc" runat="server" Text="*Código Postal"></asp:Label>

                                                        <div class="input-group">
                                                            <asp:TextBox CssClass="form-control " ID="txt_cp_fisc" runat="server" placeholder="5 números (0-9)" MaxLength="5" ToolTip="Un código postal valido consiste en 5 numeros con valores del 0-9" TabIndex="13"></asp:TextBox>
                                                            <ajaxToolkit:MaskedEditExtender ID="mee_cp_fisc" runat="server" TargetControlID="txt_cp_fisc" Mask="99999" />
                                                            <span class="input-group-btn">
                                                                <asp:Button CssClass="btn btn02" ID="btn_cp_fisc" runat="server" Text="VALIDAR" OnClick="btn_cp_fisc_Click" TabIndex="14" />
                                                            </span>
                                                        </div>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_cp_fisc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_cp_fisc" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label " ID="lbl_colonia_fisc" runat="server" Text="*Colonia"></asp:Label>

                                                        <asp:DropDownList CssClass="form-control " ID="ddl_colonia_fisc" runat="server" TabIndex="15"></asp:DropDownList>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_colonia_fisc" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="ddl_colonia_fisc" InitialValue="0" ForeColor="DarkRed" Enabled="false" TabIndex="14"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label " ID="lbl_municipio_fisc" runat="server" Text="Municipio"></asp:Label>

                                                        <asp:TextBox CssClass="form-control " ID="txt_municipio_fisc" runat="server" placeholder="letras/números" Enabled="false" TabIndex="16"></asp:TextBox>
                                                        <br />
                                                    </div>
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label " ID="lbl_estado_fisc" runat="server" Text="Estado"></asp:Label>

                                                        <asp:TextBox CssClass="form-control " ID="txt_estado_fisc" runat="server" placeholder="letras/números" Enabled="false" TabIndex="17"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-lg-10">

                                                    <asp:Label CssClass="control-label " ID="lbl_fisc_coment" runat="server" Text="Comentarios"></asp:Label>

                                                    <asp:TextBox CssClass="form-control " ID="txt_fisc_coment" runat="server" placeholder="letras/números" TextMode="MultiLine" Enabled="false" TabIndex="18"></asp:TextBox>
                                                    <div class="text-right">
                                                        <asp:RequiredFieldValidator ID="rfv_fisc_coment" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_fisc_coment" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="col-lg-2">
                                                    <br />
                                                    <br />
                                                    <div class="text-right">
                                                        <asp:Button CssClass="btn btn02" ID="btn_guardar_fisc" runat="server" Text="GUARDAR" OnClick="btn_guardar_fisc_Click" TabIndex="19" />
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
                        <asp:AsyncPostBackTrigger ControlID="btn_cp_fisc" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
                <asp:UpdatePanel ID="up_usrs" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="col-lg-9">
                            <div class="col-lg-12">
                                <div class="panel panel-default" id="pnl_usrs" runat="server" visible="false">
                                    <div class="panel-heading">
                                        <p class="text-left">
                                            <div class="input-group" id="div_busc_usr" runat="server" visible="false">
                                                <span class="input-group-addon">
                                                    <asp:Label CssClass="control-label " ID="lbl_buscar_usrs" runat="server" Text="*BUSCAR USUARIO:"></asp:Label>
                                                </span>
                                                <asp:TextBox CssClass="form-control " ID="txt_buscar_usrs" runat="server" placeholder="letras/números" TextMode="Search" TabIndex="1"></asp:TextBox>
                                                <span class="input-group-btn">
                                                    <asp:Button CssClass="btn btn01" ID="btn_buscar_usrs" runat="server" Text="ACEPTAR" TabIndex="2" OnClick="btn_buscar_usrs_Click" />
                                                </span>
                                            </div>
                                            <div class="text-right">
                                                <ajaxToolkit:AutoCompleteExtender ID="ace_buscar_usrs" runat="server" ServiceMethod="SearchCustomers" MinimumPrefixLength="2" CompletionInterval="100" EnableCaching="true" CompletionSetCount="10" TargetControlID="txt_buscar_usrs" FirstRowSelected="false"></ajaxToolkit:AutoCompleteExtender>
                                                <asp:RequiredFieldValidator ID="rfv_buscar_usrs" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_buscar_usrs" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                            </div>
                                            <p>
                                            </p>
                                            <p class="text-right">
                                                REGISTRO DE USUARIOS <span>
                                                    <asp:LinkButton ID="btn_agregar_usrs" runat="server" CssClass="btn btn02" TabIndex="3" ToolTip="AGREGAR USUARIO" OnClick="btn_agregar_usrs_Click">
                                                        <i class="fas fa-plus" id="i_agregar_usrs" runat="server"></i>
                                                    </asp:LinkButton>
                                                    <asp:LinkButton ID="btn_editar_usrs" runat="server" CssClass="btn btn02" TabIndex="4" ToolTip="EDITAR USUARIO" OnClick="btn_editar_usrs_Click">
                                                        <i class="far fa-edit" id="i_editar_usrs" runat="server"></i>
                                                    </asp:LinkButton>
                                                </span>
                                                <br />
                                                <asp:CheckBox ID="chkb_desactivar_usrs" runat="server" AutoPostBack="true" Text="Desactivar validaciones" TabIndex="5" OnCheckedChanged="chkb_desactivar_usrs_CheckedChanged" />
                                            </p>
                                        </p>
                                    </div>
                                    <div class="panel-body">
                                        <div class="col-lg-12">
                                            <asp:GridView CssClass="table" ID="gv_usrs" runat="server" AutoGenerateColumns="False" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" TabIndex="6" OnRowDataBound="gv_usrs_RowDataBound">
                                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                <Columns>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="chk_usrs" runat="server" onclick="CheckOne(this)" AutoPostBack="true" OnCheckedChanged="chk_usrs_CheckedChanged" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="code_usr" HeaderText="ID" SortExpression="code_usr" Visible="true" />

                                                    <asp:BoundField DataField="nom_cmpleto" HeaderText="NOMBRE COMPLETO" SortExpression="nom_cmpleto" />

                                                    <asp:BoundField DataField="fech_reg" HeaderText="REGISTRO" SortExpression="fech_reg" DataFormatString="{0:dd-MM-yyyy}" HtmlEncode="false" />
                                                    <asp:TemplateField HeaderText="ESTATUS">
                                                        <ItemTemplate>
                                                            <asp:DropDownList ID="ddl_usrs_estatus" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_usrs_estatus_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <EditRowStyle BackColor="#999999" />
                                                <FooterStyle BackColor="#5D7B9D" ForeColor="DarkRed" />
                                                <HeaderStyle BackColor="#999999" ForeColor="DarkRed" />
                                                <PagerSettings Mode="NumericFirstLast" FirstPageText="Inicio" LastPageText="Final" />
                                                <PagerStyle BackColor="#284775" ForeColor="DarkRed" HorizontalAlign="Center" />
                                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                            </asp:GridView>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="form-group text-left">
                                                <asp:Label CssClass="control-label " ID="lbl_nombre_usr" runat="server" Text="*Nombre"></asp:Label>
                                                <asp:TextBox CssClass="form-control " ID="txt_nombre_usr" runat="server" placeholder="letras/números" ToolTip="letras/números" TabIndex="7"></asp:TextBox>
                                                <div class="text-right">
                                                    <asp:RequiredFieldValidator ID="rfv_nombre_usr" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_nombre_usr" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="form-group text-left">
                                                <asp:Label CssClass="control-label " ID="lbl_perfil_usr" runat="server" Text="*Perfil"></asp:Label>
                                                <asp:DropDownList CssClass="form-control " ID="ddl_perfil_usr" runat="server" TabIndex="10"></asp:DropDownList>
                                                <div class="text-right">
                                                    <asp:RequiredFieldValidator ID="rfv_perfil_usr" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="ddl_perfil_usr" InitialValue="0" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
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
                                                <asp:Label CssClass="control-label " ID="lbl_apaterno_usr" runat="server" Text="*Apellido Paterno"></asp:Label>
                                                <asp:TextBox CssClass="form-control " ID="txt_apaterno_usr" runat="server" placeholder="letras/números" ToolTip="letras/números" TabIndex="8"></asp:TextBox>
                                                <div class="text-right">
                                                    <asp:RequiredFieldValidator ID="rfv_apaterno_usr" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_apaterno_usr" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="form-group text-left">

                                                <asp:Label CssClass="control-label " ID="lbl_tel_usr" runat="server" Text="Teléfono"></asp:Label>

                                                <asp:TextBox CssClass="form-control " ID="txt_tel_usr" runat="server" MaxLength="16" placeholder="000-000-00000000" TextMode="Phone" ToolTip="Un número de teléfono válido consiste en un código de lada de 3 dígitos, un guión (-),un código de área de 3 dígitos, un guión (-) y el número telefónico con valores del 0 al 9" TabIndex="11"></asp:TextBox>
                                                <div class="text-right">
                                                    <asp:RegularExpressionValidator ID="revPhone" runat="server"
                                                        ErrorMessage="Formato Invalido" ControlToValidate="txt_tel_usr"
                                                        ValidationExpression="[0-9]{3}[-][0-9]{3}[-][0-9]{8}" ForeColor="DarkRed">
                                                    </asp:RegularExpressionValidator>
                                                </div>
                                            </div>
                                            <div class="form-group text-left">

                                                <asp:Label CssClass="control-label " ID="lbl_clave_usr" runat="server" Text="*Clave"></asp:Label>

                                                <asp:TextBox CssClass="form-control " ID="txt_clave_usr" runat="server" placeholder="letras/números" TextMode="Password" ToolTip="letras/números" TabIndex="14"></asp:TextBox>
                                                <div class="text-right">
                                                    <asp:RequiredFieldValidator ID="rfv_clave_usr" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_clave_usr" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="form-group text-left">
                                                <asp:Label CssClass="control-label " ID="lbl_amaterno_usr" runat="server" Text="*Apellido Materno"></asp:Label>
                                                <asp:TextBox CssClass="form-control " ID="txt_amaterno_usr" runat="server" placeholder="letras/números" ToolTip="letras/números" TabIndex="9"></asp:TextBox>
                                                <div class="text-right">
                                                    <asp:RequiredFieldValidator ID="rfv_amaterno_usr" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_amaterno_usr" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="form-group text-left">

                                                <asp:Label CssClass="control-label " ID="lbl_email_usr" runat="server" Text="Correo electrónico"></asp:Label>

                                                <asp:TextBox CssClass="form-control " ID="txt_email_usr" runat="server" placeholder="xxxx@xxxx.xxx" TextMode="Email" ToolTip="xxxx@xxxx.xxx" TabIndex="12"></asp:TextBox>
                                                <br />
                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="form-group text-left">

                                                <asp:Label CssClass="control-label " ID="lbl_callenum_usr" runat="server" Text="Calle ý número"></asp:Label>

                                                <asp:TextBox CssClass="form-control " ID="txt_callenum_usr" runat="server" placeholder="letras/numeros" ToolTip="letras/numeros" TextMode="MultiLine" TabIndex="15"></asp:TextBox>
                                                <div class="text-right">
                                                    <asp:RequiredFieldValidator ID="rfv_callenum_usr" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_callenum_usr" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label " ID="lbl_cp_usr" runat="server" Text="Código Postal"></asp:Label>

                                                        <div class="input-group">
                                                            <asp:TextBox CssClass="form-control " ID="txt_cp_usr" runat="server" placeholder="5[0-9]" MaxLength="5" ToolTip="Un código postal valido consiste en 5 numeros con valores del 0-9" TabIndex="16"></asp:TextBox>
                                                            <ajaxToolkit:MaskedEditExtender ID="mee_cp_usr" runat="server" TargetControlID="txt_cp_usr" Mask="99999" />
                                                            <span class="input-group-btn">
                                                                <asp:Button CssClass="btn btn02" ID="btn_cp_usr" runat="server" Text="VALIDAR" TabIndex="17" OnClick="btn_cp_usr_Click" />
                                                            </span>
                                                        </div>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_cp_usr" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_cp_usr" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label " ID="lbl_col_usr" runat="server" Text="Colonia"></asp:Label>

                                                        <asp:DropDownList CssClass="form-control " ID="ddl_col_usr" runat="server" TabIndex="18"></asp:DropDownList>
                                                        <div class="text-right">
                                                            <asp:RequiredFieldValidator ID="rfv_col_usr" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="ddl_col_usr" InitialValue="0" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label " ID="lbl_municipio_usr" runat="server" Text="Municipio"></asp:Label>

                                                        <asp:TextBox CssClass="form-control " ID="txt_municipio_usr" runat="server" placeholder="letras/numeros" Enabled="false"></asp:TextBox>
                                                        <br />
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="form-group text-left">

                                                        <asp:Label CssClass="control-label " ID="lbl_estado_usr" runat="server" Text="Estado"></asp:Label>

                                                        <asp:TextBox CssClass="form-control " ID="txt_estado_usr" runat="server" placeholder="letras/numeros" Enabled="false"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <asp:Label CssClass="control-label " ID="lbl_usr_coment" runat="server" Text="Comentarios"></asp:Label>
                                            <asp:TextBox CssClass="form-control " ID="txt_usr_coment" runat="server" placeholder="letras/números" TextMode="MultiLine" Enabled="false" TabIndex="21"></asp:TextBox>
                                            <div class="text-right">
                                                <asp:RequiredFieldValidator ID="rfv_usr_coment" runat="server" ErrorMessage="*Campo Obligatorio" ControlToValidate="txt_usr_coment" ForeColor="DarkRed" Enabled="false"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="text-right">
                                                <asp:Button CssClass="btn btn02" ID="btn_guardar_usrs" runat="server" Text="GUARDAR" TabIndex="22" OnClick="btn_guardar_usrs_Click" />
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
                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
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
                                <asp:Label CssClass="" ID="lblModalBody" runat="server" Text=""></asp:Label>
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
