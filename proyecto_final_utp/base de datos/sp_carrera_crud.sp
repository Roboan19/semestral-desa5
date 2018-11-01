DELIMITER
    //
CREATE PROCEDURE sp_carrera_crud(
    IN carrer_id INT,
    IN secuencia INT,
    IN nombr VARCHAR(255),
    IN materi_id INT,
    IN nombre_materi VARCHAR(255)
)
BEGIN


IF operacion = 'I' THEN
 INSERT INTO carrera(carrera_id,secuencial,nombre,materia_id,nombre_materia)
  VALUES(carrer_id,secuencia,nombr,materi_id,nombre_materi);
END IF ; 
   
IF operacion = 'U' THEN 
   
   if profeso_id <> 0 then 
          update profesor
             set nombre           = nombr,
                 apellido         = apellid,
                 nombre_completo  = nombre_complet,
                 cedula           = cedul,
                 celular          = celula,
                 correo           = corre
           where profesor_id      = profeso_id;
   end if;
      
   if cedul <> '' then 
          update profesor
             set nombre           = nombr,
                 apellido         = apellid,
                 nombre_completo  = nombre_complet,
                 celular          = celula,
                 correo           = corre
           where cedula = cedul;
   end if;
END IF;
   
IF operacion = 'D' THEN
   
   if profeso_id <> 0 then 
   delete from profesor 
    where profesor_id = profeso_id;
   end if;
   
   if cedul <> '' then 
   delete from profesor 
    where cedula = cedul;
   end if;
   
END IF ;
   
   
IF operacion = 'Q' THEN
 
   if profeso_id <> 0 then 
      select * 
        from profesor 
       where profesor_id = profeso_id;
   end if;
   
   if cedul <> '' then 
      select * 
        from profesor 
       where cedula = cedul;
   end if;

END IF ; 
END //