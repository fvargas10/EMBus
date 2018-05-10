<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="ModificarTarifas.aspx.cs" Inherits="EMBus.ModificarTarifas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="navbar" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="footer" runat="server">

    <div class="row">
        <div class="col-md-10 col-md-offset-1 col-xs-10 col-xs-offset-1">
            <div class="col-lg-push-9">
                <h2 style="color: #fff">Tarifas</h2>
                <br />
            </div>

            <!-- BOTON MODAL -->
            <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">Actualizar Tarifas</button>
            <br />

            <!-- MODAL TARIFA -->
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div style="background-color: #96C1FF" class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 style="color: #fff" class="modal-title">Actualizar Tarifa</h4>
                        </div>
                        <div class="modal-body">
                            <p style="color: #fff">Complete los campos de a continuación</p>

                            <%-- formulario --%>
                            <div class="row">

                                <div class="col-md-6 form-group">
                                    <label class="control-label">Seleccione el valor de la tarifa</label>
                                    <asp:DropDownList ID="ddtarifas" class="form-control" runat="server" DataSourceID="datosTarifa" DataTextField="VALOR" DataValueField="ID"></asp:DropDownList>
                                    <asp:SqlDataSource ID="datosTarifa" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="select valor_boleto as VALOR, id_boleto AS ID from boleto"></asp:SqlDataSource>
                                    <br />
                                </div>

                                <div class="col-md-6 form-group">
                                    <label class="control-label">Ingrese el nuevo valor</label>
                                    <asp:TextBox ID="txttarifanueva" class="form-control" runat="server"></asp:TextBox>
                                </div>

                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                            <asp:Button class="btn btn-primary" type="button" ID="btnactualizartarifa" runat="server" Text="Guardar cambios" OnClick="btnactualizartarifa_Click" />
                        </div>
                    </div>
                </div>
            </div>
            <%-- FIN VENTANA MODAL --%>

            <br />
            
            <%--CssClass="table table-striped table-bordered table-condensed"--%>

            <%-- CONSTRUCCION DE GRIDVIEW PARA MOSTRAR LAS TARIFAS DE LOS DISTINTOS TRAMOS --%>
            
            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="grid1200" runat="server" ShowHeader="False" HorizontalAlign="Center" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="tarifa1200" GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="Column1" HeaderText="Column1" ReadOnly="True" SortExpression="Column1" DataFormatString="${0:#,0}" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                <SortedDescendingHeaderStyle BackColor="#3E3277" />
            </asp:GridView>
            <asp:SqlDataSource ID="tarifa1200" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="select CAST(VALOR_BOLETO AS nvarchar(100)) + '  ' + 'LOS MUERMOS - LAGUNITAS / PUERTO MONTT' 
FROM BOLETO WHERE ID_BOLETO=1200 "></asp:SqlDataSource>

            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="grid1000" runat="server" ShowHeader="False" HorizontalAlign="Center" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="tarifa1000" GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="Column1" HeaderText="Column1" ReadOnly="True" SortExpression="Column1" DataFormatString="${0:#,0}" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                <SortedDescendingHeaderStyle BackColor="#3E3277" />
            </asp:GridView>
            <asp:SqlDataSource ID="tarifa1000" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="
select CAST(VALOR_BOLETO AS nvarchar(100)) + '  ' + 'LOS MUERMOS - TEPUAL' 
FROM BOLETO WHERE ID_BOLETO=1000 "></asp:SqlDataSource>

            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="grid800" runat="server" ShowHeader="False" HorizontalAlign="Center" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="tarifa800" GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="Column1" HeaderText="Column1" ReadOnly="True" SortExpression="Column1" DataFormatString="${0:#,0}" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                <SortedDescendingHeaderStyle BackColor="#3E3277" />
            </asp:GridView>
            <asp:SqlDataSource ID="tarifa800" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="select CAST(VALOR_BOLETO AS nvarchar(100)) + '  ' + 'LOS MUERMOS - PARAGUAY CHICO / PARAGUAY GRANDE / LAS QUEMAS' 
FROM BOLETO WHERE ID_BOLETO=800 "></asp:SqlDataSource>

            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="grid700" runat="server" ShowHeader="False" HorizontalAlign="Center" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="tarifa700" GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="Column1" HeaderText="Column1" ReadOnly="True" SortExpression="Column1" DataFormatString="${0:#,0}" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                <SortedDescendingHeaderStyle BackColor="#3E3277" />
            </asp:GridView>
            <asp:SqlDataSource ID="tarifa700" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="
select CAST(VALOR_BOLETO AS nvarchar(100)) + '  ' + 'LOS MUERMOS - SANTA AMANDA / OSTIONES' 
FROM BOLETO WHERE ID_BOLETO=700 "></asp:SqlDataSource>

            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="grid600" runat="server" ShowHeader="False" HorizontalAlign="Center" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="tarifa600" GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="Column1" HeaderText="Column1" ReadOnly="True" SortExpression="Column1" DataFormatString="${0:#,0}" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                <SortedDescendingHeaderStyle BackColor="#3E3277" />
            </asp:GridView>
            <asp:SqlDataSource ID="tarifa600" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="
select CAST(VALOR_BOLETO AS nvarchar(100)) + '  ' + 'TARIFA ESTUDIANTE EDUCACIÓN SUPERIOR ' 
FROM BOLETO WHERE ID_BOLETO=600 "></asp:SqlDataSource>

            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="grid500" runat="server" ShowHeader="False" HorizontalAlign="Center" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="tarifa500" GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="Column1" HeaderText="Column1" ReadOnly="True" SortExpression="Column1" DataFormatString="${0:#,0}" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                <SortedDescendingHeaderStyle BackColor="#3E3277" />
            </asp:GridView>
            <asp:SqlDataSource ID="tarifa500" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="select CAST(VALOR_BOLETO AS nvarchar(100)) + '  ' + 'TARIFA LOCAL MINIMA / ESTUDIANTE EDUCACIÓN MEDIA' 
FROM BOLETO WHERE ID_BOLETO=500 "></asp:SqlDataSource>

            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="grid400" runat="server" ShowHeader="False" HorizontalAlign="Center" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="tarifa400" GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="Column1" HeaderText="Column1" ReadOnly="True" SortExpression="Column1" DataFormatString="${0:#,0}" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                <SortedDescendingHeaderStyle BackColor="#3E3277" />
            </asp:GridView>
            <asp:SqlDataSource ID="tarifa400" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="
select CAST(VALOR_BOLETO AS nvarchar(100)) + '  ' + 'ESTUDIANTE EDUCACIÓN SUPERIOR TEPUAL - PUERTO MONTT' 
FROM BOLETO WHERE ID_BOLETO=400 "></asp:SqlDataSource>

            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="grid300" runat="server" ShowHeader="False" HorizontalAlign="Center" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="tarifa300" GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="Column1" HeaderText="Column1" ReadOnly="True" SortExpression="Column1" DataFormatString="${0:#,0}" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                <SortedDescendingHeaderStyle BackColor="#3E3277" />
            </asp:GridView>
            <asp:SqlDataSource ID="tarifa300" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="select CAST(VALOR_BOLETO AS nvarchar(100)) + '  ' + 'TARIFA MEDIA LOCAL' 
FROM BOLETO WHERE ID_BOLETO=300 "></asp:SqlDataSource>            
            <%-- FIN GRIDVIEW --%>


</asp:Content>
