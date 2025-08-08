/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package web;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Roberto
 */
@WebServlet(name = "ServletSesiones", urlPatterns = {"/ServletSesiones"})
public class ServletSesiones extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //Configurar el tipo de contenido a trabajar
        response.setContentType("text/html;charset=UTF-8");
        //Obtener la sesion actual o crear una nueva si no existe
        HttpSession sesion = request.getSession();
        //Configurar atributo de sesion
        String titulo;
        Integer contadorVisitas = (Integer) sesion.getAttribute("contadorVisitas");
        if(contadorVisitas == null){
            contadorVisitas = 1;
            titulo = "Bienvenido por primera vez";
        }else{
            contadorVisitas++;
            titulo = "Bienvenido nuevamente";
        }
        
        //guardar el contadorVisitas actualizado en nuestra sesion
        sesion.setAttribute("contadorVisitas", contadorVisitas);
        
        //try finally
        try(PrintWriter impresoraHtml = response.getWriter()){
            impresoraHtml.println("<h1>"+titulo+"<h1>");
            impresoraHtml.println("<p>Veces Accedido: "+contadorVisitas+"</p>");
            impresoraHtml.println("<p>Id de la Sesion: "+sesion.getId()+"</p>");
            impresoraHtml.println("<a href='index.html' >Volver al inicio</a>");
        }
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
