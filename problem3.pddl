(define (problem problema1) (:domain healthcare-world)
(:objects 
    A1 A2 - ambulancia
    L1 L2 L3 L4 - locacion
    P1 P2 - paciente
)

(:init
    ;INSERTAR AQUÍ ESTADOS INICIALES
    (amb_on_loc A1 L1)      ;Ambulancia ubicada en L1
    (amb_on_loc A2 L1)      ;Ambulancia ubicada en L1
    (pac_on_loc P1 L4)     ;Paciente P1 ubicado en L4
    (pac_on_loc P2 L3)     ;Paciente P2 ubicado en L3
    (not(pac_on_amb P1 A1)) ;Paciente P1 no está ubicado en A
    (not(pac_on_amb P2 A1)) ;Paciente P2 no está ubicado en A
    (not(pac_on_amb P1 A2)) ;Paciente P1 no está ubicado en A
    (not(pac_on_amb P2 A2)) ;Paciente P2 no está ubicado en A
    
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
    (pac_on_loc P1 L1)
    (pac_on_loc P2 L1)
    (amb_on_loc A1 L1)
    (amb_on_loc A2 L1)
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)