<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="mipk.beanDB"%>
<%@page import="objetoscrm.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Agregando Partido</title>
</head>
<body>
<%
String club1 = request.getParameter("club1");
String club2 = request.getParameter("club2");
System.out.println(club1 + " vs " + club2);

String golesLocal_txt = request.getParameter("golesLocal");
String golesVisitante_txt = request.getParameter("golesVisitante");

Integer golesLocal = -1, golesVisitante = -1;
if(golesLocal_txt != null || golesLocal_txt.length() > 0){
	golesLocal = Integer.parseInt(golesLocal_txt);
}
if(golesVisitante_txt != null || golesVisitante_txt.length() > 0){
	golesVisitante = Integer.parseInt(golesVisitante_txt);
}

String campo = request.getParameter("nombreCampo");
System.out.println(campo);
String tipoPartido = request.getParameter("tipoPartido");
String fechaPartido = request.getParameter("fechaPartido");

if(club1 == club2){
	%>
	<h2>Deben elegirse 2 clubes distintos</h2>
	<%
} else if(fechaPartido.length() == 0 || fechaPartido == null){
	%>
	<h2>Debe establecerse una fecha correcta para el partido</h2>
	<%
} else {
	beanDB basededatos = new beanDB();
	basededatos.insert("insert into eventos values (" + (Integer.parseInt(basededatos.resConsultaSelectA3("select count(*) from eventos")[0][0]) + 1) + ", " + Integer.parseInt(tipoPartido) + ", '" + fechaPartido + "', " + campo + ", " + club1 + ", " + club2 + ", " + golesLocal + ", " + golesVisitante + ")");
	%>
	<h2>El partido se ha agregado con éxito</h2>
	<%
}
%>

</body>
</html>