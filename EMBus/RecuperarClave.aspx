<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="RecuperarClave.aspx.cs" Inherits="EMBus.RecuperarClave" %>

<asp:Content ID="Content1" ContentPlaceHolderID="navbar" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="footer" runat="server">

    <div class="row">
        <div class="col-md-10 col-md-offset-1 col-xs-10 col-xs-offset-1">
            <div class="col-lg-push-9">
                <h2 style="color: #fff">Recuperar Clave</h2>
                <br />
                <h4 style="color: #fff">Importante! Si olvidaste tu clave de acceso, rellena el campo de a continuación para obtener una nueva</h4>
                <br />
            </div>
            <div class="row">
                <div class="col-md-6 form-group">
                    <label class="control-label">Ingrese Rut</label>
                    <asp:TextBox runat="server" ID="txt_rut_usuario" class="form-control" placeholder="12345678-9" MaxLength="10" required="required"></asp:TextBox>
                    <br />
                </div>                

                <div class="col-md-12">
                    <asp:Button class="btn btn-success nextBtn btn-lg pull-right" type="button" ID="btnrecuperarclave" runat="server" Text="Recuperar" OnClick="btnrecuperarclave_Click" />

                </div>
            </div>
        </div>
    </div>

</asp:Content>
