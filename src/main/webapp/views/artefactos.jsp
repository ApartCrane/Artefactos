<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}" />

<html>
<head>
    <link rel="stylesheet" href="${context}/assets/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${context}/assets/dist/css/main.css">
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
    <title>Artefactos</title>
</head>
<body>

<nav class="navbar navbar-dark bg-light ">
    <button type="button" class="btn btn-outline-success" data-bs-target="#Modalregistro" data-bs-toggle="modal" id="btn-registrar"><i class="fas fa-plus"></i> Agregar</button>

</nav>
<table class="table table-dark">
    <thead class="">
    <tr>
        <th>#</th>
        <th>Producto:</th>
        <th>Dirección:</th>
        <th>Pais:</th>
        <th>Estado:</th>
        <th>Acciones:</th>
    </tr>
    </thead>
    <tbody id="Cont_productos">
    </tbody>
</table>

<div class="modal fade" id="Modalregistro" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content col-sm-12">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Registro</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="row g-3" id="frmregistrar" method="POST" action="/ServletActions?action=Registrar" >
                    <div class="col-sm-7">
                        <label for="name" class="col-form-label">Producto:</label>
                        <input type="text" class="form-control" id="name">
                    </div>
                    <div class="col-sm-5">
                        <label for="diaApa" class="col-form-label">Fecha Registro:</label>
                        <input type="date" class="form-control" id="diaApa">
                    </div>
                    <div class="col-sm-12">
                        <label for="direccion" class="col-form-label">Calle:</label>
                        <input type="text" class="form-control" id="direccion">
                    </div>
                    <div class="col-sm-12">
                        <label for="urb" class="col-form-label">Colonia:</label>
                        <input type="text" class="form-control" id="urb">
                    </div>
                    <div class="col-sm-4">
                        <label for="postal" class="col-form-label">Codigo Postal:</label>
                        <input type="text" class="form-control" id="postal">
                    </div>
                    <div class="col-sm-4">
                        <label for="estado" class="col-form-label">Estado:</label>
                        <input type="text" class="form-control" id="estado">
                    </div>
                    <div class="col-sm-4">
                        <label for="pais" class="col-form-label">Pais:</label>
                        <input type="text" class="form-control" id="pais">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-outline-primary" id="btn-guardar">Guardar</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="Modalmodificar" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content col-sm-12">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel1">Modificar</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="row g-3" id="frmModificar" method="POST" action="${context}/ServletActions">
                    <input type="hidden" name="action" value="Modificar">
                    <input type="hidden" name="idApa" id="idApa" value="">
                    <div class="col-sm-7">
                        <label for="txtproducto1" class="col-form-label">Producto:</label>
                        <input type="text" class="form-control" id="txtproducto1" name="nombre">
                    </div>
                    <div class="col-sm-5">
                        <label for="diaApa1" class="col-form-label">Fecha Registro:</label>
                        <input type="date" class="form-control" id="diaApa1" name="fechareg">
                    </div>
                    <div class="col-sm-12">
                        <label for="direccion1" class="col-form-label">Calle:</label>
                        <input type="text" class="form-control" id="direccion1" name="direccion1">
                    </div>
                    <div class="col-sm-12">
                        <label for="urb1" class="col-form-label">Colonia:</label>
                        <input type="text" class="form-control" id="urb1" name="urb1">
                    </div>
                    <div class="col-sm-4">
                        <label for="postal1" class="col-form-label">Codigo Postal:</label>
                        <input type="text" class="form-control" id="postal1" name="codigopos">
                    </div>
                    <div class="col-sm-4">
                        <label for="estado1" class="col-form-label">Estado:</label>
                        <input type="text" class="form-control" id="estado1" name="estado">
                    </div>
                    <div class="col-sm-4">
                        <label for="pais1" class="col-form-label">Pais:</label>
                        <input type="text" class="form-control" id="pais1" name="pais1">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-outline-success" id="btn-guardar1">Guardar</button>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="ModalEliminar" tabindex="-1" aria-labelledby="exampleModalLabel2" aria-hidden="true">
    <div class="modal-dialog ">
        <div class="modal-content ">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel2">Eliminar</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="row g-3" id="frmEliminar" method="POST" action="">
                    <input type="hidden" name="idApa1" id="idApa1" value="">
                    <div class="col-sm-11">
                        <label for="nombre2" class="col-form-label">Producto:</label>
                        <input type="text" class="form-control" id="nombre2" disabled>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-outline-danger" id="btn-guardar2">Eliminar</button>
                <button type="button" class="btn btn-outline-warning" id="btn-bajatempo">Baja</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="Modaldetalles" tabindex="-1" aria-labelledby="exampleModalLabel3" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content col-sm-12">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel3">Detalles</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="row g-3">
                    <input type="hidden" name="idApa" id="idApa2" value="">
                    <div class="col-sm-7">
                        <label for="txtproducto1" class="col-form-label">Producto:</label>
                        <input type="text" class="form-control" id="nombre21" disabled>
                    </div>
                    <div class="col-sm-5">
                        <label for="diaApa1" class="col-form-label">Fecha Registro:</label>
                        <input type="date" class="form-control" id="diaApa21" disabled>
                    </div>
                    <div class="col-sm-12">
                        <label for="direccion1" class="col-form-label">Calle:</label>
                        <input type="text" class="form-control" id="direccion21" disabled>
                    </div>
                    <div class="col-sm-12">
                        <label for="urb1" class="col-form-label">Colonia:</label>
                        <input type="text" class="form-control" id="urb21" disabled>
                    </div>
                    <div class="col-sm-4">
                        <label for="postal1" class="col-form-label">Codigo Postal:</label>
                        <input type="text" class="form-control" id="postal21" disabled>
                    </div>
                    <div class="col-sm-4">
                        <label for="estado1" class="col-form-label">Estado:</label>
                        <input type="text" class="form-control" id="estado21" disabled>
                    </div>
                    <div class="col-sm-4">
                        <label for="pais1" class="col-form-label">Pais:</label>
                        <input type="text" class="form-control" id="pais21" disabled>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="${context}/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${context}/assets/plugins/bootstrap/js/bootstrap.bundle.js"></script>
<script src="${context}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
</body>
<script src="${context}/assets/dist/js/funciones.js"></script>
</html>


