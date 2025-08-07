
package web;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kevin
 */
@WebServlet("/ServletContador")
public class ServletContador extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        
        //Obteniendo todas las cookies
        Cookie [] cookies = request.getCookies();
        int contador = 0;
        //Buscar la cookie contador
        if (cookies != null) {
            for (Cookie cooky : cookies) {
                if ("contadorVisitas".equals(cooky.getName())) {
                    contador = Integer.parseInt(cooky.getValue()); 
                }
            }
        }
        //Incrementar el contador
        //contador = contador + 1;
        contador++;
        
        //actualizar el proceso de contar, crear una cookie
        Cookie cookie = new Cookie("contadorVisitas", Integer.toString(contador));
        // la cookie viva durante 1 hora
        cookie.setMaxAge(3600);
        response.addCookie(cookie);
        
        //Mostrar el mensaje
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter impresoraHtml = response.getWriter();
        
        impresoraHtml.println("<p>Numero de visitas: "+ contador+"</p>");
        
        
    }
}
