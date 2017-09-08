<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="CrearOficina.aspx.cs" Inherits="EMBus.CrearOficina" %>

<asp:Content ID="Content1" ContentPlaceHolderID="navbar" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="footer" runat="server">
    
    <link rel="stylesheet" href="css/style.css" />
    <img id="banner" class="img-responsive" src="img/inicio2.jpg" />
    
    <div class="col-sm-4" id="wrapper">
        <asp:Label ID="Label1" runat="server" Text="Administrador"></asp:Label> 
        <asp:DropDownList ID="ddadmin" runat="server"></asp:DropDownList>
    </div>
       
    

</asp:Content>
