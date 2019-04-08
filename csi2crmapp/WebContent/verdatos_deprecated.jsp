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
<h1><%=session.getAttribute("usuario") %>: Estos son los datos datos</h1>
<hr/>
<p><a href="bienvenido.jsp">Página principal</a></p>
<p><a href="cerrarsesion.jsp">Salir</a></p>
<hr/>
<br/>
<% 
String query="select idGrupo, Profesores_idProfesor, etapas_idEtapa from grupos";
beanDB basededatos = new beanDB();
String [][] tablares = basededatos.resConsultaSelectA3(query);
ArrayList<Grupos> listagrupos = new ArrayList<Grupos>();
for (int i=0; i<tablares.length;i++) {
	listagrupos.add(new Grupos(tablares[i][0],tablares[i][1],tablares[i][2]));
}
%> 
<table>
<% for (Grupos g:listagrupos) { //g es una variable tipo grupo que va recorriendo la lista
	%><tr>
	 <td> <%=g.getIdGrupo() %> </td>
	 <td> <%=g.getetapa() %> </td>
	 <td> <%=g.getIdTutor() %> </td>
	 </tr> <% 
}
%>
</table>
</body></html>