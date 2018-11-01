DELIMITER
    //
CREATE PROCEDURE sp_profesor_crud(
    IN profeso_id INT,
    IN nombr VARCHAR(50),
    IN apellid VARCHAR(50),
    IN nombre_complet VARCHAR(100),
    IN cedul VARCHAR(20),
    IN celula VARCHAR(20),
    IN corre VARCHAR(100)
)
BEGIN


IF operacion = 'I' THEN
 INSERT INTO profesor(profesor_id,nombre,apellido,nombre_completo,cedula,celular,correo)
  VALUES(profeso_id,nombr,apellid,nombre_complet,cedul,celula,corre);
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