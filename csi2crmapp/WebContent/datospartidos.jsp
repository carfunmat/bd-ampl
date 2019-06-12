<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="mipk.beanDB"%>
<%@page import="objetoscrm.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Datos Partido</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>


<%
String clubId_txt = request.getParameter("clubPartidos");

Integer clubId;
if(clubId_txt != null){
	clubId = Integer.parseInt(clubId_txt);
} else {
	clubId = 0;
}
%>
<h2>Partidos del club</h2>
<%
String query_clubes = "select * from clubes";
beanDB basededatos = new beanDB();
String [][] tablares = basededatos.resConsultaSelectA3(query_clubes);
ArrayList<Club> listaClubes = new ArrayList<Club>();
Integer id = 0;
for(int i = 0; i < tablares.length; i++){
	id = Integer.parseInt(tablares[i][0]);
	listaClubes.add(new Club(id, tablares[i][1], tablares[i][2]));
}

String query = "select descripcionEvento, date_format(fecha, '%d-%m-%Y'), camp.nombre, club_local, goles_local, club_visitante, goles_visitante from tipoEvento tE join eventos e on (tE.idTipoEvento = e.tipoEvento) join campos camp on (e.campo_id = camp.idCampo) where club_local = " + clubId + " or club_visitante = " + clubId;
tablares = basededatos.resConsultaSelectA3(query);

String nombreClubLocal = "", nombreClubVisitante = "";
Integer idClubLocal, idClubVisitante;
%>
<table class="table table-striped">
<tr>
	<th>Tipo Evento</th>
	<th>Fecha</th>
	<th>Campo</th>
	<th>Club Local</th>
	<th>Club Visitante</th>
	<th>Resultado</th>
</tr>
<%
for(int i = 0; i < tablares.length; i++){
	
	idClubLocal = Integer.parseInt(tablares[i][3]);
	idClubVisitante = Integer.parseInt(tablares[i][5]);
	for(Club c : listaClubes){
		if(c.getIdClub() == idClubLocal){
			nombreClubLocal = c.getNombre();
		} else if (c.getIdClub() == idClubVisitante){
			nombreClubVisitante = c.getNombre();
		}
		if(nombreClubLocal.length() != 0 && nombreClubVisitante.length() != 0)
			break;
	}
	%>
<tr>
	<td><%= tablares[i][0] %> </td>
	<td><%= tablares[i][1] %> </td>
	<td><%= tablares[i][2] %> </td>
	<td><%= nombreClubLocal %> </td>
	<td><%= nombreClubVisitante %> </td>
	<td><%= tablares[i][4] %> - <%= tablares[i][6] %> </td>
</tr>
	<% 
	nombreClubLocal = "";
	nombreClubVisitante = "";
	
}
%>
</table>

</body>
</html>