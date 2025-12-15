package Model;
import java.sql.CallableStatement;
import java.sql.ResultSet;

import Beans.*;
import Util.*;
public class RecargaModel extends Conexion {
	CallableStatement cs;
	ResultSet rs;
	public void recargarSaldo(int idUsuario,double saldo) {
		try {
			String sql="call sp_recargarSaldo(?,?)";
			this.abrirConexion();
			cs=conexion.prepareCall(sql);
			cs.setInt(1, idUsuario);
			cs.setDouble(2, saldo);
			cs.executeUpdate();
			this.cerrarConexion();
		} catch (Exception e) {
			e.printStackTrace();
			this.cerrarConexion();
		}
	}
}
