DELIMITER
    //
CREATE PROCEDURE sp_estudiante_crud(
    IN estudiant_id INT,
    IN nombr VARCHAR(50),
    IN apellid VARCHAR(50),
    IN nombre_complet VARCHAR(100),
    IN cedul VARCHAR(20),
    IN celula VARCHAR(20),
    IN corre VARCHAR(100)
)
BEGIN


IF operacion = 'I' THEN
 INSERT INTO estudiante(estudiante_id,nombre,apellido,nombre_completo,cedula,celular,correo)
  VALUES(estudiant_id,nombr,apellid,nombre_complet,cedul,celula,corre);
END IF ; 
   
IF operacion = 'U' THEN 
   
   if estudiant_id <> 0 then 
          update estudiante
             set nombre           = nombr,
                 apellido         = apellid,
                 nombre_completo  = nombre_complet,
                 cedula           = cedul,
                 celular          = celula,
                 correo           = corre
           where estudiante_id      = estudiant_id;
   end if;
      
   if cedul <> '' then 
          update estudiante
             set nombre           = nombr,
                 apellido         = apellid,
                 nombre_completo  = nombre_complet,
                 celular          = celula,
                 correo           = corre
           where cedula = cedul;
   end if;
END IF;
   
IF operacion = 'D' THEN
   
   if estudiant_id <> 0 then 
   delete from estudiante 
    where estudiante_id = estudiant_id;
   end if;
   
   if cedul <> '' then 
   delete from estudiante 
    where cedula = cedul;
   end if;
   
END IF ;
   
   
IF operacion = 'Q' THEN
 
   if estudiant_id <> 0 then 
      select * 
        from estudiante 
       where estudiante_id = estudiant_id;
   end if;
   
   if cedul <> '' then 
      select * 
        from estudiante 
       where cedula = cedul;
   end if;

END IF ; 
END //