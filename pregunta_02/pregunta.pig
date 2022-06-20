/*
Pregunta
===========================================================================

Ordene el archivo `data.tsv`  por letra y valor (3ra columna). Escriba el
resultado separado por comas.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

     >>> Escriba el codigo del mapper a partir de este punto <<<
*/
Data_02 = LOAD 'data.tsv' USING PigStorage('\t')
    AS(
       dt1:chararray,
       dt2:chararray,
       dt3:int
       );

sort1 = ORDER Data_02 BY dt1, dt3 asc;
STORE sort1 INTO 'output' USING PigStorage(',');