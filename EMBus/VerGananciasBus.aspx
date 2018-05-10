<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="VerGananciasBus.aspx.cs" Inherits="EMBus.VerGananciasBus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="navbar" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="footer" runat="server">

    <div class="row">
        <div class="col-md-10 col-md-offset-1 col-xs-10 col-xs-offset-1">
            <div class="col-lg-push-9">
                <h2 style="color: #fff">Ver ganancias por Bus</h2>
                <br />

                <div class="col-xs-6 col-md-4 form-group">
                    <label class="control-label">Seleccione fecha desde</label>
                    <asp:TextBox class="form-control" ID="txtfechadesde" runat="server" TextMode="Date"></asp:TextBox>
                </div>

                <div class="col-xs-6 col-md-4 form-group">
                    <label class="control-label">Seleccione fecha hasta</label>
                    <asp:TextBox class="form-control" ID="txtfrchahasta" runat="server" TextMode="Date"></asp:TextBox>
                </div>

                <div class="col-xs-6 col-md-4 form-group">
                    <label class="control-label">Ver ganancias</label>
                    <br />
                    <asp:Button ID="btnmostrarganancias" class="btn btn-success" runat="server" Text="Ver Gráfico" OnClick="btnmostrarganancias_Click" Width="210px" />
                </div>

            </div>
        </div>
    </div>

    <center>
    <asp:Chart ID="graficoVentasPorBus" CssClass="table  table-bordered table-condensed table-responsive" runat="server" DataSourceID="datosGananciasPorBus" Height="500px" Width="900px" BackGradientStyle="Center" BackImageWrapMode="Scaled" BackSecondaryColor="LightSeaGreen" BorderlineDashStyle="Solid" BorderlineWidth="2" Palette="Fire" RightToLeft="Yes" BorderlineColor="LightSeaGreen">
        <Series>
            <asp:Series Name="Ingresos" XValueMember="BUS" YValueMembers="INGRESOS" ></asp:Series>
            <asp:Series ChartArea="ChartArea1" Name="Gastos" XValueMember="BUS" YValueMembers="GASTOS">
            </asp:Series>
            <asp:Series ChartArea="ChartArea1" Name="Ganancia" XValueMember="BUS" YValueMembers="GANANCIAS">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
        </ChartAreas>
        <Legends>
            <asp:Legend AutoFitMinFontSize="10" BorderColor="Black" Name="Legend1">
            </asp:Legend>
        </Legends>
        <Titles>
            <asp:Title Alignment="TopCenter" Name="Title1" Text="GANANCIAS VS GASTOS POR BUS" Font="Arial, 9.75pt, style=Bold" ShadowColor="White">
            </asp:Title>
            <asp:Title Docking="Left" Name="Title2" Text="GANANCIAS / GASTOS ($)" Font="Arial, 9.75pt, style=Bold">
            </asp:Title>
            <asp:Title Docking="Bottom" Name="Title3" Text="PATENTES" Font="Arial, 9.75pt, style=Bold">
            </asp:Title>
        </Titles>
        <BorderSkin BorderColor="Transparent" />
    </asp:Chart>
        <asp:SqlDataSource ID="datosGananciasPorBus" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="select SUM(distinct TOTAL_FINAL) AS INGRESOS,SUM(distinct TOTAL_GASTOS) as GASTOS, PATENTE AS BUS, 
SUM(DISTINCT TOTAL_FINAL)-SUM(DISTINCT TOTAL_GASTOS) AS GANANCIAS
from ARQUEO
where TOTAL_FINAL&lt;&gt;0 and FECHA_ARQUEO between @fecha_desde and @fecha_hasta
GROUP BY PATENTE">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtfechadesde" Name="fecha_desde" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtfrchahasta" Name="fecha_hasta" PropertyName="Text" />
            </SelectParameters>
                </asp:SqlDataSource>
    </center>

</asp:Content>
