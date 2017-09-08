<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ArqueoCaja.aspx.cs" Inherits="EMBus.ArqueoCaja" %>

<!DOCTYPE html>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link rel="stylesheet" href="css/style.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Agregar Bus</title>
    <link rel="icon" type="image/png" href="img/logo.png" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            font-weight: normal;
            color: #000000;
        }
        </style>
</head>
<body>
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>

    <div class="row">
			<div class="col-xs-12">
				<center><h2>Realizar Caja Diaria</h2></center>
			</div>
		</div>
		

    <form id="form1" runat="server">

    <div class="col-sm-1">
        <asp:Label class="text-success" runat="server" Text="Conductor: "></asp:Label>
        <br />                
        <asp:Label class="text-success" runat="server" Text="Auxiliar: "></asp:Label>        
    </div>
        

    <div class="col-lg-11">
    <button type="button" class="btn col-lg-offset-10" data-toggle="modal" data-target="#gastos">Administrar Gastos</button>
    </div>


        <br />
        <br />
        <br />
        <br />

        <center>
        <div class="table-responsive">          
          <table class="table-bordered">
            <thead>
              <tr>
                <th>Boletos ($)</th>
                <th>Serie Inicio</th>
                <th>Serie Fin</th>
                <th>Boletos Cortados</th>
                <th>Total en dinero</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>$1.200</td>
                <td><input type="number" class="form-control" id="seriei1200"</td>
                <td><input type="number" class="form-control" id="serief1200"</td>
                <td><input type="number" class="form-control" id="bolcor1200"</td>
                <td><input type="number" class="form-control" id="total1200"</td>
                
              </tr>
            </tbody>
              <tbody>
              <tr>
                <td>$1.000</td>
                <td><input type="number" class="form-control" id="seriei1000"</td>
                <td><input type="number" class="form-control" id="serief1000"</td>
                <td><input type="number" class="form-control" id="bolcor1000"</td>
                <td><input type="number" class="form-control" id="total1000"</td>
                
              </tr>
            </tbody>
              <tbody>
              <tr>
                <td>$800</td>
                <td><input type="number" class="form-control" id="seriei800"</td>
                <td><input type="number" class="form-control" id="serief800"</td>
                <td><input type="number" class="form-control" id="bolcor800"</td>
                <td><input type="number" class="form-control" id="total800"</td>
                
              </tr>
            </tbody>
              <tbody>
              <tr>
                <td>$700</td>
                <td><input type="number" class="form-control" id="seriei700"</td>
                <td><input type="number" class="form-control" id="serief700"</td>
                <td><input type="number" class="form-control" id="bolcor700"</td>
                <td><input type="number" class="form-control" id="total700"</td>
                
              </tr>
            </tbody>
              <tbody>
              <tr>
                <td>$600</td>
                <td><input type="number" class="form-control" id="seriei600"</td>
                <td><input type="number" class="form-control" id="serief600"</td>
                <td><input type="number" class="form-control" id="bolcor600"</td>
                <td><input type="number" class="form-control" id="total600"</td>
                
              </tr>
            </tbody>
              <tbody>
              <tr>
                <td>$500</td>
                <td><input type="number" class="form-control" id="seriei500"</td>
                <td><input type="number" class="form-control" id="serief500"</td>
                <td><input type="number" class="form-control" id="bolcor500"</td>
                <td><input type="number" class="form-control" id="total500"</td>
                
              </tr>
            </tbody>
              <tbody>
              <tr>
                <td>$400</td>
                <td><input type="number" class="form-control" id="seriei400"</td>
                <td><input type="number" class="form-control" id="serief400"</td>
                <td><input type="number" class="form-control" id="bolcor400"</td>
                <td><input type="number" class="form-control" id="total400"</td>
                
              </tr>
            </tbody>
              <tbody>
              <tr>
                <td>$300</td>
                <td><input type="number" class="form-control" id="seriei300"</td>
                <td><input type="number" class="form-control" id="serief300"</td>
                <td><input type="number" class="form-control" id="bolcor300"</td>
                <td><input type="number" class="form-control" id="total300"</td>
                
              </tr>
            </tbody>

              <tbody>
              <tr>
                <td></td>
                <td></td>
                <td></td>            
                <td><span class="auto-style1"><strong>Total Liquido:</strong></span> </td>
                <td><input type="number" class="form-control" id="totalliquido" disabled="true"</td>
               </tbody>       
              <tbody>
              <tr>
                <td></td>
                <td></td>
                <td></td>            
                <td><span class="auto-style1"><strong>Total Gastos:</strong></span> </td>
                <td><input type="number" class="form-control" id="totalgastosfinal" disabled="true"</td>
               </tbody>    
              <tbody>
              <tr>
                <td></td>
                <td></td>
                <td></td>            
                <td><span class="auto-style1"><strong>Total Final:</strong></span> </td>
                <td><input type="number" class="form-control" id="totalfinal" disabled="true"</td>
               </tbody>                  
               </table>
            </center>
      </div>


    <!-- Modal -->
    <div id="gastos" class="modal fade" role="dialog">
      <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <center>
            <h4 class="modal-title">Gastos del Día</h4>
            </center>
          </div>
          <div class="modal-body">
            <p>A continuación se detallan los gastos del día por Bus</p>

             <center>
             <div class="table-responsive">          
              <table class="table-condensed">                                              
                <tbody>
                  <tr>
                    <td>Petróleo</td>
                    <td><input type="number" class="form-control" id="Number1"</td>                                   
                  </tr>
                </tbody>

                <tbody>
                  <tr>
                    <td>Andenes</td>
                    <td><input type="number" class="form-control" id="Number2"</td>                                   
                  </tr>
                </tbody>

                <tbody>
                  <tr>
                    <td>Colaciones</td>
                    <td><input type="number" class="form-control" id="Number3"</td>                                   
                  </tr>
                </tbody>

                <tbody>
                  <tr>
                    <td>Aseo</td>
                    <td><input type="number" class="form-control" id="Number4"</td>                                                                           
                  </tr>
                </tbody>

                <tbody>
                  <tr>                                                     
                    <td><strong>Total Gastos:</strong></td>                     
                    <td><input type="number" class="form-control" id="totalgastos" disabled="true"</td>
                  </tr>
                </tbody>
               </table>
             </div>
             </center>

          </div>           
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">Guardar Cambios</button>
          </div>     
        </div>

      </div>
    </div>

           
    </form>
</body>
</html>
