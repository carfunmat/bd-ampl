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
</head>
<body onload="alert('no way!!!');">
<h1><%=session.getAttribute("usuario") %>: Estos son los datos</h1>
<hr/>
<p><a href="bienvenido.jsp">Página principal</a></p>
<p><a href="cerrarsesion.jsp">Salir</a></p>
<hr/>
<br/>
<% 
String query="select idEspectador, nombre, apellidos, fechaNac from espectadores";
beanDB basededatos = new beanDB();
String [][] tablares = basededatos.resConsultaSelectA3(query);
ArrayList<Espectador> listaespectadores = new ArrayList<Espectador>();
for (int i=0; i<tablares.length;i++) {
	listaespectadores.add(new Espectador(tablares[i][0],tablares[i][1],tablares[i][2], tablares[i][3]));
}
%> 
<table>
<% for (Espectador e:listaespectadores) { //g es una variable tipo grupo que va recorriendo la lista
	%><tr>
	 <td> <%=e.getIdEspectador() %> </td>
	 <td> <%=e.getNombre() %> </td>
	 <td> <%=e.getApellidos() %> </td>
	 <td> <%=e.getFechaNac() %> </td>
	 </tr> <% 
}
%>
</table>
</body></html>