<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="FlujoDeCaja.aspx.cs" Inherits="EMBus.FlujoDeCaja" %>

<asp:Content ID="Content1" ContentPlaceHolderID="navbar" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="footer" runat="server">

    <div class="row">
        <div class="col-md-10 col-md-offset-1 col-xs-10 col-xs-offset-1">
            <div class="col-lg-push-12">
                <h2 style="color: #fff">Flujo de Caja</h2>
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

            <div class="col-xs-6 col-md-2 form-group">
                <label class="control-label">Patente</label>
                <asp:DropDownList ID="ddpatente" class="form-control" runat="server" DataSourceID="datospatentes" DataTextField="PATENTE" DataValueField="PATENTE"></asp:DropDownList>
                <asp:SqlDataSource ID="datospatentes" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="SELECT UPPER(PATENTE) AS PATENTE FROM BUS WHERE ESTADO_BUS='TRUE'"></asp:SqlDataSource>
                <br />
            </div>

            <div class="col-xs-6 col-md-3 form-group">
                <label class="control-label">Buscar</label>
                <asp:Button ID="btnmostrarflujocaja" class="form-control btn-success" runat="server" Text="Generar Flujo de Caja" OnClick="btnmostrarflujocaja_Click" />
                <br />
            </div>

        </div>
    </div>

    <div class="container">
        <asp:GridView ID="gridFC" CssClass="table table-striped table-bordered table-condensed" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="datosFC" ForeColor="#333333" GridLines="None" AllowSorting="True">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="FECHA" HeaderText="FECHA" ReadOnly="True" SortExpression="FECHA" />
                <asp:BoundField DataField="PATENTE" HeaderText="PATENTE" SortExpression="PATENTE" Visible="False" />
                <asp:BoundField DataField="INGRESOS" HeaderText="INGRESOS" SortExpression="INGRESOS" />
                <asp:BoundField DataField="EGRESOS" HeaderText="EGRESOS" SortExpression="EGRESOS" />
                <asp:BoundField DataField="LIQUIDO" HeaderText="LIQUIDO" ReadOnly="True" SortExpression="LIQUIDO" />
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
        <asp:SqlDataSource ID="datosFC" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="SELECT DISTINCT FORMAT (FECHA_ARQUEO, 'dd-MM-yyyy') AS FECHA, PATENTE AS PATENTE, TOTAL_FINAL AS INGRESOS, 
TOTAL_GASTOS AS EGRESOS, TOTAL_FINAL - TOTAL_GASTOS AS LIQUIDO
FROM ARQUEO
where TOTAL_FINAL&lt;&gt;0 and FECHA_ARQUEO BETWEEN @fecha_desde AND @fecha_hasta and PATENTE=@patente
ORDER BY PATENTE">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtfechadesde" Name="fecha_desde" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtfechahasta" Name="fecha_hasta" PropertyName="Text" />
                <asp:ControlParameter ControlID="ddpatente" Name="patente" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>

    <div class="row">
        <div class="col-md-10 col-md-offset-1 col-xs-10 col-xs-offset-1">
            <div class="col-xs-6 col-md-3 form-group">
                <label class="control-label">Buscar</label>
                <asp:Button ID="btnexportarpdf" class="form-control btn-success" runat="server" Text="Generar PDF" OnClick="btnexportarpdf_Click" />
                <br />
            </div>
        </div>
    </div>


</asp:Content>
