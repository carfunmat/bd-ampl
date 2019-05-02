<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<h1><%=session.getAttribute("usuario") %>: Estos son los datos</h1>
<hr/>
<p><a href="bienvenido.jsp">Página principal</a></p>
<p><a href="cerrarsesion.jsp">Salir</a></p>
<hr/>
<br/>
<% 
String query="select idEspectador, nombre, apellidos, date_format(fechaNac, '%d-%m-%Y') from espectadores";
beanDB basededatos = new beanDB();
String [][] tablares = basededatos.resConsultaSelectA3(query);
ArrayList<Espectador> listaespectadores = new ArrayList<Espectador>();
for (int i=0; i<tablares.length;i++) {
	listaespectadores.add(new Espectador(tablares[i][0],tablares[i][1],tablares[i][2], tablares[i][3]));
}
%> 
<table class="table table-striped">
<% for (Espectador e:listaespectadores) {
	%><tr>
	 <!-- Agregar cabecera tabla -->
	 <td> <%=e.getNombre() %> </td>
	 <td> <%=e.getApellidos() %> </td>
	 <td> <%=e.getFechaNac() %> </td> 
	 </tr> <% 
}
%>
</table>
</body></html>