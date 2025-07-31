/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package web;

import com.sun.javafx.application.ParametersImpl;
import dao.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.RolUsuario;
import model.Usuario;

/**
 *
 * @author josel
 */
@WebServlet(name = "ServletUsuario", urlPatterns = {"/ServletUsuario"})
public class ServletUsuario extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        //realiza un metodo distinto segun lo indicado en el "accion"
        switch (accion) {
            case "agregar":
                agregarUsuario(request, response);
                break;
            case "editar":
                formularioEditar(request, response);
                break;
            case "actualizar":
                editarUsuario(request, response);
                break;
            case "eliminar":
                eliminarUsuario(request, response);
                break;
            case "listar":
                listarUsuario(request, response);
                break;
            default:
                System.out.println("hola");
        }

    }

    //Metodo para agregar usuarios
    protected void agregarUsuario(HttpServletRequest solicitud, HttpServletResponse respuesta) throws ServletException, IOException {
        //Obtiene el texto dentro del parametro (el parametro se añade en los
        //inputs del jsp, se añaden como name=nombre)
        String nombre = solicitud.getParameter("nombre");
        String apellido = solicitud.getParameter("apellido");
        String emailUsuario = solicitud.getParameter("emailUsuario");
        String telefono = solicitud.getParameter("telefono");
        String direccion = solicitud.getParameter("direccion");
        String contrasena = solicitud.getParameter("contrasena");
        String rol = solicitud.getParameter("rol");
        // Convertir String a enum
        
         

        String nit = solicitud.getParameter("nit");

        UsuarioDAO dao = new UsuarioDAO();

        Usuario usu = new Usuario();
        usu.setNombre(nombre);
        usu.setApellido(apellido);
        usu.setCorreo(emailUsuario);
        usu.setTelefono(telefono);
        usu.setDireccion(direccion);
        usu.setContrasena(contrasena);
        if(rol.equals("Admin")){
            usu.setRol(RolUsuario.Admin);
        }else
            usu.setRol(RolUsuario.Cliente);

        dao.saveUsuario(usu);

        //Esto llama el servlet y cambia la accion a listar para mostrar la tabla
        respuesta.sendRedirect("ServletUsuario?accion=listar");
    }

    //Metodo que busca el id para luego enviar al formulario de edición el usuario con el id elegido
    protected void formularioEditar(HttpServletRequest solicitud, HttpServletResponse respuesta) throws ServletException, IOException {
        //dao -> usuario(id) - redireccionar con el usuario -> usuarioEditar.jsp
        UsuarioDAO dao = new UsuarioDAO();
        int idEditar = Integer.parseInt(solicitud.getParameter("id"));

        //Este metedo en el dao no existe, añadanlo
        Usuario usu = dao.getUsuarioById(idEditar);

        solicitud.setAttribute("usuarioEditar", usu);
        solicitud.getRequestDispatcher("/pages/editarUsuario.jsp").forward(solicitud, respuesta);

        //acción es igual a "editar"
    }

    //Metodo para editar usuarios
    protected void editarUsuario(HttpServletRequest solicitud, HttpServletResponse respuesta) throws ServletException, IOException {
        UsuarioDAO dao = new UsuarioDAO();
        int idActualizar = Integer.parseInt(solicitud.getParameter("id"));
        Usuario usu = dao.getUsuarioById(idActualizar);

        usu.setNombre(String.valueOf(solicitud.getParameter("nombre")));
        usu.setApellido(String.valueOf(solicitud.getParameter("apellido")));
        usu.setCorreo(String.valueOf(solicitud.getParameter("emailUsuario")));
        usu.setTelefono(String.valueOf(solicitud.getParameter("telefono")));
        usu.setDireccion(String.valueOf(solicitud.getParameter("direccion")));
        usu.setContrasena(String.valueOf(solicitud.getParameter("contrasena")));
        String rol = solicitud.getParameter("rol");
        if(rol.equals("Admin")){
            usu.setRol(RolUsuario.Admin);
        }else
            usu.setRol(RolUsuario.Cliente);
        usu.setNit(String.valueOf(solicitud.getParameter("nit")));

        dao.updateUsuario(usu);
        respuesta.sendRedirect("ServletUsuario?accion=listar");

        //acción es igual a "actualizar"
    }

    protected void eliminarUsuario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int idEliminar = Integer.parseInt(request.getParameter("id"));
        UsuarioDAO dao = new UsuarioDAO();
        dao.deleteUsuario(idEliminar);
        response.sendRedirect("ServletUsuario?accion=listar");

    }

    protected void listarUsuario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //Dao -> ListarTodos -> List<Clientes> ---------> Atributo(ListaClientes) -enviarlo-listarClientes
        UsuarioDAO dao = new UsuarioDAO();
        List<Usuario> listaClientes = dao.getAllUsuarios();

        request.setAttribute("listaUsuario", listaClientes);

        request.getRequestDispatcher("/pages/administracionUsuarios.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
