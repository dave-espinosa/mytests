;UNIVERSIDAD INTERNACIONAL DE LA RIOJA - UNIR
;Máster Universitario en Inteligencia Artificial (MIA - EL) - PER1878 2020-2021
;Asignatura: Razonamiento y Planificación Automática
;Autor: David Alejandro Espinosa Guaita
;Fecha de Elaboración: 2021-02-25
;Fecha de Eliminación: 2021-02-06
;PROHIBIDA LA COPIA Y DIFUSIÓN, TOTAL O PARCIAL, DE ESTE PROGRAMA!

(define (problem problema2) (:domain healthcare-world)
(:objects 
    A - ambulancia
    L1 L2 L3 L4 - locacion
    P1 P2 - paciente
)

(:init
    ;INSERTAR AQUÍ ESTADOS INICIALES
    (amb_on_loc A L1)      ;Ambulancia ubicada en L1
    (pac_on_loc P1 L2)     ;Paciente P1 ubicado en L2
    (pac_on_loc P2 L4)     ;Paciente P2 ubicado en L3
    (not(pac_on_amb P1 A)) ;Paciente P1 no está ubicado en A
    (not(pac_on_amb P2 A)) ;Paciente P2 no está ubicado en A
    
    ;Enlaces: L1 <-> L2 <-> L3 <-> L4
    (enlace L1 L2) 
    (enlace L2 L3)
    (enlace L3 L4)
    (enlace L4 L3)
    (enlace L3 L2)
    (enlace L2 L1)
)

(:goal (and
    ;INSERTA META AQUÍ
    (pac_on_loc P1 L1)
    (pac_on_loc P2 L1)
    (amb_on_loc A L1)
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
