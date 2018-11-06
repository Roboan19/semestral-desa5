DELIMITER
    //
CREATE PROCEDURE sp_matricula_crud(
    IN operacion char(2),
    IN matricul_id INT,
    IN secuencia INT,
    IN estudiant_id INT,
    IN nombre_estudiant varchar(100),
    IN carrer_id INT,
    IN nombre_carrer varchar(255),
    IN materi_id INT,
    IN nombre_materi varchar(255),
    IN prefoso_id int,
    IN nombre_profeso varchar(100),
    IN estad char(2),
    IN modo int
)
BEGIN

IF operacion = 'I' THEN

   insert into matricula(matricula_id,secuencial,estudiante_id,nombre_estudiante,carrera_id,nombre_carrera,materia_id,nombre_materia,prefosor_id,nombre_profesor,estado)
   values(matricula_id,secuencial,estudiante_id,nombre_estudiante,carrera_id,nombre_carrera,materia_id,nombre_materia,prefosor_id,nombre_profesor,estado);

END IF ;
   
IF operacion = 'U' THEN 
   update matricula
      set estudiante_id     =  estudiant_id,
          nombre_estudiante =  nombre_estudiant,
          carrera_id        =  carrer_id,
          nombre_carrera    =  nombre_carrer,
          materia_id        =  materi_id,
          nombre_materia    =  nombre_materi,
          prefosor_id       =  prefoso_id,
          nombre_profesor   =  nombre_profeso,
          estado            =  estad
    where matricula_id =  matricul_id
      and secuencial   =  secuencia;   
end if;
   
IF operacion = 'D' THEN
   
   if modo = 0
   then 
   
     delete from matricula
      where matricula_id = matricul_id
        and secuencial = secuencia;
     
   end if;
   
   if modo = 1
   then 
   
     delete from matricula
      where matricula_id = matricul_id;
     
   end if;

END IF ;
   
   
IF operacion = 'Q' THEN

select * from matricula

END IF ;

END //

