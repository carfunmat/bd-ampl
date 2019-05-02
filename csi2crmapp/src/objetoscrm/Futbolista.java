package objetoscrm;

public class Futbolista {

	private Integer idFutbolista;
	private String nombre;
	private String apellidos;
	private String fechaNac;
	private Club club;
	
	public Futbolista(Integer idFutbolista, String nombre, String apellidos, String fechaNac) {
		this.idFutbolista = idFutbolista;
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.fechaNac = fechaNac;
		club = null;
	}
	
	public Futbolista(Integer idFutbolista, String nombre, String apellidos, String fechaNac, Club club) {
		this.idFutbolista = idFutbolista;
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.fechaNac = fechaNac;
		this.club = club;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellidos() {
		return apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	public String getFechaNac() {
		return fechaNac;
	}

	public void setFechaNac(String fechaNac) {
		this.fechaNac = fechaNac;
	}

	public Club getClub() {
		return club;
	}

	public void setClub(Club club) {
		this.club = club;
	}

	public Integer getIdFutbolista() {
		return idFutbolista;
	}
	
	
}
