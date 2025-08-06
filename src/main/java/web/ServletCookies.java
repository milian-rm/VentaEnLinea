
package web;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kevin
 */

@WebServlet("/ServletCookies")
public class ServletCookies extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response ) 
            throws IOException{
        boolean nuevoUsuario = true;
        String mensaje;
        
        
        //si el usuario visita la pagina por primera vez = "mensaje"
        //si el usuario visita la pagina de nuevo = "bienvenido NUEVAMENTE"
        
        //Cookies como arreglo
        Cookie[] cookies = request.getCookies();
        
        //busque si ya existe alguna cookie creada
        if (cookies != null) {
            for (Cookie cooky : cookies) {
                if (cooky.getName().equals("visitanteRecurrente") && 
                        cooky.getValue().equals("si")) {
                    nuevoUsuario = false;
                    break;
                }
            }
        }
        
        
        //que pasa si el usuario es nuevo, mensaje
        if (nuevoUsuario) {
            //creamos una cookie que identifica al usuario recurrente
            Cookie visitanteCookie = new Cookie("visitanteRecurrente", "si");
                    
            response.addCookie(visitanteCookie);
            mensaje = "Gracias por visitarnos por PRIMERA VEZ";
        } else {
            mensaje = "Gracias por visitar nuestro sitio NUEVAMENTE";           
        }
        
        response.setContentType("text/html; charset=UTF-8");
        
        
        PrintWriter impresoraHTML = response.getWriter();
        
        impresoraHTML.print("Saludo: "+mensaje);
    }
}
