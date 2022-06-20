/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
aparece cada letra minúscula en la columna 2.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
Data_05 = LOAD 'data.tsv' USING PigStorage('\t')
    AS(
        dt1:chararray,
        dt2:chararray,
        dt3:chararray
     );

pr1 = FOREACH Data_05 GENERATE dt2;
pr2 = FOREACH pr1 GENERATE FLATTEN(TOKENIZE(dt2)) AS dt21;
pr2 = FILTER pr2 BY (dt21 '.*[a-z].*');
pr3 = GROUP pr2 BY dt21;
Agg_05 = FOREACH pr3 GENERATE group; COUNT(pr2);
STORE Agg_05 INTO 'output' USING PigStorage(',');

