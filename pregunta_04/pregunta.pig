/*
Pregunta
===========================================================================

El archivo `data.csv` tiene la siguiente estructura:

  driverId       INT
  truckId        INT
  eventTime      STRING
  eventType      STRING
  longitude      DOUBLE
  latitude       DOUBLE
  eventKey       STRING
  correlationId  STRING
  driverName     STRING
  routeId        BIGINT
  routeName      STRING
  eventDate      STRING

Escriba un script en Pig que carge los datos y obtenga los primeros 10 
registros del archivo para las primeras tres columnas, y luego, ordenados 
por driverId, truckId, y eventTime. 

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

         >>> Escriba su respuesta a partir de este punto <<<
*/

Data_04 = LOAD 'data.csv' USING PigStorage(',')
    AS(
      driverId:int,
      truckId:int,
      eventTime:chararray ,
      eventType:chararray,
      longitude:double,
      latitude:double,
      eventKey:chararray,
      correlationId:chararray,
      driverName:chararray,
      routeId:biginterger,
      routeName:chararray,
      eventDate:chararray
    );

top_04 = FOREACH Data_04 GENERATE driverId, truckId, evenTime;
sort_04 = ORDER top_04 BY driverId, truckId, evenTime asc;
sort_04 = LIMIT sort_04 10;
STORE sort_04 INTO 'output' USING PigStorage(',');
