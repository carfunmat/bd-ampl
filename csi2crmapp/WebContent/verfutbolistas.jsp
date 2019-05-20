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
<form method="post" action="/csi2crmapp/verfutbolistas.jsp">
	<label>Club</label>
	<select name="clubes">
	<% for(Club c: listaClubes){
		%><option value=<%=c.getIdClub()%>><%=c.getNombre()%></option>
	<%
	}
	%>
	</select>
	<button>Enviar</button>
</form>
<%
String s = request.getParameter("clubes");
Integer clubId;
if(s != null){
	clubId = Integer.parseInt(s);
} else {
	clubId = 0;
}

String queryFutbolistas;
if(clubId == null || clubId == 0){
	queryFutbolistas = "select idFutbolista, nombre, apellidos, date_format(fechaNac, '%d-%m-%Y'), club_id from futbolistas";	
} else {
	queryFutbolistas = "select idFutbolista, f.nombre, apellidos, date_format(fechaNac, '%d-%m-%Y'), club_id from futbolistas f where club_id=" + clubId;
}

tablares = basededatos.resConsultaSelectA3(queryFutbolistas);
Futbolista f = null;
Club clubFutbolista = null;
Integer idFutbolista = 0;
for(Club c: listaClubes){
	if(c.getIdClub() == clubId){
		clubFutbolista = c;
		break;
	}
}
if(clubFutbolista == null){
	clubFutbolista = new Club();
}
	
for(int i = 0; i < tablares.length; i++){
	idFutbolista = Integer.parseInt(tablares[i][0]);
	f = new Futbolista(idFutbolista, tablares[i][1], tablares[i][2], tablares[i][3], clubFutbolista);
	futbolistas.add(f);
}

%>

<table class="table table-striped">
	 
	 <tr colspan = 5 style = ><strong>Futbolistas del equipo: <%=clubFutbolista.getNombre() %></strong></tr>
<tr>
	<th>ID</th>
	<th>Nombre</th>
	<th>Apellidos</th>
	<th>Fecha Nacimiento</th>
	<th>Club</th>
</tr>
<%for(Futbolista fut: futbolistas){
	%>
	
<tr>
	<td><%=fut.getIdFutbolista() %></td>
	<td><%=fut.getNombre() %></td>
	<td><%=fut.getApellidos() %></td>
	<td><%=fut.getFechaNac()%></td>
	<td><%=fut.getClub().getNombre() %></td>
	<td>
	<form name="form_mod" method="get" action="modificarFutbolista.jsp?futbolista=<%=fut.getNombre() %>">
		<input type="hidden" name="futbolista" value=<%=fut.getIdFutbolista() %>>
	 	<a href="modificarFutbolista.jsp?futbolista=<%=fut.getIdFutbolista() %>">Modificar</a>
	</form>
	</td>
</tr>

<% 
}

if(request.getParameter("idFutbolista") != null){
	Integer futbolista_id = Integer.parseInt(request.getParameter("idFutbolista"));
	/* Integer futbolista_id_antiguo = Integer.parseInt(request.getParameter("idFutbolista_antiguo")); */
	String futbolista_nombre = request.getParameter("nombre");
	String futbolista_apellidos = request.getParameter("apellidos");
	String futbolista_fechaNac = request.getParameter("fechaNac");
	Integer futbolista_club_id = Integer.parseInt(request.getParameter("club"));
	Club clubNuevoFutbolista = null;
	for(Club cl: listaClubes){
		if(cl.getIdClub() == futbolista_club_id){
			clubNuevoFutbolista = cl;
			break;
		}
	}
	String queryModFutbolista;
	if(futbolista_id == null || futbolista_nombre == null || futbolista_apellidos == null || futbolista_fechaNac == null || futbolista_club_id == null || clubNuevoFutbolista == null || futbolista_nombre.trim().length() == 0 || futbolista_apellidos.trim().length() == 0 || futbolista_fechaNac.trim().length() == 0){
		queryModFutbolista = "";
		System.out.println("El id del jugador que se va a modificar es el " + futbolista_id);
	} else {
		System.out.println("El id del jugador que se va a modificar es el " + futbolista_id);
		queryModFutbolista = "update futbolistas set nombre='" + futbolista_nombre + "', apellidos='" + futbolista_apellidos + "', fechaNac='" + futbolista_fechaNac + "', club_id=" + futbolista_club_id + " where idFutbolista=" + futbolista_id;
		basededatos.update(queryModFutbolista);
	}
}
%>


</table>

</body>
</html>