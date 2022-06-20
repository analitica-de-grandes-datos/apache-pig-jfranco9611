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
   WHERE color = 'blue' AND firstname LIKE 'Z%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

*/
Data_15 = LOAD 'data.csv' USING PigStorage(',')
    AS(
        id:int,
        name:chararray,
        lsname:chararray,
        date:chararray,
        color:chararray,
        number:int,
      );

pr1 = FOREACH Data_15 GENERATE name, color;
pr2 = FILTER pr1 BY (name MATCHES '.*^[zZ].*') AND color == 'blue';
STORE pr2 INTO 'output' USING PigStorage(' ');