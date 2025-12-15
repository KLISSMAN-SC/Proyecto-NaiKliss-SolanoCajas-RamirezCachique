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
}
