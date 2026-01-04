package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import Beans.*;
import java.io.IOException;
import Model.*;

@WebServlet("/AmistadController")
public class AmistadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    AmistadModel modelo=new AmistadModel();    
   
    public AmistadController() {
        super();
       
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) 
    		throws ServletException, IOException {
		String opcion = request.getParameter("op");
		if(opcion==null) {
		
			return;
		}
		switch (opcion) {
		case "listarAmigos":
			listarAmigos(request, response);
			break;
		case "listarSolicitudes":
			listarSolicitudes(request, response);
			break;
		case "añadirAmigos":
			añadirAmigos(request, response);
			break;
		case "enviarSolicitud":
			enviarSolicitud(request, response);
			break;
		case "aceptarSolicitud":
			aceptarSolicitud(request, response);
			break;
		case "rechazarSolicitud":
			rechazarSolicitud(request, response);
			break;
		case "buscarPorId":
		    buscarPorId(request, response);
		    break;

		case "buscarPorNombre":
		    buscarPorNombre(request, response);
		    break;
		}
	}
    private void listarAmigos(HttpServletRequest request, HttpServletResponse response) 
    		throws ServletException, IOException{
    	try {
			response.setContentType("text/html; charset=UTF-8");
			HttpSession session = request.getSession();
	    	
		    
	    	int id=(int) session.getAttribute("idUsuario");
	    	request.setAttribute("listar", modelo.listarAmigos(id));
	    	request.getRequestDispatcher("/usuario/fragmentos/mostrarAmigos.jsp")
	           .forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
    
	private void listarSolicitudes(HttpServletRequest request, HttpServletResponse response) 
	    		throws ServletException, IOException{
			try {
				response.setContentType("text/html; charset=UTF-8");
				HttpSession session = request.getSession();
		    	
			    
		    	int id=(int) session.getAttribute("idUsuario");
		    	request.setAttribute("listar", modelo.mostrarSolicitudes(id));
		    	
		    	request.getRequestDispatcher("/usuario/fragmentos/solicitudes.jsp")
		           .forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
	}
	private void añadirAmigos(HttpServletRequest request, HttpServletResponse response) 
    		throws ServletException, IOException{
		try {
			response.setContentType("text/html; charset=UTF-8");
			
			request.getRequestDispatcher("usuario/fragmentos/añadirAmigos.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	private void buscarPorId(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    try {
	        int id = Integer.parseInt(request.getParameter("idUsuario"));

	        Usuario u = modelo.obtenerUsuarioporId(id);

	        response.setContentType("application/json; charset=UTF-8");

	        if (u == null) {
	            response.setStatus(404);
	            response.getWriter().write("{\"error\":\"Usuario no encontrado\"}");
	            return;
	        }

	        String json = "{"
	                + "\"idUsuario\":" + u.getId() + ","
	                + "\"nombre\":\"" + u.getNombreUsuario() + "\""
	                + "}";

	        response.getWriter().write(json);

	    } catch (Exception e) {
	        e.printStackTrace();
	        response.setStatus(500);
	        response.getWriter().write("{\"error\":\"Error interno\"}");
	    }
	}
	private void buscarPorNombre(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    try {
	        String nombre = request.getParameter("nombre");

	        Usuario u = modelo.obtenerUsuarioporNombre(nombre);

	        response.setContentType("application/json; charset=UTF-8");

	        if (u == null) {
	            response.setStatus(404);
	            response.getWriter().write("{\"error\":\"Usuario no encontrado\"}");
	            return;
	        }

	        String json = "{"
	                + "\"idUsuario\":" + u.getId() + ","
	                + "\"nombre\":\"" + u.getNombreUsuario() + "\""
	                + "}";

	        response.getWriter().write(json);

	    } catch (Exception e) {
	        e.printStackTrace();
	        response.setStatus(500);
	        response.getWriter().write("{\"error\":\"Error interno\"}");
	    }
	}
	private void enviarSolicitud(HttpServletRequest request, HttpServletResponse response) 
	        throws ServletException, IOException {

	    response.setContentType("text/plain; charset=UTF-8");

	    try {

	        HttpSession session = request.getSession();
	        int idUsuario = (int) session.getAttribute("idUsuario");
	        int idAmigo = Integer.parseInt(request.getParameter("idAmigo"));

	        modelo.enviarSolicitud(idUsuario, idAmigo);

	        // Si no hubo excepción → todo correcto
	        response.getWriter().write("Solicitud enviada correctamente");

	    } catch (Exception e) {

	        String mensajeError = e.getMessage();

	       
	        if (e.getCause() != null) {
	            mensajeError = e.getCause().getMessage();
	        }

	       
	        response.setStatus(400); 
	        response.getWriter().write(mensajeError);
	    }
	}
	private void aceptarSolicitud(HttpServletRequest request, HttpServletResponse response) 
	        throws ServletException, IOException {

	    try {
	        response.setContentType("text/plain; charset=UTF-8");

	        int idAmistad = Integer.parseInt(request.getParameter("idAmistad"));
	        modelo.aceptarSolicitud(idAmistad);

	        response.getWriter().write("Solicitud aceptada");
	        return;

	    } catch (Exception e) {
	        e.printStackTrace();
	        response.setStatus(500);
	        response.getWriter().write("Error al aceptar solicitud");
	    }
	}
	private void rechazarSolicitud(HttpServletRequest request, HttpServletResponse response) 
	        throws ServletException, IOException {

	    try {
	        response.setContentType("text/plain; charset=UTF-8");

	        int idAmistad = Integer.parseInt(request.getParameter("idAmistad"));
	        modelo.rechazarSolicitud(idAmistad);

	        response.getWriter().write("Solicitud rechazada");
	        return;

	    } catch (Exception e) {
	        e.printStackTrace();
	        response.setStatus(500);
	        response.getWriter().write("Error al rechazar solicitud");
	    }
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		processRequest(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		processRequest(request, response);
	}

}
