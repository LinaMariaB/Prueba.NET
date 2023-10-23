<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="personas.aspx.cs" Inherits="PruebaNET.personas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js" crossorigin="anonymous" type="text/javascript"></script>
    <title>Personas</title>
    <link href="Style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function Numeros(e) {
            var key = window.Event ? e.which : e.keyCode
            return ((key >= 48 && key <= 57) || key == 46)
        }
        function Letras(e) {
            var key = window.Event ? e.which : e.keyCode
            return ((key >= 65 && key <= 90) || (key >= 97 && key <= 122) || key === 32)
        }
    </script>
</head>
<body>
    <div class="container Decoracion">
        <form runat="server" style="height: 100%">
            <h1>Registrar Personas</h1>
            <div class="DatosBasicos">
                <label class="lblSubtitulo">Datos Basicos</label>
                <div class="filas">
                    <div class="columnas">
                        <label>Identificación</label>
                        <input type="text" name="id" value="" runat="server" id="Identificacion" onkeypress="return Numeros(event)" />
                    </div>
                    <div class="columnas">
                        <label>Nombres</label>
                        <input type="text" name="nombres" value="" runat="server" id="Nombres" onkeypress="return Letras(event)" />
                    </div>
                    <div class="columnas">
                        <label>Apellidos</label>
                        <input type="text" name="apellidos" value="" runat="server" id="Apellidos" onkeypress="return Letras(event)" />
                    </div>
                    <div class="columnas">
                        <label>Fecha de nacimiento</label>
                        <input type="date" name="FechaNacimiento" value="" runat="server" id="FechaNacimiento" />
                    </div>
                </div>
            </div>
            <div class="InformacionContacto">
                <label class="lblSubtitulo">Información de Contacto</label>
                <div class="filas">
                    <div class="columnas" style="width: 300px">
                        <label>Número de Teléfono</label>
                        <div>
                            <input type="text" name="telefono" value="" runat="server" id="telefono" />
                            <button class="btn_icono" runat="server" onserverclick="Mostrar" id="telefonoBtn"><i class="fa-solid fa-circle-plus"></i></button>
                        </div>
                    </div>
                    <div class="columnas" style="width: 300px">
                        <label>Correo Electronico</label>
                        <div>
                            <input type="text" name="correo" value="" runat="server" id="correo" />
                            <button class="btn_icono" runat="server" onserverclick="Mostrar" id="correoBtn"><i class="fa-solid fa-circle-plus"></i></button>
                        </div>
                    </div>
                    <div class="columnas" style="width: 300px">
                        <label>Dirección</label>
                        <div>
                            <input type="text" name="direccion" value="" runat="server" id="direccion" />
                            <button class="btn_icono" runat="server" onserverclick="Mostrar" id="direccionBtn"><i class="fa-solid fa-circle-plus"></i></button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="InformacionContacto2" runat="server" id="InformacionContacto2" visible="false">
                <div class="filas">
                    <div class="columnas" style="width: 300px">
                        <div runat="server" id="addTelefono" visible="false">
                            <input type="text" name="telefono" value="" runat="server" id="telefono2" />
                            <button class="btn_icono" runat="server" id="ocultarTelefono" onserverclick="Ocultar"><i class="fa-solid fa-circle-minus"></i></button>
                        </div>
                    </div>
                    <div class="columnas" style="width: 300px">
                        <div runat="server" id="addCorreo" visible="false">
                            <input type="text" name="correo" value="" runat="server" id="correo2" />
                            <button class="btn_icono" runat="server" id="ocultarCorreo" onserverclick="Ocultar"><i class="fa-solid fa-circle-minus"></i></button>
                        </div>
                    </div>
                    <div class="columnas" style="width: 300px">
                        <div runat="server" id="addDireccion" visible="false">
                            <input type="text" name="direccion" value="" runat="server" id="direccion2" />
                            <button class="btn_icono" runat="server" id="ocultarDireccion" onserverclick="Ocultar"><i class="fa-solid fa-circle-minus"></i></button>
                        </div>
                    </div>
                </div>
            </div>
            <button runat="server" onserverclick="button_ServerClick" id="button" style="margin-bottom: 20px" class="btn">Registrar</button>
            <h2>Personas Registradas</h2>
            <div class="table-personas" style="display: flex; justify-content: center">
                <asp:GridView Width="100%" runat="server" ID="Grilla" CssClass="table Grilla" Culture="co-CO" AutoGenerateColumns="false" AllowPaging="true"
                    PageSize="10" OnPageIndexChanging="Grilla_PageIndexChanging" SelectedIndex="-1" PagerStyle-CssClass="pagination">
                    <SelectedRowStyle Font-Bold="true" />
                    <RowStyle HorizontalAlign="Center" VerticalAlign="Middle"/>
                    <PagerStyle HorizontalAlign="Center" />
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" HeaderStyle-CssClass="header"></asp:BoundField>
                        <asp:BoundField DataField="Documento_Identidad" HeaderText="Identificacion" HeaderStyle-CssClass="header"></asp:BoundField>
                        <asp:BoundField DataField="Nombres" HeaderText="Nombres" HeaderStyle-CssClass="header"></asp:BoundField>
                        <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" HeaderStyle-CssClass="header"></asp:BoundField>
                        <asp:BoundField DataField="Fecha_Nacimiento" HeaderText="Fecha de nacimiento" DataFormatString="{0:dd/MM/yyyy}" HeaderStyle-CssClass="header"></asp:BoundField>
                        <asp:BoundField DataField="Telefono" HeaderText="Telefono" HeaderStyle-CssClass="header"></asp:BoundField>
                        <asp:BoundField DataField="Telefono2" HeaderText="Telefono 2" HeaderStyle-CssClass="header"></asp:BoundField>
                        <asp:BoundField DataField="Correo_Electronico" HeaderText="Correo Electronico" HeaderStyle-CssClass="header"></asp:BoundField>
                        <asp:BoundField DataField="Correo_Electronico2" HeaderText="Correo Electronico 2" HeaderStyle-CssClass="header"></asp:BoundField>
                        <asp:BoundField DataField="Direccion_Fisica" HeaderText="Direccion Física" HeaderStyle-CssClass="header"></asp:BoundField>
                        <asp:BoundField DataField="Direccion_Fisica2" HeaderText="Direccion Física 2" HeaderStyle-CssClass="header"></asp:BoundField>
                    </Columns>
                    <RowStyle CssClass="fila" />
                </asp:GridView>
            </div>
            <button runat="server" onserverclick="consutar_ServerClick" id="consutar" style="margin-bottom: 20px" class="btn">Consultar</button>
        </form>
    </div>
</body>
</html>
