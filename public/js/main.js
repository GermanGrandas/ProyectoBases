function validacion() {
    console.log("hola mundo");
    if (document.p.nombre.value.length==0) {
     // Si no se cumple la condicion...
        alert('[ERROR] El campo no debe ser nulo');
        return false;
    }else{
    alert("Muchas gracias por enviar el formulario"); 
    document.p.submit(); 
    }};