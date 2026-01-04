package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import Beans.Usuario;
import Model.AmistadModel;
import Model.BibliotecaModel;
import Model.PerfilModel;
import Model.ReporteModel;
import Model.UsuariosModel;

@WebServlet("/UsuarioController")
public class UsuarioController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    PerfilModel model = new PerfilModel();
    AmistadModel model2=new AmistadModel();
    ReporteModel model3= new ReporteModel();
    BibliotecaModel model4=new BibliotecaModel();
    public UsuarioController() {
        super();
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) 
    		throws ServletException, IOException {
    	String opcion = request.getParameter("op");
		if(opcion==null) {
			listarPerfil(request, response);
			return;
		}
		switch (opcion) {
		case "modificar":
			modificarPerfil(request, response);
			break;
		case "guardar":
			guardar(request, response);
			break;
		case "cargarVista":
		    cargarVista(request, response);
		    break;
		case "actualizarAvatar":
			actualizarAvatar(request, response);
			break;
		default:
			listarPerfil(request, response);
			break;
		}
    	
		
    }
    private void actualizarAvatar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	try {
    		HttpSession session = request.getSession(false);
            int idUsuario = (int) session.getAttribute("idUsuario");
    		String avatar = (String) request.getParameter("avatarSeleccionado");
    		model.modificarAvatar(idUsuario, avatar);
    		listarPerfil(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
    private void cargarVista(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        int idUsuario = (int) session.getAttribute("idUsuario");

        Usuario usuario = model2.obtenerUsuarioporId(idUsuario);

        request.setAttribute("usuario", usuario);

        String vista = request.getParameter("vista");

        if ("avatar".equals(vista)) {
            request.getRequestDispatcher("usuario/fragmentosPerfil/avatar.jsp")
                   .forward(request, response);
        } else {
            request.getRequestDispatcher("usuario/fragmentosPerfil/general.jsp")
                   .forward(request, response);
        }
    }

    
    private void guardar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	try {
    		HttpSession session = request.getSession(false);
    		int id = (int) session.getAttribute("idUsuario");
    		String nombreUsuario = request.getParameter("nombreUsuario");
  
    		
    		String pais = request.getParameter("pais");
    		String estado = request.getParameter("estado");
    		String descripcion = request.getParameter("descripcion");
        	model.modificarPerfil(id, nombreUsuario, pais, estado, descripcion);
        	listarPerfil(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
    
    private void modificarPerfil(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	try {
    		response.setContentType("text/html; charset=UTF-8");
    		HttpSession session = request.getSession(false);
    		int id = (int) session.getAttribute("idUsuario");
        	Usuario usuario = model2.obtenerUsuarioporId(id);
        	request.setAttribute("usuario", usuario);
        	
        	request.getRequestDispatcher("usuario/modificarUsuario.jsp").forward(request, response);
        	
        	
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
    
    private void listarPerfil(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	try {
    		response.setContentType("text/html; charset=UTF-8");
    		HttpSession session = request.getSession(false);
        	int idUsuario = (int) session.getAttribute("idUsuario");
        	Usuario usuario = model2.obtenerUsuarioporId(idUsuario);
        	request.setAttribute("usuario", usuario);
        	request.setAttribute("amigos", model3.obtenerCantidadAmigos(idUsuario));
        	request.setAttribute("juegos", model3.obtenercantidadVideojuegos(idUsuario));
        	request.setAttribute("listarBiblioteca", model4.listarBiblioteca(idUsuario));
        	request.getRequestDispatcher("usuario/perfil.jsp").forward(request, response);
        	
        	
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

}
