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
%>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Partidos</title>
<script type="text/javascript">
function cargarClubes(){
	var clubSelect1 = document.getElementById("club1").value;
	var listaClubes = <%= nombresClubes.toArray() %>
	
}

</script>
</head>
<body>
<h1>PARTIDOS</h1>
<hr/>
<p><a href="bienvenido.jsp">Página principal</a></p>
<p><a href="cerrarsesion.jsp">Salir</a></p>
<hr/>
<br/>


<form method="post" action="/csi2crmapp/partidos.jsp">
<label>Club 1</label>
<select name="club1" onchange="cargarClubes()">
<%  for(Club club_select: listaClubes){
		%><option value=<%=club_select.getIdClub()%>><%=club_select.getNombre()%></option>
	<%
    }
%>
</select>
<select name="club2">
<%  for(Club club_select: listaClubes){
		%><option value=<%=club_select.getIdClub()%>><%=club_select.getNombre()%></option>
	<%
    }
%>
</select>
</form>


</body>
</html>