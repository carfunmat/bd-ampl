<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="mipk.beanDB"%>
<%@page import="objetoscrm.*"%>
<%
try {
	String aux=session.getAttribute("usuario").toString();
} catch (Exception e) {
	response.sendRedirect("cerrarsesion.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Clubes</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<h1>Datos de los futbolistas en cada club</h1>
<hr/>
<p><a href="bienvenido.jsp">Página principal</a></p>
<p><a href="cerrarsesion.jsp">Salir</a></p>
<hr/>
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

ArrayList<Futbolista> futbolistas = new ArrayList<Futbolista>();
%>
<form action="">
	<label>Club</label>
	<select name="clubes">
	<% for(Club c: listaClubes){
		%><option value=<%c.getNombre();%>><%c.getNombre(); %></option>
	<%
	}
	%>
	</select>
	<button>Enviar</button>
</form>
<%
String nombreFutbolista = request.getParameter("futbolistas");
String queryFutbolista;
if(nombreFutbolista == null || nombreFutbolista.length() == 0){
	queryFutbolista = "select idFutbolista, nombre, apellidos, date_format(fechaNac, '%d-%m-%Y'), club_id from futbolistas";	
} else {
	queryFutbolista = "select idFutbolista, nombre, apellidos, date_format(fechaNac, '%d-%m-%Y'), club_id from futbolistas where nombre=" + request.getParameter("futbolistas");
}

tablares = basededatos.resConsultaSelectA3(queryFutbolista);
Club clubFutbolista = null;
Integer clubId = Integer.parseInt(tablares[0][4]);
for(Club c: listaClubes){
	if(c.getIdClub() == clubId){
		clubFutbolista = c;
		break;
	}
}
Futbolista f = new Futbolista(Integer.parseInt(tablares[0][0]), tablares[0][1], tablares[0][2], tablares[0][3], clubFutbolista);
%>

<table class="table table-striped">
	 <!-- Agregar cabecera tabla --> 
<tr>
	<td>ID</td>
	<td><%f.getIdFutbolista(); %></td>
</tr>
<tr>
	<td>Nombre</td>
	<td><%f.getNombre(); %></td>
</tr>
<tr>
	<td>Apellidos</td>
	<td><%f.getApellidos(); %></td>
</tr>
<tr>
	<td>Fecha Nacimiento</td>
	<td><%f.getFechaNac(); %></td>
</tr>
<tr>
	<td>Club</td>
	<td><%f.getClub().getNombre(); %></td>
</tr>
</table>

</body>
</html>