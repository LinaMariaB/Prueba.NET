using Service.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace Service
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de interfaz "IService1" en el código y en el archivo de configuración a la vez.
    [ServiceContract]
    public interface IService1
    {


        [OperationContract]
        IEnumerable<Persona> Consultar();

        [OperationContract]
        bool Adicionar(Persona persona);

        [OperationContract]
        bool ConsultarIdentificacion(string identificacion);

        // TODO: agregue aquí sus operaciones de servicio
    }

}
