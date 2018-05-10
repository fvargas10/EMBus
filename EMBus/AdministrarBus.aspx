<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="AdministrarBus.aspx.cs" Inherits="EMBus.AdministrarBus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="navbar" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="footer" runat="server">

    <div class="row">
        <div class="col-md-10 col-md-offset-1 col-xs-10 col-xs-offset-1">
            <div class="col-lg-push-9">
                <h2 style="color: #fff">Información Buses de la Empresa</h2>
                <br />
            </div>

            <%-- CREANDO VENTANA MODAL PARA FORMULARIO AGREGAR BUS --%>

            <!-- BOTON MODAL -->
            <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">Agregar Bus</button>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal2">Dar de Baja / Alta Bus</button>

            <!-- MODAL -->
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div style="background-color: #96C1FF" class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 style="color: #fff" class="modal-title">Agregar Nuevo Bus</h4>
                        </div>
                        <div class="modal-body">
                            <p style="color: #fff">Complete los campos de a continuación</p>

                            <%-- formulario --%>
                            <div class="row">
                                <div class="col-md-6 form-group">
                                    <label class="control-label">Ingresar Patente</label>
                                    <asp:TextBox runat="server" ID="patente" Style="text-transform: uppercase" class="form-control" placeholder="ABCD12" MaxLength="6"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="validapatente" runat="server" ControlToValidate="patente"
                                        ErrorMessage="*Debe ingresar una patente válida" ValidationExpression="^[a-zA-Z]{4}[0-9]{2}$" ForeColor="Red"></asp:RegularExpressionValidator>
                                    <br />
                                </div>

                                <div class="col-md-6 form-group">
                                    <label class="control-label">¿Qué marca es el bus?</label>
                                    <asp:DropDownList class="form-control" ID="ddmarca" runat="server" DataSourceID="datosmarca" DataTextField="NOMBRE_MARCA_BUS" DataValueField="ID_MARCA_BUS"></asp:DropDownList>
                                    <asp:SqlDataSource ID="datosmarca" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="SELECT * FROM [MARCA_BUS]"></asp:SqlDataSource>
                                    <br />
                                </div>

                                <div class="col-md-6 form-group">
                                    <label class="control-label">Seleccione la oficina a la que pertenece</label>
                                    <asp:DropDownList ID="ddidoficina" runat="server" AppendDataBoundItems="true" class="form-control">
                                        <asp:ListItem Value="0" Text="Avenida Padre Nelson Aguilar S/N"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="Direccion Oficina 2"></asp:ListItem>
                                    </asp:DropDownList>
                                    <br />
                                </div>

                                <div class="col-md-6 form-group">
                                    <label class="control-label">¿Cuál es el apodo del Bus?</label>
                                    <asp:TextBox runat="server" ID="apodo" value="" class="form-control" Style="text-transform: capitalize" placeholder="Ingresa el apodo" MaxLength="40"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="validaapodo" runat="server" ControlToValidate="apodo"
                                        ErrorMessage="*Debe ingresar solo letras" ValidationExpression="[a-zA-ZñÑáéíóúÁÉÍÓÚ ]*$" ForeColor="Red"></asp:RegularExpressionValidator>
                                    <br />
                                </div>

                                <div class="col-md-6 form-group">
                                    <label class="control-label">¿Cuánta capacidad tiene?</label>
                                    <asp:TextBox runat="server" ID="capacidad" value="" class="form-control" placeholder="Ingresa la capacidad" CausesValidation="True" MaxLength="2" type="Number"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="validacapacidad" runat="server" ControlToValidate="capacidad"
                                        ErrorMessage="*Ingrese solo números de 3 digitos" ValidationExpression="^[0-9]{0,3}$" ForeColor="Red"></asp:RegularExpressionValidator>
                                    <br />
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                            <asp:Button class="btn btn-primary" type="button" ID="btnagregarbus" runat="server" Text="Guardar cambios" OnClick="btnagregarbus_Click" />
                        </div>
                    </div>
                </div>
            </div>
            <%-- FIN VENTANA MODAL --%>

            <div class="col-md-10 col-md-offset-1 col-xs-10 col-xs-offset-1">
                <br />
                <br />
                <asp:GridView ID="gridBuses" CssClass="table table-striped table-bordered table-condensed" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="datosBuses" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="PATENTE" HeaderText="PATENTE" ReadOnly="True" SortExpression="PATENTE" />
                        <asp:BoundField DataField="MARCA" HeaderText="MARCA" SortExpression="MARCA" ReadOnly="True" />
                        <asp:BoundField DataField="APODO" HeaderText="APODO" SortExpression="APODO" ReadOnly="True" />
                        <asp:BoundField DataField="CAPACIDAD_BUS" HeaderText="CAPACIDAD" SortExpression="CAPACIDAD_BUS" />
                        <asp:CheckBoxField DataField="ESTADO_BUS" HeaderText="ESTADO" SortExpression="ESTADO_BUS" />
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
                <asp:SqlDataSource ID="datosBuses" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="SELECT UPPER(PATENTE) AS PATENTE, UPPER(NOMBRE_MARCA_BUS) AS MARCA, 
UPPER(APODO_BUS) AS APODO, CAPACIDAD_BUS, ESTADO_BUS FROM BUS
INNER JOIN MARCA_BUS ON BUS.ID_MARCA_BUS = MARCA_BUS.ID_MARCA_BUS
AND ESTADO_BUS='TRUE'"></asp:SqlDataSource>
            </div>


            <div class="modal fade" id="myModal2" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div style="background-color: #96C1FF" class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 style="color: #fff" class="modal-title">Dar de Baja/Alta Bus</h4>
                        </div>
                        <div class="modal-body">
                            <p style="color: #fff">Complete los campos de a continuación</p>

                            <%-- formulario --%>
                            <div class="row">
                                <div class="col-md-6 form-group">
                                    <label class="control-label">Seleccione una Patente</label>
                                    <asp:DropDownList ID="ddpatente" class="form-control" runat="server" DataSourceID="datosbuses2" DataTextField="PATENTE" DataValueField="PATENTE"></asp:DropDownList>
                                    <asp:SqlDataSource ID="datosbuses2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="SELECT UPPER(PATENTE) AS PATENTE FROM BUS"></asp:SqlDataSource>
                                    <br />
                                </div>
                                <div class="col-md-6 form-group">
                                    <label class="control-label">Seleccione una opción</label>
                                    <asp:DropDownList ID="ddestado" runat="server" AppendDataBoundItems="true" class="form-control">
                                        <asp:ListItem Value="0" Text="Dar de Baja"></asp:ListItem>
                                        <asp:ListItem Value="1" Text="Dar de Alta"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                <asp:Button class="btn btn-primary" type="button" ID="btncambiarestado" runat="server" Text="Guardar cambios" OnClick="btncambiarestado_Click" />
                            </div>
                        </div>
                    </div>
                </div>
                <%-- FIN VENTANA MODAL --%>
            </div>
        </div>
</asp:Content>
