<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "https://www.w3.org/TR/html4/loose.dtd">
<%@page import="mipk.Sesionok"%><html>
<head>
<% 
//aquí pongo todo el código java que quiera que mi servidor ejecute.
String usuario="";
boolean ok=false;
try {
	 usuario=session.getAttribute("usuario").toString();
	 ok=true;
} catch (Exception e) {
	response.sendRedirect("cerrarsesion.jsp");
}

%><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bienvenido</title>
</head>
<body>
<% if (ok) { %>
<h1>Bienvenido <%=session.getAttribute("usuario") %></h1>
Sesión iniciada
<hr/>
<a href="verdatos.jsp">Acceder a los Datos</a><br/>
<br/><br/><a href="cerrarsesion.jsp">Salir</a>
<% } else { 
	//AHORA PONGO EL HTML DE SESION INCORRECTA %>
<h1>Usuario y/o contraseña incorrectos.</h1>
Por favor, inténtelo de nuevo.<br/>
<a href="index.jsp">Volver</a>
<% } %>
</body>
</html>