/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package web;

import dao.ProveedorDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Proveedor;

/**
 *
 * @author Kevin
 */
@WebServlet(name = "ProveedorServlet", urlPatterns = {"/ProveedorServlet"})
public class ProveedorServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        switch (accion) {
            case "agregar":
                agregarProveedor(request, response);
                break;
            case "editar":
                formularioEditar(request, response);
                break;
            case "actualizar":
                editarProveedor(request, response);
                break;
            case "eliminar":
                eliminarProveedor(request, response);
                break;
            case "listar":
                listarProveedor(request, response);
                break;
            default:
                System.out.println("hola");
        }

    }

    //Metodo para agregar Proveedores
    protected void agregarProveedor(HttpServletRequest solicitud, HttpServletResponse respuesta) throws ServletException, IOException {
        String nombreProveedor = solicitud.getParameter("nombreProveedor");
        String contacto = solicitud.getParameter("contacto");
        String telefono = solicitud.getParameter("telefono");
        String email = solicitud.getParameter("email");
        String direccion = solicitud.getParameter("direccion");
        String paisOrigen = solicitud.getParameter("paisOrigen");
        String estado = solicitud.getParameter("estado");

        ProveedorDAO dao = new ProveedorDAO();
        Proveedor proveedor = new Proveedor(nombreProveedor, contacto, telefono, email, direccion, paisOrigen, estado);
        dao.saveProveedor(proveedor);

        respuesta.sendRedirect("ProveedorServlet?accion=listar");
    }

    //Metodo para enviar formulario de edicion de Proveedores
    protected void formularioEditar(HttpServletRequest solicitud, HttpServletResponse respuesta) throws ServletException, IOException {
        ProveedorDAO dao = new ProveedorDAO();
        int idEditar = Integer.parseInt(solicitud.getParameter("id"));
        //Este metodo en el dao no existe añadalo
        Proveedor proveedor = dao.getProveedorById(idEditar);

        solicitud.setAttribute("listaProveedor", proveedor);
        solicitud.getRequestDispatcher("/pages/editarProveedor.jsp").forward(solicitud, respuesta);
    }

    //Metodo para editar Proveedor
    protected void editarProveedor(HttpServletRequest solicitud, HttpServletResponse respuesta) throws ServletException, IOException {
        ProveedorDAO dao = new ProveedorDAO();

        int idActualizar = Integer.parseInt(solicitud.getParameter("idProveedor"));
        String nombreProveedor = solicitud.getParameter("nombreProveedor");
        String contacto = solicitud.getParameter("contacto");
        String telefono = solicitud.getParameter("telefono");
        String email = solicitud.getParameter("email");
        String direccion = solicitud.getParameter("direccion");
        String paisOrigen = solicitud.getParameter("paisOrigen");
        String estado = solicitud.getParameter("estado");

        Proveedor proveedor = dao.getProveedorById(idActualizar);
        proveedor.setNombreProveedor(nombreProveedor);
        proveedor.setContacto(contacto);
        proveedor.setTelefono(telefono);
        proveedor.setEmail(email);
        proveedor.setDireccion(direccion);
        proveedor.setPaisOrigen(paisOrigen);
        proveedor.setEstado(estado);

        dao.updateProveedor(proveedor);

        respuesta.sendRedirect("ProveedorServlet?accion=listar");
    }

    //Metodo para eliminar Proveedor
    protected void eliminarProveedor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idEliminar = Integer.parseInt(request.getParameter("id"));
        ProveedorDAO dao = new ProveedorDAO();
        dao.deleteProveedor(idEliminar);
        response.sendRedirect("ProveedorServlet?accion=listar");
    }

    //Metodo para listar Proveedor
    protected void listarProveedor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProveedorDAO dao = new ProveedorDAO();
        List<Proveedor> listaProveedor = dao.getAllProveedores();
        request.setAttribute("listaProveedor", listaProveedor);
        request.getRequestDispatcher("/pages/administracionProveedor.jsp").forward(request, response);
    }

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
