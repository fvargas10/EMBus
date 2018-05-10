<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Caja.aspx.cs" Inherits="EMBus.Caja" %>

<%--<%@ MasterType VirtualPath="~/PaginaMaestra.Master" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="navbar" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="footer" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="jquery-2.1.4.min.js"></script>
    <script src="jspdf.debug.js"></script>
    <script src="Scripts/jquery-3.3.1.js"></script>
    <script src="Scripts/jspdf.debug.js"></script>

    <%--calcular series de 1200--%>
    <script>
        function fncAutocompletar1200() {

            var inicio = $('#footer_serieInicio1200').val(); //captura la serie inicial completa
            var fin = $('#footer_serieFin1200').val(); //capturo serie final completa

            //para calcular boletos cortados menores a 100
            var fin_digito = Number(fin.substr(fin.length - 2)); //capturo los ultimos dos digitos de la serie final
            var inicio_digito = Number(inicio.substr(inicio.length - 2)); //capturo los dos ultimos digitos de la serie inicial

            //para calcular boletos cortados mayores o iguales a 100
            var fin_digito_3 = Number(fin.substr(fin.length - 3)); //capturo ultimos 3 digitos de la serie final
            var inicio_digito_3 = Number(inicio.substr(inicio.length - 3)); // capturo ultimos 3 digitos de la s. inicio

            var resultado; //se crea esta variable para guardar el resultado de las operaciones

            //var valor_boleto = $('#footer_ddvalor1').val(); //valor del dropdown de boletos
            var valor_boleto = $('#footer_ddvalor1 option:selected').text(); //valor del dropdown de boletos            

            if (fin_digito_3 > inicio_digito_3) {
                resultado = (Number(fin_digito_3) - Number(inicio_digito_3));
                $('#footer_boletosCortados1200').val(Number(resultado));
                var bol_cortados = Number(resultado);
                $('#footer_total1200').val(Number(valor_boleto) * Number(bol_cortados));
            }

            else if (fin_digito_3 < inicio_digito_3 && Number(fin.substr(fin.length - 4)) == Number(inicio.substr(inicio.length - 4))) {
                fin_digito_3 = (Number(fin_digito_3) + 100);
                inicio_digito_3 = (Number(inicio.substr(inicio.length - 2)));
                resultado = (Number(fin_digito_3) - Number(inicio_digito_3));
                $('#footer_boletosCortados1200').val(Number(resultado));
                var bol_cortados = Number(resultado);
                $('#footer_total1200').val(Number(valor_boleto) * Number(bol_cortados));
            }

            else if (fin_digito < inicio_digito) { //primer caso, cuando la serie final es menor a la serie inicial
                resultado = ((Number(fin_digito) + 100) - Number(inicio_digito)); //calculo de los boletos cortados
                $('#footer_boletosCortados1200').val(Number(resultado)); //obtengo el resultado y lo muestro en un textbox
                var bol_cortados = Number(resultado); //guardo el resultado                              
                $('#footer_total1200').val(Number(valor_boleto) * Number(bol_cortados)); //muestro el total en dinero
            }
            else if (fin_digito > inicio_digito) { //segundo caso, cuando la serie final es menor a la serie inicial
                resultado = (Number(fin_digito) - Number(inicio_digito)); //calculo de los boletos cortados
                $('#footer_boletosCortados1200').val(Number(resultado)); //obtengo y muestro el resultado en un textbox
                var bol_cortados = Number(resultado); //guardo el resultado
                $('#footer_total1200').val(Number(valor_boleto) * Number(bol_cortados));

            }
            else if (fin_digito = inicio_digito) { //tercer caso, series de inicio y fin iguales<<< por si acaso, estas haciendo asignacion
                resultado = 0;
                $('#footer_boletosCortados1200').val(Number(resultado)); //obtengo y guardo el resultado en un textbox
                var bol_cortados = Number(resultado); //guardo el resultado
                $('#footer_total1200').val(Number(valor_boleto) * Number(bol_cortados));
            }
            fncCalcularTotalIngresos();
        }
    </script>

    <%--calcular series de 1000--%>
    <script>
        function fncAutocompletar1000() {
            var inicio = $('#footer_serieInicio1000').val(); //captura la serie inicial completa
            var fin = $('#footer_serieFin1000').val(); //capturo serie final completa

            var fin_digito = Number(fin.substr(fin.length - 2)); //capturo los ultimos dos digitos de la serie final
            var inicio_digito = Number(inicio.substr(inicio.length - 2)); //capturo los dos ultimos digitos de la serie inicial
            var resultado; //se crea esta variable para guardar el resultado de las operaciones

            //var valor_boleto = $('#footer_ddvalor2').val(); //valor del dropdown de boletos
            var valor_boleto = $('#footer_ddvalor2 option:selected').text();

            if (fin_digito < inicio_digito) { //primer caso, cuando la serie final es menor a la serie inicial
                resultado = ((Number(fin_digito) + 100) - Number(inicio_digito)); //calculo de los boletos cortados
                $('#footer_boletosCortados1000').val(Number(resultado)); //obtengo el resultado y lo muestro en un textbox
                var bol_cortados = Number(resultado); //guardo el resultado                              
                $('#footer_total1000').val(Number(valor_boleto) * Number(bol_cortados)); //muestro el total en dinero
            }
            else if (fin_digito > inicio_digito) { //segundo caso, cuando la serie final es menor a la serie inicial
                resultado = (Number(fin_digito) - Number(inicio_digito)); //calculo de los boletos cortados
                $('#footer_boletosCortados1000').val(Number(resultado)); //obtengo y muestro el resultado en un textbox
                var bol_cortados = Number(resultado); //guardo el resultado
                $('#footer_total1000').val(Number(valor_boleto) * Number(bol_cortados));

            }
            else if (fin_digito = inicio_digito) { //tercer caso, series de inicio y fin iguales<<< por si acaso, estas haciendo asignacion
                resultado = 0;
                $('#footer_boletosCortados1000').val(Number(resultado)); //obtengo y guardo el resultado en un textbox
                var bol_cortados = Number(resultado); //guardo el resultado
                $('#footer_total1000').val(Number(valor_boleto) * Number(bol_cortados));
            }
            fncCalcularTotalIngresos();
        }
    </script>

    <%--calcular series de 800--%>
    <script>
        function fncAutocompletar800() {
            var inicio = $('#footer_serieInicio800').val(); //captura la serie inicial completa
            var fin = $('#footer_serieFin800').val(); //capturo serie final completa

            var fin_digito = Number(fin.substr(fin.length - 2)); //capturo los ultimos dos digitos de la serie final
            var inicio_digito = Number(inicio.substr(inicio.length - 2)); //capturo los dos ultimos digitos de la serie inicial
            var resultado; //se crea esta variable para guardar el resultado de las operaciones

            //var valor_boleto = $('#footer_ddvalor3').val(); //valor del dropdown de boletos
            var valor_boleto = $('#footer_ddvalor3 option:selected').text();

            if (fin_digito < inicio_digito) { //primer caso, cuando la serie final es menor a la serie inicial
                resultado = ((Number(fin_digito) + 100) - Number(inicio_digito)); //calculo de los boletos cortados
                $('#footer_boletosCortados800').val(Number(resultado)); //obtengo el resultado y lo muestro en un textbox
                var bol_cortados = Number(resultado); //guardo el resultado                              
                $('#footer_total800').val(Number(valor_boleto) * Number(bol_cortados)); //muestro el total en dinero
            }
            else if (fin_digito > inicio_digito) { //segundo caso, cuando la serie final es menor a la serie inicial
                resultado = (Number(fin_digito) - Number(inicio_digito)); //calculo de los boletos cortados
                $('#footer_boletosCortados800').val(Number(resultado)); //obtengo y muestro el resultado en un textbox
                var bol_cortados = Number(resultado); //guardo el resultado
                $('#footer_total800').val(Number(valor_boleto) * Number(bol_cortados));

            }
            else if (fin_digito = inicio_digito) { //tercer caso, series de inicio y fin iguales<<< por si acaso, estas haciendo asignacion
                resultado = 0;
                $('#footer_boletosCortados800').val(Number(resultado)); //obtengo y guardo el resultado en un textbox
                var bol_cortados = Number(resultado); //guardo el resultado
                $('#footer_total800').val(Number(valor_boleto) * Number(bol_cortados));
            }
            fncCalcularTotalIngresos();
        }
    </script>

    <%--calcular series de 700--%>
    <script>
        function fncAutocompletar700() {
            var inicio = $('#footer_serieInicio700').val(); //captura la serie inicial completa
            var fin = $('#footer_serieFin700').val(); //capturo serie final completa

            var fin_digito = Number(fin.substr(fin.length - 2)); //capturo los ultimos dos digitos de la serie final
            var inicio_digito = Number(inicio.substr(inicio.length - 2)); //capturo los dos ultimos digitos de la serie inicial
            var resultado; //se crea esta variable para guardar el resultado de las operaciones

            //var valor_boleto = $('#footer_ddvalor4').val(); //valor del dropdown de boletos
            var valor_boleto = $('#footer_ddvalor4 option:selected').text();

            if (fin_digito < inicio_digito) { //primer caso, cuando la serie final es menor a la serie inicial
                resultado = ((Number(fin_digito) + 100) - Number(inicio_digito)); //calculo de los boletos cortados
                $('#footer_boletosCortados700').val(Number(resultado)); //obtengo el resultado y lo muestro en un textbox
                var bol_cortados = Number(resultado); //guardo el resultado                              
                $('#footer_total700').val(Number(valor_boleto) * Number(bol_cortados)); //muestro el total en dinero
            }
            else if (fin_digito > inicio_digito) { //segundo caso, cuando la serie final es menor a la serie inicial
                resultado = (Number(fin_digito) - Number(inicio_digito)); //calculo de los boletos cortados
                $('#footer_boletosCortados700').val(Number(resultado)); //obtengo y muestro el resultado en un textbox
                var bol_cortados = Number(resultado); //guardo el resultado
                $('#footer_total700').val(Number(valor_boleto) * Number(bol_cortados));

            }
            else if (fin_digito = inicio_digito) { //tercer caso, series de inicio y fin iguales<<< por si acaso, estas haciendo asignacion
                resultado = 0;
                $('#footer_boletosCortados700').val(Number(resultado)); //obtengo y guardo el resultado en un textbox
                var bol_cortados = Number(resultado); //guardo el resultado
                $('#footer_total700').val(Number(valor_boleto) * Number(bol_cortados));
            }
            fncCalcularTotalIngresos();
        }
    </script>

    <%--calcular series de 600 --%>
    <script>
        function fncAutocompletar600() {
            var inicio = $('#footer_serieInicio600').val(); //captura la serie inicial completa
            var fin = $('#footer_serieFin600').val(); //capturo serie final completa

            var fin_digito = Number(fin.substr(fin.length - 2)); //capturo los ultimos dos digitos de la serie final
            var inicio_digito = Number(inicio.substr(inicio.length - 2)); //capturo los dos ultimos digitos de la serie inicial
            var resultado; //se crea esta variable para guardar el resultado de las operaciones

            //var valor_boleto = $('#footer_ddvalor5').val(); //valor del dropdown de boletos
            var valor_boleto = $('#footer_ddvalor5 option:selected').text();

            if (fin_digito < inicio_digito) { //primer caso, cuando la serie final es menor a la serie inicial
                resultado = ((Number(fin_digito) + 100) - Number(inicio_digito)); //calculo de los boletos cortados
                $('#footer_boletosCortados600').val(Number(resultado)); //obtengo el resultado y lo muestro en un textbox
                var bol_cortados = Number(resultado); //guardo el resultado                              
                $('#footer_total600').val(Number(valor_boleto) * Number(bol_cortados)); //muestro el total en dinero
            }
            else if (fin_digito > inicio_digito) { //segundo caso, cuando la serie final es menor a la serie inicial
                resultado = (Number(fin_digito) - Number(inicio_digito)); //calculo de los boletos cortados
                $('#footer_boletosCortados600').val(Number(resultado)); //obtengo y muestro el resultado en un textbox
                var bol_cortados = Number(resultado); //guardo el resultado
                $('#footer_total600').val(Number(valor_boleto) * Number(bol_cortados));

            }
            else if (fin_digito = inicio_digito) { //tercer caso, series de inicio y fin iguales<<< por si acaso, estas haciendo asignacion
                resultado = 0;
                $('#footer_boletosCortados600').val(Number(resultado)); //obtengo y guardo el resultado en un textbox
                var bol_cortados = Number(resultado); //guardo el resultado
                $('#footer_total600').val(Number(valor_boleto) * Number(bol_cortados));
            }
            fncCalcularTotalIngresos();
        }
    </script>

    <%--calcular series de 500 --%>
    <script>
        function fncAutocompletar500() {
            var inicio = $('#footer_serieInicio500').val(); //captura la serie inicial completa
            var fin = $('#footer_serieFin500').val(); //capturo serie final completa

            var fin_digito = Number(fin.substr(fin.length - 2)); //capturo los ultimos dos digitos de la serie final
            var inicio_digito = Number(inicio.substr(inicio.length - 2)); //capturo los dos ultimos digitos de la serie inicial
            var resultado; //se crea esta variable para guardar el resultado de las operaciones

            //var valor_boleto = $('#footer_ddvalor6').val(); //valor del dropdown de boletos
            var valor_boleto = $('#footer_ddvalor6 option:selected').text();

            if (fin_digito < inicio_digito) { //primer caso, cuando la serie final es menor a la serie inicial
                resultado = ((Number(fin_digito) + 100) - Number(inicio_digito)); //calculo de los boletos cortados
                $('#footer_boletosCortados500').val(Number(resultado)); //obtengo el resultado y lo muestro en un textbox
                var bol_cortados = Number(resultado); //guardo el resultado                              
                $('#footer_total500').val(Number(valor_boleto) * Number(bol_cortados)); //muestro el total en dinero
            }
            else if (fin_digito > inicio_digito) { //segundo caso, cuando la serie final es menor a la serie inicial
                resultado = (Number(fin_digito) - Number(inicio_digito)); //calculo de los boletos cortados
                $('#footer_boletosCortados500').val(Number(resultado)); //obtengo y muestro el resultado en un textbox
                var bol_cortados = Number(resultado); //guardo el resultado
                $('#footer_total500').val(Number(valor_boleto) * Number(bol_cortados));

            }
            else if (fin_digito = inicio_digito) { //tercer caso, series de inicio y fin iguales<<< por si acaso, estas haciendo asignacion
                resultado = 0;
                $('#footer_boletosCortados500').val(Number(resultado)); //obtengo y guardo el resultado en un textbox
                var bol_cortados = Number(resultado); //guardo el resultado
                $('#footer_total500').val(Number(valor_boleto) * Number(bol_cortados));
            }
            fncCalcularTotalIngresos();
        }
    </script>

    <%--calcular series de 400 --%>
    <script>
        function fncAutocompletar400() {
            var inicio = $('#footer_serieInicio400').val(); //captura la serie inicial completa
            var fin = $('#footer_serieFin400').val(); //capturo serie final completa

            var fin_digito = Number(fin.substr(fin.length - 2)); //capturo los ultimos dos digitos de la serie final
            var inicio_digito = Number(inicio.substr(inicio.length - 2)); //capturo los dos ultimos digitos de la serie inicial
            var resultado; //se crea esta variable para guardar el resultado de las operaciones

            //var valor_boleto = $('#footer_ddvalor7').val(); //valor del dropdown de boletos
            var valor_boleto = $('#footer_ddvalor7 option:selected').text();

            if (fin_digito < inicio_digito) { //primer caso, cuando la serie final es menor a la serie inicial
                resultado = ((Number(fin_digito) + 100) - Number(inicio_digito)); //calculo de los boletos cortados
                $('#footer_boletosCortados400').val(Number(resultado)); //obtengo el resultado y lo muestro en un textbox
                var bol_cortados = Number(resultado); //guardo el resultado                              
                $('#footer_total400').val(Number(valor_boleto) * Number(bol_cortados)); //muestro el total en dinero
            }
            else if (fin_digito > inicio_digito) { //segundo caso, cuando la serie final es menor a la serie inicial
                resultado = (Number(fin_digito) - Number(inicio_digito)); //calculo de los boletos cortados
                $('#footer_boletosCortados400').val(Number(resultado)); //obtengo y muestro el resultado en un textbox
                var bol_cortados = Number(resultado); //guardo el resultado
                $('#footer_total400').val(Number(valor_boleto) * Number(bol_cortados));

            }
            else if (fin_digito = inicio_digito) { //tercer caso, series de inicio y fin iguales<<< por si acaso, estas haciendo asignacion
                resultado = 0;
                $('#footer_boletosCortados400').val(Number(resultado)); //obtengo y guardo el resultado en un textbox
                var bol_cortados = Number(resultado); //guardo el resultado
                $('#footer_total400').val(Number(valor_boleto) * Number(bol_cortados));
            }
            fncCalcularTotalIngresos();
        }
    </script>

    <%--calcular series de 300 --%>
    <script>
        function fncAutocompletar300() {
            var inicio = $('#footer_serieInicio300').val(); //captura la serie inicial completa
            var fin = $('#footer_serieFin300').val(); //capturo serie final completa

            var fin_digito = Number(fin.substr(fin.length - 2)); //capturo los ultimos dos digitos de la serie final
            var inicio_digito = Number(inicio.substr(inicio.length - 2)); //capturo los dos ultimos digitos de la serie inicial
            var resultado; //se crea esta variable para guardar el resultado de las operaciones

            //var valor_boleto = $('#footer_ddvalor8').val(); //valor del dropdown de boletos
            var valor_boleto = $('#footer_ddvalor8 option:selected').text();

            if (fin_digito < inicio_digito) { //primer caso, cuando la serie final es menor a la serie inicial
                resultado = ((Number(fin_digito) + 100) - Number(inicio_digito)); //calculo de los boletos cortados
                $('#footer_boletosCortados300').val(Number(resultado)); //obtengo el resultado y lo muestro en un textbox
                var bol_cortados = Number(resultado); //guardo el resultado                              
                $('#footer_total300').val(Number(valor_boleto) * Number(bol_cortados)); //muestro el total en dinero
            }
            else if (fin_digito > inicio_digito) { //segundo caso, cuando la serie final es menor a la serie inicial
                resultado = (Number(fin_digito) - Number(inicio_digito)); //calculo de los boletos cortados
                $('#footer_boletosCortados300').val(Number(resultado)); //obtengo y muestro el resultado en un textbox
                var bol_cortados = Number(resultado); //guardo el resultado
                $('#footer_total300').val(Number(valor_boleto) * Number(bol_cortados));
            }
            else if (fin_digito = inicio_digito) { //tercer caso, series de inicio y fin iguales<<< por si acaso, estas haciendo asignacion
                resultado = 0;
                $('#footer_boletosCortados300').val(Number(resultado)); //obtengo y guardo el resultado en un textbox
                var bol_cortados = Number(resultado); //guardo el resultado
                $('#footer_total300').val(Number(valor_boleto) * Number(bol_cortados));
            }
            fncCalcularTotalIngresos();
            fncCalcularTotalFinal();
        }
    </script>

    <%--################################################################################################# %>
    <%--Obtener total ingresos, que es el total bruto sin descuentos de los gastos--%>
    <%--#################################################################################################--%>
    <script>
        function fncCalcularTotalIngresos() {

            var total1200 = $('#footer_total1200').val(); //captura total1200
            var total1000 = $('#footer_total1000').val(); //captura total1000
            var total800 = $('#footer_total800').val(); //captura total800
            var total700 = $('#footer_total700').val(); //captura total700
            var total600 = $('#footer_total600').val(); //captura total600
            var total500 = $('#footer_total500').val(); //captura total500
            var total400 = $('#footer_total400').val(); //captura total400
            var total300 = $('#footer_total300').val(); //captura total300

            $('#footer_txttotalingresos').val(Number(total1200) + Number(total1000) + Number(total800) + Number(total700) + Number(total600) + Number(total500) + Number(total400) + Number(total300)); //obtiene la suma de los totales en dinero por cada fila

            //fncCalcularTotalFinal()
            //fcnSinBoletos()
        }
    </script>

    <%--Obtener total final, que hace referencia al total temporal, el total calculado en el sistema, ajeno del total entregado--%>
    <script>
        function fncCalcularTotalFinal() {

            var totalingresos = $('#footer_txttotalingresos').val(); //captura totalingresos
            var totalgastos = $('#footer_txttotalgastos').val(); //captura totalgastos
            var sinboletos = $('#footer_txtsinboletos').val(); //capturo el valor en $ de sin boletos

            $('#footer_txttotalfinal').val(Number(totalingresos) - Number(totalgastos) + Number(sinboletos)); //obtiene la resta del total ingresos menos los gastos
        }
    </script>

    <%--Obtener valor sin boletos--%>
    <script>
        function fcnSinBoletos() {

            var totalentregado = Number($('#footer_txttotalentregado').val()); //obtengo el valor en $ entregados por el conductor o aux.            
            console.log("entregado", totalentregado);

            fncCalcularTotalFinal()
            var totalfinal = Number($('#footer_txttotalfinal').val());
            console.log("totalfinal", totalfinal);

            var sinboletos = totalentregado - totalfinal;
            console.log("sin boletos:", sinboletos);

            Number($('#footer_txtsinboletos').val(totalentregado - totalfinal));

            if (sinboletos < 0) {
                $('#footer_txtsinboletos').css("color", "#FF0000");
            }
            else if (sinboletos >= 0) {
                $('#footer_txtsinboletos').css("color", "#0000CD");
            }
            //fcnBonoAuxiliar()
            //fcnTotalCaja()
        }
    </script>

    <%--Sumar Gastos--%>
    <script>
        function fncSumarGastos() {

            var petroleo = $('#footer_txtpetroleo').val(); //captura valor petroleo
            var colacion = $('#footer_txtcolaciones').val(); //captura valor colacion
            var anden = $('#footer_txtandenes').val(); //captura valor anden
            var aseo = $('#footer_txtaseo').val(); //captura valor aseo
            var mantencion = $('#footer_txtmantencion').val(); //captura valor mantencion
            var peaje = $('#footer_txtpeajes').val(); //captura valor peaje
            var noqueras = $('#footer_txtnoqueras').val(); //captura valor noqueras
            var utiles_oficina = $('#footer_txtutilesoficina').val(); //captura valor utiles de oficina

            $('#footer_txttotalgastos').val(Number(petroleo) + Number(colacion) + Number(anden) + Number(aseo) + Number(mantencion) + Number(peaje) + Number(noqueras) + Number(utiles_oficina)); //obtiene la suma de los gastos

            fncCalcularTotalFinal() //cambia el txt de total temporal
        }
    </script>

    <%--obtener Total Caja Final--%>
    <script>
        function fcnTotalCaja() {

            var totalsinboletos = $('#footer_txtsinboletos').val();
            var totalentregado = $('#footer_txttotalentregado').val();//captura valor entregado por miembro
            fncCalcularTotalFinal()
            var totaltemporal = $('#footer_txttotalfinal').val();//capturo total temporal

            if (totalentregado >= totaltemporal) {
                $('#footer_txttotalcaja').val(Number(totalentregado));
            } else {
                $('#footer_txttotalcaja').val(Number(totaltemporal));
            }
            fcnBonoConductor();
            fcnBonoAuxiliar();
        }

    </script>

    <%--Obtener Bono conductor--%>
    <script>
        function fcnBonoConductor() {

            var txttotalcaja = $('#footer_txttotalcaja').val(); //obtiene el valor total de la caja            
            $('#footer_txtbonoconductor').val(Number(txttotalcaja) * 20 / 100); //obtiene el 20% de la caja
        }
    </script>

    <%--Obtener Bono Auxiliar--%>
    <script>
        function fcnBonoAuxiliar() {

            var auxiliar = $('#footer_ddauxiliar option:selected').text();
            console.log(auxiliar);
            if (auxiliar != "Sin Auxiliar") {

                var totalentregado = Number($('#footer_txttotalentregado').val());  // obtiene el total entregado   
                console.log("total entregado:", totalentregado);

                var totalgastos = Number($('#footer_txttotalgastos').val()); // obtiene el total de gastos
                console.log("total gastos:", totalgastos);

                var resultado = totalentregado + totalgastos; //suma de gastos + totalentregado
                console.log("resultado:", resultado); //verificar en inspeccionar

                if (resultado < 200000) {
                    $('#footer_txtbonoauxiliar').val(Number(10000));
                }
                else if (resultado >= 200000 && resultado < 250000) {
                    $('#footer_txtbonoauxiliar').val(Number(15000));
                }
                else if (resultado >= 250000 && resultado < 300000) {
                    $('#footer_txtbonoauxiliar').val(Number(20000));
                }
                else if (resultado >= 300000 && resultado < 350000) {
                    $('#footer_txtbonoauxiliar').val(Number(25000));
                }
                else if (resultado >= 350000 && resultado < 400000) {
                    $('#footer_txtbonoauxiliar').val(Number(30000));
                }
            }
            else {
                $('#footer_txtbonoauxiliar').val(Number(0));
            }
        }
    </script>

    <%--#################################################################################################--%>
    <%--INICIO DE DISEÑO HTML--%>
    <%--#################################################################################################--%>

    <div class="row">
        <div class="col-md-10 col-md-offset-1 col-xs-11 col-xs-offset-1">
            <div class="col-lg-push-9">
                <div class="table-responsive">
                    <table draggable="false">
                        <tbody>
                            <tr>
                                <td style="width: 13px"></td>
                                <td>
                                    <asp:Label ID="Label17" runat="server" Text="Bus: " Style="color: #FFFFFF"></asp:Label>
                                    <asp:DropDownList ID="ddpatentebus" runat="server" class="form-control" DataSourceID="bdbus" DataTextField="PATENTE" DataValueField="PATENTE"></asp:DropDownList>
                                    <asp:SqlDataSource ID="bdbus" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="SELECT UPPER(PATENTE) AS PATENTE FROM BUS  WHERE ESTADO_BUS='True'"></asp:SqlDataSource>
                                </td>
                                <td style="width: 35px"></td>
                                <td>
                                    <asp:Label ID="Label19" runat="server" Text="Fecha: " Style="color: #FFFFFF"></asp:Label>
                                    <asp:TextBox type="date" class="form-control" ID="txtfechaarqueo" runat="server"></asp:TextBox>
                                </td>
                                <td style="width: 35px"></td>
                                <td>
                                    <asp:Label ID="Label12" runat="server" Text="Conductor: " Style="color: #FFFFFF"></asp:Label>
                                    <asp:DropDownList class="form-control" ID="ddconductor" runat="server" DataSourceID="bdconductor" DataTextField="NOMBRE" DataValueField="RUT_CON"></asp:DropDownList>
                                    <asp:SqlDataSource ID="bdconductor" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="SELECT RUT_CON, UPPER(LEFT(PRIMER_NOMBRE, 1)) + LOWER(SUBSTRING(PRIMER_NOMBRE, 2, LEN(PRIMER_NOMBRE)))
+ ' ' + UPPER(LEFT(PRIMER_APELLIDO, 1)) + LOWER(SUBSTRING(PRIMER_APELLIDO, 2, LEN(PRIMER_APELLIDO))) AS NOMBRE FROM CONDUCTOR where RUT_CON &lt;&gt;'0' AND ESTADO_CON='True'"></asp:SqlDataSource>
                                </td>
                                <td style="width: 35px"></td>
                                <td>
                                    <asp:Label ID="Label15" runat="server" Text="Auxiliar: " Style="color: #FFFFFF"></asp:Label>
                                    <asp:DropDownList class="form-control" ID="ddauxiliar" runat="server" DataSourceID="bdauxiliar" DataTextField="NOMBRE" DataValueField="RUT_AUX"></asp:DropDownList>
                                    <asp:SqlDataSource ID="bdauxiliar" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="SELECT RUT_AUX, UPPER(LEFT(PRIMER_NOMBRE, 1)) + LOWER(SUBSTRING(PRIMER_NOMBRE, 2, LEN(PRIMER_NOMBRE)))
+ ' ' + UPPER(LEFT(PRIMER_APELLIDO, 1)) + LOWER(SUBSTRING(PRIMER_APELLIDO, 2, LEN(PRIMER_APELLIDO))) AS NOMBRE FROM AUXILIAR where RUT_AUX &lt;&gt;'1' AND ESTADO_AUX='True'"></asp:SqlDataSource>
                                </td>
                                <td style="width: 35px"></td>
                                <td>
                                    <asp:Label ID="Label2" runat="server" Text="Recorrido (Ida y Vuelta): " Style="color: #FFFFFF"></asp:Label>
                                    <asp:DropDownList ID="ddnumerovueltas" AppendDataBoundItems="true" runat="server" class="form-control" Width="150px">
                                        <asp:ListItem Value="1/2 Vuelta" Text="1/2 Recorrido"></asp:ListItem>
                                        <asp:ListItem Value="1 Vuelta" Text="1 Recorrido"></asp:ListItem>
                                        <asp:ListItem Value="1 Vuelta 1/5" Text="1 Recorrido 1/2"></asp:ListItem>
                                        <asp:ListItem Value="2 Vueltas" Text="2 Recorridos"></asp:ListItem>
                                        <asp:ListItem Value="2 Vueltas 1/5" Text="2 Recorridos 1/2"></asp:ListItem>
                                        <asp:ListItem Value="3 Vueltas" Text="3 Recorridos"></asp:ListItem>
                                        <asp:ListItem Value="3 Vueltas 1/5" Text="3 Recorridos 1/2"></asp:ListItem>
                                        <asp:ListItem Value="4 Vueltas" Text="4 Recorridos"></asp:ListItem>
                                        <asp:ListItem Value="4 Vueltas 1/5" Text="4 Recorridos 1/2"></asp:ListItem>
                                        <asp:ListItem Value="5 Vueltas" Text="5 Recorridos"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 35px"></td>
                                <td>
                                    <asp:Label ID="Label16" runat="server" Text="Turno: " Style="color: #FFFFFF"></asp:Label>
                                    <asp:DropDownList ID="ddturnos" AppendDataBoundItems="true" runat="server" class="form-control">
                                        <asp:ListItem Value="1" Text="Turno 10"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="Turno 11"></asp:ListItem>
                                        <asp:ListItem Value="3" Text="Turno 12"></asp:ListItem>
                                        <asp:ListItem Value="4" Text="Turno 13"></asp:ListItem>
                                        <asp:ListItem Value="5" Text="Turno 14"></asp:ListItem>
                                        <asp:ListItem Value="6" Text="Turno 15"></asp:ListItem>
                                        <asp:ListItem Value="7" Text="Turno 16"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-10 col-md-offset-1 col-xs-10 col-xs-offset-1">
            <div class="col-lg-push-9">
                <div class="table-responsive">
                    <table draggable="false">
                        <tbody>
                            <tr>
                                <br />
                                <td style="width: 50px"></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12 col-md-offset-1 col-xs-10 col-xs-offset-1">
            <div class="col-lg-push-9">
                <table>
                    <tbody>
                        <tr>
                            <td style="width: 13px"></td>
                            <td style="width: 40px"></td>
                            <td>
                                <br />
                                <center>                                
                                    <button style="width:600px" type="button" class="btn btn-primary col-md-12" data-toggle="modal" data-target="#gastos">Administrar Gastos</button>
                                    </center>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <br />

    <div class="col-md-10 col-md-offset-1 col-xs-10 col-xs-offset-5">
        <div class="table-responsive">
            <table draggable="false">
                <thead>
                    <tr>
                        <th style="color: #FFFFFF;">Boletos ($)</th>
                        <th style="height: 22px; color: #FFFFFF;">Serie Inicio</th>
                        <th style="height: 22px; color: #FFFFFF;">Serie Fin</th>
                        <th style="height: 22px; color: #FFFFFF;">Boletos Cortados</th>
                        <th style="height: 22px; color: #FFFFFF;">Total en Dinero ($)</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="width: 90px">
                            <%--<asp:DropDownList ReadOnly="true" onkeyup="fncAutocompletar1200()" class="form-control" ID="ddvalor1" runat="server" AppendDataBoundItems="true">
                                <asp:ListItem Value="1200" Text="1200" Selected="False"></asp:ListItem>
                            </asp:DropDownList>--%>
                            <asp:DropDownList ReadOnly="true" onkeyup="fncAutocompletar1200()" class="form-control" ID="ddvalor1" runat="server" DataSourceID="datos1200" DataTextField="valor_boleto" DataValueField="ID_BOLETO"></asp:DropDownList>
                            <asp:SqlDataSource ID="datos1200" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="select valor_boleto, ID_BOLETO from BOLETO
where ID_BOLETO=1200"></asp:SqlDataSource>
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
                <tbody>
                    <tr>
                        <td style="width: 90px">
                            <asp:DropDownList ReadOnly="true" onkeyup="fncAutocompletar1000()" class="form-control" ID="ddvalor2" runat="server" DataSourceID="datos1000" DataTextField="valor_boleto" DataValueField="ID_BOLETO"></asp:DropDownList>
                            <asp:SqlDataSource ID="datos1000" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="select valor_boleto, ID_BOLETO from BOLETO
where ID_BOLETO=1000"></asp:SqlDataSource>
                        </td>
                        <td>
                            <asp:TextBox onkeyup="fncAutocompletar1000()" type="number" class="form-control" ID="serieInicio1000" placeholder="ingrese serie inicial" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox onkeyup="fncAutocompletar1000()" type="number" class="form-control" ID="serieFin1000" placeholder="ingrese serie final" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox onkeyup="fncAutocompletar1000()" type="number" class="form-control" ID="boletosCortados1000" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox onblur="fncCalcularTotalIngresos()" type="number" class="form-control" ID="total1000" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </tbody>
                <tbody>
                    <tr>
                        <td style="width: 90px">
                            <asp:DropDownList ReadOnly="true" onkeyup="fncAutocompletar800()" class="form-control" ID="ddvalor3" runat="server" AppendDataBoundItems="True" DataSourceID="datos800" DataTextField="valor_boleto" DataValueField="ID_BOLETO"></asp:DropDownList>
                            <asp:SqlDataSource ID="datos800" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="select valor_boleto, ID_BOLETO from BOLETO
where ID_BOLETO=800"></asp:SqlDataSource>
                        </td>
                        <td>
                            <asp:TextBox onkeyup="fncAutocompletar800()" type="number" class="form-control" ID="serieInicio800" placeholder="ingrese serie inicial" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox onkeyup="fncAutocompletar800()" type="number" class="form-control" ID="serieFin800" placeholder="ingrese serie final" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox onkeyup="fncAutocompletar800()" type="number" class="form-control" ID="boletosCortados800" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox onblur="fncCalcularTotalIngresos()" type="number" class="form-control" ID="total800" runat="server"></asp:TextBox>
                        </td>
                        <td style="width: 70px"></td>
                        <td style="width: 120px">
                            <asp:Label ID="Label3" runat="server" Text="Total Entregado ($)" ForeColor="#009900"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox onblur="fcnSinBoletos()" type="number" class="form-control" ID="txttotalentregado" runat="server" BorderColor="Green"></asp:TextBox>
                        </td>
                    </tr>
                </tbody>
                <tbody>
                    <tr>
                        <td style="width: 90px">
                            <asp:DropDownList ReadOnly="true" onkeyup="fncAutocompletar700()" class="form-control" ID="ddvalor4" runat="server" AppendDataBoundItems="True" DataSourceID="datos700" DataTextField="valor_boleto" DataValueField="ID_BOLETO"></asp:DropDownList>
                            <asp:SqlDataSource ID="datos700" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="select valor_boleto, ID_BOLETO from BOLETO
where ID_BOLETO=700"></asp:SqlDataSource>
                        </td>
                        <td>
                            <asp:TextBox onkeyup="fncAutocompletar700()" type="number" class="form-control" ID="serieInicio700" placeholder="ingrese serie inicial" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox onkeyup="fncAutocompletar700()" type="number" class="form-control" ID="serieFin700" placeholder="ingrese serie final" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox onkeyup="fncAutocompletar700()" type="number" class="form-control" ID="boletosCortados700" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox onblur="fncCalcularTotalIngresos()" type="number" class="form-control" ID="total700" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </tbody>
                <tbody>
                    <tr>
                        <td style="width: 90px">
                            <asp:DropDownList ReadOnly="true" onkeyup="fncAutocompletar600()" class="form-control" ID="ddvalor5" runat="server" AppendDataBoundItems="True" DataSourceID="datos600" DataTextField="valor_boleto" DataValueField="ID_BOLETO"></asp:DropDownList>
                            <asp:SqlDataSource ID="datos600" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="select valor_boleto, ID_BOLETO from BOLETO
where ID_BOLETO=600"></asp:SqlDataSource>
                        </td>
                        <td>
                            <asp:TextBox onkeyup="fncAutocompletar600()" type="number" class="form-control" ID="serieInicio600" placeholder="ingrese serie inicial" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox onkeyup="fncAutocompletar600()" type="number" class="form-control" ID="serieFin600" placeholder="ingrese serie final" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox onkeyup="fncAutocompletar600()" type="number" class="form-control" ID="boletosCortados600" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox onblur="fncCalcularTotalIngresos()" type="number" class="form-control" ID="total600" runat="server"></asp:TextBox>
                        </td>
                        <td style="width: 70px"></td>
                        <td style="width: 120px">
                            <asp:Label ID="Label4" runat="server" Text="Sin Boletos ($)" ForeColor="White"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox onkeyup="fcnSinBoletos()" type="number" class="form-control" ID="txtsinboletos" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </tbody>
                <tbody>
                    <tr>
                        <td style="width: 90px">
                            <asp:DropDownList ReadOnly="true" onkeyup="fncAutocompletar500()" class="form-control" ID="ddvalor6" runat="server" AppendDataBoundItems="True" DataSourceID="datos500" DataTextField="valor_boleto" DataValueField="ID_BOLETO"></asp:DropDownList>
                            <asp:SqlDataSource ID="datos500" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="select valor_boleto, ID_BOLETO from BOLETO
where ID_BOLETO=500"></asp:SqlDataSource>
                        </td>
                        <td>
                            <asp:TextBox onkeyup="fncAutocompletar500()" type="number" class="form-control" ID="serieInicio500" placeholder="ingrese serie inicial" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox onkeyup="fncAutocompletar500()" type="number" class="form-control" ID="serieFin500" placeholder="ingrese serie final" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox onkeyup="fncAutocompletar500()" type="number" class="form-control" ID="boletosCortados500" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox onblur="fncCalcularTotalIngresos()" type="number" class="form-control" ID="total500" runat="server"></asp:TextBox>
                        </td>
                        <td style="width: 90px"></td>
                        <td>
                            <span style="color: #f00" class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                            <asp:Label ID="Label7" ForeColor="Red" runat="server" Text="Falta dinero"></asp:Label>
                        </td>
                        <td>
                            <span style="color: #0026ff" class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                            <asp:Label ID="Label9" ForeColor="#0026ff" runat="server" Text="Sobra dinero"></asp:Label>
                        </td>
                    </tr>
                </tbody>
                <tbody>
                    <tr>
                        <td style="width: 90px">
                            <asp:DropDownList ReadOnly="true" onkeyup="fncAutocompletar400()" class="form-control" ID="ddvalor7" runat="server" AppendDataBoundItems="True" DataSourceID="datos400" DataTextField="valor_boleto" DataValueField="ID_BOLETO"></asp:DropDownList>
                            <asp:SqlDataSource ID="datos400" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="select valor_boleto, ID_BOLETO from BOLETO
where ID_BOLETO=400"></asp:SqlDataSource>
                        </td>
                        <td>
                            <asp:TextBox onkeyup="fncAutocompletar400()" type="number" class="form-control" ID="serieInicio400" placeholder="ingrese serie inicial" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox onkeyup="fncAutocompletar400()" type="number" class="form-control" ID="serieFin400" placeholder="ingrese serie final" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox onkeyup="fncAutocompletar400()" type="number" class="form-control" ID="boletosCortados400" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox onblur="fncCalcularTotalIngresos()" type="number" class="form-control" ID="total400" runat="server"></asp:TextBox>
                        </td>
                        <td style="width: 70px"></td>
                        <td style="width: 120px">
                            <asp:Label ID="Label6" runat="server" Text="Total Temporal ($)" ForeColor="White"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox type="number" class="form-control" ID="txttotalfinal" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </tbody>
                <tbody>
                    <tr>
                        <td style="width: 90px">
                            <asp:DropDownList ReadOnly="true" onkeyup="fncAutocompletar300()" class="form-control" ID="ddvalor8" runat="server" AppendDataBoundItems="True" DataSourceID="datos300" DataTextField="valor_boleto" DataValueField="ID_BOLETO"></asp:DropDownList>
                            <asp:SqlDataSource ID="datos300" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringEmbus %>" SelectCommand="select valor_boleto, ID_BOLETO from BOLETO
where ID_BOLETO=300"></asp:SqlDataSource>
                        </td>
                        <td>
                            <asp:TextBox onkeyup="fncAutocompletar300()" type="number" class="form-control" ID="serieInicio300" placeholder="ingrese serie inicial" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox onkeyup="fncAutocompletar300()" type="number" class="form-control" ID="serieFin300" placeholder="ingrese serie final" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox onkeyup="fncAutocompletar300()" type="number" class="form-control" ID="boletosCortados300" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox onblur="fncCalcularTotalIngresos()" type="number" class="form-control" ID="total300" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </tbody>
                <tbody>
                    <tr>
                        <td style="width: 90px"></td>
                        <td style="width: 170px">
                            <br />
                            <asp:Label ID="Label21" runat="server" Text="Porcentaje Conductor ($): " Style="color: #FFFFFF"></asp:Label>
                        </td>
                        <td style="width: 170px">
                            <br />
                            <asp:TextBox onblur="fcnBonoConductor()" ID="txtbonoconductor" runat="server" class="form-control"></asp:TextBox>
                        </td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label23" runat="server" Text="Bono Auxiliar ($): " Style="color: #FFFFFF; text-align: right;"></asp:Label>
                        </td>
                        <td>
                            <br />
                            <asp:TextBox onblur="fcnBonoAuxiliar()" ID="txtbonoauxiliar" runat="server" class="form-control"></asp:TextBox>
                        </td>
                        <td style="width: 70px"></td>
                        <td style="width: 120px">

                            <br />
                            <asp:Label ID="Label8" runat="server" Text="Total Caja ($)" ForeColor="White"></asp:Label>
                        </td>
                        <td>
                            <br />
                            <asp:TextBox onblur="fcnTotalCaja()" type="number" class="form-control" ID="txttotalcaja" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </tbody>
                <tbody>
                    <tr>
                        <td style="width: 90px"></td>
                        <td>
                            <br />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

    </div>


    <br />
    <br />

    <!-- Modal -->
    <div class="container">
        <!-- Modal -->
        <div class="modal fade" id="gastos" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content" style="background-color: #96C1FF">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Descripción de Gastos del día</h4>
                    </div>
                    <div class="modal-body">
                        <p>Complete los campos asosiados a los gastos</p>

                        <div class="table-responsive">
                            <center>
                                            <table class="table-condensed">
                                                <tr>
                                                    <td>
                                                        <asp:DropDownList ID="ddpetroleo" ReadOnly="true" AppendDataBoundItems="true" runat="server" class="form-control">
                                                            <asp:ListItem Value="0" Text="Petróleo"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td style="width: 100px">
                                                        <asp:TextBox onkeyup="fncSumarGastos()" placeholder="Valor" ID="txtpetroleo" runat="server" class="form-control" required="required" MaxLength="6" type="number"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <textarea style="resize:none" name="txtobservacionespetroleo" id="txtobservacionespetroleo" placeholder="Observaciónes y/o detalle" rows="2" cols="20" class="form-control" draggable="false" runat="server"></textarea>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:DropDownList ID="ddandenes" ReadOnly="true" AppendDataBoundItems="true" runat="server" class="form-control">
                                                            <asp:ListItem Value="1" Text="Andénes"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox onkeyup="fncSumarGastos()" placeholder="Valor" ID="txtcolaciones" runat="server" class="form-control" required="required" MaxLength="6" type="number"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <textarea style="resize:none" name="txtobservacionesandenes" id="txtobservacionesandenes" placeholder="Observaciónes y/o detalle" rows="2" cols="20" class="form-control" runat="server"></textarea>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:DropDownList ID="ddcolaciones" ReadOnly="true" AppendDataBoundItems="true" runat="server" class="form-control">
                                                            <asp:ListItem Value="2" Text="Colación"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox onkeyup="fncSumarGastos()" placeholder="Valor" ID="txtandenes" runat="server" class="form-control" required="required" MaxLength="6" type="number"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <textarea style="resize:none" name="txtobservacionescolaciones" id="txtobservacionescolaciones" placeholder="Observaciónes y/o detalle" rows="2" cols="20" class="form-control" runat="server"></textarea>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:DropDownList ID="ddaseo" ReadOnly="true" DataBoundItems="true" runat="server" class="form-control">
                                                            <asp:ListItem Value="3" Text="Aseo"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox onkeyup="fncSumarGastos()" placeholder="Valor" ID="txtaseo" runat="server" class="form-control" MaxLength="6" type="number"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <textarea style="resize:none" name="txtobservacionesaseo" id="txtobservacionesaseo" placeholder="Observaciónes y/o detalle" rows="2" cols="20" class="form-control" runat="server"></textarea>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:DropDownList ID="ddmantencion" ReadOnly="true" AppendDataBoundItems="true" runat="server" class="form-control">
                                                            <asp:ListItem Value="4" Text="Mantención"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox onkeyup="fncSumarGastos()" placeholder="Valor" ID="txtmantencion" runat="server" class="form-control" MaxLength="6" type="number"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <textarea style="resize:none" name="txtobservacionesmantencion" id="txtobservacionesmantencion" placeholder="Observaciónes y/o detalle" rows="2" cols="20" class="form-control" runat="server"></textarea>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:DropDownList ID="ddpeajes" ReadOnly="true" AppendDataBoundItems="true" runat="server" class="form-control">
                                                            <asp:ListItem Value="5" Text="Peajes"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox onkeyup="fncSumarGastos()" placeholder="Valor" ID="txtpeajes" runat="server" class="form-control" MaxLength="6" type="number"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <textarea style="resize:none" name="txtobservacionespeajes" id="txtobservacionespeajes" placeholder="Observaciónes y/o detalle" rows="2" cols="20" class="form-control" runat="server"></textarea>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:DropDownList ID="ddnoqueras" ReadOnly="true" AppendDataBoundItems="true" runat="server" class="form-control">
                                                            <asp:ListItem Value="6" Text="Noqueras"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox onkeyup="fncSumarGastos()" placeholder="Valor" ID="txtnoqueras" runat="server" class="form-control" MaxLength="6" type="number"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <textarea style="resize:none" name="txtobservacionesnoqueras" id="txtobservacionesnoqueras" placeholder="Observaciónes y/o detalle" rows="2" cols="20" class="form-control" runat="server"></textarea>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:DropDownList ID="ddutilesoficina" ReadOnly="true" AppendDataBoundItems="true" runat="server" class="form-control">
                                                            <asp:ListItem Value="7" Text="Útiles de Oficina"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox onkeyup="fncSumarGastos()" placeholder="Valor" ID="txtutilesoficina" runat="server" class="form-control" MaxLength="6" type="number"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <textarea style="resize:none" name="txtobservacionesutiles" id="txtobservacionesutiles" placeholder="Observaciónes y/o detalle" rows="2" cols="30" class="form-control" runat="server"></textarea>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label5" runat="server" Text="Total Gastos ($)" Font-Size="Medium"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox onblur="fncCalcularTotalFinal()" ID="txttotalgastos" runat="server" class="form-control" MaxLength="6" type="number"></asp:TextBox>
                                                    </td>

                                                </tr>
                                            </table>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Volver</button>
                    </div>
                </div>
            </div>
        </div>
        <asp:Button ID="btnagregarcaja" runat="server" class="btn btn-success col-md-12" Text="Guardar Cambios y Crear PDF" OnClick="btnagregarcaja_Click"></asp:Button>
    </div>

    <script>
        function DescargarPDF(ContenidoID, nombre) {
            var pdf = new jsPDF('p', 'pt', 'letter');
            html = $('#' + ContenidoID).html();
            specialElementHandlers = {};
            margins = { top: 10, bottom: 20, left: 20, width: 522 };
            pdf.fromHTML(html, margins.left, margins.top, { 'width': margins.width }, function (dispose) { pdf.save(nombre + '.pdf'); }, margins);
        }
    </script>

</asp:Content>

