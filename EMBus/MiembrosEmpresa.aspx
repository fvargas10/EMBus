<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="MiembrosEmpresa.aspx.cs" Inherits="EMBus.MiembrosEmpresa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="navbar" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="footer" runat="server">

    <script src="Scripts/rut.js"></script>
    <asp:ScriptManager ID="SM" runat="server"></asp:ScriptManager>

    <div class="row">
        <div class="col-md-10 col-md-offset-1 col-xs-10 col-xs-offset-1">
            <div class="col-lg-push-9">
                <h2 style="color: #fff">Miembros de la Empresa</h2>
                <br />
            </div>

            <%-- CREANDO VENTANA MODAL PARA FORMULARIO AGREGAR MIEMBROS --%>

            <!-- BOTON MODAL -->
            <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">Agregar Miembro</button>

            <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal2">Actualizar Miembro</button>

            <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal3">Dar de Baja / alta Miembro</button>

            <!-- MODAL -->
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div style="background-color: #96C1FF" class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 style="color: #fff" class="modal-title">Agregar Nuevo Miembro</h4>
                        </div>
                        <div class="modal-body">
                            <p style="color: #fff">Complete los campos de a continuación</p>

                            <%-- formulario --%>
                            <div class="row">
                                <div class="col-md-6 form-group">
                                    <label class="control-label">Ingresar Rut</label>
                                    <asp:TextBox runat="server" ID="txtrutconductor" class="form-control" placeholder="Ej: 12345678-9" MaxLength="10"></asp:TextBox>
                                    <asp:CustomValidator ID="validarut" runat="server"
                                        ClientValidationFunction="validar_rut" ControlToValidate="txtrutconductor"
                                        Display="Dynamic" ErrorMessage="*Ingrese un rut valido Ej: 10432967-4" SetFocusOnError="True" ForeColor="Red"></asp:CustomValidator>
                                    <br />
                                </div>

                                <div class="col-md-6 form-group">
                                    <label class="control-label">Seleccione la oficina a la que pertenece</label>
                                    <asp:DropDownList ID="ddidoficina" runat="server" AppendDataBoundItems="true" class="form-control">
                                        <asp:ListItem Value="0" Text="Avenida Padre Nelson Aguilar S/N"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="Dirección oficina 2"></asp:ListItem>
                                    </asp:DropDownList>
                                    <br />
                                </div>

                                <div class="col-md-6 form-group">
                                    <label class="control-label">Indique el Primer Nombre</label>
                                    <asp:TextBox runat="server" ID="txtprimernombre" class="form-control" Style="text-transform: capitalize" placeholder="Ej: Pedro" type="text"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="validaprimernombre" runat="server" ControlToValidate="txtprimernombre"
                                        ErrorMessage="*Debe ingresar solo letras" ValidationExpression="[a-zA-ZñÑáéíóúÁÉÍÓÚ ]*$" ForeColor="Red"></asp:RegularExpressionValidator>
                                    <br />
                                </div>

                                <div class="col-md-6 form-group">
                                    <label class="control-label">Indique el Segundo Nombre</label>
                                    <asp:TextBox runat="server" ID="txtsegundonombre" class="form-control" Style="text-transform: capitalize" placeholder="Ej: Lucas" type="text"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="validasegundonombre" runat="server" ControlToValidate="txtsegundonombre"
                                        ErrorMessage="*Debe ingresar solo letras" ValidationExpression="[a-zA-ZñÑáéíóúÁÉÍÓÚ ]*$" ForeColor="Red"></asp:RegularExpressionValidator>
                                    <br />
                                </div>

                                <div class="col-md-6 form-group">
                                    <label class="control-label">Indique el Primer Apellido</label>
                                    <asp:TextBox runat="server" ID="txtprimerapellido" class="form-control" Style="text-transform: capitalize" placeholder="Ej: Oyarzo" type="text"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="validaprimerapellido" runat="server" ControlToValidate="txtprimerapellido"
                                        ErrorMessage="*Debe ingresar solo letras" ValidationExpression="[a-zA-ZñÑáéíóúÁÉÍÓÚ ]*$" ForeColor="Red"></asp:RegularExpressionValidator>
                                    <br />
                                </div>

                                <div class="col-md-6 form-group">
                                    <label class="control-label">Indique el Segundo Apellido</label>
                                    <asp:TextBox runat="server" ID="txtsegundoapellido" class="form-control" Style="text-transform: capitalize" placeholder="Ej: Navarro" type="text"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="validasegundoapellido" runat="server" ControlToValidate="txtsegundoapellido"
                                        ErrorMessage="*Debe ingresar solo letras" ValidationExpression="[a-zA-ZñÑáéíóúÁÉÍÓÚ ]*$" ForeColor="Red"></asp:RegularExpressionValidator>
                                    <br />
                                </div>

                                <div class="col-md-6 form-group">
                                    <label class="control-label">Indique el teléfono de contacto</label>
                                    <asp:TextBox runat="server" ID="txttel" class="form-control" placeholder="Ej: 998765432" MaxLength="9"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="validatelefono" runat="server" ControlToValidate="txttel"
                                        ErrorMessage="*Debe ingresar un teléfono válido" ValidationExpression="^[0-9]{9}$" ForeColor="Red"></asp:RegularExpressionValidator>
                                    <br />
                                </div>

                                <div class="col-md-6 form-group">
                                    <label class="control-label">Cargo</label>
                                    <asp:DropDownList ID="ddidtipousuario" runat="server" AppendDataBoundItems="true" class="form-control">
                                        <asp:ListItem Value="2" Text="Conductor"></asp:ListItem>
                                        <asp:ListItem Value="3" Text="Auxiliar"></asp:ListItem>
                                    </asp:DropDownList>
                                    <br />
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                            <asp:Button class="btn btn-primary" type="button" ID="btnagregarmiembro" runat="server" Text="Guardar cambios" OnClick="btnagregarmiembro_Click" />
                        </div>
                    </div>
                </div>
            </div>
            <%-- FIN VENTANA MODAL --%>

            <!-- MODAL 2 ACTUALIZAR MIEMBROS -->

            <div class="modal fade" id="myModal2" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div style="background-color: #96C1FF" class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 style="color: #fff" class="modal-title">Actualizar Conductor</h4>
                        </div>
                        <div class="modal-body">
                            <p style="color: #fff">Complete los campos de a continuación</p>

                            <%-- formulario --%>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <div class="row">

                                        <div class="col-md-6 form-group">
                                            <label class="control-label">Seleccione un Trabajador</label>
                                            <asp:DropDownList ID="ddruttrabajador" class="form-control" runat="server" OnSelectedIndexChanged="ddruttrabajador_SelectedIndexChanged" DataSourceID="datosmiembrosactivos" DataTextField="NOMBRE_TRABAJADOR" DataValueField="RUT_TRABAJADOR" AutoPostBack="True"></asp:DropDownList>
                                            <asp:SqlDataSource ID="datosmiembrosactivos" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="select RUT_CON as RUT_TRABAJADOR, UPPER(PRIMER_NOMBRE+ ' ' + ' ' + SEGUNDO_NOMBRE + ' ' + PRIMER_APELLIDO+ ' ' + SEGUNDO_APELLIDO)   as NOMBRE_TRABAJADOR
  from CONDUCTOR WHERE RUT_CON &lt;&gt; '0'
 union all
select RUT_AUX, UPPER(PRIMER_NOMBRE+ ' ' + ' ' + SEGUNDO_NOMBRE + ' ' + PRIMER_APELLIDO+ ' ' + SEGUNDO_APELLIDO) 
  from AUXILIAR WHERE RUT_AUX &lt;&gt; '0' AND RUT_AUX &lt;&gt; '1'"></asp:SqlDataSource>
                                            <br />
                                        </div>

                                        <div class="col-md-6 form-group">
                                            <label class="control-label">Primer Nombre</label>
                                            <asp:TextBox ID="txtprimernombreupdate" class="form-control" runat="server"></asp:TextBox>
                                            <br />
                                        </div>

                                        <div class="col-md-6 form-group">
                                            <label class="control-label">Segundo Nombre</label>
                                            <asp:TextBox ID="txtsegundonombreupdate" class="form-control" runat="server"></asp:TextBox>
                                            <br />
                                        </div>

                                        <div class="col-md-6 form-group">
                                            <label class="control-label">Primer Apellido</label>
                                            <asp:TextBox ID="txtprimerapellidoupdate" class="form-control" runat="server"></asp:TextBox>
                                            <br />
                                        </div>

                                        <div class="col-md-6 form-group">
                                            <label class="control-label">Segundo Apellido</label>
                                            <asp:TextBox ID="txtsegundoapellidoupdate" class="form-control" runat="server"></asp:TextBox>
                                            <br />
                                        </div>

                                        <div class="col-md-6 form-group">
                                            <label class="control-label">Teléfono</label>
                                            <asp:TextBox ID="txttelefonoupdate" class="form-control" runat="server"></asp:TextBox>
                                            <br />
                                        </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="ddruttrabajador" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                        <asp:Button class="btn btn-primary" type="button" ID="btnactualizarmiembro" runat="server" Text="Guardar cambios" OnClick="btnactualizarmiembro_Click" />
                    </div>
                </div>
            </div>
        </div>
        <%-- FIN VENTANA MODAL --%>



        <!-- MODAL3 MIEMBROS -->
        <div class="modal fade" id="myModal3" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div style="background-color: #96C1FF" class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 style="color: #fff" class="modal-title">Dar de Baja / Alta Miembro</h4>
                    </div>
                    <div class="modal-body">
                        <p style="color: #fff">Complete los campos de a continuación</p>

                        <%-- formulario --%>
                        <div class="row">
                            <div class="col-md-6 form-group">
                                <label class="control-label">Seleccione un Mimebro</label>
                                <asp:DropDownList ID="ddbajamiembros" runat="server" class="form-control" DataSourceID="datosbajamiembros" DataTextField="NOMBRE_TRABAJADOR" DataValueField="RUT_TRABAJADOR"></asp:DropDownList>
                                <asp:SqlDataSource ID="datosbajamiembros" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="select RUT_CON as RUT_TRABAJADOR, UPPER(PRIMER_NOMBRE+ ' ' + ' ' + SEGUNDO_NOMBRE + ' ' + PRIMER_APELLIDO+ ' ' + SEGUNDO_APELLIDO)   as NOMBRE_TRABAJADOR
  from CONDUCTOR WHERE RUT_CON &lt;&gt; '0'
 union all
select RUT_AUX, UPPER(PRIMER_NOMBRE+ ' ' + ' ' + SEGUNDO_NOMBRE + ' ' + PRIMER_APELLIDO+ ' ' + SEGUNDO_APELLIDO) 
  from AUXILIAR WHERE RUT_AUX &lt;&gt; '0' AND RUT_AUX &lt;&gt; '1'"></asp:SqlDataSource>
                                <br />
                            </div>
                            <div class="col-md-6 form-group">
                                <label class="control-label">Seleccione una opción</label>
                                <asp:DropDownList ID="ddcambiarestadomimebro" runat="server" AppendDataBoundItems="true" class="form-control">
                                    <asp:ListItem Value="0" Text="Dar de Baja"></asp:ListItem>
                                    <asp:ListItem Value="1" Text="Dar de Alta"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                            <asp:Button class="btn btn-primary" type="button" ID="btncambiarestadomiembro" runat="server" Text="Guardar cambios" OnClick="btncambiarestadomiembro_Click" />
                        </div>
                    </div>
                </div>
            </div>
            <%-- FIN VENTANA MODAL --%>
        </div>

        <div class="col-md-10 col-md-offset-1 col-xs-10 col-xs-offset-1">
            <br />
            <h3 style="color: #fff">Auxiliares:</h3>
            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridMiembros" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="RUT" DataSourceID="datosMiembros" ForeColor="#333333" GridLines="None" HorizontalAlign="Center">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="RUT" HeaderText="RUT" ReadOnly="True" SortExpression="RUT" />
                    <asp:BoundField DataField="NOMBRE_COMPLETO" HeaderText="NOMBRE" ReadOnly="True" SortExpression="NOMBRE_COMPLETO" />
                    <asp:BoundField DataField="CARGO" HeaderText="CARGO" ReadOnly="True" SortExpression="CARGO" />
                    <asp:BoundField DataField="TELÉFONO" HeaderText="TELÉFONO" SortExpression="TELÉFONO" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:SqlDataSource ID="datosMiembros" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="SELECT RUT_AUX AS RUT, UPPER(PRIMER_NOMBRE + ' ' + PRIMER_APELLIDO + ' ' + SEGUNDO_APELLIDO) AS NOMBRE_COMPLETO,
UPPER(ROL_TIPO_USUARIO) AS CARGO, TEL_AUX AS TELÉFONO FROM AUXILIAR INNER JOIN TIPO_USUARIO ON AUXILIAR.ID_TIPO_USUARIO=TIPO_USUARIO.ID_TIPO_USUARIO
AND RUT_AUX &lt;&gt; '0' and RUT_AUX &lt;&gt;'1' AND ESTADO_AUX='TRUE'"></asp:SqlDataSource>
        </div>

        <div class="col-md-10 col-md-offset-1 col-xs-10 col-xs-offset-1">
            <h3 style="color: #fff">Conductores:</h3>
            <asp:GridView ID="gridMiembros2" CssClass="table table-striped table-bordered table-condensed" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="RUT" DataSourceID="datosMiembros2" ForeColor="#333333" GridLines="None" HorizontalAlign="Center">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="RUT" HeaderText="RUT" ReadOnly="True" SortExpression="RUT" />
                    <asp:BoundField DataField="NOMBRE_COMPLETO" HeaderText="NOMBRE" ReadOnly="True" SortExpression="NOMBRE_COMPLETO" />
                    <asp:BoundField DataField="CARGO" HeaderText="CARGO" ReadOnly="True" SortExpression="CARGO" />
                    <asp:BoundField DataField="TELÉFONO" HeaderText="TELÉFONO" SortExpression="TELÉFONO" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:SqlDataSource ID="datosMiembros2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="SELECT RUT_CON AS RUT, UPPER(PRIMER_NOMBRE + ' ' + PRIMER_APELLIDO + ' ' + SEGUNDO_APELLIDO) AS NOMBRE_COMPLETO,
UPPER(ROL_TIPO_USUARIO) AS CARGO, TEL_CON AS TELÉFONO FROM CONDUCTOR INNER JOIN TIPO_USUARIO ON CONDUCTOR.ID_TIPO_USUARIO=TIPO_USUARIO.ID_TIPO_USUARIO AND RUT_CON &lt;&gt;'0' AND ESTADO_CON='TRUE'
"></asp:SqlDataSource>
        </div>
    </div>
    </div>


  



</asp:Content>
