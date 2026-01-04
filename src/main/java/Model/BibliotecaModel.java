package Model;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Beans.*;
import Util.*;
public class BibliotecaModel extends Conexion {
	CallableStatement cs;
	ResultSet rs;
	
	public List<Biblioteca> listarBiblioteca(int idBiblioteca){
		ArrayList<Biblioteca> biblioteca = new ArrayList<Biblioteca>();
		try {
			String sql = "CALL sp_ListarBiblioteca(?)";
			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			cs.setInt(1, idBiblioteca);
			rs = cs.executeQuery();
			while(rs.next()) {
				Biblioteca b = new Biblioteca();
				b.setIdDetalle(rs.getInt("ID"));
				b.setNombreVideojuego(rs.getString("Nombre"));
				b.setDescripcion(rs.getString("Descripcion"));
				b.setDesarrollador(rs.getString("Desarrollador"));
				b.setCategoria(rs.getString("Categoria"));
				biblioteca.add(b);
			}
			this.cerrarConexion();
		} catch (Exception e) {
			e.printStackTrace();
			this.cerrarConexion();
			
		}
		return biblioteca;
	}
	public Biblioteca categoriaFavorita(int idUsuario) {
		Biblioteca b=null;
		try {
			String sql="CALL sp_categoriaFavorita(?)";
			
			this.abrirConexion();
			cs=conexion.prepareCall(sql);
			cs.setInt(1, idUsuario);
			rs=cs.executeQuery();
			if(rs.next()) {
				b=new Biblioteca();
				b.setCategoria(rs.getString("CATEGORIA"));
				b.setCantidad(rs.getInt("CANTIDAD"));
				
			}
			this.cerrarConexion();
		} catch (Exception  e) {
			e.printStackTrace();
			this.cerrarConexion();
		}
		return b;
	}
	public List<Amistad> listarJuegosAmigos(int idUsuario){
		ArrayList<Amistad> amistad=new ArrayList<Amistad>();
		try {
			String sql = "CALL sp_juegos_amigos(?)";
			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			cs.setInt(1, idUsuario);
			rs = cs.executeQuery();
			while(rs.next()) {
				Amistad a = new Amistad();
				a.setNombreAmigo(rs.getString("AMIGO"));
				a.setCantidad(rs.getInt("CANTIDAD"));
				amistad.add(a);
			}
			this.cerrarConexion();	
		} catch (Exception e) {
			e.printStackTrace();
			this.cerrarConexion();
			
		}
		return amistad;
	}
	public List<Biblioteca> listarPorCategoria(int idUsuario){
		ArrayList<Biblioteca> biblioteca=new ArrayList<Biblioteca>();
		try {
			String sql = "CALL sp_videojuegos_por_categoria(?)";
			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			cs.setInt(1, idUsuario);
			rs = cs.executeQuery();
			while(rs.next()) {
				Biblioteca b = new Biblioteca();
				b.setCategoria(rs.getString("CATEGORIA"));
				b.setCantidad(rs.getInt("CANTIDAD"));
				biblioteca.add(b);
			}
			this.cerrarConexion();	
		} catch (Exception e) {
			e.printStackTrace();
			this.cerrarConexion();
			
		}
		return biblioteca;
	}
	public int obtenerCantidadAmigos(int idUsuario) {
		int cantidad=0;
		try {
			
			String sql="CALL sp_contarAmigos(?)";
			this.abrirConexion();
			cs=conexion.prepareCall(sql);
			cs.setInt(1, idUsuario);
			rs=cs.executeQuery();
			if(rs.next()) {
				cantidad=rs.getInt("total");
			}
			this.cerrarConexion();
		} catch (Exception e) {
			e.printStackTrace();
			this.cerrarConexion();
		}
		return cantidad;
	}
	
	public int obtenercantidadVideojuegos(int idUsuario) {
		
		int cantidad=0;
		try {
			
			String sql="CALL sp_contarVideojuegos(?)";
			this.abrirConexion();
			cs=conexion.prepareCall(sql);
			cs.setInt(1, idUsuario);
			rs=cs.executeQuery();
			if(rs.next()) {
				cantidad=rs.getInt("CANTIDAD");
			}
			this.cerrarConexion();
		} catch (Exception e) {
			e.printStackTrace();
			this.cerrarConexion();
		}
		return cantidad;
	}
}
