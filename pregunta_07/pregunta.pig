/*
Pregunta
===========================================================================

Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
columna 3 separados por coma. La tabla debe estar ordenada por las 
columnas 1, 2 y 3.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
Data_07 = LOAD 'data.tsv' USING PigStorage('\t')
    AS(
        dt1:chararray,
        dt2:chararray,
        dt3:chararray,
     );

pr1 = FOREACH Data_07 GENERATE dt1, TOKENIZE(dt2, ',') AS dt21, TOKENIZE(dt3, ',') AS dt31;
pr2 = FOREACH pr1 GENERATE dt1, COUNT(dt21) AS dt22, COUNT(dt31) AS dt32;
pr3 = ORDER pr2 BY dt1, dt22, dt32 asc;
STORE pr3 INTO 'output' USING PigStorage(',');