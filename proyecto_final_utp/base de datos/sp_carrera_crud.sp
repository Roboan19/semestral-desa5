DELIMITER
    //
CREATE PROCEDURE sp_carrera_crud(
    IN operacion char(2),
    IN carrer_id INT,
    IN secuencia INT,
    IN nombr VARCHAR(255),
    IN materi_id INT,
    IN nombre_materi VARCHAR(255),
    IN modo INT
)
BEGIN


IF operacion = 'I' THEN
 INSERT INTO carrera(carrera_id,secuencial,nombre,materia_id,nombre_materia)
  VALUES(carrer_id,secuencia,nombr,materi_id,nombre_materi);
END IF ;
   
IF operacion = 'U' THEN 
   
   if carrer_id <> 0 then 
      update carrera
         set nombre         = nombr,
             materia_id     = materi_id,
             nombre_materia = nombre_materi
       where carrera_id = carrer_id
         and secuencial = secuencia;
    end if;
	
end if;
   
IF operacion = 'D' THEN

   if modo = 0 THEN
      if carrer_id <> 0 and secuencia then 
         delete from carrera  
          where carrera_id = carrer_id
            and secuencial = secuencia;
      end if; 
   end if; 
   
   if modo = 1 THEN
      if carrer_id <> 0 then 
         delete from carrera  
          where carrera_id = carrer_id;
      end if;
   end if;

END IF ;
   
   
IF operacion = 'Q' THEN
 
      select * 
        from carrera
       where carrera_id = carrer_id;
   
END IF ;

END //