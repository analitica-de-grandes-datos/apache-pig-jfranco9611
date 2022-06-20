/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

Data_03 = LOAD 'data.tsv' USING PigStorage('\t')
    AS(
        dt1:chararray,
        dt2:chararray,
        dt3:int
     );

top = FOREACH 'Data_03' GENERATE dt3;
sort3 = ORDER top BY dt3 asc;
sort3 = LIMIT 5; sort3;
STORE sort3 INTO 'output' USING PigStorage(',');