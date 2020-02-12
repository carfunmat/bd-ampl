<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="objetoscrm.Util"%><html>
<head>
<meta charset="ISO-8859-1">
<title>Resultado Registro Nuevo Usuario</title>
</head>
<body>
<%
String usuario = request.getParameter("usuario");
String pass = request.getParameter("pass");
String nombre = request.getParameter("nombre");
String apellidos = request.getParameter("apellidos");
if (usuario == null) usuario = "";
if (pass == null) pass = "";
if (nombre == null) nombre = "";
if (apellidos == null) apellidos = "";
//boolean ok = false;

if (usuario.length() > 0 && pass.length() > 0 && nombre.length() > 0 && apellidos.length() > 0) {
	Util.insertaUsuario(usuario, pass, nombre, apellidos);
	%>
	<h2>El usuario ha sido registrado con éxito</h2> 
	<%
} else {
	%>
	<h2>El usuario no ha sido registrado</h2> 
	<% 	
}
%>
</body>
</html>