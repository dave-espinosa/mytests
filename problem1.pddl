;UNIVERSIDAD INTERNACIONAL DE LA RIOJA - UNIR
;Máster Universitario en Inteligencia Artificial (MIA - EL) - PER1878 2020-2021
;Asignatura: Razonamiento y Planificación Automática
;Autor: David Alejandro Espinosa Guaita
;Fecha de Elaboración: 2021-02-25
;Fecha de Eliminación: 2021-02-06
;PROHIBIDA LA COPIA Y DIFUSIÓN, TOTAL O PARCIAL, DE ESTE PROGRAMA!

(define (problem problema1) (:domain healthcare-world)
(:objects 
    A1 - ambulancia
    L1 L2 L3 L4 - locacion
    P1 P2 - paciente
)

(:init
    ;INSERTAR AQUÍ ESTADOS INICIALES
    (amb_free A1)           ;Ambulancia está libre
    (amb_on_loc A1 L1)      ;Ambulancia ubicada en L1
    (pac_on_loc P1 L4)     ;Paciente P1 ubicado en L4
    (pac_on_loc P2 L3)     ;Paciente P2 ubicado en L3
    (not(pac_on_amb P1 A1)) ;Paciente P1 no está ubicado en A
    (not(pac_on_amb P2 A1)) ;Paciente P2 no está ubicado en A
    
    ;Enlaces: L1 <-> L2 <-> L4 <-> L3
    (enlace L1 L2) 
    (enlace L2 L4)
    (enlace L4 L3)
    (enlace L3 L4)
    (enlace L4 L2)
    (enlace L2 L1)
)

(:goal (and
    ;INSERTA META AQUÍ
    (pac_on_loc P1 L1) ;Paciente P1 entregado en L1 (Hospital)
    (pac_on_loc P2 L1) ;Paciente P2 entregado en L1 (Hospital)
    (amb_on_loc A1 L1)  ;Ambulancia A en L1 (Hospital)
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
