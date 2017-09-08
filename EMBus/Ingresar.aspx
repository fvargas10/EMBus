<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Ingresar.aspx.cs" Inherits="EMBus.Ingresar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="navbar" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="footer" runat="server">

    <script src="http://mymaplist.com/js/vendor/TweenLite.min.js"></script>

    <link rel="stylesheet" href="css/style.css" />

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
                            <asp:TextBox ID="txtrut" runat="server" class="form-control" placeholder="Rut sin puntos ni guión" type="text" ></asp:TextBox>                            
			    		</div>
			    		<div class="form-group">
                            <asp:TextBox ID="txtclave" runat="server" class="form-control" placeholder="Contraseña" type="password" ></asp:TextBox>
			    		</div>
			    		<div class="checkbox">
			    	    	<label>
			    	    		<input name="remember" type="checkbox" value="Remember You"/> Recordarme
			    	    	</label>
			    	    </div>
			    	</fieldset>
                        <asp:Button ID="btnlogin" runat="server" Text="Ingresar" class="btn btn-lg btn-success btn-block" OnClick="btnlogin_Click" />
			      	</form>
			    </div>
			</div>
		</div>
	</div>
</div>

    <script>
        $(document).ready(function () {
            $(document).mousemove(function (e) {
                TweenLite.to($('body'),
                   .5,
                   {
                       css:
                         {
                             'background-position': parseInt(event.pageX / 8) + "px " + parseInt(event.pageY / 12) + "px, " + parseInt(event.pageX / 15) + "px " + parseInt(event.pageY / 15) + "px, " + parseInt(event.pageX / 30) + "px " + parseInt(event.pageY / 30) + "px"
                         }
                   });
            });
        });
    </script>

</asp:Content>
