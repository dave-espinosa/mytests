;UNIVERSIDAD INTERNACIONAL DE LA RIOJA - UNIR
;Máster Universitario en Inteligencia Artificial (MIA - EL) - PER1878 2020-2021
;Asignatura: Razonamiento y Planificación Automática
;Autor: David Alejandro Espinosa Guaita
;Fecha de Elaboración: 2021-02-25
;Fecha de Eliminación: 2021-02-06
;PROHIBIDA LA COPIA Y DIFUSIÓN, TOTAL O PARCIAL, DE ESTE PROGRAMA!

(define (domain healthcare-world)

;remove requirements that are not needed
(:requirements :strips :typing :negative-preconditions)

;TIPOS
(:types
    ambulancia paciente locacion - object
)

;PREDICADOS
(:predicates
    (amb_on_loc ?a - ambulancia ?l - locacion);Ambulancia en locación
    (pac_on_loc ?p - paciente ?l - locacion)  ;Paciente en locación
    (pac_on_amb ?p - paciente ?a - ambulancia);Paciente en ambulancia
    (enlace ?l1 ?l2 - locacion)                      ;Existe trayecto entre 'l1' y 'l2'
)

;ACCIONES
(:action viajar
    :parameters (?a - ambulancia ?l1 - locacion ?l2 - locacion)
    :precondition (and
        (amb_on_loc ?a ?l1)       ;La ambulancia está en el punto de partida
        (enlace ?l1 ?l2)          ;Existe un camino entre punto de partida y llegada
    )
    :effect (and 
        (not (amb_on_loc ?a ?l1)) ;La ambulancia no estará en el punto de partida
        (amb_on_loc ?a ?l2)       ;La ambulancia se ubicará en punto de llegada
    )
)

(:action subir
    :parameters (?a - ambulancia ?p - paciente ?l - locacion)
    :precondition (and
        (not(pac_on_amb ?p ?a))   ;El paciente no está en la ambulancia
        (pac_on_loc ?p ?l)        ;El paciente está en la ubicación 'l'
        (amb_on_loc ?a ?l)        ;La ambulancia está en la (misma) ubicación 'l'
    )
    :effect (and
        (pac_on_amb ?p ?a)        ;El paciente estará en la ambulancia
        (not (pac_on_loc ?p ?l))  ;El paciente ya no estará en ubicación 'l'
    )
)


(:action bajar
    :parameters (?a - ambulancia ?p - paciente ?l - locacion)
    :precondition (and
        (amb_on_loc ?a ?l)        ;La ambulancia está en la ubicación 'l'
        (pac_on_amb ?p ?a)        ;El paciente está en la ambulancia
    )
    :effect (and
        (pac_on_loc ?p ?l)        ;El paciente estará en ubicación 'l' (hospital)
        (not(pac_on_amb ?p ?a))   ;El paciente ya no estará en la ambulancia
    )
)

)