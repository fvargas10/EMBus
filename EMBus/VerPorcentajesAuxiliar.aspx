<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="VerPorcentajesAuxiliar.aspx.cs" Inherits="EMBus.VerPorcentajesAuxiliar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="navbar" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="footer" runat="server">

    <div class="row">
        <div class="col-md-10 col-md-offset-1 col-xs-10 col-xs-offset-1">
            <div class="col-lg-push-12">
                <h2 style="color: #fff">Pago Auxiliares</h2>
                <br />                
            </div>

            <div class="col-xs-6 col-md-3 form-group">
                <label class="control-label">Fecha Desde</label>
                <asp:TextBox ID="txtfechadesde" class="form-control" runat="server" TextMode="Date"></asp:TextBox>
            </div>

            <div class="col-xs-6 col-md-3 form-group">
                <label class="control-label">Fecha Hasta</label>
                <asp:TextBox ID="txtfechahasta" class="form-control" runat="server" TextMode="Date"></asp:TextBox>
                <br />
            </div>

            <div class="col-xs-6 col-md-1 form-group">
                <label class="control-label">Cantidad</label>
                <asp:TextBox ID="txtnumeroconductores" class="form-control" runat="server" TextMode="Number"></asp:TextBox>
                <br />
            </div>

            <div class="col-xs-6 col-md-4 form-group">
                <label class="control-label">Buscar</label>
                <asp:Button ID="btnMostrarPorcentajes" class="form-control btn-success" runat="server" Text="Mostrar Porcentajes" OnClick="btnMostrarPorcentajes_Click" />
                <br />
            </div>

        </div>
    </div>

    <div class="col-md-10 col-md-offset-1 col-xs-12 col-xs-offset-5">
        <div class="table-responsive">
            <table draggable="false">
                <thead>
                    <tr>
                        <th style="color: #FFFFFF;">
                            <label class="control-label">Primer Auxiliar</label>
                            <asp:DropDownList ID="ddAuxiliar1" class="form-control" runat="server" DataSourceID="datosAuxiliar1" DataTextField="AUXILIAR" DataValueField="RUT"></asp:DropDownList>
                            <asp:SqlDataSource ID="datosAuxiliar1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="SELECT RUT_AUX AS RUT, UPPER(PRIMER_NOMBRE + ' ' + PRIMER_APELLIDO + ' ' + SEGUNDO_APELLIDO) AS AUXILIAR FROM AUXILIAR WHERE ESTADO_AUX='True' and RUT_AUX &lt;&gt; '0' AND RUT_AUX &lt;&gt; '1'"></asp:SqlDataSource>
                        </th>
                        <th style="width: 90px"></th>
                        <th style="color: #FFFFFF;">
                            <label class="control-label">Segundo Auxiliar</label>
                            <asp:DropDownList ID="ddAuxiliar2" class="form-control" runat="server" DataSourceID="datosAuxiliar2" DataTextField="AUXILIAR" DataValueField="RUT"></asp:DropDownList>
                            <asp:SqlDataSource ID="datosAuxiliar2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="SELECT RUT_AUX AS RUT, UPPER(PRIMER_NOMBRE + ' ' + PRIMER_APELLIDO + ' ' + SEGUNDO_APELLIDO) AS AUXILIAR FROM AUXILIAR WHERE ESTADO_AUX='True' and RUT_AUX &lt;&gt; '0' AND RUT_AUX &lt;&gt; '1'"></asp:SqlDataSource>
                        </th>
                        <th style="width: 90px"></th>
                        <th style="color: #FFFFFF;">
                            <label class="control-label">Tercer Auxiliar</label>
                            <asp:DropDownList ID="ddAuxiliar3" class="form-control" runat="server" DataSourceID="datosAuxiliar3" DataTextField="AUXILIAR" DataValueField="RUT"></asp:DropDownList>
                            <asp:SqlDataSource ID="datosAuxiliar3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="SELECT RUT_AUX AS RUT, UPPER(PRIMER_NOMBRE + ' ' + PRIMER_APELLIDO + ' ' + SEGUNDO_APELLIDO) AS AUXILIAR FROM AUXILIAR WHERE ESTADO_AUX='True' and RUT_AUX &lt;&gt; '0' AND RUT_AUX &lt;&gt; '1'"></asp:SqlDataSource>
                        </th>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <td style="border: 5px solid #96C1FF;">
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridBonoAuxiliar1" runat="server" CellPadding="4" DataSourceID="datosBonoAuxiliar1" ForeColor="#333333" GridLines="None" AllowSorting="True" AutoGenerateColumns="False">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="DÍA" HeaderText="DÍA" ReadOnly="True" SortExpression="DÍA" />
                                    <asp:BoundField DataField="FECHA" HeaderText="FECHA" SortExpression="FECHA" DataFormatString="{0:d}" />
                                    <asp:BoundField DataField="BONO" HeaderText="BONO" SortExpression="BONO" DataFormatString="${0:#,0}" />
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="datosBonoAuxiliar1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="obtenerBonosDiariosAuxiliar" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddAuxiliar1" Name="rut" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="txtfechadesde" DbType="Date" Name="fecha_desde" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtfechahasta" DbType="Date" Name="fecha_hasta" PropertyName="Text" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td style="border: 5px solid #96C1FF;"></td>

                        <td style="border: 5px solid #96C1FF;">
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridBonoAuxiliar2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="datosBonoAuxiliar2" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="DÍA" HeaderText="DÍA" ReadOnly="True" SortExpression="DÍA" />
                                    <asp:BoundField DataField="FECHA" HeaderText="FECHA" SortExpression="FECHA" DataFormatString="{0:d}" />
                                    <asp:BoundField DataField="BONO" HeaderText="BONO" SortExpression="BONO" DataFormatString="${0:#,0}" />
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="datosBonoAuxiliar2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="obtenerBonosDiariosAuxiliar" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddAuxiliar2" Name="rut" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="txtfechadesde" DbType="Date" Name="fecha_desde" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtfechahasta" DbType="Date" Name="fecha_hasta" PropertyName="Text" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>

                        <td style="border: 5px solid #96C1FF;"></td>

                        <td style="border: 5px solid #96C1FF;">
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="griBonoAuxiliar3" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="datosBonoAuxilair3" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="DÍA" HeaderText="DÍA" ReadOnly="True" SortExpression="DÍA" />
                                    <asp:BoundField DataField="FECHA" HeaderText="FECHA" SortExpression="FECHA" DataFormatString="{0:d}" />
                                    <asp:BoundField DataField="BONO" HeaderText="BONO" SortExpression="BONO" DataFormatString="${0:#,0}" />
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="datosBonoAuxilair3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="obtenerBonosDiariosAuxiliar" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddAuxiliar3" Name="rut" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="txtfechadesde" DbType="Date" Name="fecha_desde" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtfechahasta" DbType="Date" Name="fecha_hasta" PropertyName="Text" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </tbody>

                <tbody>
                    <tr>
                        <td style="border: 5px solid #96C1FF;">
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridSabadosAuxiliar1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="datosSabadoAuxiliar1" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="DOMINGO" HeaderText="SÁBADOS" SortExpression="DOMINGO" DataFormatString="${0:#,0}" />
                                    <asp:BoundField DataField="FECHA_TRABAJADA" HeaderText="FECHA" SortExpression="FECHA_TRABAJADA" DataFormatString="{0:d}" />
                                </Columns>
                                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                                <SortedDescendingHeaderStyle BackColor="#820000" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="datosSabadoAuxiliar1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="obtenerDiasSabadosTrabajadosAuxiliar" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddAuxiliar1" Name="rut" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="txtfechadesde" DbType="Date" Name="fecha_desde" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtfechahasta" DbType="Date" Name="fecha_hasta" PropertyName="Text" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>

                        <td style="border: 5px solid #96C1FF;"></td>

                        <td style="border: 5px solid #96C1FF;">
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridSabadosAuxiliar2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="datosSabadoAuxiliar2" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="DOMINGO" HeaderText="SÁBADOS" SortExpression="DOMINGO" DataFormatString="${0:#,0}" />
                                    <asp:BoundField DataField="FECHA_TRABAJADA" HeaderText="FECHA" SortExpression="FECHA_TRABAJADA" DataFormatString="{0:d}" />
                                </Columns>
                                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                                <SortedDescendingHeaderStyle BackColor="#820000" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="datosSabadoAuxiliar2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="obtenerDiasSabadosTrabajadosAuxiliar" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddAuxiliar2" Name="rut" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="txtfechadesde" DbType="Date" Name="fecha_desde" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtfechahasta" DbType="Date" Name="fecha_hasta" PropertyName="Text" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>

                        <td style="border: 5px solid #96C1FF;"></td>


                        <td style="border: 5px solid #96C1FF;">
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridSabadosAuxiliar3" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="datosSabadoAuxiliar3" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="DOMINGO" HeaderText="SÁBADOS" SortExpression="DOMINGO" DataFormatString="${0:#,0}" />
                                    <asp:BoundField DataField="FECHA_TRABAJADA" HeaderText="FECHA" SortExpression="FECHA_TRABAJADA" DataFormatString="{0:d}" />
                                </Columns>
                                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                                <SortedDescendingHeaderStyle BackColor="#820000" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="datosSabadoAuxiliar3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="obtenerDiasSabadosTrabajadosAuxiliar" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddAuxiliar3" Name="rut" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="txtfechadesde" DbType="Date" Name="fecha_desde" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtfechahasta" DbType="Date" Name="fecha_hasta" PropertyName="Text" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </tbody>

                <tbody>
                    <tr>
                        <td style="border: 5px solid #96C1FF;">
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridDomingosAuxiliar1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="datosDomingoAuxiliar1" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="DOMINGO" HeaderText="DOMINGOS" SortExpression="DOMINGO" DataFormatString="${0:#,0}" />
                                    <asp:BoundField DataField="FECHA_TRABAJADA" HeaderText="FECHA" SortExpression="FECHA_TRABAJADA" DataFormatString="{0:d}" />
                                </Columns>
                                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                                <SortedDescendingHeaderStyle BackColor="#820000" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="datosDomingoAuxiliar1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="obtenerDiasDomingosTrabajadosAuxiliar" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddAuxiliar1" Name="rut" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="txtfechadesde" DbType="Date" Name="fecha_desde" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtfechahasta" DbType="Date" Name="fecha_hasta" PropertyName="Text" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>

                        <td style="border: 5px solid #96C1FF;"></td>

                        <td style="border: 5px solid #96C1FF;">
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridDomingosAuxiliar2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="datosDomingoAuxiliar2" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="DOMINGO" HeaderText="DOMINGOS" SortExpression="DOMINGO" DataFormatString="${0:#,0}" />
                                    <asp:BoundField DataField="FECHA_TRABAJADA" HeaderText="FECHA" SortExpression="FECHA_TRABAJADA" DataFormatString="{0:d}" />
                                </Columns>
                                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                                <SortedDescendingHeaderStyle BackColor="#820000" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="datosDomingoAuxiliar2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="obtenerDiasDomingosTrabajadosAuxiliar" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddAuxiliar2" Name="rut" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="txtfechadesde" DbType="Date" Name="fecha_desde" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtfechahasta" DbType="Date" Name="fecha_hasta" PropertyName="Text" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>

                        <td style="border: 5px solid #96C1FF;"></td>


                        <td style="border: 5px solid #96C1FF;">
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridDomingosAuxiliar3" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="datosDomingoAuxiliar3" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="DOMINGO" HeaderText="DOMINGOS" SortExpression="DOMINGO" DataFormatString="${0:#,0}" />
                                    <asp:BoundField DataField="FECHA_TRABAJADA" HeaderText="FECHA" SortExpression="FECHA_TRABAJADA" DataFormatString="{0:d}" />
                                </Columns>
                                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                                <SortedDescendingHeaderStyle BackColor="#820000" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="datosDomingoAuxiliar3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="obtenerDiasDomingosTrabajadosAuxiliar" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddAuxiliar3" Name="rut" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="txtfechadesde" DbType="Date" Name="fecha_desde" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtfechahasta" DbType="Date" Name="fecha_hasta" PropertyName="Text" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </tbody>

                <tbody>
                    <tr>
                        <td style="border: 5px solid #96C1FF;">
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridSumaBonosAuxiliar1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="datosSumaBonoAuxiliar1" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="Total_Bono" HeaderText="TOTAL (LUNES-VIERNES)" ReadOnly="True" SortExpression="Total_Bono" DataFormatString="${0:#,0}" />
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="datosSumaBonoAuxiliar1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="obtenerSumaBonosAuxiliar" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddAuxiliar1" Name="rut" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="txtfechadesde" DbType="Date" Name="fecha_desde" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtfechahasta" DbType="Date" Name="fecha_hasta" PropertyName="Text" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>

                        <td style="border: 5px solid #96C1FF;"></td>

                        <td style="border: 5px solid #96C1FF;">
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridSumaBonosAuxiliar2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="datosSumaBonoAuxiliar2" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="Total_Bono" HeaderText="TOTAL (LUNES-VIERNES)" ReadOnly="True" SortExpression="Total_Bono" DataFormatString="${0:#,0}" />
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="datosSumaBonoAuxiliar2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="obtenerSumaBonosAuxiliar" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddAuxiliar2" Name="rut" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="txtfechadesde" DbType="Date" Name="fecha_desde" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtfechahasta" DbType="Date" Name="fecha_hasta" PropertyName="Text" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>

                        <td style="border: 5px solid #96C1FF;"></td>

                        <td style="border: 5px solid #96C1FF;">
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridSumaBonosAuxiliar3" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="datosSumaBonoAuxiliar3" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="Total_Bono" HeaderText="TOTAL (LUNES-VIERNES)" ReadOnly="True" SortExpression="Total_Bono" DataFormatString="${0:#,0}" />
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="datosSumaBonoAuxiliar3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="obtenerSumaBonosAuxiliar" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddAuxiliar3" Name="rut" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="txtfechadesde" DbType="Date" Name="fecha_desde" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtfechahasta" DbType="Date" Name="fecha_hasta" PropertyName="Text" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </tbody>

                <tbody>
                    <tr>
                        <td style="border: 5px solid #96C1FF;">
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridLiquidoAuxiliar1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="datosLiquidoAuxiliar1" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="LIQUIDO_AUXILIAR" HeaderText="SUELDO LÍQUIDO" ReadOnly="True" SortExpression="LIQUIDO_AUXILIAR" DataFormatString="${0:#,0}" />
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="datosLiquidoAuxiliar1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="obtenerLiquidoAuxiliares" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddAuxiliar1" Name="rut1" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddAuxiliar2" Name="rut2" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddAuxiliar3" Name="rut3" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="txtfechadesde" DbType="Date" Name="fecha_desde" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtfechahasta" DbType="Date" Name="fecha_hasta" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtnumeroconductores" Name="numero_conductores" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td style="border: 5px solid #96C1FF;"></td>
                        <td style="border: 5px solid #96C1FF;">
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridLiquidoAuxiliar2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="datosLiquidoAuxiliar2" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="LIQUIDO_AUXILIAR" HeaderText="SUELDO LÍQUIDO" ReadOnly="True" SortExpression="LIQUIDO_AUXILIAR" DataFormatString="${0:#,0}" />
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="datosLiquidoAuxiliar2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="obtenerLiquidoAuxiliares" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddAuxiliar1" Name="rut1" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddAuxiliar2" Name="rut2" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddAuxiliar3" Name="rut3" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="txtfechadesde" DbType="Date" Name="fecha_desde" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtfechahasta" DbType="Date" Name="fecha_hasta" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtnumeroconductores" Name="numero_conductores" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td style="border: 5px solid #96C1FF;"></td>
                        <td style="border: 5px solid #96C1FF;">
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridLiquidoAuxiliar3" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="datosLiquidoAuxiliar3" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="LIQUIDO_AUXILIAR" HeaderText="SUELDO LÍQUIDO" ReadOnly="True" SortExpression="LIQUIDO_AUXILIAR" DataFormatString="${0:#,0}" />
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="datosLiquidoAuxiliar3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="obtenerLiquidoAuxiliares" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddAuxiliar1" Name="rut1" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddAuxiliar2" Name="rut2" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddAuxiliar3" Name="rut3" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="txtfechadesde" DbType="Date" Name="fecha_desde" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtfechahasta" DbType="Date" Name="fecha_hasta" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtnumeroconductores" Name="numero_conductores" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </tbody>

                <tbody>
                    <tr>
                        <td style="border: 5px solid #96C1FF;">
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridLiquidoFDSAuxiliar1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="datosLiquidoFDSAuxiliar1" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="Column1" HeaderText="LÍQUIDO + SABADOS + DOMINGOS" ReadOnly="True" SortExpression="Column1" DataFormatString="${0:#,0}" />
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="datosLiquidoFDSAuxiliar1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="obtenerLiquidoAuxiliaresMasFDS" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddAuxiliar1" Name="rut1" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddAuxiliar2" Name="rut2" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddAuxiliar3" Name="rut3" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="txtfechadesde" DbType="Date" Name="fecha_desde" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtfechahasta" DbType="Date" Name="fecha_hasta" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtnumeroconductores" Name="numero_conductores" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td style="border: 5px solid #96C1FF;"></td>
                        <td style="border: 5px solid #96C1FF;">
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridLiquidoFDSAuxiliar2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="datosLiquidoFDSAuxiliar2" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="Column1" HeaderText="LÍQUIDO + SABADOS + DOMINGOS" ReadOnly="True" SortExpression="Column1" DataFormatString="${0:#,0}" />
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="datosLiquidoFDSAuxiliar2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="obtenerLiquidoAuxiliaresMasFDS" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddAuxiliar2" Name="rut1" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddAuxiliar3" Name="rut2" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddAuxiliar1" Name="rut3" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="txtfechadesde" DbType="Date" Name="fecha_desde" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtfechahasta" DbType="Date" Name="fecha_hasta" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtnumeroconductores" Name="numero_conductores" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td style="border: 5px solid #96C1FF;"></td>
                        <td style="border: 5px solid #96C1FF;">
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridLiquidoFDSAuxiliar3" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="datosLiquidoFDSAuxiliar3" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="Column1" HeaderText="LÍQUIDO + SABADOS + DOMINGOS" ReadOnly="True" SortExpression="Column1" DataFormatString="${0:#,0}" />
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="datosLiquidoFDSAuxiliar3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="obtenerLiquidoAuxiliaresMasFDS" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddAuxiliar3" Name="rut1" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddAuxiliar1" Name="rut2" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddAuxiliar2" Name="rut3" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="txtfechadesde" DbType="Date" Name="fecha_desde" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtfechahasta" DbType="Date" Name="fecha_hasta" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtnumeroconductores" Name="numero_conductores" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </tbody>

                <tbody>
                    <tr>
                        <td style="border: 5px solid #96C1FF;">
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridPrestamosAuxiliar1" runat="server" AutoGenerateColumns="False" CellPadding="3" DataSourceID="datosPrestamosAuxiliar1" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2">
                                <Columns>
                                    <asp:BoundField DataField="PRESTAMO" HeaderText="PRESTAMO" ReadOnly="True" SortExpression="PRESTAMO" DataFormatString="${0:#,0}" />
                                </Columns>
                                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                                <SortedDescendingHeaderStyle BackColor="#93451F" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="datosPrestamosAuxiliar1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="obtenerPrestamoAuxiliares" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddAuxiliar1" Name="rut" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="txtfechadesde" DbType="Date" Name="fecha_desde" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtfechahasta" DbType="Date" Name="fecha_hasta" PropertyName="Text" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td style="border: 5px solid #96C1FF;"></td>
                        <td style="border: 5px solid #96C1FF;">
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridPrestamosAuxiliar2" runat="server" AutoGenerateColumns="False" CellPadding="3" DataSourceID="datosPrestamosAuxiliar2" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2">
                                <Columns>
                                    <asp:BoundField DataField="PRESTAMO" HeaderText="PRESTAMO" ReadOnly="True" SortExpression="PRESTAMO" DataFormatString="${0:#,0}" />
                                </Columns>
                                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                                <SortedDescendingHeaderStyle BackColor="#93451F" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="datosPrestamosAuxiliar2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="obtenerPrestamoAuxiliares" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddAuxiliar2" Name="rut" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="txtfechadesde" DbType="Date" Name="fecha_desde" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtfechahasta" DbType="Date" Name="fecha_hasta" PropertyName="Text" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td style="border: 5px solid #96C1FF;"></td>
                        <td style="border: 5px solid #96C1FF;">
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridPrestamosAuxiliar3" runat="server" AutoGenerateColumns="False" CellPadding="3" DataSourceID="datosPrestamosAuxiliar3" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2">
                                <Columns>
                                    <asp:BoundField DataField="PRESTAMO" HeaderText="PRESTAMO" ReadOnly="True" SortExpression="PRESTAMO" DataFormatString="${0:#,0}" />
                                </Columns>
                                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                                <SortedDescendingHeaderStyle BackColor="#93451F" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="datosPrestamosAuxiliar3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="obtenerPrestamoAuxiliares" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddAuxiliar3" Name="rut" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="txtfechadesde" DbType="Date" Name="fecha_desde" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtfechahasta" DbType="Date" Name="fecha_hasta" PropertyName="Text" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </tbody>

                <tbody>
                    <tr>
                        <td style="border: 5px solid #96C1FF;">
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridLiquidoFinalAuxiliar1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="datosLiquidoFinalAuxiliar1" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="Column1" HeaderText="SUELDO FINAL" ReadOnly="True" SortExpression="Column1" DataFormatString="${0:#,0}" />
                                </Columns>
                                <EditRowStyle BackColor="#7C6F57" />
                                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#E3EAEB" />
                                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                <SortedDescendingHeaderStyle BackColor="#15524A" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="datosLiquidoFinalAuxiliar1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="obtenerLiquidoFinalAuxiliar" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddAuxiliar1" Name="rut1" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddAuxiliar2" Name="rut2" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddAuxiliar3" Name="rut3" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="txtfechadesde" DbType="Date" Name="fecha_desde" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtfechahasta" DbType="Date" Name="fecha_hasta" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtnumeroconductores" Name="numero_conductores" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td style="border: 5px solid #96C1FF;"></td>
                        <td style="border: 5px solid #96C1FF;">
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridLiquidoFinalAuxiliar2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="datosLiquidoFinalAuxiliar2" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="Column1" HeaderText="SUELDO FINAL" ReadOnly="True" SortExpression="Column1" DataFormatString="${0:#,0}" />
                                </Columns>
                                <EditRowStyle BackColor="#7C6F57" />
                                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#E3EAEB" />
                                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                <SortedDescendingHeaderStyle BackColor="#15524A" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="datosLiquidoFinalAuxiliar2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="obtenerLiquidoFinalAuxiliar" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddAuxiliar2" Name="rut1" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddAuxiliar3" Name="rut2" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddAuxiliar1" Name="rut3" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="txtfechadesde" DbType="Date" Name="fecha_desde" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtfechahasta" DbType="Date" Name="fecha_hasta" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtnumeroconductores" Name="numero_conductores" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td style="border: 5px solid #96C1FF;"></td>
                        <td style="border: 5px solid #96C1FF;">
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridLiquidoFinalAuxiliar3" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="datosLiquidoFinalAuxiliar3" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="Column1" HeaderText="SUELDO FINAL" ReadOnly="True" SortExpression="Column1" DataFormatString="${0:#,0}" />
                                </Columns>
                                <EditRowStyle BackColor="#7C6F57" />
                                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#E3EAEB" />
                                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                <SortedDescendingHeaderStyle BackColor="#15524A" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="datosLiquidoFinalAuxiliar3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="obtenerLiquidoFinalAuxiliar" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddAuxiliar3" Name="rut1" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddAuxiliar1" Name="rut2" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddAuxiliar2" Name="rut3" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="txtfechadesde" DbType="Date" Name="fecha_desde" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtfechahasta" DbType="Date" Name="fecha_hasta" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtnumeroconductores" Name="numero_conductores" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </tbody>

            </table>
        </div>
        <asp:Button ID="generarPDF" class="btn btn-success col-md-11" runat="server" Text="Exportar a PDF" OnClick="generarPDF_Click" />
    </div>

</asp:Content>


