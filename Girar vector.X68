*-----------------------------------------------------------
* Titulo : P1 (2024-2025) - Selection Sort
* Autores: Andreu Morey y Miquel Matas
*-----------------------------------------------------------
   ORG $1000
N: EQU 6
V: DC.B 5,3,8,10,1,4
VIN: DS.B N
*-----------------------------------------------------------

Minimo: DS.B 1
TEMP: DS.B 1
PosMin: DS.B 1
        DS.B 1 ;Para empezar en una posición par

START:
        MOVE.B #0,D3 ;índice externo =0

Bucle_Externo:
        CMP.B #N-1,D3
        BGE Fin

        LEA.L V,A0 
        MOVE.B D3,D0
        ADD.L D0,A0
        MOVE.B  (A0),D0 
        MOVE.B  D0,Minimo 
        MOVE.B D3,PosMin 
        MOVE.B D3,D2 
        ADDQ.B #1,D2

Bucle_Interno:
        CMP.B #N,D2
        BGE Comprobar_Intercambio
        
        LEA V,A1 
        MOVE.B D2,D0
        ADD.L D0,A1
        MOVE.B (A1),D1
        CMP.B Minimo,D1
        BGE Saltar_Actualizar
        
        MOVE.B D1,Minimo
        MOVE.B D2,PosMin
        
Saltar_Actualizar:
        ADDQ.B #1,D2
        BRA Bucle_Interno
        
Comprobar_Intercambio:
        MOVE.B PosMin,D0
        CMP.B D3,D0 
        BEQ Saltar_Intercambio
        
        LEA V,A2 
        MOVE.B D3,D0
        ADD.L D0,A2
        LEA V,A3
        MOVE.B PosMin,D0
        ADD.L D0,A3
        MOVE.B (A2),TEMP
        MOVE.B (A3),(A2)
        MOVE.B TEMP,(A3)

Saltar_Intercambio:
        ADDQ.B #1,D3
        BRA Bucle_Externo

Fin:    ;Girar el vector como hicimos en clase
        LEA.L VIN,A0
        MOVE.B #N,D1
        SUBQ.B #1,D1
        LEA.L VIN,A1    
Bucle:  
        MOVE.B -(A0),D0
        MOVE.B D0,(A1)
        ADDQ.L #1,A1
        DBRA D1,Bucle

        SIMHALT
        END     START



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
