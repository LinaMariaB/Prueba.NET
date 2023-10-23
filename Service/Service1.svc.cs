using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using Service.Model;

namespace Service
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de clase "Service1" en el código, en svc y en el archivo de configuración.
    // NOTE: para iniciar el Cliente de prueba WCF para probar este servicio, seleccione Service1.svc o Service1.svc.cs en el Explorador de soluciones e inicie la depuración.
    public class Service1 : IService1
    {
        BDPersonasEntities bDPersonasEntities; 
        public bool Adicionar(Persona persona)
        {
            try
            {
                using (bDPersonasEntities = new BDPersonasEntities())
                {
                    bDPersonasEntities.Persona.Add(persona);
                    bDPersonasEntities.SaveChanges();
                    return true;
                }
            }
            catch
            {
                return false;
            }
        }

        public IEnumerable<Persona> Consultar()
        {
            using (bDPersonasEntities = new BDPersonasEntities())
            {
                return (from persona in bDPersonasEntities.Persona select persona).ToList();
            }
        }

        public bool ConsultarIdentificacion(string identificacion)
        {
            using (bDPersonasEntities = new BDPersonasEntities())
            {
                var persona = (from per in bDPersonasEntities.Persona where per.Documento_Identidad == identificacion select per).FirstOrDefault();
                if (persona == null)
                {
                    return false;
                }
                else
                {
                    return true;
                }
            }
        }
    }
}
