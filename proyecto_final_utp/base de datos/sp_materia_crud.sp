DELIMITER
    //
CREATE PROCEDURE sp_materia_crud(
    IN operacion char(2),
    IN materi_id INT,
    IN secuencia INt,
    IN nombr VARCHAR(255),
    IN turn CHAR(2),
    IN horario_incia varchar(20),
    IN horario_salid varchar(20),
    IN modo INT
)
BEGIN


IF operacion = 'I' THEN
    insert into materia(materia_id,secuencial,nombre,turno,horario_incial,horario_salida)
    values(materi_id,secuencia,nombr,turn,horario_incia,horario_salid);
END IF ;
   
IF operacion = 'U' THEN 
   
   if carrer_id <> 0 then 
       update materia
          set nombre = nombr,
              turno = turn,
              horario_incial = horario_incia,
              horario_salida = horario_salid
        where materia_id = materi_id
          and secuencial = secuencia;
   end if;
	
end if;
   
IF operacion = 'D' THEN

   if modo = 0 THEN
      delete from materia
       where materia_id = materi_id
         and secuencial = secuencia;
   end if; 
   
   if modo = 1 THEN
      if carrer_id <> 0 then 
         delete from materia
          where materia_id = materi_id;
      end if;
   end if;

END IF ;
   
   
IF operacion = 'Q' THEN
 
      select *
        from materia;
   
END IF ;

END //