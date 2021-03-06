/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname, 
       color 
   FROM 
       u
   WHERE color NOT IN ('blue','black');

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

*/

Data_18 = LOAD 'data.csv' USING PigStorage(',')
    AS(
        id:int,
        name:chararray,
        lsname:chararray,
        date:chararray,
        color:chararray,
        number:int
      );

pr1 = FOREACH Data_18 GENERATE name, color;
pr2 = FILTER pr1 BY NOT color IN ('blue', 'black');
STORE pr2 INTO 'output' USING PigStorage(',');
