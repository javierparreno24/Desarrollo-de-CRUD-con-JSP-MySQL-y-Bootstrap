/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */

/**
 * main.js - Control de validación y eventos para el CRUD Académico
 */

// 1. Validación de formularios de Bootstrap (Criterio 65 del PDF)
(function () {
    'use strict';
    
    // Obtenemos todos los formularios a los que queremos aplicar estilos de validación de Bootstrap
    var forms = document.querySelectorAll('.needs-validation');

    // Bucle sobre ellos para evitar el envío si hay campos vacíos
    Array.prototype.slice.call(forms).forEach(function (form) {
        form.addEventListener('submit', function (event) {
            if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            }
            form.classList.add('was-validated');
        }, false);
    });
})();

// 2. Confirmación de eliminación para evitar borrados accidentales (Criterio 12/f)
document.addEventListener("DOMContentLoaded", function() {
    
    // Buscamos todos los botones que tengan la clase btn-danger (Eliminar)
    const deleteButtons = document.querySelectorAll(".btn-danger");
    
    deleteButtons.forEach(button => {
        button.addEventListener("click", function(event) {
            // Ventana emergente de confirmación
            const confirmacion = confirm("¿Estás seguro de que deseas eliminar este registro?");
            
            // Si el usuario cancela, evitamos que el enlace (href) se ejecute
            if (!confirmacion) {
                event.preventDefault();
            }
        });
    });
});