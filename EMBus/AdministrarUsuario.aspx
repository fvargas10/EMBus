<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="AdministrarUsuario.aspx.cs" Inherits="EMBus.AdministrarUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="navbar" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="footer" runat="server">

    <script src="Scripts/rut.js"></script>
    <asp:ScriptManager ID="SM" runat="server"></asp:ScriptManager>

    <div class="row">
        <div class="col-md-10 col-md-offset-1 col-xs-10 col-xs-offset-1">
            <div class="col-lg-push-9">
                <h2 style="color: #fff">Agregar un nuevo Contador</h2>
                <br />
                <h4 style="color: #fff">Recuerde que su contraseña será su propio rut sin puntos, ni guión, ni dígito verificador. Posterior a esto, podrá actualizarla.</h4>
                <br />
            </div>
            <div class="row">
                <div class="col-md-6 form-group">
                    <label class="control-label">Ingrese Rut del Contador</label>
                    <asp:TextBox runat="server" ID="txt_rut_usuario" class="form-control" placeholder="12345678-9" MaxLength="10" required="required"></asp:TextBox>
                    <asp:CustomValidator ID="validaRutContador" runat="server"
                        ClientValidationFunction="validar_rut" ControlToValidate="txt_rut_usuario"
                        Display="Dynamic" ErrorMessage="*Ingrese un rut valido Ej: 10432967-4" SetFocusOnError="True" ForeColor="Red"></asp:CustomValidator>
                    <br />
                </div>

                <div class="col-md-6 form-group">
                    <label class="control-label">
                        Ingrese Primer Nombre del Contador
                    </label>
                    <asp:TextBox runat="server" ID="txt_primer_nombre" class="form-control" placeholder="Juan" required="required"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="validaPrimerNombre" ControlToValidate="txt_primer_nombre" runat="server" ErrorMessage="Ingrese solo letras" ValidationExpression="[a-zA-ZñÑáéíóúÁÉÍÓÚ ]*$" ForeColor="Red"></asp:RegularExpressionValidator>
                    <br />
                </div>

                <div class="col-md-6 form-group">
                    <label class="control-label">
                        Ingrese Segundo Nombre del Contador
                    </label>
                    <asp:TextBox runat="server" ID="txt_segundo_nombre" class="form-control" placeholder="Pedro" required="required"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="validaSegundoNombre" ControlToValidate="txt_segundo_nombre" runat="server" ErrorMessage="Ingrese solo letras" ValidationExpression="[a-zA-ZñÑáéíóúÁÉÍÓÚ ]*$" ForeColor="Red"></asp:RegularExpressionValidator>
                    <br />
                </div>

                <div class="col-md-6 form-group">
                    <label class="control-label">
                        Ingrese Primer Apellido del Contador
                    </label>
                    <asp:TextBox runat="server" ID="txt_primer_apellido" class="form-control" placeholder="Jara" required="required"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="validaPrimerApellido" ControlToValidate="txt_primer_apellido" runat="server" ErrorMessage="Ingrese solo letras" ValidationExpression="[a-zA-ZñÑáéíóúÁÉÍÓÚ ]*$" ForeColor="Red"></asp:RegularExpressionValidator>

                    <br />
                </div>

                <div class="col-md-6 form-group">
                    <label class="control-label">
                        Ingrese Segundo Apellido del Contador
                    </label>
                    <asp:TextBox runat="server" ID="txt_segundo_apellido" class="form-control" placeholder="Mora" required="required"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="validaSegundoApellido" ControlToValidate="txt_segundo_apellido" runat="server" ErrorMessage="Ingrese solo letras" ValidationExpression="[a-zA-ZñÑáéíóúÁÉÍÓÚ ]*$" ForeColor="Red"></asp:RegularExpressionValidator>
                    <br />
                </div>

                <div class="col-md-6 form-group">
                    <label class="control-label">
                        Ingrese Teléfono de Contacto
                    </label>
                    <asp:TextBox runat="server" ID="txt_telefono" class="form-control" placeholder="Ej: 988776655" required="required" MaxLength="9"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="validaTelefonoContador" runat="server" ControlToValidate="txt_telefono" ErrorMessage="Debe ingresar un teléfono válido Ej: 988776655" ValidationExpression="^\d+$" ForeColor="Red">
                    </asp:RegularExpressionValidator>
                    <br />
                </div>

                <div class="col-md-6 form-group">
                    <label class="control-label">
                        Ingrese Dirección del Contador
                    </label>
                    <asp:TextBox runat="server" ID="txt_direccion" class="form-control" placeholder="Ej: Pasaje 500" required="required"></asp:TextBox>
                    <br />
                </div>

                <div class="col-md-6 form-group">
                    <label class="control-label">
                        Ingrese Correo electrónico
                    </label>
                    <asp:TextBox runat="server" ID="txt_correo_usuario" class="form-control" placeholder="Ej: ejemplo@gmail.com" required="required"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="validaCorreoContador" runat="server" ErrorMessage="Debe ingresar un correo válido" ControlToValidate="txt_correo_usuario" ValidationExpression="^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$" ForeColor="Red">
                    </asp:RegularExpressionValidator>
                    <br />
                </div>

                <div class="col-md-12">
                    <asp:Button class="btn btn-success nextBtn btn-lg pull-right" type="button" ID="btnagregarcontador" runat="server" Text="Guardar cambios" OnClick="btnagregarcontador_Click" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>
