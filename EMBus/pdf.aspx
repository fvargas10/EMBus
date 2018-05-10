<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pdf.aspx.cs" Inherits="EMBus.pdf" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script src="jquery-2.1.4.min.js"></script>
    <script src="jspdf.debug.js"></script>
    <script src="Scripts/jquery-3.3.1.js"></script>
    <script src="Scripts/jspdf.debug.js"></script>
</head>
<body>
    <form id="form1" runat="server">


        <div id="Reporte">
            <div class="col-md-10 col-md-offset-1 col-xs-10 col-xs-offset-5">
                <div class="table-responsive">
                    <table draggable="false">
                        
                        <tbody>
                            <tr>
                                <td style="width: 90px">
                                    <asp:DropDownList ReadOnly="true" onkeyup="fncAutocompletar1200()" class="form-control" ID="ddvalor1" runat="server" AppendDataBoundItems="true">
                                        <asp:ListItem Value="1200" Text="1200" Selected="False"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:TextBox onkeyup="fncAutocompletar1200()" type="number" class="form-control" ID="serieInicio1200" runat="server" placeholder="ingrese serie inicial"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox onkeyup="fncAutocompletar1200()" type="number" class="form-control" ID="serieFin1200" runat="server" placeholder="ingrese serie final"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox onkeyup="fncAutocompletar1200()" type="number" class="form-control" ID="boletosCortados1200" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox onblur="fncCalcularTotalIngresos()" type="number" class="form-control" ID="total1200" runat="server"></asp:TextBox>
                                </td>
                                <td style="width: 70px"></td>
                                <td style="width: 120px">
                                    <asp:Label ID="Label1" runat="server" Text="Total Ingresos ($)" ForeColor="White"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox onblur="fncCalcularTotalFinal()" type="number" class="form-control" ID="txttotalingresos" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                        </tbody>                        
                    </table>
                </div>
                <input type="button" onclick="DescargarPDF('Reporte', 'ReporteASP')" value="Decargar Reporte" />
            </div>

        </div>

    </form>
    <script>
        function DescargarPDF(ContenidoID, nombre) {
            var pdf = new jsPDF('p', 'pt', 'letter');
            html = $('#' + ContenidoID).html();
            specialElementHandlers = {};
            margins = { top: 10, bottom: 20, left: 20, width: 522 };
            pdf.fromHTML(html, margins.left, margins.top, { 'width': margins.width }, function (dispose) { pdf.save(nombre + '.pdf'); }, margins);
        }
    </script>
</body>
</html>
