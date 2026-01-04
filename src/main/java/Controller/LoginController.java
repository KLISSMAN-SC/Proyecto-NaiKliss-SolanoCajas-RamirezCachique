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
import Model.UsuariosModel;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	UsuariosModel modelo = new UsuariosModel();
	AmistadModel model2=new AmistadModel();
	
    public LoginController() {
        super();
        
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String opcion = request.getParameter("op");
		if(opcion==null) {
			mostrarLogin(request, response);
			return;
		}
		switch (opcion) {
        case "login":
            autenticar(request, response);
            break;
        case "register":
        	registrar(request, response);
        	break;
        case "mostrarRegister":
        	mostrarRegister(request, response);
        	break;
        case "logout":
            cerrarSesion(request, response);
            break;
        default:
            mostrarLogin(request, response);
            break;
		}
		
	}
    
    private void cerrarSesion(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        response.sendRedirect(request.getContextPath() + "/LoginController");
    }
    
    protected void registrar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String nombre = request.getParameter("nombre")+" "+request.getParameter("apellido");
    	String usuario = request.getParameter("usuario");
    	String email = request.getParameter("email");
    	String pass1 = request.getParameter("password");
    	String pass2 = request.getParameter("confirmPassword");
    	
    	if(pass1.equals(pass2)) {
    		
    		if(pass1.length()>=8) {
    			Usuario usuarioNuevo = new Usuario();
    			usuarioNuevo.setNombreCompleto(nombre);
    			usuarioNuevo.setNombreUsuario(usuario);
    			usuarioNuevo.setEmail(email);
    			usuarioNuevo.setPassword(pass2);
    			modelo.crearUsuario(usuarioNuevo);
    			request.setAttribute("error", "Cuenta creada correctamente, inicia sesión");
    			mostrarLogin(request, response);
    		}else {
    			request.setAttribute("error", "La contraseña debe tener mínimo 8 caracteres.");
                mostrarRegister(request, response);
    		}
    	}else {
    		 request.setAttribute("error", "Las contraseñas no coinciden.");
             mostrarRegister(request, response);
    	}
    	
    	
		
	}
    
    protected void autenticar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String nombreUsuario = request.getParameter("usuario");
        String password = request.getParameter("password");
        
        // Autenticar usuario
        Usuario usuario = modelo.autenticarUsuario(nombreUsuario, password);
        
        if (usuario != null) {
            // Usuario autenticado correctamente
            HttpSession session = request.getSession();
            session.setAttribute("usuario", usuario);
            session.setAttribute("nombreUsuario", usuario.getNombreUsuario());
            session.setAttribute("nombreCompleto", usuario.getNombreCompleto());
            session.setAttribute("rol", usuario.getRol());
            session.setAttribute("idUsuario", usuario.getId());
            session.setAttribute("fechaCreacion", usuario.getFechaCreacion());
            session.setAttribute("saldo", usuario.getSaldo());
            session.setAttribute("descripcion", usuario.getDescripcion());
            session.setAttribute("pais", usuario.getPais());
            session.setAttribute("localidad", usuario.getLocalidad());
            session.setAttribute("avatar", usuario.getAvatar());
            
            
            // Redireccionar al inicio
            response.sendRedirect(request.getContextPath() + "/Inicio.jsp");
        } else {
            // Credenciales incorrectas
            request.setAttribute("error", "Usuario o contraseña incorrectos");
            mostrarLogin(request, response);
        }
	}
    
    protected void mostrarRegister(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("text/html; charset=UTF-8");
        request.getRequestDispatcher("/login_register/register.jsp").forward(request, response);
	}
    
    protected void mostrarLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("text/html; charset=UTF-8");
        request.getRequestDispatcher("/login_register/Login.jsp").forward(request, response);
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
}
