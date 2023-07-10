<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/5ac1168347.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../CSS/Estilo-Perfil.css">
    <link rel="stylesheet" href="../CSS/Principal-Estilo-Menu-Principal.css">
    <link rel="stylesheet" href="../CSS/Estilos-Ingresos.css">
    <link rel="stylesheet" href="../CSS/estilos-extra1.css">
    <title>Perfil</title>

    <style>
        /* Estilos para el overlay popup */
        .overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 999;
        }

        .overlay.show {
            display: block;
        }

        .popup {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>
<%
    String idusuario= request.getParameter("usuario");
    modelo.usuario us = new controlador.control_impl().muestraUsuario(idusuario);
%>
<div class="Cuadro-morado">
    <img src="../IMG/logo.png" alt="Logotipo" title="Logotipo" class="Logo">
    <span>SGAFP</span>
    <a class="CSesion" href="CerrarSesionServlet"><i title="Cerrar Sesión" class="fas fa-sign-out-alt icon-tam"></i></a>
</div>

<center>
    <nav>
        <a href="Perfil.jsp?usuario=<%=us.getUsuario()%>"><b>Perfil</b>  <br> <i class="far fa-address-card icon-menu"></i></a>
        <a href="Gastos.jsp?usuario=<%=us.getUsuario()%>"><b>Gastos</b> <br> <i class="fas fa-hand-holding-usd icon-menu"></i></a>
        <a href="Ingresos.jsp?usuario=<%=us.getUsuario()%>"><b>Ingresos</b> <br> <i class="fas fa-piggy-bank icon-menu"></i></a>
        <a href="Estadisticas.jsp?usuario=<%=us.getUsuario()%>"><b>Estadisticas</b><br> <i class="fas fa-chart-pie icon-menu"></i></a>
        <div class="animation start-home"></div>
    </nav>
</center>

<div class="Cuadro-blanco">
    <div class="div-derecho">
        <center>
            <span class="h1-titulo">Perfil</span>

            <br>
            <p class="p-sub">Información personal</p>
            <table class="tb-info-perfil">
                <tr class="tr-info-perfil">
                    <td class="td-info-perfil">Usuario: </td>
                    <td><%=us.getUsuario()%></td>
                </tr>
                <tr class="tr-info-perfil">
                    <td class="td-info-perfil">Nombre: </td>
                    <td><%=us.getNombre()%> <%=us.getApaterno()%> <%=us.getAmaterno()%></td>
                </tr>
                <tr class="tr-info-perfil">
                    <td class="td-info-perfil">Email: </td>
                    <td><%=us.getCorreo()%></td>
                </tr>
                <tr class="tr-info-perfil">
                    <td class="td-info-perfil">Teléfono: </td>
                    <td><%=us.getTelefono()%></td>
                </tr>
            </table>

            <button id="editar-btn" class="editar-btn" style="background-color: #c9187f;">
                <span style="color: #fff;">Actualizar información personal</span>
                <i class="fas fa-edit" style="color: #fff;"></i>
            </button>

        </center>
    </div>
    <div class="div-izquierdo">
        <br><br>
        <center>
            <img src="<%=us.getFoto()%>" alt="Foto" class="img-foto br-img-foto" id="foto-usuario">
        </center>
        <br><br>
        <table class="tb-btn-img">
            <tr>
                <td>
                    <a href="cambia-img.jsp?usuario=<%=us.getUsuario()%>" class="a-btn-img">
                        <i title="Cambiar Imagen" class="far fa-images icon-menu1"></i>
                    </a>
                </td>
                <td>
                    <a href="eliminar-foto.jsp?usuario=<%=us.getUsuario()%>" class="a-btn-img">
                        <i title="Quitar Imagen" class="far fa-eye-slash icon-menu1"></i>
                    </a>
                </td>
            </tr>
        </table>
    </div>

</div>

<!-- Overlay popup -->
<div class="overlay" id="overlay">
    <div class="popup">
        <h2>Actualizar información personal</h2>
        <form action="ActualizarPerfilServlet" method="POST">
            <input type="hidden" name="usuario" value="<%=us.getUsuario()%>">

            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" value="<%=us.getNombre()%>">

            <label for="apaterno">Apellido Paterno:</label>
            <input type="text" id="apaterno" name="apaterno" value="<%=us.getApaterno()%>">

            <label for="amaterno">Apellido Materno:</label>
            <input type="text" id="amaterno" name="amaterno" value="<%=us.getAmaterno()%>">

            <label for="correo">Correo electrónico:</label>
            <input type="email" id="correo" name="correo" value="<%=us.getCorreo()%>">

            <label for="telefono">Teléfono:</label>
            <input type="text" id="telefono" name="telefono" value="<%=us.getTelefono()%>">

            <button type="submit">Guardar cambios</button>
        </form>

        <button id="cerrar-btn">Cerrar</button>
    </div>
</div>

<script>
    // Obtener la referencia a la imagen del usuario
    const fotoUsuario = document.getElementById('foto-usuario');

    // Función para actualizar la imagen
    function actualizarFoto() {
        // Agregar una cadena de consulta única a la URL de la imagen
        const nuevaURL = `<%=us.getFoto()%>?v=${Date.now()}`;

        // Asignar la nueva URL a la imagen
        fotoUsuario.src = nuevaURL;
    }

    // Llamar a la función para actualizar la foto cuando se cargue la página
    window.addEventListener('load', actualizarFoto);

    const editarBtn = document.getElementById('editar-btn');
    const overlay = document.getElementById('overlay');
    const cerrarBtn = document.getElementById('cerrar-btn');

    editarBtn.addEventListener('click', function (event) {
        event.preventDefault();
        overlay.style.display = 'block';
    });

    cerrarBtn.addEventListener('click', function () {
        overlay.style.display = 'none';
    });

    // Ocultar el overlay popup al cargar la página
    window.addEventListener('DOMContentLoaded', function() {
        overlay.style.display = 'none';
    });
</script>

</body>
</html>
