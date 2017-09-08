<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarBus.aspx.cs" Inherits="EMBus.AgregarBus" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="css/style.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Agregar Bus</title>
    <link rel="icon" type="image/png" href="img/logo.png" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
        <div class="row">
			<div class="col-xs-12">
				<center><h2>Agregar un nuevo Bus</h2></center>
			</div>
		</div>
		<br><br/>
		
		<!--FORMULARIO-->
		<form class="form-horizontal" runat="server">
		
			<div class="form-group">
				<asp:label class="col-sm-5 control-label" runat="server" Text="Patente: " style="font-size: medium"></asp:label>
				<div class="col-sm-2">
					<input type="text" id="patente" class="form-control"/>
				</div>
			</div>

            <div class="form-group">
				<asp:label class="col-sm-5 control-label" runat="server" Text="Apodo: " style="font-size: medium"></asp:label>
				<div class="col-sm-3">
					<input type="text" id="apodo" class="form-control"/>
				</div>
			</div>

            <div class="form-group">
				<asp:label class="col-sm-5 control-label" runat="server" Text="Capacidad: " style="font-size: medium"></asp:label>
				<div class="col-sm-1">
					<input type="text" id="capacidad" class="form-control"/>
				</div>
			</div>
            <br />

            <div class="btn-lg">
                <center>
                <asp:Button class="btn" ID="btnagregar" Text="Agregar" runat="server"></asp:Button>            
                &nbsp;&nbsp;&nbsp;            
                <asp:Button class="btn" ID="btncancelar" Text="Cancelar" runat="server"></asp:Button>
                </center>

            </div>
            

		</form>


    
    



    

</body>
</html>
