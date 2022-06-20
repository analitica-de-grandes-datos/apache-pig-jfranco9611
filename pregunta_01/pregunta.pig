/* 
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra.
Almacene los resultados separados por comas. 

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
Data_01 = LOAD 'data.tsv' USING PigStorage('\t')
    AS (
        dt1:chararray,
        dt2:chararray,
        dt3:int
    );

Agg_1 = GROUP ejercicio BY dt1;
Cnt_1 = FOREACH Agg_1 GENERATE group, COUNT(Data_01);
STORE Cnt_1 INTO 'output' USING PigStorage(',');