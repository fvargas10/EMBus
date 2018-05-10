<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Prestamos.aspx.cs" Inherits="EMBus.Prestamos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="navbar" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="footer" runat="server">

    <div class="row">
        <div class="col-md-10 col-md-offset-1 col-xs-10 col-xs-offset-1">
            <div class="col-lg-push-12">
                <h2 style="color: #fff">Agregar Préstamo</h2>
                <br />

                <div class="col-xs-6 col-md-4 form-group">
                    <label class="control-label">Seleccione Trabajador</label>
                    <asp:DropDownList ID="ddTrabajadores" class="form-control" runat="server" DataSourceID="datosTrabajadores" DataTextField="NOMBRE_TRABAJADOR" DataValueField="RUT_TRABAJADOR"></asp:DropDownList>
                    <asp:SqlDataSource ID="datosTrabajadores" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="select RUT_CON as RUT_TRABAJADOR, UPPER(PRIMER_NOMBRE+ ' ' + ' ' + SEGUNDO_NOMBRE + ' ' + PRIMER_APELLIDO+ ' ' + SEGUNDO_APELLIDO)   as NOMBRE_TRABAJADOR
  from CONDUCTOR WHERE RUT_CON &lt;&gt; '0'
 union all
select RUT_AUX, UPPER(PRIMER_NOMBRE+ ' ' + ' ' + SEGUNDO_NOMBRE + ' ' + PRIMER_APELLIDO+ ' ' + SEGUNDO_APELLIDO) 
  from AUXILIAR WHERE RUT_AUX &lt;&gt; '0' AND RUT_AUX &lt;&gt; '1'"></asp:SqlDataSource>
                </div>

                <div class="col-xs-6 col-md-2 form-group">
                    <label class="control-label">Fecha Préstamos</label>
                    <asp:TextBox ID="txtfechaprestamo" class="form-control" runat="server" TextMode="Date"></asp:TextBox>
                </div>

                <div class="col-xs-6 col-md-2 form-group">
                    <label class="control-label">Valor Préstamos</label>
                    <asp:TextBox ID="txtvalorprestamo" class="form-control" runat="server" TextMode="Number"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="validaprestamo" runat="server" ControlToValidate="txtvalorprestamo"
                        ErrorMessage="*Debe ingresar un monto válido Ej: 10000" ValidationExpression="^\d+$" ForeColor="Red"></asp:RegularExpressionValidator>
                    <br />
                </div>

                <div class="col-md-12">
                    <asp:Button class="btn btn-success nextBtn btn-lg pull-right" type="button" ID="btnguardarprestamo" runat="server" Text="Guardar Préstamo" OnClick="btnguardarprestamo_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
