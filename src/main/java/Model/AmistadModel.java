package Model;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Beans.*;
import Util.*;
public class AmistadModel extends Conexion {
	CallableStatement cs;
	ResultSet rs;
	public List<Amistad> listarAmigos(int idUsuario){
		ArrayList<Amistad> lista=new ArrayList<>();
		try {
			String sql = "CALL sp_ListarAmigos(?)";
			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			cs.setInt(1, idUsuario);
			rs = cs.executeQuery();
			while(rs.next()) {
				Amistad a=new Amistad();
				a.setIdAmigo(rs.getInt("idAmigo"));
				a.setNombreAmigo(rs.getString("amigo"));
				a.setAvatar(rs.getString("avatar"));
				lista.add(a);
			}
			this.cerrarConexion();
		} catch (Exception e) {
			e.printStackTrace();
			this.cerrarConexion();
		}
		return lista;
	}
	public List<Amistad> mostrarSolicitudes(int idUsuario){
		ArrayList<Amistad> lista=new ArrayList<>();
		try {
			String sql = "CALL sp_ListarSolicitudes(?)";
			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			cs.setInt(1, idUsuario);
			rs = cs.executeQuery();
			while(rs.next()) {
				Amistad a=new Amistad();
				a.setIdAmistad(rs.getInt("ID"));
				a.setNombreAmigo(rs.getString("Remitente"));
				a.setAvatar(rs.getString("avatar"));
				lista.add(a);
			}
			this.cerrarConexion();
		} catch (Exception e) {
			e.printStackTrace();
			this.cerrarConexion();
		}
		return lista;
	}
	public void enviarSolicitud(int idUsuario,int idAmigo) throws Exception{
		try {
			String sql="call sp_enviarSolicitud(?,?)";
			this.abrirConexion();
			cs=conexion.prepareCall(sql);
			cs.setInt(1, idUsuario);
			cs.setInt(2, idAmigo);
			cs.executeUpdate();
			
			} 
			
			
		catch (Exception e) {
			
			throw e;
		}finally{
			this.cerrarConexion();
		}
	
		
	}
	public void aceptarSolicitud(int idAmistad) {
		try {
			String sql="call sp_aceptarSolicitud(?)";
			this.abrirConexion();
			cs=conexion.prepareCall(sql);
			cs.setInt(1, idAmistad);
			
			cs.executeUpdate();
			this.cerrarConexion();
			} catch (Exception e) {
			e.printStackTrace();
			this.cerrarConexion();
		}
	}
	public void rechazarSolicitud(int idAmistad) {
		try {
			String sql="call sp_rechazarSolicitud(?)";
			this.abrirConexion();
			cs=conexion.prepareCall(sql);
			cs.setInt(1, idAmistad);
			
			
			cs.executeUpdate();
			this.cerrarConexion();
			} catch (Exception e) {
			e.printStackTrace();
			this.cerrarConexion();
		}
	}
	public Usuario obtenerUsuarioporId(int idUsuario) {
		Usuario u=null;
		
		try {
			
			String sql="call sp_obtenerUsuario(?)";
			this.abrirConexion();
			cs=conexion.prepareCall(sql);
			cs.setInt(1, idUsuario);
			rs=cs.executeQuery();
			if(rs.next()) {
				 u=new Usuario();
				u.setId(rs.getInt("ID"));
				u.setNombreUsuario(rs.getString("nombre"));
				u.setDescripcion(rs.getString("descripcion"));
				u.setNombreCompleto(rs.getString("nombreReal"));
				u.setPais(rs.getString("pais"));
				u.setLocalidad(rs.getString("localidad"));
				u.setAvatar(rs.getString("avatar"));
				u.setRol(rs.getString("rol"));
			}
			this.cerrarConexion();
		} catch (Exception e) {
			e.printStackTrace();
			this.cerrarConexion();
			
		}
		return u;
	}
	public Usuario obtenerUsuarioporNombre(String nombre) {
		Usuario u=null;
		
		try {
			
			String sql="call sp_obtenerUsuarioporNombre(?)";
			this.abrirConexion();
			cs=conexion.prepareCall(sql);
			cs.setString(1, nombre);
			rs=cs.executeQuery();
			if(rs.next()) {
				 u=new Usuario();
				u.setId(rs.getInt("ID"));
				u.setNombreUsuario(rs.getString("Nombre"));
			}
			this.cerrarConexion();
		} catch (Exception e) {
			e.printStackTrace();
			this.cerrarConexion();
			
		}
		return u;
	}
	
}
