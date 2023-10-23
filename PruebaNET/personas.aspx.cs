using PruebaNET.Servicio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PruebaNET
{
    public partial class personas : System.Web.UI.Page
    {
        Service1Client service = new Service1Client();
        private static Persona[] datos;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void button_ServerClick(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Identificacion.Value)|| !string.IsNullOrEmpty(Nombres.Value)
                || !string.IsNullOrEmpty(Apellidos.Value)|| !string.IsNullOrEmpty(FechaNacimiento.Value))
            {
                if (!string.IsNullOrEmpty(direccion.Value) || !string.IsNullOrEmpty(correo.Value))
                {
                    var existe= service.ConsultarIdentificacion(Identificacion.Value);
                    if (existe)
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "swal({ title: 'Atencion', text: 'El documento de identidad ya se encuentra registrado', icon: 'info'});", true);
                    }
                    else
                    {
                        bool respuesta = service.Adicionar(new Persona
                        {
                            Documento_Identidad = Identificacion.Value,
                            Nombres = Nombres.Value,
                            Apellidos = Apellidos.Value,
                            Fecha_Nacimiento =  DateTime.Parse(FechaNacimiento.Value),
                            Telefono = telefono.Value,
                            Telefono2 =telefono2.Value,
                            Correo_Electronico=correo.Value,
                            Correo_Electronico2 = correo2.Value,
                            Direccion_Fisica=direccion.Value,
                            Direccion_Fisica2 = direccion2.Value
                        });
                        if (respuesta)
                        {
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "swal({ title: '', text: 'Se registraron los datos correctamente', icon: 'success'});", true);
                        }
                        else
                        {
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "swal({ title: 'Atencion', text: 'Se presento un inconveniente al adicionar los datos', icon: 'error'});", true);
                        }
                    }
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "swal({ title: 'Atencion', text: 'Debe registrar al menos una información de contacto que puede ser correo electrónico o dirección', icon: 'info'});", true);
                }
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "swal({ title: 'Atencion', text: 'El documento de identidad, nombres, apellidos y fecha de nacimiento son obligatorios', icon: 'info'});", true);
            }
            
        }

        protected void Mostrar(object sender, EventArgs e)
        {
            string tipo = ((Control)sender).ClientID;
            if(tipo == "telefonoBtn")
            {
                InformacionContacto2.Visible = true;
                telefono2.Value = "";
                telefonoBtn.Visible = false;
                addTelefono.Visible = true;
            }
            if (tipo == "correoBtn")
            {
                InformacionContacto2.Visible = true;
                correoBtn.Visible = false;
                correo2.Value = "";
                addCorreo.Visible = true;
            }
            if (tipo == "direccionBtn")
            {
                InformacionContacto2.Visible = true;
                direccionBtn.Visible = false;
                direccion2.Value = "";
                addDireccion.Visible = true;
            }
        }

        protected void Ocultar(object sender, EventArgs e)
        {
            string tipo = ((Control)sender).ClientID;
            if (tipo == "ocultarTelefono")
            {
                telefono2.Value = "";
                telefonoBtn.Visible = true;
                addTelefono.Visible = false;
            }
            if (tipo == "ocultarCorreo")
            {
                correoBtn.Visible = true;
                correo2.Value = "";
                addCorreo.Visible = false;
            }
            if (tipo == "ocultarDireccion")
            {
                direccionBtn.Visible = true;
                direccion2.Value = "";
                addDireccion.Visible = false;
            }
            if (addTelefono.Visible == false && addCorreo.Visible == false && addDireccion.Visible == false)
            {
                InformacionContacto2.Visible = false;
            }
        }

        protected void Grilla_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Grilla.PageIndex = e.NewPageIndex;
            LlenarGrilla();
        }

        private void LlenarGrilla()
        {
            Grilla.DataSource = datos;
            Grilla.DataBind();
        }

        protected void consutar_ServerClick(object sender, EventArgs e)
        {
            datos = service.Consultar();
            LlenarGrilla();
        }
    }
}