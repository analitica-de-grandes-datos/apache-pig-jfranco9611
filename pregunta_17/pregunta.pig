/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname, color 
   FROM 
       u
   WHERE color IN ('blue','black');

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        /* >>> Escriba su respuesta a partir de este punto <<< */
*/

Data_17 = LOAD 'data.csv' USING PigStorage(',')
    AS(
        id: int,
        name:chararray,
        lsname:chararray,
        date:chararray,
        color:chararray,
        numer:int
      );

pr1 = FOREACH Data_17 GENERATE name, color;
pr2 = FILTER pr1 BY color IN ('blue', 'black');
STORE pr2 INTO 'output' USING PigStorage(',');