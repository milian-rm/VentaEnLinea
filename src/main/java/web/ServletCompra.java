/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package web;

import model.Compra;
import dao.CompraDAO;
import dao.UsuarioDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Usuario;

/**
 *
 * @author informatica
 */
@WebServlet(name = "ServletCompra", urlPatterns = {"/ServletCompra"})
public class ServletCompra extends HttpServlet {

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
                agregarCompra(request, response);
                break;
            case "editar":
                formularioEditar(request, response);
                break;
            case "actualizar":
                editarCompra(request, response);
                break;
            case "eliminar":
                eliminarCompra(request, response);
                break;
            case "listar":
                listarCompra(request, response);
                break;
            default:
                System.out.println("hola");
        }

    }

    //Metodo para agregar
    protected void agregarCompra(HttpServletRequest solicitud, HttpServletResponse respuesta) throws ServletException, IOException {
        //Obtiene el texto dentro del parametro
        int idUsuario = Integer.parseInt(solicitud.getParameter("idUsuario"));
        int totalOrden = Integer.parseInt(solicitud.getParameter("totalOrden"));
        String estadoOrden = solicitud.getParameter("estadoOrden");
        CompraDAO dao = new CompraDAO();
        
        //Busca la id de usuario, para comprobar que la id exista
        UsuarioDAO usuDao = new UsuarioDAO();
        Usuario usu = usuDao.getUsuarioById(idUsuario);
        
        Compra comp = new Compra(usu, totalOrden, estadoOrden);

        dao.saveCompra(comp);

        respuesta.sendRedirect("ServletCompra?accion=listar");
    }

    //Metodo que busca el id para luego enviar al formulario de edición la compra con el id elegido
    protected void formularioEditar(HttpServletRequest solicitud, HttpServletResponse respuesta) throws ServletException, IOException {
        CompraDAO dao = new CompraDAO();
        int idEditar = Integer.parseInt(solicitud.getParameter("id"));

        Compra comp = dao.getCompraById(idEditar);

        
        solicitud.setAttribute("compraEditar", comp);
        solicitud.getRequestDispatcher("/pages/editarCompra.jsp").forward(solicitud, respuesta);

        //acción es igual a "editar"
    }

    //Metodo para editar compra
    protected void editarCompra(HttpServletRequest solicitud, HttpServletResponse respuesta) throws ServletException, IOException {
        CompraDAO dao = new CompraDAO();
        int idActualizar = Integer.parseInt(solicitud.getParameter("id"));
        Compra comp = dao.getCompraById(idActualizar);
        
        //se guarda en integer el texto del parametro
        int idUsu = Integer.parseInt(solicitud.getParameter("idUsuario"));
        
        //Con la variable idUsu se busca en Usuario para poder usarlo, también
        //Verifica que exista el id
        UsuarioDAO usuDao = new UsuarioDAO();
        Usuario usu = usuDao.getUsuarioById(idUsu);
        
        comp.setUsuario(usu);
        comp.setTotalOrden(Double.parseDouble(solicitud.getParameter("totalOrden")));
        comp.setEstadoOrden(solicitud.getParameter("estadoOrden"));

        dao.updateCompra(comp);
        respuesta.sendRedirect("ServletCompra?accion=listar");

        //acción es igual a "actualizar"
    }

    protected void eliminarCompra(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int idEliminar = Integer.parseInt(request.getParameter("id"));
        CompraDAO dao = new CompraDAO();
        dao.deleteCompra(idEliminar);
        response.sendRedirect("ServletCompra?accion=listar");

    }

    protected void listarCompra(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        CompraDAO dao = new CompraDAO();
        List<Compra> listaCompras = dao.getAllCompras();

        request.setAttribute("listaCompra", listaCompras);
        
        request.getRequestDispatcher("/pages/administracionCompras.jsp").forward(request, response);
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
