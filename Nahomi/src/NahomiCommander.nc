%
O08000 (NAHOMI COMMANDER)
(#####################################################################################)
(##                               FRAMEWORK NAHOMI CNC                              ##)
(##                   Donde la precision encuentra la dulzura                       ##)
(##                                                                                 ##)
(##           Agradable ->  Como la experiencia de usar codigo claro                ##)
(##           Dulzura   ->  Como el flujo de trabajo armonico                       ##)
(##           Placer    ->  Como la satisfaccion de ver piezas perfectas            ##)
(##           Deleite   ->  Como la alegria de crear herramientas utiles            ##)
(##                                                                                 ##)
(##  Porque el trabajo bien hecho deberia ser agradable, la complejidad deberia ser ##)
(##  manejable y dulce, resolver problemas deberia dar placer, y ver a otros logran ##)
(##  sus objetivos un deleite.                                                      ##)
(##                                                                                 ##)
(##  Dedico mi trabajo a mi hija, ella en su edad de infinitos porques              ##)
(##  y descubrimientos diarios, me recordo que la mejor tecnologia no es la mas     ##)
(##  compleja, sino la que resuelve problemas reales con claridad y proposito.      ##)
(##                                                                                 ##)
(##                                                                                 ##)
(##           Porque si no puedo explicarle algo probablemente este muy complicado. ##)
(##                                                                                 ##)
(#####################################################################################)
(##  FUNCION G81                                                                    ##)
(##  G65 P8000 W1. T1 S900 F0.1 Z-2. R5. A0. C2.                                    ##)
(##  FUNCION G73                                             U21 V22 W23 E8         ##)
(##  G65 P8000 W2. T4 S900 F0.1 Z-22. R5. Q3. A0. C2.                               ##)
(##  FUNCION G83                                                                    ##)
(##  G65 P8000 W3. T4 S900 F0.1 Z-22. R5. Q3. A0. C2.                               ##)
(##  FUNCION G84                                                                    ##)
(##  G65 P8000 W4. T11 S400 F1.5 Z-12. R5. A2. C2.                                  ##)
(##  FUNCION CAJAS                                                                  ##)
(##  G65 P8000 W5. T17 S2350 F0.36 Z-20. Q0.3 R1. D30. A0. C1                       ##)
(##  FUNCION G86                                                                    ##)
(##  G65 P8000 W6. T5 S150 Z-18. R5. A0. C2.                                        ##)
(##  FUNCION ANGULO Z                                                               ##)
(##  G65 P8000 W7. T26 S2400 X0. Y-35. Z0. H50. A-91. B0. C100. F0.8 I0.            ##)
(##  FUNCION CIRCULO CONDICIONADOR                                                  ##)
(##  G65 P8000 W8. T27 S1800 F0.8 X0. Y0. Z-5. R0. D15. Q.2                         ##)
(##  FUNCION CONTORNO CUADRADO EXTERIOR                                             ##)
(##  G65 P8000 W9. T27 S1800 F0.8 X0. Y0. Z-58.66 K0. R0. A15. B150. V1.            ##)
(##  FUNCION OBLONGO ANGULADO                                                       ##)
(##  G65 P8000 W10. T25 S2400 F0.36 X-30. Y-12.5 Z0. D27. A0. H160. Q0.5            ##)
(##  CALENTAR HUSILLO                                                               ##)
(##  G65 P8000 W11.                                                                 ##)
(##  LIMPIAR BROCAS                                                                 ##)
(##  G65 P8000 W12. S2000 T2                                                        ##)
(#####################################################################################)
IF[#23 EQ #0] GOTO999                                                   (FUNCION SALIR)
IF[#23 EQ 1.] GOTO1                                                       (FUNCION G81)
IF[#23 EQ 2.] GOTO2                                                       (FUNCION G73)
IF[#23 EQ 3.] GOTO3                                                       (FUNCION G83)
IF[#23 EQ 4.] GOTO4                                                       (FUNCION G84)
IF[#23 EQ 5.] GOTO5                                                     (FUNCION CAJAS)
IF[#23 EQ 6.] GOTO11                                                      (FUNCION G86)
IF[#23 EQ 7.] GOTO12                                                 (FUNCION ANGULO Z)
IF[#23 EQ 8.] GOTO15                                            (CIRCULO CONDICIONADOR)
IF[#23 EQ 9.] GOTO16                                       (CONTORNO CUADRADO EXTERIOR)
IF[#23 EQ 10.] GOTO21                                                (OBLONGO ANGULADO)
IF[#23 EQ 11.] GOTO28                                                (CALENTAR HUSILLO)
IF[#23 EQ 12.] GOTO29                                                   (LIMPIAR BROCA)
GOTO999                                                               (FIN DE PROGRAMA)
(####ABRAHAM#ORTIZ#ONTIVEROS##################################20/11/2025####NAHOMI####)
N01                                                                       (FUNCION G81)
T#20 M06 
M03 S#19
M08
#197 = ABS[#18 * 5]
IF[#197 GT 150. ] THEN #197 = 150.                                         (LIMITE MAX)
IF[#197 LT 10.] THEN #197 = 10.                                            (LIMITE MIN)
IF[#9 EQ #0] THEN #9 = 90.                                      (AVANCE PREDETERMINADO)
#199 = 0                                                            (CONTADOR TEMPORAL)
#198 = 100 + [[#1 + #199] * 2]                          (FUNCION DE COORDENADA INICIAL)
G00 G90 X#[#198] Y#[#198 + 1]
G43 H#20 Z#197
#199 = 0                                                                (CONTADOR LOOP)
WHILE [#199 LT #3] DO1                                             (CICLO DE BARRENADO)
#198 = 100 + [[#1 + #199] * 2]                                                (FORMULA)
G00 X#[#198] Y#[#198 + 1]
G98 G81 Z#26 R#18 F#9
#199 = #199 + 1
END1
G80
G00 Z#197
M09
M05
/G91 G28 Z0. Y0.
M01
M99
(####ABRAHAM#ORTIZ#ONTIVEROS##################################20/11/2025####NAHOMI####)
N02                                                                       (FUNCION G73)
T#20 M06 
M03 S#19
M08
#197 = ABS[#18 * 5]
IF[#197 GT 50.] THEN #197 = 50.                                            (LIMITE MAX)
IF[#197 LT 10.] THEN #197 = 10.                                            (LIMITE MIN)
IF[#9 EQ #0 ] THEN #9 = 90.                                     (AVANCE PREDETERMINADO)
#199 = 0                                                            (CONTADOR TEMPORAL)
#198 = 100 + [[#1 + #199] * 2]                          (FUNCION DE COORDENADA INICIAL)
G00 G90 X#[#198] Y#[#198 + 1]
G43 H#20 Z#197                                                     (CICLO DE BARRENADO)
#199 = 0                                                                (CONTADOR LOOP)
WHILE [#199 LT #3] DO1
#198 = 100 + [[#1 + #199] * 2]                                                (FORMULA)
G00 X#[#198] Y#[#198 + 1]
G98 G73 Z#26 R#18 Q#17 F#9
#199 = #199 + 1
END1                                                                  (FIN DE PROGRAMA)
G80
G00 Z#197
M09
M05
/G91 G28 Z0. Y0.
M01
M99
(####ABRAHAM#ORTIZ#ONTIVEROS##################################20/11/2025####NAHOMI####)
N03                                                                       (FUNCION G83)
T#20 M06 
M03 S#19
M08
#197 = ABS[#18 * 5]                                             (CALCULOS DE SEGURIDAD)
IF[#197 GT 150. ] THEN #197 = 150.                                         (LIMITE MAX)
IF[#197 LT 10.] THEN #197 = 10.                                            (LIMITE MIN)
IF[#9 EQ #0 ] THEN #9 = 90.                                     (AVANCE PREDETERMINADO)
#199 = 0                                                            (CONTADOR TEMPORAL)
#198 = 100 + [[#1 + #199] * 2]                          (FUNCION DE COORDENADA INICIAL)
G00 G90 X#[#198] Y#[#198 + 1]                                 (IR A COORDENADA INICIAL)
G43 H#20 Z#197
#199 = 0                                                                (CONTADOR LOOP)
WHILE [#199 LT #3] DO1
#198 = 100 + [[#1 + #199] * 2]                                                (FORMULA)
G00 X#[#198] Y#[#198 + 1]
G98 G83 Z#26 R#18 Q#17 F#9
#199 = #199 + 1
END1
G80                                                                      (FIN DE CICLO)
G00 Z#197
M09
M05
/G91 G28 Z0. Y0.
M01
M99
(####ABRAHAM#ORTIZ#ONTIVEROS##################################20/11/2025####NAHOMI####)
N04                                                                       (FUNCION G84)
T#20 M06 
M03 S#19
M08
(CALCULOS DE SEGURIDAD)
#197 = ABS[#18 * 5]
IF[#197 GT 150. ] THEN #197 = 150.                                         (LIMITE MAX)
IF[#197 LT 10.] THEN #197 = 10.                                            (LIMITE MIN)
(IF[#9 EQ #0] THEN #9 = 0.1 )                                   (AVANCE PREDETERMINADO)
#199 = 0                                                            (CONTADOR TEMPORAL)
#198 = 100 + [[#1 + #199] * 2]                          (FUNCION DE COORDENADA INICIAL)
G00 G90 X#[#198] Y#[#198 + 1]
G43 H#20 Z#197                                                     (CICLO DE BARRENADO)
#199 = 0                                                                (CONTADOR LOOP)
WHILE [#199 LT #3] DO1
#198 = 100 + [[#1 + #199] * 2]                                                (FORMULA)
G00 X#[#198] Y#[#198 + 1]
G98 G84 Z#26 R#18 F#9
#199 = #199 + 1
END1                                                                  (FIN DE PROGRAMA)
G80
G00 Z#197
M09
M05
/G91 G28 Z0. Y0.
M01
M99
(####ABRAHAM#ORTIZ#ONTIVEROS##################################25/11/2025####NAHOMI####)
N05                                                                             (CAJAS)
IF[#17 EQ #0] THEN #17 = 0.25                                      (PREDETERMINADO - Q)
IF[#18 EQ #0] THEN #18 = 5.0                                       (PREDETERMINADO - R)
IF[#21 EQ #0] THEN #191 = 100.                                (RETRACCION COMPLETA - U)
(CALCULOS)
#196=#7/2.                                                                      (RADIO)
#195=[#7/2.]*-1.                                                       (RADIO NEGATIVO)
IF[#18 GT 0] THEN GOTO6                                                   (AVALUAR R Z)
IF[#18 LE 0] THEN GOTO7                                                   (AVALUAR R Z)
IF[#18 EQ 0] THEN GOTO8                                                   (AVALUAR R Z)
IF[#26 GT 0] THEN GOTO9                                                   (AVALUAR R Z)
N6                                                            (R EXACTAMENTE IGUAL A 0)
#194= ABS[#26]+ABS[#18]
GOTO10
N7                                                                      (R MENOR QUE 0)
#194= ABS[#26]-ABS[#18] 
GOTO10
N8                                                                      (R MAYOR QUE 0)
#194= ABS[#26]
GOTO10
N9                                                            (Z EXACTAMENTE IGUAL A 0)
#194= ABS[#18]-ABS[#26]
GOTO10
N10                                                                 (CALCULO DE ALTURA)
#193=FIX[[ABS[#194/#17]]+1]                                           (NUMERO DE PASOS)
#192=[#194*-1.]+ABS[#193*#17]                               (CALCULO DE APROXIMACION Z)
#197 = #18+10.                                                  (CALCULOS DE SEGURIDAD)
T#20 M06
M03 S#19
M08
#199 = 0                                                               (CONTADOR CAJAS)
WHILE [#199 LT #3] DO1
#198 = 100 + [[#1 + #199] * 2]                            (CALCULO VARIABLE COORDENADA)
IF[#[#198] EQ #0] THEN #3000=1                               (COORDENADA X NO DEFINIDA)
IF[#[#198+1] EQ #0] THEN #3000=1                             (COORDENADA Y NO DEFINIDA)
G00 G90 X#[#198] Y#[#198 + 1]
G43 H#20 Z#197
G01 Z[#18+#192] F[#9/3.]
G01 G91 G41 D#20 X#196 F[#9/3.]                                      (CICLO HELICOIDAL)
G03 I#195 J0.0 Z[#17*-1.] L#193 F#9
G03 I#195 J0.0 F[#9/3.]                                                (LIMPIEZA FINAL)
G01 G40 X#195 F[#9/3.]
G90 G00 Z#197
G00 Z [ #197 + #191 ] 
#199 = #199 + 1
END1
G00 Z [ #197 + #191 ]                                                 (FIN DE PROGRAMA)
M09
M05
/G91 G28 Z0. Y0.
M01
M99
(####ABRAHAM#ORTIZ#ONTIVEROS##################################25/11/2025####NAHOMI####)
N11                                                                       (FUNCION G86)
T#20 M06 
M03 S#19
M08                                                             (CALCULOS DE SEGURIDAD)
#197 = ABS[#18 * 5]
IF[#197 GT 50.] THEN #197 = 50.                                            (LIMITE MAX)
IF[#197 LT 10.] THEN #197 = 10.                                            (LIMITE MIN)
IF[#9 EQ #0 ] THEN #9 = 90.                                     (AVANCE PREDETERMINADO)
#199 = 0                                                            (CONTADOR TEMPORAL)
#198 = 100 + [[#1 + #199] * 2]                          (FUNCION DE COORDENADA INICIAL)
G00 G90 X#[#198] Y#[#198 + 1]
G43 H#20 Z#197                                                     (CICLO DE BARRENADO)
#199 = 0                                                                (CONTADOR LOOP)
WHILE [#199 LT #3] DO1
#198 = 100 + [[#1 + #199] * 2]                                                (FORMULA)
G00 X#[#198] Y#[#198 + 1]
G98 G86 Z#26 R#18 F#9
#199 = #199 + 1
END1                                                                  (FIN DE PROGRAMA)
G80
G00 Z#197
M09
M05
/G91 G28 Z0. Y0.
M01
M99
(####ABRAHAM#ORTIZ#ONTIVEROS##################################15/12/2025####NAHOMI####)
N12                                                                          (ANGULO Z)
IF[#4 EQ #0] THEN #4 = 13                          (POSICION DE SUBPROGRAMA Y CORTE XZ)
IF[#4 EQ 0] THEN #4 = 13                           (POSICION DE SUBPROGRAMA Y CORTE XZ)
IF[#4 EQ 1] THEN #4 = 14                           (POSICION DE SUBPROGRAMA Y CORTE XZ)
T#20 M06
M03 S#19
M08
G00 G90 X#24 Y#25
G43 H#20 Z[#26+10.]
#101= COS[#1+#2]*#11                                                                (Z)
#102= SIN[#1+#2]*#11                                                               (XY)
#103= #17
#104= FIX[#3/ABS[#103]]                                                       (PASO YX)
G91 G01 Z-10. F0.25 
M97 P#4 L#104                                                                  (MATRIZ)
G00 Z[#26+50.]                                                                 (SALIDA)
M09
M05
/G91 G28 Z0. Y0.
M01
M99
N13                                                                         (MATRIZ XZ)
G91
G01 Y#103 F[#9/2]
G01 X#101 Z#102 F[#9]
G01 Y#103 F[#9/2]
G01 X[#101*-1.] Z[#102*-1.] F[#9]
M99
N14                                                                         (MATRIZ YZ)
G91
G01 X#103 F[#9/2]
G01 Y#101 Z#102 F[#9]
G01 X#103 F[#9/2]
G01 Y[#101*-1.] Z[#102*-1.] F[#9]
M99
(#####################################################################################)
N15                                                             (CIRCULO CONDICIONADOR)
IF[#9 EQ #0 ] THEN #9 = 360.                                       (PREDETERMINADA - F)
IF[#7 EQ #0 ] THEN #3000 = 1                                     (PROPORCIONE DIAMETRO)
IF[#17 EQ #0 ] THEN #17 = 0.5                                      (PREDETERMINADA - Q)
IF[#18 EQ #0 ] THEN #18 = 0                                        (PREDETERMINADA - R)
IF[#24 EQ #0 ] THEN #24 = 0                                        (PREDETERMINADA - X)
IF[#25 EQ #0 ] THEN #25 = 0                                        (PREDETERMINADA - Y)
IF[#26 EQ #0 ] THEN #26 = 0                                        (PREDETERMINADA - Z)
#100=#7/2.                                                                      (RADIO)
#101=[#7/2.]*-1.                                                       (RADIO NEGATIVO)
#107= FIX[[ABS[#26/#17]]+1]                                           (NUMERO DE PASOS)
#108= #26+ABS[#107*#17]                                     (CALCULO DE APROXIMACION Z)
T#20 M06
G00 G90 X#24 Y#25 M03 S#19 
M08
G43 H#20 Z[#18+#6+20.]
G90 G00 Z[#18+#6+2.]
G01 Z[#18+#108] F[#9/3.]
G01 G91 G41 D#20 X#100 F[#9/3.]                                         (INTERPOLACION)
G03 I#101 J0.0 Z [ #17 *-1.] L#107 F#9
G03 I#101 J0.0 F[#9/3.]
G01 G40 X#101 F[#9/3.]
G90 G00 Z[#6+20.]
M99
(####ABRAHAM#ORTIZ#ONTIVEROS##################################23/12/2025####NAHOMI####)
N16                                                                 (CONTORNO CUADRADO)
IF[#6 EQ #0 ] THEN #6 = 0                                          (PREDETERMINADA - H)
IF[#18 EQ #0 ] THEN #18 = 0.01                                     (PREDETERMINADA - R)
IF[#18 EQ 0 ] THEN #18 = 0.01                                      (PREDETERMINADA - R)
IF[#17 EQ #0 ] THEN #17 = 0.5                                      (PREDETERMINADA - Q)
IF[#24 EQ #0 ] THEN #24 = 0                                        (PREDETERMINADA - X)
IF[#25 EQ #0 ] THEN #25 = 0                                        (PREDETERMINADA - Y)
IF[#26 EQ #0 ] THEN #26 = 0                                        (PREDETERMINADA - Z)
#101= #2-[#18*2.]                                                         (LARGO TOTAL)
#102= [#2-[#18*2.]]*-1.                                          (LARGO TOTAL NEGATIVO)
#103= #1-[#18*2.]                                                         (ANCHO TOTAL)
#104= [#1-[#18*2.]]*-1.                                          (ANCHO TOTAL NEGETIVO)
#105= #17                                                                  (PASOS RIFF)
#106= #18*-1.                                                          (RADIO NEGATIVO)
#107= FIX[[ABS[#26/#105]]+1]                                          (NUMERO DE PASOS)
#108= #26+ABS[#107*#105]                                    (CALCULO DE APROXIMACION Z)
#109= 30.                                                                 (NIVEL STOCK)
#110= [[#109*2.]*-1.]                                                    (POS ESTOCK X)
IF[#22 EQ #0 ] GOTO17                                             (CUADRADO CON RADIOS)
IF[#22 EQ 0 ] GOTO17                                              (CUADRADO CON RADIOS)
IF[#22 EQ 1. ] GOTO19                                    (CUADRADO CON BISEL ANGULO 45)
M30
N17                                                    (CUADRADO CON RADIOS / ANGULO45)
T#20 M06
G00 G90 X[#110+#24] Y#25
M03 S#19
M08 
G43 H#20 Z10.
G90 G01 Z[#108+#6] F[#9*.3]                                (ENTRADA - BARRA CON RADIOS)
G91 G01 G41 D#20 X#109 Y0. F#9
G01 X#109 Y0.
G01 X#18
M97 P18 L#107                                                                  (MATRIZ)
G01 X#101                                            (ELIMINCAION DE MATRIZ HELICOIDAL)
G02 X#18 Y#106 R#18
G01 Y#104
G02 X#106 Y#106 R#18
G01 X#102
G02 X#106 Y#18 R#18
G01 Y#103
G02 X#18 Y#18 R#18
G03 X0. Y[#109*2.] R#109                                          (SALIDA CONTROL #109)
G40 G01 X#110 F[#9*3.]
G90 G00 Z50.
M09
M05
/ G91 G28 Y0. Z0. 
M99
N18                                                                     (MATRIZ RADIOS)
G01 X#101 Z[[#105/4]*-1]
G02 X#18 Y#106 R#18
G01 Y#104 Z[[#105/4]*-1]
G02 X#106 Y#106 R#18
G01 X#102 Z[[#105/4]*-1]
G02 X#106 Y#18 R#18
G01 Y#103 Z[[#105/4]*-1]
G02 X#18 Y#18 R#18
M99
N19                                                           (CUADRADO CON AVELLAN 45)
T#20 M06
G00 G90 X[#110+#24] Y#25
M03 S#19
M08 
G43 H#20 Z10.
G90 G01 Z[#108+#6] F[#9*.3]
G91                                                          (ENTRADA BARRA CON RADIOS)
G01 G41 D#20 X#109 Y0. F#9
G01 X#109 Y0.
G01 X#18
M97 P20 L#107                                                                  (MATRIZ)
G01 X#101                                                   (ELIMINCAION DE HELICOIDAL)
G01 X#18 Y#106
G01 Y#104
G01 X#106 Y#106
G01 X#102
G01 X#106 Y#18
G01 Y#103
G01 X#18 Y#18
G03 X0. Y[#109*2.] R#109                                          (SALIDA CONTROL #109)
G40 G01 X#110 F[#9*3.]
G90 G00 Z50.
M09
M05
/ G91 G28 Y0. Z0. 
M99 
N20                                                                  (MATRIZ 45 GRADOS)
G01 X#101 Z[[#105/4]*-1]
G01 X#18 Y#106
G01 Y#104 Z[[#105/4]*-1]
G01 X#106 Y#106
G01 X#102 Z[[#105/4]*-1]
G01 X#106 Y#18
G01 Y#103 Z[[#105/4]*-1]
G01 X#18 Y#18
M99
(####ABRAHAM#ORTIZ#ONTIVEROS##################################24/12/2025####NAHOMI####)
N21                                                                  (OBLONGO ANGULADO)
IF[#7 EQ #0] THEN #3000=1                                        (DIAMETRO NO DEFINIDO)
IF[#11 EQ #0] THEN #3000=2                                       (LONGITUD NO DEFINIDA)
IF[#1 EQ #0] THEN #1=0                                        (ANGULO CERO POR DEFECTO)

#100= #7 / 2.                                                                   (RADIO)
#101=COS[#1+90.]*#100                                  (X PUNTO INICIO C/ COMPENSACION)
#102=SIN[#1+90.]*#100                                  (Y PUNTO INICIO C/ COMPENSACION)
#103=COS[#1+270.]*#7                                                (VECTOR X ARCO 180)
#104=SIN[#1+270.]*#7                                                (VECTOR Y ARCO 180)
#105=COS[#1]*#11                                                      (VECTOR X LINEAL)
#106=SIN[#1]*#11                                                      (VECTOR Y LINEAL)
IF[#18 GT 0] THEN GOTO22                                                  (AVALUAR R Z)
IF[#18 LE 0] THEN GOTO23                                                  (AVALUAR R Z)
IF[#18 EQ 0] THEN GOTO24                                                  (AVALUAR R Z)
IF[#26 GT 0] THEN GOTO25                                                  (AVALUAR R Z)
N22                                                           (R EXACTAMENTE IGUAL A 0)
#110=ABS[#26]+ABS[#18]
GOTO26
N23                                                                     (R MENOR QUE 0)
#110 = ABS[#26]-ABS[#18]
GOTO26
N24                                                                     (R MAYOR QUE 0)
#110 = ABS[#26]
GOTO26
N25                                                           (Z EXACTAMENTE IGUAL A 0)
#110=ABS[#18] - ABS[#26]
GOTO26
N26                                                                 (CALCULO DE ALTURA)
#107=FIX[[ABS[#110/#17]]+1]                                           (NUMERO DE PASOS)
#108=[#110*-1.]+ABS[#107*#17]                               (CALCULO DE APROXIMACION Z)
#109 = ABS[#18+10.]
IF[#109 GT 50.] THEN #109 = 50.                                            (LIMITE MAX)
IF[#109 LT 10.] THEN #109 = 10.                                            (LIMITE MIN)
IF[#9 EQ #0] THEN #9 = 1800.                                       (PREDETERMINADO - F)
IF[#17 EQ #0] THEN #17 = 0.5                                       (PREDETERMINADO - Q)
T#20 M06
G00 G90 X#24 Y#25
M03 S#19
M08
G43 H#20 Z#109
G90 G01 Z#18 F#9
G90 G01 Z[#108+#18] F[#9/3.]
G91                                                                  (OBLINGO INTERIOR)
G01 G41 D#20 X#101 Y#102 F[#9/3.]                                        (COMPENSACION)
M97 P27 L#107                                                         (LLAMAR A MATRIZ)
G03 X#103 Y#104 R#100 F#9 
G01 X#105 Y#106
G03 X[#103 * -1.] Y[#104*-1] R#100
G01 X[#105*-1.] Y[#106*-1]
G40 G01 X[#101*-1.] Y[#102*-1.] F[#9/3.]                                       (SALIDA)
G90 G00 Z10.
G90 G00 Z100.  
/ G91 G28 Y0. Z0. 
M99
N27                                                                            (MATRIZ)
G03 X#103 Y#104 R#100 F#9                                        (ARCO DE ENTRADA #180)
G01 X#105 Y#106 Z[[#17/2.]*-1.]                              (LADO LINEAL + DESCENSO Z)
G03 X[#103 * -1.] Y[#104*-1] R#100                                (ARCO DE SALIDA #180)
G01 X[#105*-1.] Y[#106*-1] Z[[#17/2.]*-1.]           (LADO LINEAL OPUESTO + DESCENSO Z)
M99
(####ABRAHAM#ORTIZ#ONTIVEROS##################################30/12/2025####NAHOMI####)
N28                                                                  (CALENTAR HUSILLO)
#100=100                                                                  (RPM INICIAL)
#101=10000                                                                  (RPM FINAL)
#102=100                                                                   (INCREMENTO)
#103=12.                                                             (TIEMPO DE ESPERA)
WHILE [#100 LE #101] DO1
S#100 M03
G04 P#103
#100=#100+#102
END1
M99
(####ABRAHAM#ORTIZ#ONTIVEROS##################################30/12/2025####NAHOMI####)
N29                                                                    (LIMPIAR BROCAS)
(LEER PARAMETROS)
IF[#20 EQ #0] THEN #20=2.
IF[#19 EQ #0] THEN #19=2400
M05
M08
G04 P#20
M04 S#19
G04 P#20
M05
M09
G04 P#20
M99
(#####################################################################################)
N999(SALIR)
M30
%
