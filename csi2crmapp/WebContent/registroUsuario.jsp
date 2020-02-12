<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registro Nuevo Usuario</title>

<script type="text/javascript">
function compruebayenvia() {
	datos=document.registroUsuario;
	if (datos.usuario.value == '' ||
			datos.pass.value == '')
		alert ('¡Tiene que rellenar todos los campos!');
	else datos.submit();
}
function compruebanums(campo, evento) {
	var keycode;
	if (window.event) keycode = window.event.keyCode;
	else if (evento) keycode = evento.which;
	else return true;
	if (keycode < 48 || keycode > 57) //Rango ASCII de números
	{
		if (keycode != 8 && keycode != 27 && keycode != 0 ) { //Caracteres especiales permitidos
			alert('Sólo puede introducir números ');
			return false;
		}
		else return true;
	}
	else return true;
}
function compruebaalfan(campo, evento) {
	var keycode;
	if (window.event) keycode = window.event.keyCode;
	else if (evento) keycode = evento.which;
	else return true;
	if (( keycode < 48 || keycode > 57 ) && ( keycode < 64 || keycode > 90 ) && ( keycode < 97 || keycode > 122 )) //Rango ASCII de números y letras
	{
		if (keycode != 8 && keycode != 27 && keycode != 0 ) { //Caracteres especiales permitidos
			alert('Sólo puede introducir letras y números ');
			return false;
		}
		else return true;
	}
	else return true;
}
</script>
</head>
<body>
<h3>Registro de nuevo usuario</h3>

<form action="resultadoRegistroUsuario.jsp" method="post" name="registroUsuario">
<table style="text-align: left; border: none;">
<tr><td>
<input type="hidden" name="varoculta" value="secreto"/>
Usuario:
	</td><td><input type="text" name="usuario" onkeypress="return compruebaalfan(this,event);" maxlength="10" value="" class="inputgris"/>
</td></tr><tr><td>
Contraseña:
	</td><td><input type="password" name="pass" onkeypress="return compruebaalfan(this,event);" maxlength="8" value="" class="inputgris"/>
</td></tr><tr><td>
Nombre:
	</td><td><input type="text" name="nombre" onkeypress="return compruebaalfan(this,event);" maxlength="20" value="" class="inputgris"/>
</td></tr><tr><td>
Apellidos:
	</td><td><input type="text" name="apellidos" onkeypress="return compruebaalfan(this,event);" maxlength="40" value="" class="inputgris"/>
</td></tr><tr><td>
	</td><td style="text-align: right;">
		<input type="button" name="send" value="Registrarse" onclick="compruebayenvia();"/>
</td></tr></table>
</form>

</body>
</html>