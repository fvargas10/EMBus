<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="AgregarMarcaBus.aspx.cs" Inherits="EMBus.AgregarMarcaBus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="navbar" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="footer" runat="server">

    <div class="row">
        <div class="col-md-10 col-md-offset-1 col-xs-10 col-xs-offset-1">
            <div class="col-lg-push-9">
                <h2 style="color: #fff">Marcas de la Empresa</h2>
                <br />
            </div>

            <!-- BOTON MODAL -->
            <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">Agregar Marca</button>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button type="button" class="btn btn-danger btn-lg" data-toggle="modal" data-target="#myModal2">Eliminar Marca</button>

            <br />


            <!-- MODAL AGREGAR MARCA -->
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div style="background-color: #96C1FF" class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 style="color: #fff" class="modal-title">Agregar Nueva Marca</h4>
                        </div>
                        <div class="modal-body">
                            <p style="color: #fff">Complete los campos de a continuación</p>

                            <%-- formulario --%>
                            <div class="row">
                                <div class="col-md-6 form-group">
                                    <label class="control-label">Nombre de Marca</label>
                                    <asp:TextBox runat="server" ID="txtmarca" class="form-control" placeholder="Ej: Mitsubishi"></asp:TextBox>
                                    <br />
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                            <asp:Button class="btn btn-primary" type="button" ID="btnagregarmarca" runat="server" Text="Guardar cambios" OnClick="btnagregarmarca_Click" />
                        </div>
                    </div>
                </div>
            </div>
            <%-- FIN VENTANA MODAL --%>

            <!-- MODAL ELIMINAR MARCA -->
            <div class="modal fade" id="myModal2" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div style="background-color: #96C1FF" class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 style="color: #fff" class="modal-title">Eliminar Marca</h4>
                        </div>

                        <div class="modal-body">
                            <p style="color: #fff">Complete los campos de a continuación</p>

                            <%-- formulario --%>
                            <div class="row">
                                <div class="col-md-6 form-group">
                                    <label class="control-label">Nombre de Marca</label>
                                    <asp:DropDownList ID="ddnombremarca" class="form-control" runat="server" DataSourceID="datosmarcas" DataTextField="MARCAS" DataValueField="MARCAS"></asp:DropDownList>
                                    <asp:SqlDataSource ID="datosmarcas" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="select upper(NOMBRE_MARCA_BUS) as MARCAS from MARCA_BUS"></asp:SqlDataSource>
                                    <br />
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                            <asp:Button class="btn btn-primary" type="button" ID="btneliminarmarca" runat="server" Text="Guardar cambios" OnClick="btneliminarmarca_Click" />
                        </div>

                    </div>
                </div>
            </div>
            <%-- FIN VENTANA MODAL --%>

            <div class="col-md-10 col-md-offset-1 col-xs-10 col-xs-offset-1">
                <br />
                <br />
                <asp:GridView ID="gridMarca" runat="server" CssClass="table table-striped table-bordered table-condensed" CellPadding="4" DataSourceID="datosMarca" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
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
                <asp:SqlDataSource ID="datosMarca" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="select upper(nombre_marca_bus) as MARCA from marca_bus"></asp:SqlDataSource>
            </div>
        </div>
    </div>

</asp:Content>
