<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="EMBus.Inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="navbar" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="footer" runat="server">

    <link rel="stylesheet" href="css/style.css" />

    <center> 
        <br />
        <br />
        <br />
        <br />      
        <br />  
        <img src="img/logo2.png" class="img-responsive" style="width:40%" >
        <br />
        <br />
        <br />
        <img src="img/titulo.png" class="img-responsive" style="width:70%"/>
        <br />
        <br />
   </center>
    <asp:Label ID="txt_rut_usuario" runat="server" Text="Label" Visible="false"></asp:Label>

    <footer class="navbar navbar-fixed-bottom" id="contacto" style="background-color: #4682B4; padding-bottom: 20px;">
        <br />
        <div>
            <small style="color: white" class="pull-left">&copy; EMBus Los Muermos 2018</small>
            <small style="color: white" class="pull-right"><i>#fvargas-dev</i></small>

            <br />
            <small style="color: white" class="pull-right"><i>Contacto: +56996755909</i></small>
            <br />
            <small style="color: white" class="pull-right"><i>Francisco Vargas Sandoval</i></small>


        </div>
    </footer>

</asp:Content>
