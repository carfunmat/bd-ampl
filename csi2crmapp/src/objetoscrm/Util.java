package objetoscrm;

import java.sql.SQLException;
import java.util.ArrayList;

import mipk.beanDB;

public class Util {
	
	public static ArrayList<Futbolista> listaFutbolistas(String nombreClub) throws SQLException{
		ArrayList<Futbolista> futbolistas = new ArrayList<Futbolista>();
		String query_club;
		if (nombreClub == null || nombreClub.length() == 0) {
			query_club = "select * from clubes";
		} else {
			query_club = "select * from clubes where nombre=" + nombreClub;	
		}
		beanDB basededatos = new beanDB();
		String[][] tabla_club = basededatos.resConsultaSelectA3(query_club);
		Club c = new Club(Integer.parseInt(tabla_club[0][0]), tabla_club[0][1], tabla_club[0][2]);
		String query_futbolistas = "select idFutbolista, nombre, apellidos, date_format(fechaNac, '%d-%m-%Y'), club_id from futbolistas where club_id = " + c.getIdClub();
		String [][] tabla_futbolistas = basededatos.resConsultaSelectA3(query_futbolistas);
		for(int i = 0; i < tabla_futbolistas.length; i++) {
			futbolistas.add(new Futbolista(Integer.parseInt(tabla_futbolistas[i][0]), tabla_futbolistas[i][1], tabla_futbolistas[i][2], tabla_futbolistas[i][3], c));
		}
		return futbolistas;
	}

}
