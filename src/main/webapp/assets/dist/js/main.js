const findAll = () =>{
    $.ajax({
        type: 'GET',
        url: 'http://localhost:8080/Artefactos_war/readArtefactos'
    }).done(function (res){
        let ListArtefactos = res.ListArtefactos;
        let content = "";
        if(ListArtefactos.length > 0){
            let conta = 1;
            for (let artefacto of ListArtefactos) {
                content += `
             <tr>
             <td>${conta}</td>
             <td>${artefacto.nombre}</td>
             <td>${artefacto.directApa.direccion}, ${artefacto.directApa.urb}, ${artefacto.directApa.postal}, ${artefacto.directApa.estado}, ${artefacto.directApa.pais}</td>
             <td>${artefacto.diaApa}</td>
             <td>${artefacto.status ? `<span class="badge rounded-pill bg-success">Activo</span>` : `<span class="badge rounded-pill bg-danger">Inactivo</span>`}</td>
             <td>${artefacto.status  ?
                    `<button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#update" onclick="busquedaId('${artefacto.idApa}','1');"> <i class="fas fa-edit"></i> Modificar</button> `
                    +
                    ` <button  type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#delete" onclick="busquedaId('${artefacto.idApa}','2');"><i class="fas fa-trash"></i> Eliminar</button>`
                    : `<button  type="button" class="btn btn-outline-info" data-bs-toggle="modal" data-bs-target="#details" onclick="busquedaId('${artefacto.idApa}','3');" ><i class="fas fa-info-circle"></i> Detalles</button>`}
             </td>
             </tr>        
             `;
                conta++;
            }

        }else{
            content=`
       <tr>
       <td colspan="6" align="center">No hay artefactos registrados</td>
       </tr>
       
       `;
        }
        $("#tableGadget > tbody").html(content);
    });
}
const crear = () =>{
    let action = 'crear';
    let nombre  = document.getElementById("nombre").value;
    let direccion = document.getElementById("direccion").value;
    let urb = document.getElementById("urb").value;
    let postal = document.getElementById("postal").value;
    let estado =  document.getElementById("estado").value;
    let pais = document.getElementById("pais").value;
    let dia = document.getElementById("dia").value;

    $.ajax({
        type: 'POST',
        url: 'http://localhost:8080/Artefactos_war/createArtefactos',
        data: {
            action: action,
            nombre:  nombre,
            direccion: direccion,
            urb: urb,
            postal: postal,
            estado: estado,
            pais: pais,
            dia: dia
        }
    }).done(function(res){
        document.getElementById("nombre").value="";
        document.getElementById("direcciont").value="";
        document.getElementById("urb").value="";
        document.getElementById("postal").value="";
        document.getElementById("estado").value="";
        document.getElementById("pais").value="";
        document.getElementById("dia").value="";
        $('#create').modal('hide');
        findAll();
    });
}
const busquedaId = (id, type) => {
    let typeCrud = type;
    $.ajax({
        type: 'POST',
        url: 'http://localhost:8080/Artefactos_war/busquedaId',
        data: {
            action: 'findById',
            id: id,
        }
    }).done(function(res){
        let artefacto= res.gadget;
        switch(typeCrud){
            case '1':
                document.getElementById("id").value=id;
                document.getElementById("idDirect").value=artefacto.directApa.idDirect;
                document.getElementById("nombre1").value=artefacto.nombre;
                document.getElementById("direccion1").value=artefacto.directApa.direccion;
                document.getElementById("urb1").value=artefacto.directApa.urb;
                document.getElementById("postal1").value=artefacto.directApa.postal;
                document.getElementById("estado1").value=artefacto.directApa.estado;
                document.getElementById("pais1").value=artefacto.directApa.pais;
                document.getElementById("dia1").value=artefacto.dia;
                break;
            case '2':
                document.getElementById("id2").value=id;
                document.getElementById("nombre2").innerHTML=artefacto.nombre;
                break;
            case '3':
                document.getElementById("nombre3").innerHTML=artefacto.nombre;
                document.getElementById("direccion2").innerHTML=artefacto.directApa.street;
                document.getElementById("urb2").innerHTML=artefacto.directApa.suburb;
                document.getElementById("postal2").innerHTML=artefacto.directApa.postal;
                document.getElementById("estado2").innerHTML=artefacto.directApa.estado;
                document.getElementById("ciudad2").innerHTML=artefacto.directApa.pais;
                document.getElementById("dia2").innerHTML=artefacto.dia;

                break;
        }
    });
}
findAll();