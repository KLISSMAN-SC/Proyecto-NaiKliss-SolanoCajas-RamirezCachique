package Beans;
import Util.*;
public class Biblioteca {
	private int idDetalle;
	private int idVideojuego;
	private int idBiblioteca;
	
	private String nombreVideojuego;
	private String descripcion;
	private String desarrollador;
	private String categoria;
	
	public Biblioteca() {
		
	}
	
	
	
	public Biblioteca(int idDetalle, int idVideojuego, int idBiblioteca) {
		super();
		this.idDetalle = idDetalle;
		this.idVideojuego = idVideojuego;
		this.idBiblioteca = idBiblioteca;
	}
	public int getIdDetalle() {
		return idDetalle;
	}
	public void setIdDetalle(int idDetalle) {
		this.idDetalle = idDetalle;
	}
	public int getIdVideojuego() {
		return idVideojuego;
	}
	public void setIdVideojuego(int idVideojuego) {
		this.idVideojuego = idVideojuego;
	}
	public int getIdBiblioteca() {
		return idBiblioteca;
	}
	public void setIdBiblioteca(int idBiblioteca) {
		this.idBiblioteca = idBiblioteca;
	}
	public String getNombreVideojuego() {
		return nombreVideojuego;
	}
	public void setNombreVideojuego(String nombreVideojuego) {
		this.nombreVideojuego = nombreVideojuego;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
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
	
	
}
