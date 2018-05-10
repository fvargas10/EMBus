<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="ActualizarClave.aspx.cs" Inherits="EMBus.ActualizarClave" %>
<asp:Content ID="Content1" ContentPlaceHolderID="navbar" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="footer" runat="server">

    <div class="row">
        <div class="col-md-10 col-md-offset-1 col-xs-10 col-xs-offset-1">
            <div class="col-lg-push-9">
                <h2 style="color: #fff">Modifique su Clave</h2>
                <br />
            </div>
            <div class="row">
                <div class="col-md-4 form-group">
                    <label class="control-label">Ingrese su clave actual</label>
                    <asp:TextBox runat="server" ID="txt_clave_actual" class="form-control" required="required" TextMode="Password"></asp:TextBox>
                    <br />
                </div>   
                
                <div class="col-md-4 form-group">
                    <label class="control-label">Ingrese su nueva clave</label>
                    <asp:TextBox runat="server" ID="txt_clave_nueva" class="form-control" required="required" TextMode="Password"></asp:TextBox>
                    <br />
                </div>   

                <div class="col-md-4 form-group">
                    <label class="control-label">Vuelva a ingresar su nueva clave</label>
                    <asp:TextBox runat="server" ID="txt_clave_nueva_repeticion" class="form-control" required="required" TextMode="Password"></asp:TextBox>
                    <br />
                </div>          

                <div class="col-md-12">
                    <asp:Button class="btn btn-success nextBtn btn-lg pull-right" type="button" ID="btnrecuperarclave" runat="server" Text="Actualizar" OnClick="btnrecuperarclave_Click" />                    
                    <asp:Label ID="labelrutusuario" runat="server" Text="Label" Visible="false"></asp:Label>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
