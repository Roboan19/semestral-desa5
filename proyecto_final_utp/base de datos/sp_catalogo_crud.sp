DELIMITER
    //
CREATE PROCEDURE sp_catalogo_crud(
    IN operacion char(2),
    IN valo INT,
    IN codig varchar(20),
    IN descripcio VARCHAR(255),
    IN estad CHAR(2)

)
BEGIN


IF operacion = 'I' THEN
 INSERT INTO catalogo(valor,codigo,descripcion,estado)
 VALUES (valo,codig,descripcio,estad);
END IF ;
   
IF operacion = 'U' THEN 
   
      update catalogo
         set codigo      = codig,
             descripcion = descripcio,
             estado      = estad
       where valor = valo;
	
end if; 
   
IF operacion = 'D' THEN

      update catalogo
         set estado = estad
       where valor = valo;

END IF ;
   
   
IF operacion = 'Q' THEN
 
      select * 
        from catalogo
       where carrera_id = carrer_id;
   
END IF ;

END //