package Beans;

public class Categoria {
	private int idCategoria;
	private String categoria;
	private String abreviatura;
	
	public Categoria() {
	}

	public Categoria(int idCategoria, String categoria, String abreviatura) {
		this.idCategoria = idCategoria;
		this.categoria = categoria;
		this.abreviatura = abreviatura;
	}

	public int getIdCategoria() {
		return idCategoria;
	}

	public void setIdCategoria(int idCategoria) {
		this.idCategoria = idCategoria;
	}

	public String getCategoria() {
		return categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

	public String getAbreviatura() {
		return abreviatura;
	}

	public void setAbreviatura(String abreviatura) {
		this.abreviatura = abreviatura;
	}
	
}
