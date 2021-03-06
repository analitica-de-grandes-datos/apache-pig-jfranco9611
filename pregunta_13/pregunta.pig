/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta en SQL.

   SELECT
       color
   FROM 
       u 
   WHERE 
       color 
   LIKE 'b%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

      >>> Escriba su respuesta a partir de este punto <<<
*/


Data_13 = LOAD 'data.csv' USING PigStorage(',')
    AS(
        name:chararray,
        lsname:chararray,
        date:chararray,
        color:chararray,
        numer:int
      );


pr1 = FOREACH Data_13 GENERATE color;
pr2 = FILTER pr1 BY (color MATCHES '.*^[bB].*');
STORE pr2 INTO 'output' USING PigStorage(',');

