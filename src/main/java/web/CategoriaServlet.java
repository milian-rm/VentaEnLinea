/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package web;

import dao.CategoriaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Categoria;

/**
 *
 * @author informatica
 */
@WebServlet(name = "CategoriaServlet", urlPatterns = {"/CategoriaServlet"})
public class CategoriaServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        switch (accion) {
            case "agregar":
                agregarCategoria(request, response);
                break;
            case "editar":
                formularioEditar(request, response);
                break;
            case "actualizar":
                editarCategoria(request, response);
                break;
            case "eliminar":
                eliminarCategoria(request, response);
                break;
            case "listar":
                listarCategoria(request, response);
                break;
            default:
                System.out.println("hola");
        }      
    }
    
    //Metodo para agregar Categoria
    protected void agregarCategoria(HttpServletRequest solicitud, HttpServletResponse respuesta) throws ServletException, IOException {
        String nombreCategoria = solicitud.getParameter("nombreCategoria");
        String descripcion = solicitud.getParameter("descripcion");
        String estado = solicitud.getParameter("estado");
        
        CategoriaDAO dao = new CategoriaDAO();
        Categoria categoria = new Categoria(nombreCategoria, descripcion, estado);
        dao.saveCategoria(categoria);
        
        respuesta.sendRedirect("CategoriaServlet?accion=listar");      
    }
    
    //Metodo para enviar formulario de edicion de Categorias
    protected void formularioEditar(HttpServletRequest solicitud, HttpServletResponse respuesta) throws ServletException, IOException {
        CategoriaDAO dao = new CategoriaDAO();
        int idEditar = Integer.parseInt(solicitud.getParameter("id"));
        //Este metodo en el dao no existe añadalo
        Categoria categoria = dao.getCategoriaById(idEditar);
        
        solicitud.setAttribute("listaCategoria", categoria);
        solicitud.getRequestDispatcher("/pages/editarCategoria.jsp").forward(solicitud, respuesta);
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
