package Beans;

public class Creador {
	private int IdCreador;
	private String desarrollador;
	private String nacionalidad;
	
	public Creador() {
	}

	public Creador(int idCreador, String desarrollador, String nacionalidad) {
		IdCreador = idCreador;
		this.desarrollador = desarrollador;
		this.nacionalidad = nacionalidad;
	}

	public int getIdCreador() {
		return IdCreador;
	}

	public void setIdCreador(int idCreador) {
		IdCreador = idCreador;
	}

	public String getDesarrollador() {
		return desarrollador;
	}

	public void setDesarrollador(String desarrollador) {
		this.desarrollador = desarrollador;
	}

	public String getNacionalidad() {
		return nacionalidad;
	}

	public void setNacionalidad(String nacionalidad) {
		this.nacionalidad = nacionalidad;
	}
	
}
