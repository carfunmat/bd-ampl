package objetoscrm;

public class Club {
	
	private Integer idClub;
	private String nombre;
	private String ciudad;
	
	
	public Club() {
		idClub = 0;
		nombre = "";
		ciudad = "";
	}
	
	public Club(Integer id, String nom, String ciud) {
		idClub = id;
		nombre = nom;
		ciudad = ciud;
	}
	
	public Integer getIdClub() {
		return idClub;
	}
	public void setIdClub(Integer idClub) {
		this.idClub = idClub;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getCiudad() {
		return ciudad;
	}
	public void setCiudad(String ciudad) {
		this.ciudad = ciudad;
	}
	
	

}
