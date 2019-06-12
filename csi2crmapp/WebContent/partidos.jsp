<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="mipk.beanDB"%>
<%@page import="objetoscrm.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<%
try {
	String aux=session.getAttribute("usuario").toString();
} catch (Exception e) {
	response.sendRedirect("cerrarsesion.jsp");
}
%>

<%
beanDB basededatos = new beanDB();
String query_clubes = "select * from clubes";
String[][] tablares_clubes = basededatos.resConsultaSelectA3(query_clubes);
Club c = null;

ArrayList<Club> listaClubes = new ArrayList<Club>();
Integer idClub = 0;
for(int i = 0; i < tablares_clubes.length; i++){
	idClub = Integer.parseInt(tablares_clubes[i][0]);
	listaClubes.add(new Club(idClub, tablares_clubes[i][1], tablares_clubes[i][2]));
}

ArrayList<String> nombresClubes = new ArrayList<String>();
for(int i = 0; i < listaClubes.size(); i++){
	nombresClubes.add(listaClubes.get(i).getNombre());
}

String query_campos = "select idCampo, nombre from campos";
String[][] tablares_campos = basededatos.resConsultaSelectA3(query_campos);
String query_tipos = "select idTipoEvento, descripcionEvento from tipoEvento";
String[][] tablares_tipos = basededatos.resConsultaSelectA3(query_tipos);

%>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Partidos</title>
</head>
<body>
<h1>DATOS DE PARTIDOS</h1>
<hr/>
<p><a href="bienvenido.jsp">Página principal</a></p>
<p><a href="cerrarsesion.jsp">Salir</a></p>
<hr/>
<br/>


<form method="post" action="/csi2crmapp/datospartidos.jsp">
<label>Seleccione un club para ver sus partidos: </label>
<select name="clubPartidos">
<%  for(Club club_select: listaClubes){
		%><option value=<%=club_select.getIdClub()%>><%=club_select.getNombre()%></option>
	<%
    }
%>
</select>
<button formtarget="_blank">Ver partidos</button>
</form>
<br/>
<br/>
<form method="post" action="/csi2crmapp/agregapartido.jsp">
<p>O bien introduzca los datos para agregar un partido nuevo: </p>
<br/>
<label>Club Local</label>
<select name="club1">
<%  for(Club club_select: listaClubes){
		%><option value=<%=club_select.getIdClub()%>><%=club_select.getNombre()%></option>
	<%
    }
%>
</select>
<label>Goles: </label>
<select name="golesLocal">
	<option value="0">0</option>
	<option value="1">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
	<option value="4">4</option>
	<option value="5">5</option>
</select>
<br/>
<label>Club Visitante</label>
<select name="club2">
<%  for(Club club_select: listaClubes){
		%><option value=<%=club_select.getIdClub()%>><%=club_select.getNombre()%></option>
	<%
    }
%>
</select>
<label>Goles: </label>
<select name="golesVisitante">
	<option value="0">0</option>
	<option value="1">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
	<option value="4">4</option>
	<option value="5">5</option>
</select>
<br/>
<label>Campo: </label>
<select name="nombreCampo">
	<% for(int i = 0; i < tablares_campos.length; i++){
		%><option value=<%=tablares_campos[i][0]%>><%=tablares_campos[i][1]%></option>
		<%
	}
	%>
</select>
<label>Tipo Partido: </label>
<select name="tipoPartido">
	<% for(int i = 0; i < tablares_tipos.length; i++){
		%><option value=<%=tablares_tipos[i][0]%>><%=tablares_tipos[i][1]%></option>
		<%
	}
	%>
</select>
<br/>

<label>Fecha Partido: </label>
<input name="fechaPartido" type="date">
<br/>
<button formtarget="_blank">Agregar partido</button>
</form>


</body>
</html>