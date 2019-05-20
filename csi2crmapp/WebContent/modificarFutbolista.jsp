<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mipk.beanDB"%>
<%@page import="objetoscrm.*"%>
<%
try {
	String aux=session.getAttribute("usuario").toString();
} catch (Exception e) {
	response.sendRedirect("cerrarsesion.jsp");
}
%>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<h1>Modificar datos futbolista</h1>
<p><a href="bienvenido.jsp">Página principal</a></p>
<p><a href="cerrarsesion.jsp">Salir</a></p>
<hr/>
<%

String idFut_form_txt = request.getParameter("futbolista");
Integer idFut_form = Integer.parseInt(idFut_form_txt);

System.out.println(idFut_form_txt);

String query_futbolistas = "select * from futbolistas";
beanDB basededatos = new beanDB();
String [][] tablares_futbolistas = basededatos.resConsultaSelectA3(query_futbolistas);
Futbolista f = null;


String query_clubes = "select * from clubes";
String[][] tablares_clubes = basededatos.resConsultaSelectA3(query_clubes);
Club c = null;

ArrayList<Club> listaClubes = new ArrayList<Club>();
Integer idClub = 0;
for(int i = 0; i < tablares_clubes.length; i++){
	idClub = Integer.parseInt(tablares_clubes[i][0]);
	listaClubes.add(new Club(idClub, tablares_clubes[i][1], tablares_clubes[i][2]));
}

Integer idFut_query = 0;
Integer idClubFutbolista = 0;
for(int i = 0; i < tablares_futbolistas.length; i++){
	idFut_query = Integer.parseInt(tablares_futbolistas[i][0]);
	idClubFutbolista = Integer.parseInt(tablares_futbolistas[i][4]);
	for(Club club: listaClubes){
		if(club.getIdClub() == idClubFutbolista){
			c = club;
			break;
		}
	}
	if(idFut_query == idFut_form){
		f = new Futbolista(idFut_query, tablares_futbolistas[i][1], tablares_futbolistas[i][2], tablares_futbolistas[i][3], c);
		break;
	}
}

if(f == null){
	%>
	<p> Fallo al buscar futbolista</p>
	<%
} else {
%>
<form method="post" action="/csi2crmapp/verfutbolistas.jsp">
	<%-- <label>ID: </label>
	<input name="idFutbolista" type="text"><%=f.getIdFutbolista() %> --%>
	<input name="idFutbolista" type="hidden" value="<%=f.getIdFutbolista() %>">
	<br>
	<label>Nombre:</label>
	<input name="nombre" type="text" placeholder="<%=f.getNombre() %>">
	<br>
	<label>Apellidos:</label>
	<input name="apellidos" type="text" placeholder="<%=f.getApellidos() %>">
	<br>
	<label>Fecha Nacimiento: </label>
	<input name="fechaNac" type="date" placeholder="<%=f.getFechaNac() %>">
	<br>
	<label>Club: </label>
	<select name="club">
	<% for(Club club_select: listaClubes){
		%><option value=<%=club_select.getIdClub()%>><%=club_select.getNombre()%></option>
	<%
	}
	%></select>
	<button>Modificar</button>
</form>
<%
}




%>
</body>
</html>