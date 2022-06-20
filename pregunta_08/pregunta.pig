/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
columna 3 es:

  ((b,jjj), 216)

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
Data_08 = LOAD 'data.tsv' USING PigStorage('\t')
    AS(
        dt1:chararray,
        dt2:chararray,
        dt3:chararray
     );

pr1 = FOREACH Data_08 GENERATE dt1, FLATTEN(TOKENIZE(dt2, ',')) AS dt21, FLATTEN(TOKENIZE(dt3, ',')) AS dt31;
pr2 = FOREACH pr1 GENERATE REPLACE(dt21, '([^a-zA-Z\\s]+)','') AS dt22, REPLACE(dt31, '([^a-zA-Z\\s]+)','') AS dt32;
pr3 = FOREACH pr2 GENERATE TOTUPLE(dt22, dt32) AS tp:
Agg_08 = GROUP pr3 BY tp;
Cnt_08 = FOREACH Agg_08 GENERATE group, COUNT(pr3);
STORE Cnt_08 INTO 'output' USING PigStorage(',');