<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Ingresar.aspx.cs" Inherits="EMBus.Ingresar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="navbar" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="footer" runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="css/style.css" />

    <script src="Scripts/rut.js"></script>
    <asp:ScriptManager ID="SM" runat="server"></asp:ScriptManager>

    <% Session["RUT_USUARIO"] = txtrut.Text; %>

    <div class="container">
        <div class="row vertical-offset-100">
            <div class="col-md-4 col-md-offset-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Por favor Identifíquese</h3>
                    </div>

                    <div class="panel-body">
                        <form accept-charset="UTF-8" role="form">
                            <fieldset>
                                <div class="form-group">
                                    <asp:TextBox ID="txtrut" runat="server" class="form-control" placeholder="Ej: 12345678-9" MaxLength="10" type="text"></asp:TextBox>
                                    <asp:CustomValidator ID="validaRut" runat="server"
                                        ClientValidationFunction="validar_rut" ControlToValidate="txtrut"
                                        Display="Dynamic" ErrorMessage="*Ingrese un rut valido Ej: 10432967-4" SetFocusOnError="True" ForeColor="Red"></asp:CustomValidator>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="txtclave" runat="server" class="form-control" placeholder="Contraseña" type="password"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <a href="RecuperarClave.aspx">¿Ha olvidado su contraseña?</a>
                                </div>
                            </fieldset>
                            <asp:Button ID="btnlogin" runat="server" Text="Ingresar" class="btn btn-lg btn-primary btn-block" OnClick="btnlogin_Click" />
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

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
