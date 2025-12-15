package Beans;

public class VideoJuego {
	private int idVideoJuego;
	private String nombre;
	private double precio;
	private String desarrollador;
	private String categoria;
	private String estado;
	private String descripcion;
	
	public VideoJuego() {
	}

	public VideoJuego(int idVideoJuego, String nombre, double precio, String desarrollador, String categoria,
			String estado, String descripcion) {
		this.idVideoJuego = idVideoJuego;
		this.nombre = nombre;
		this.precio = precio;
		this.desarrollador = desarrollador;
		this.categoria = categoria;
		this.estado = estado;
		this.descripcion = descripcion;
	}

	public int getIdVideoJuego() {
		return idVideoJuego;
	}

	public void setIdVideoJuego(int idVideoJuego) {
		this.idVideoJuego = idVideoJuego;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public double getPrecio() {
		return precio;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}

	public String getDesarrollador() {
		return desarrollador;
	}

	public void setDesarrollador(String desarrollador) {
		this.desarrollador = desarrollador;
	}

	public String getCategoria() {
		return categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	
}
