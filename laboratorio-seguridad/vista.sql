create or replace view v_estudiante_curso as
   select e.carne,
          e.primer_nombre,
          e.segundo_nombre,
          e.primer_apellido,
          e.segundo_apellido,
          c.cod_curso,
          c.nom_curso,
          c.num_creditos
     from estudiante e,
          curso c,
          estudiante_curso ec
    where e.carne = ec.carne
      and c.cod_curso = ec.cod_curso;

      select * from UMG.v_estudiante_curso;