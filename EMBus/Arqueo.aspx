<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Arqueo.aspx.cs" Inherits="EMBus.Arqueo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        
    
        <div>
        <label>Escuela</label>
        <asp:DropDownList runat="server" AppendDataBoundItems="true" ID="ddEscuela" class="form-control">
        <asp:ListItem Value="0">Seleccione una escuela</asp:ListItem>
        </asp:DropDownList>
        <br />
        </div>
        
    
    </div>
    </form>
</body>
</html>
