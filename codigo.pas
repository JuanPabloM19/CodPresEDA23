CONST n = ...; (* numero de vertices *)
TYPE MATRIZ = ARRAY [1..n],[1..n] OF CARDINAL;

PROCEDURE GrafosIguales(k:CARDINAL);
VAR vertice:CARDINAL; (*vertice que indica la opcion en curso*) BEGIN
vertice:=0; 
REPEAT
INC(vertice);
X[k]:=vertice;
IF Valido(k) THEN
IF k<n THEN
GrafosIguales(k+1) ELSE
exito:=TRUE END
END
UNTIL (X[k]=n) OR exito; END GrafosIguales;


PROCEDURE Valido(k:CARDINAL):BOOLEAN; VAR i:CARDINAL;
BEGIN
FOR i:=1 TO k-1 DO (* no pueden repetirse elementos *) IF X[i]=X[k] THEN
RETURN FALSE END
END;
IF NumArcos(L1,k)<>NumArcos(L2,X[k]) THEN(* mismo num. arcos *) RETURN FALSE
END;
FOR i:=1 TO k-1 DO (* mismas conexiones *)
IF (L2[X[i],X[k]]<>L1[i,k]) OR (L2[X[k],X[i]]<>L1[k,i]) THEN RETURN FALSE
END END;
RETURN TRUE;
END Valido;


PROCEDURE NumArcos(VAR L:MATRIZ;k:CARDINAL):CARDINAL; VAR i,suma:CARDINAL;
BEGIN
suma:=0;
FOR i:=1 TO n DO
IF ((i<>k) AND (L[i,k]<MAX(CARDINAL))) THEN
INC(suma)
END;
IF ((i<>k) AND (L[k,i]<MAX(CARDINAL))) THEN
INC(suma) END;
END;
RETURN suma;
END NumArcos;

