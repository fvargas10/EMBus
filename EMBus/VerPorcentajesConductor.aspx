<%@ Page Title="" EnableEventValidation="false" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="VerPorcentajesConductor.aspx.cs" Inherits="EMBus.VerPorcentajesConductor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="navbar" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="footer" runat="server">
    <script src="jspdf.debug.js"></script>
    <script src="Scripts/jquery-3.3.1.js"></script>
    <script src="Scripts/jspdf.debug.js"></script>
    <meta charset="UTF-32">
    <div class="row">
        <div class="col-md-10 col-md-offset-1 col-xs-10 col-xs-offset-1">
            <div class="col-lg-push-12">
                <h2 style="color: #fff">Pago Conductores</h2>
                <br />

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
    </div>

    <%-- CONSTRUCCION TABLA DE GRAFICOS DE PAGO --%>

    <div id="customers" class="col-md-10 col-md-offset-1 col-xs-12 col-xs-offset-5">
        <div class="table-responsive">
            <table draggable="false">
                <thead>
                    <tr>
                        <th style="color: #FFFFFF;">
                            <label class="control-label">Primer Conductor</label>
                            <asp:DropDownList class="form-control" ID="ddrutconductores" runat="server" DataSourceID="obtenerRutConductores" DataTextField="NOMBRE_CONDUCTOR" DataValueField="RUT"></asp:DropDownList>
                            <asp:SqlDataSource ID="obtenerRutConductores" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="SELECT RUT_CON AS RUT, Upper(PRIMER_NOMBRE) + ' ' + Upper(PRIMER_APELLIDO) + ' ' + Upper(SEGUNDO_APELLIDO) AS NOMBRE_CONDUCTOR FROM CONDUCTOR WHERE ESTADO_CON='True' and RUT_CON &lt;&gt; '0'"></asp:SqlDataSource>
                        </th>

                        <th style="color: #FFFFFF;">
                            <label class="control-label">Segundo Conductor</label>
                            <asp:DropDownList class="form-control" ID="ddconductores2" runat="server" DataSourceID="obtenerRutConductores2" DataTextField="NOMBRE_CONDUCTOR" DataValueField="RUT"></asp:DropDownList>
                            <asp:SqlDataSource ID="obtenerRutConductores2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="SELECT RUT_CON AS RUT, Upper(PRIMER_NOMBRE) + ' ' + Upper(PRIMER_APELLIDO) + ' ' + Upper(SEGUNDO_APELLIDO) AS NOMBRE_CONDUCTOR FROM CONDUCTOR WHERE ESTADO_CON='True' and RUT_CON &lt;&gt; '0'"></asp:SqlDataSource>
                        </th>

                        <th style="color: #FFFFFF;">
                            <label class="control-label">Tercer Conductor</label>
                            <asp:DropDownList class="form-control" ID="ddconductores3" runat="server" DataSourceID="obtenerRutConductores3" DataTextField="NOMBRE_CONDUCTOR" DataValueField="RUT"></asp:DropDownList>
                            <asp:SqlDataSource ID="obtenerRutConductores3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="SELECT RUT_CON AS RUT, Upper(PRIMER_NOMBRE) + ' ' + Upper(PRIMER_APELLIDO) + ' ' + Upper(SEGUNDO_APELLIDO) AS NOMBRE_CONDUCTOR FROM CONDUCTOR WHERE ESTADO_CON='True' and RUT_CON &lt;&gt; '0'"></asp:SqlDataSource>
                        </th>

                        <th style="color: #FFFFFF;">
                            <label class="control-label">Cuarto Conductor</label>
                            <asp:DropDownList class="form-control" ID="ddconductores4" runat="server" DataSourceID="obtenerRutConductores4" DataTextField="NOMBRE_CONDUCTOR" DataValueField="RUT"></asp:DropDownList>
                            <asp:SqlDataSource ID="obtenerRutConductores4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="SELECT RUT_CON AS RUT, Upper(PRIMER_NOMBRE) + ' ' + Upper(PRIMER_APELLIDO) + ' ' + Upper(SEGUNDO_APELLIDO) AS NOMBRE_CONDUCTOR FROM CONDUCTOR WHERE ESTADO_CON='True' and RUT_CON &lt;&gt; '0'"></asp:SqlDataSource>
                        </th>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <td style="border: 5px solid #96C1FF;">
                            <%-- CONSTRUCCIÓN DE TABLA CON DOS COLUMNAS PARA MOSTRAR GRIDVIEWS --%>
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridPorcentaje" runat="server" DataSourceID="datosConductor" AutoGenerateColumns="False" CellPadding="6" AllowSorting="True" ForeColor="#333333" GridLines="None" HorizontalAlign="Left" Height="25px" Width="250px" PageSize="5">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="DÍA" HeaderText="DÍA" ReadOnly="True" SortExpression="DÍA" />
                                    <asp:BoundField DataField="FECHA" HeaderText="FECHA" SortExpression="FECHA" DataFormatString="{0:d}" />
                                    <asp:BoundField DataField="PORCENTAJE" HeaderText="20%" SortExpression="PORCENTAJE" DataFormatString="${0:#,0}" />
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#284775" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>

                            <asp:SqlDataSource ID="datosConductor" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="obtenerPorcentajesConductor" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddrutconductores" Name="rut" PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="txtfechadesde" Name="fecha_desde" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtfechahasta" Name="fecha_hasta" PropertyName="Text" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>



                        <td style="border: 5px solid #96C1FF;">
                            <%-- CONSTRUCCIÓN DE TABLA CON DOS COLUMNAS PARA MOSTRAR GRIDVIEWS --%>
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridPorcentaje2" runat="server" DataSourceID="datosConductor2" AutoGenerateColumns="False" CellPadding="6" AllowSorting="True" ForeColor="#333333" GridLines="None" HorizontalAlign="Left" Height="25px" Width="250px" PageSize="5">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="DÍA" HeaderText="DÍA" ReadOnly="True" SortExpression="DÍA" />
                                    <asp:BoundField DataField="FECHA" HeaderText="FECHA" SortExpression="FECHA" DataFormatString="{0:d}" />
                                    <asp:BoundField DataField="PORCENTAJE" HeaderText="20% " SortExpression="PORCENTAJE" DataFormatString="${0:#,0}" />
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#284775" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>

                            <asp:SqlDataSource ID="datosConductor2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="obtenerPorcentajesConductor" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddconductores2" Name="rut" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="txtfechadesde" DbType="Date" Name="fecha_desde" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtfechahasta" DbType="Date" Name="fecha_hasta" PropertyName="Text" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>



                        <td style="border: 5px solid #96C1FF;">
                            <%-- CONSTRUCCIÓN DE TABLA CON DOS COLUMNAS PARA MOSTRAR GRIDVIEWS --%>
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridPorcentaje3" runat="server" DataSourceID="datosConductor3" AutoGenerateColumns="False" CellPadding="6" AllowSorting="True" ForeColor="#333333" GridLines="None" HorizontalAlign="Left" Height="25px" Width="250px" PageSize="5">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="DÍA" HeaderText="DÍA" ReadOnly="True" SortExpression="DÍA" />
                                    <asp:BoundField DataField="FECHA" HeaderText="FECHA" SortExpression="FECHA" DataFormatString="{0:d}" />
                                    <asp:BoundField DataField="PORCENTAJE" HeaderText="20%" SortExpression="PORCENTAJE" DataFormatString="${0:#,0}" />
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#284775" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>

                            <asp:SqlDataSource ID="datosConductor3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="obtenerPorcentajesConductor" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddconductores3" Name="rut" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="txtfechadesde" DbType="Date" Name="fecha_desde" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtfechahasta" DbType="Date" Name="fecha_hasta" PropertyName="Text" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>



                        <td style="border: 5px solid #96C1FF;">
                            <%-- CONSTRUCCIÓN DE TABLA CON DOS COLUMNAS PARA MOSTRAR GRIDVIEWS --%>
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridPorcentaje4" runat="server" DataSourceID="datosConductor4" AutoGenerateColumns="False" CellPadding="6" AllowSorting="True" ForeColor="#333333" GridLines="None" HorizontalAlign="Left" Height="25px" Width="250px" PageSize="5">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="DÍA" HeaderText="DÍA" ReadOnly="True" SortExpression="DÍA" />
                                    <asp:BoundField DataField="FECHA" HeaderText="FECHA" SortExpression="FECHA" DataFormatString="{0:d}" />
                                    <asp:BoundField DataField="PORCENTAJE" HeaderText="20%" SortExpression="PORCENTAJE" DataFormatString="${0:#,0}" />
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#284775" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="datosConductor4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="obtenerPorcentajesConductor" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddconductores4" Name="rut" PropertyName="SelectedValue" Type="String" />
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
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridSumaPorcentajes" runat="server" AutoGenerateColumns="False" DataSourceID="datosPagoConductor" CellPadding="4" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="SUMA_PORCENTAJES_DIARIOS" HeaderText="TOTAL 20% (SIN DOMINGOS)" ReadOnly="True" SortExpression="SUMA_PORCENTAJES_DIARIOS" DataFormatString="${0:#,0}" />
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
                            <asp:SqlDataSource ID="datosPagoConductor" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="obtenerSumaPorcentajesConductor" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddrutconductores" Name="rut" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="txtfechadesde" DbType="Date" Name="fecha_desde" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtfechahasta" DbType="Date" Name="fecha_hasta" PropertyName="Text" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>

                        <td style="border: 5px solid #96C1FF;">
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridSumaPorcentaje2" runat="server" AutoGenerateColumns="False" DataSourceID="datosPagoConductor2" CellPadding="4" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="SUMA_PORCENTAJES_DIARIOS" HeaderText="TOTAL 20% (SIN DOMINGOS)" ReadOnly="True" SortExpression="SUMA_PORCENTAJES_DIARIOS" DataFormatString="${0:#,0}" />
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

                            <asp:SqlDataSource ID="datosPagoConductor2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="obtenerSumaPorcentajesConductor" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddconductores2" Name="rut" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="txtfechadesde" DbType="Date" Name="fecha_desde" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtfechahasta" DbType="Date" Name="fecha_hasta" PropertyName="Text" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>


                        <td style="border: 5px solid #96C1FF;">
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridSumaPorcentaje3" runat="server" AutoGenerateColumns="False" DataSourceID="datosPagoConductor3" CellPadding="4" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="SUMA_PORCENTAJES_DIARIOS" HeaderText="TOTAL 20% (SIN DOMINGOS)" ReadOnly="True" SortExpression="SUMA_PORCENTAJES_DIARIOS" DataFormatString="${0:#,0}" />
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
                            <asp:SqlDataSource ID="datosPagoConductor3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="obtenerSumaPorcentajesConductor" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddconductores3" Name="rut" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="txtfechadesde" DbType="Date" Name="fecha_desde" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtfechahasta" DbType="Date" Name="fecha_hasta" PropertyName="Text" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>


                        <td style="border: 5px solid #96C1FF;">
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridSumaPorcentaje4" runat="server" AutoGenerateColumns="False" DataSourceID="datosPagoConductor4" CellPadding="4" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="SUMA_PORCENTAJES_DIARIOS" HeaderText="TOTAL 20% (SIN DOMINGOS)" ReadOnly="True" SortExpression="SUMA_PORCENTAJES_DIARIOS" DataFormatString="${0:#,0}" />
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
                            <asp:SqlDataSource ID="datosPagoConductor4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="obtenerSumaPorcentajesConductor" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddconductores4" Name="rut" PropertyName="SelectedValue" Type="String" />
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
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridDomingosTrabajados" runat="server" AutoGenerateColumns="False" DataSourceID="datosDomingosTrabajados" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" HorizontalAlign="Left">
                                <Columns>
                                    <asp:BoundField DataField="DIAS_DOMINGOS_TRABAJADOS" HeaderText="DOMINGOS " SortExpression="DIAS_DOMINGOS_TRABAJADOS" DataFormatString="${0:#,0}" />
                                    <asp:BoundField DataField="FECHA_TRABAJADA" HeaderText="FECHA" SortExpression="FECHA_TRABAJADA" DataFormatString="{0:d}" />
                                </Columns>
                                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                                <RowStyle BackColor="White" ForeColor="#330099" />
                                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                                <SortedAscendingCellStyle BackColor="#FEFCEB" />
                                <SortedAscendingHeaderStyle BackColor="#AF0101" />
                                <SortedDescendingCellStyle BackColor="#F6F0C0" />
                                <SortedDescendingHeaderStyle BackColor="#7E0000" />
                            </asp:GridView>

                            <asp:SqlDataSource ID="datosDomingosTrabajados" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="obtenerDiasDomingosTrabajadosConductor" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddrutconductores" Name="rut" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="txtfechadesde" DbType="Date" Name="fecha_desde" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtfechahasta" DbType="Date" Name="fecha_hasta" PropertyName="Text" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>

                        <td style="border: 5px solid #96C1FF;">
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridDomingosTrabajados2" runat="server" AutoGenerateColumns="False" DataSourceID="datosDomingosTrabajados2" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" HorizontalAlign="Left">
                                <Columns>
                                    <asp:BoundField DataField="DIAS_DOMINGOS_TRABAJADOS" HeaderText="DOMINGOS " SortExpression="DIAS_DOMINGOS_TRABAJADOS" DataFormatString="${0:#,0}" />
                                    <asp:BoundField DataField="FECHA_TRABAJADA" HeaderText="FECHA" SortExpression="FECHA_TRABAJADA" DataFormatString="{0:d}" />
                                </Columns>
                                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                                <RowStyle BackColor="White" ForeColor="#330099" />
                                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                                <SortedAscendingCellStyle BackColor="#FEFCEB" />
                                <SortedAscendingHeaderStyle BackColor="#AF0101" />
                                <SortedDescendingCellStyle BackColor="#F6F0C0" />
                                <SortedDescendingHeaderStyle BackColor="#7E0000" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="datosDomingosTrabajados2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="obtenerDiasDomingosTrabajadosConductor" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddconductores2" Name="rut" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="txtfechadesde" DbType="Date" Name="fecha_desde" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtfechahasta" DbType="Date" Name="fecha_hasta" PropertyName="Text" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>

                        <td style="border: 5px solid #96C1FF;">
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridDomingosTrabajados3" runat="server" AutoGenerateColumns="False" DataSourceID="datosDomingosTrabajados3" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" HorizontalAlign="Left">
                                <Columns>
                                    <asp:BoundField DataField="DIAS_DOMINGOS_TRABAJADOS" HeaderText="DOMINGOS" SortExpression="DIAS_DOMINGOS_TRABAJADOS" DataFormatString="${0:#,0}" />
                                    <asp:BoundField DataField="FECHA_TRABAJADA" HeaderText="FECHA" SortExpression="FECHA_TRABAJADA" DataFormatString="{0:d}" />
                                </Columns>
                                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                                <RowStyle BackColor="White" ForeColor="#330099" />
                                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                                <SortedAscendingCellStyle BackColor="#FEFCEB" />
                                <SortedAscendingHeaderStyle BackColor="#AF0101" />
                                <SortedDescendingCellStyle BackColor="#F6F0C0" />
                                <SortedDescendingHeaderStyle BackColor="#7E0000" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="datosDomingosTrabajados3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="obtenerDiasDomingosTrabajadosConductor" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddconductores3" Name="rut" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="txtfechadesde" DbType="Date" Name="fecha_desde" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtfechahasta" DbType="Date" Name="fecha_hasta" PropertyName="Text" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>

                        <td style="border: 5px solid #96C1FF;">
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridDomingosTrabajdos4" runat="server" AutoGenerateColumns="False" DataSourceID="datosDomingosTrabajados4" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" HorizontalAlign="Left">
                                <Columns>
                                    <asp:BoundField DataField="DIAS_DOMINGOS_TRABAJADOS" HeaderText="DOMINGOS " SortExpression="DIAS_DOMINGOS_TRABAJADOS" DataFormatString="${0:#,0}" />
                                    <asp:BoundField DataField="FECHA_TRABAJADA" HeaderText="FECHA" SortExpression="FECHA_TRABAJADA" DataFormatString="{0:d}" />
                                </Columns>
                                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                                <RowStyle BackColor="White" ForeColor="#330099" />
                                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                                <SortedAscendingCellStyle BackColor="#FEFCEB" />
                                <SortedAscendingHeaderStyle BackColor="#AF0101" />
                                <SortedDescendingCellStyle BackColor="#F6F0C0" />
                                <SortedDescendingHeaderStyle BackColor="#7E0000" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="datosDomingosTrabajados4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="obtenerDiasDomingosTrabajadosConductor" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddconductores4" Name="rut" PropertyName="SelectedValue" Type="String" />
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
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridLiquidoConductor1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="obtenerLiquidoConductor1" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="LIQUIDO_CONDUCTOR" HeaderText="SUELDO LÍQUIDO" ReadOnly="True" SortExpression="LIQUIDO_CONDUCTOR" DataFormatString="${0:#,0}" />
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="obtenerLiquidoConductor1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="obtenerLiquidoConductores" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddrutconductores" Name="rut1" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddconductores2" Name="rut2" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddconductores3" Name="rut3" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddconductores4" Name="rut4" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="txtfechadesde" DbType="Date" Name="fecha_desde" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtfechahasta" DbType="Date" Name="fecha_hasta" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtnumeroconductores" Name="numero_conductores" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td style="border: 5px solid #96C1FF;">
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridLiquidoConductor2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="obtenerLiquidoConductor1" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="LIQUIDO_CONDUCTOR" HeaderText="SUELDO LÍQUIDO" ReadOnly="True" SortExpression="LIQUIDO_CONDUCTOR" DataFormatString="${0:#,0}" />
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>
                        </td>
                        <td style="border: 5px solid #96C1FF;">
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridLiquidoConductor3" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="obtenerLiquidoConductor1" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="LIQUIDO_CONDUCTOR" HeaderText="SUELDO LÍQUIDO" ReadOnly="True" SortExpression="LIQUIDO_CONDUCTOR" DataFormatString="${0:#,0}" />
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>
                        </td>
                        <td style="border: 5px solid #96C1FF;">
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridLiquidoConductor4" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="obtenerLiquidoConductor1" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="LIQUIDO_CONDUCTOR" HeaderText="SUELDO LÍQUIDO" ReadOnly="True" SortExpression="LIQUIDO_CONDUCTOR" DataFormatString="${0:#,0}" />
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>
                        </td>
                    </tr>
                </tbody>
                <tbody>
                    <tr>
                        <td style="border: 5px solid #96C1FF;">
                            <asp:GridView ID="gridLiquidoMasDomingo1" CssClass="table table-striped table-bordered table-condensed" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="datosLiquidoMasDomingo1" GridLines="None" ForeColor="#333333">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="LIQUIDO_MAS_DOMINGOS_TRABAJADO" HeaderText="LIQUIDO + DOMINGOS" ReadOnly="True" SortExpression="LIQUIDO_MAS_DOMINGOS_TRABAJADO" DataFormatString="${0:#,0}" />
                                </Columns>
                                <EditRowStyle BackColor="#7C6F57" />
                                <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#E3EAEB" />
                                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                <SortedDescendingHeaderStyle BackColor="#15524A" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="datosLiquidoMasDomingo1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="obtenerLiquidoMasDomingosConductor" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddrutconductores" Name="rut1" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddconductores2" Name="rut2" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddconductores3" Name="rut3" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddconductores4" Name="rut4" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="txtfechadesde" DbType="Date" Name="fecha_desde" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtfechahasta" DbType="Date" Name="fecha_hasta" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtnumeroconductores" Name="numero_conductores" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td style="border: 5px solid #96C1FF;">
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridLiquidoMasDomingos2" runat="server" CellPadding="4" GridLines="None" AutoGenerateColumns="False" DataSourceID="datosLiquidoMasDomingo2" ForeColor="#333333">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="LIQUIDO_MAS_DOMINGOS_TRABAJADO" HeaderText="LIQUIDO + DOMINGOS" ReadOnly="True" SortExpression="LIQUIDO_MAS_DOMINGOS_TRABAJADO" DataFormatString="${0:#,0}" />
                                </Columns>
                                <EditRowStyle BackColor="#7C6F57" />
                                <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#E3EAEB" />
                                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                <SortedDescendingHeaderStyle BackColor="#15524A" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="datosLiquidoMasDomingo2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="obtenerLiquidoMasDomingosConductor" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddconductores2" Name="rut1" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddconductores3" Name="rut2" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddconductores4" Name="rut3" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddrutconductores" Name="rut4" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="txtfechadesde" DbType="Date" Name="fecha_desde" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtfechahasta" DbType="Date" Name="fecha_hasta" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtnumeroconductores" Name="numero_conductores" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td style="border: 5px solid #96C1FF;">
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridLiquidoMasDomingos3" runat="server" AutoGenerateColumns="False" DataSourceID="datosLiquidoMasDomingo3" CellPadding="4" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="LIQUIDO_MAS_DOMINGOS_TRABAJADO" HeaderText="LIQUIDO + DOMINGOS" ReadOnly="True" SortExpression="LIQUIDO_MAS_DOMINGOS_TRABAJADO" DataFormatString="${0:#,0}" />
                                </Columns>
                                <EditRowStyle BackColor="#7C6F57" />
                                <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#E3EAEB" />
                                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                <SortedDescendingHeaderStyle BackColor="#15524A" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="datosLiquidoMasDomingo3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="obtenerLiquidoMasDomingosConductor" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddconductores3" Name="rut1" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddconductores4" Name="rut2" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddrutconductores" Name="rut3" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddconductores2" Name="rut4" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="txtfechadesde" DbType="Date" Name="fecha_desde" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtfechahasta" DbType="Date" Name="fecha_hasta" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtnumeroconductores" Name="numero_conductores" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td style="border: 5px solid #96C1FF;">
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridLiquidoMasDomingos4" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="datosLiquidoMasDomingo4" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="LIQUIDO_MAS_DOMINGOS_TRABAJADO" HeaderText="LIQUIDO + DOMINGOS" ReadOnly="True" SortExpression="LIQUIDO_MAS_DOMINGOS_TRABAJADO" DataFormatString="${0:#,0}" />
                                </Columns>
                                <EditRowStyle BackColor="#7C6F57" />
                                <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#E3EAEB" />
                                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                <SortedDescendingHeaderStyle BackColor="#15524A" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="datosLiquidoMasDomingo4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="obtenerLiquidoMasDomingosConductor" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddconductores4" Name="rut1" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddrutconductores" Name="rut2" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddconductores2" Name="rut3" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddconductores3" Name="rut4" PropertyName="SelectedValue" Type="String" />
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
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridPrestamosConductor1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="datosPrestamoConductor1" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="PRESTAMOS_MAS_PETROLEO" HeaderText="PRESTAMOS E IMPOSICIONES" ReadOnly="True" SortExpression="PRESTAMOS_MAS_PETROLEO" DataFormatString="${0:#,0}" />
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
                            <asp:SqlDataSource ID="datosPrestamoConductor1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="obtenerPrestamos" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddrutconductores" Name="rut" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="txtfechadesde" DbType="Date" Name="fecha_desde" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtfechahasta" DbType="Date" Name="fecha_hasta" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtnumeroconductores" Name="numero_conductores" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td style="border: 5px solid #96C1FF;">
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridPrestamosConductor2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="datosPrestamoConductor2" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="PRESTAMOS_MAS_PETROLEO" HeaderText="PRESTAMOS E IMPOSICIONES" ReadOnly="True" SortExpression="PRESTAMOS_MAS_PETROLEO" DataFormatString="${0:#,0}"/>
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
                            <asp:SqlDataSource ID="datosPrestamoConductor2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="obtenerPrestamos" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddconductores2" Name="rut" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="txtfechadesde" DbType="Date" Name="fecha_desde" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtfechahasta" DbType="Date" Name="fecha_hasta" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtnumeroconductores" Name="numero_conductores" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td style="border: 5px solid #96C1FF;">
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridPrestamoConductor3" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="datosPrestamoConductor3" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="PRESTAMOS_MAS_PETROLEO" HeaderText="PRESTAMOS E IMPOSICIONES" ReadOnly="True" SortExpression="PRESTAMOS_MAS_PETROLEO" DataFormatString="${0:#,0}" />
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
                            <asp:SqlDataSource ID="datosPrestamoConductor3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="obtenerPrestamos" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddconductores3" Name="rut" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="txtfechadesde" DbType="Date" Name="fecha_desde" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtfechahasta" DbType="Date" Name="fecha_hasta" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtnumeroconductores" Name="numero_conductores" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td style="border: 5px solid #96C1FF;">
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridPrestamoConductor4" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="datosPrestamoConductor4" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="PRESTAMOS_MAS_PETROLEO" HeaderText="PRESTAMOS Y/O PETROLEO" ReadOnly="True" SortExpression="PRESTAMOS_MAS_PETROLEO" DataFormatString="${0:#,0}"/>
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
                            <asp:SqlDataSource ID="datosPrestamoConductor4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="obtenerPrestamos" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddconductores4" Name="rut" PropertyName="SelectedValue" Type="String" />
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
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridTotalConductor1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="datosTotalConductor1" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="LIQUIDO_MENOS_PRESTAMOS" HeaderText="SUELDO" ReadOnly="True" SortExpression="LIQUIDO_MENOS_PRESTAMOS" DataFormatString="${0:#,0}"/>
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
                            <asp:SqlDataSource ID="datosTotalConductor1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="obtenerLiquidoMenosPrestamos" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddrutconductores" Name="rut1" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddconductores2" Name="rut2" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddconductores3" Name="rut3" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddconductores4" Name="rut4" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="txtfechadesde" DbType="Date" Name="fecha_desde" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtfechahasta" DbType="Date" Name="fecha_hasta" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtnumeroconductores" Name="numero_conductores" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td style="border: 5px solid #96C1FF;">
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridTotalConductor2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="datosTotalConductor2" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="LIQUIDO_MENOS_PRESTAMOS" HeaderText="SUELDO" ReadOnly="True" SortExpression="LIQUIDO_MENOS_PRESTAMOS" DataFormatString="${0:#,0}" />
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
                            <asp:SqlDataSource ID="datosTotalConductor2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="obtenerLiquidoMenosPrestamos" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddconductores2" Name="rut1" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddconductores3" Name="rut2" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddconductores4" Name="rut3" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddrutconductores" Name="rut4" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="txtfechadesde" DbType="Date" Name="fecha_desde" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtfechahasta" DbType="Date" Name="fecha_hasta" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtnumeroconductores" Name="numero_conductores" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td style="border: 5px solid #96C1FF;">
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridTotalConductor3" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="datosTotalConductor3" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="LIQUIDO_MENOS_PRESTAMOS" HeaderText="SUELDO" ReadOnly="True" SortExpression="LIQUIDO_MENOS_PRESTAMOS" DataFormatString="${0:#,0}" />
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
                            <asp:SqlDataSource ID="datosTotalConductor3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="obtenerLiquidoMenosPrestamos" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddconductores3" Name="rut1" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddconductores4" Name="rut2" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddrutconductores" Name="rut3" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddconductores2" Name="rut4" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="txtfechadesde" DbType="Date" Name="fecha_desde" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtfechahasta" DbType="Date" Name="fecha_hasta" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtnumeroconductores" Name="numero_conductores" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td style="border: 5px solid #96C1FF;">
                            <asp:GridView CssClass="table table-striped table-bordered table-condensed" ID="gridTotalConductor4" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="datosTotalConductor4" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="LIQUIDO_MENOS_PRESTAMOS" HeaderText="SUELDO" ReadOnly="True" SortExpression="LIQUIDO_MENOS_PRESTAMOS" DataFormatString="${0:#,0}"/>
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
                            <asp:SqlDataSource ID="datosTotalConductor4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="obtenerLiquidoMenosPrestamos" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddconductores4" Name="rut1" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddrutconductores" Name="rut2" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddconductores2" Name="rut3" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddconductores3" Name="rut4" PropertyName="SelectedValue" Type="String" />
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


    <%-- FIN PAGOS --%>
</asp:Content>


