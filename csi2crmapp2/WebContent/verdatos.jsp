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
%> 
<table>
<% for (int i=0; i<tablares.length;i++) { //g es una variable tipo grupo que va recorriendo la lista
	%><tr>
	 <td> <%=tablares[i][0] %> </td>
	 <td> <%=tablares[i][1] %> </td>
	 <td> <%=tablares[i][2] %> </td>
	 </tr> <% 
}
%>
</table>
</body></html>