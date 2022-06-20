/*
Pregunta
===========================================================================

Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
columna 3. En otras palabras, cuántos registros hay que tengan la clave 
`aaa`?

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
Data_06 = LOAD 'data.tsv' USING PigStorage('\t')
    AS(
        dt1:chararray,
        dt2:chararray,
        dt3:chararray
     );

pr1 = FOREACH Data_06 GENERATE dt3;
pr2 = FOREACH pr1 GENERATE FLATTEN(TOKENIZE(dt3)) AS dt31;
pr3 = FOREACH pr2 GENERATE REPLACE (dt31, '([^a-zA-Z\\s]+)','') AS dt31;
pr4 = GROUP pr3 BY dt31;
Agg_06 = FOREACH pr4 GENERATE group, COUNT(pr3);
STORE Agg_06 INTO 'output' USING PigStorage(',');
