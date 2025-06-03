create or replace trigger tcurso before
   insert or update or delete on curso
   for each row
begin
   if inserting then
      insert_bitacora(
         p_nom_tabla  => 'CURSO',
         p_nom_campo  => 'TODOS',
         p_v_nuevo    => :new.nom_curso
                      || ' '
                      || :new.nom_curso
                      || ' '
                      || :new.num_creditos,
         p_v_anterior => 'N/A',
         p_tipo_trans => 'I',
         p_llave_p    => to_char(:new.cod_curso)
      );
   elsif updating then
      insert_bitacora(
         p_nom_tabla  => 'CURSO',
         p_nom_campo  => 'TODOS',
         p_v_nuevo    => :new.nom_curso
                      || ' '
                      || :new.nom_curso
                      || ' '
                      || :new.num_creditos,
         p_v_anterior => :old.nom_curso
                         || ' '
                         || :old.nom_curso
                         || ' '
                         || :old.num_creditos,
         p_tipo_trans => 'U',
         p_llave_p    => to_char(:old.cod_curso)
      );
   elsif deleting then
      insert_bitacora(
         p_nom_tabla  => 'CURSO',
         p_nom_campo  => 'TODOS',
         p_v_nuevo    => 'N/A',
         p_v_anterior => :old.nom_curso
                         || ' '
                         || :old.nom_curso
                         || ' '
                         || :old.num_creditos,
         p_tipo_trans => 'D',
         p_llave_p    => to_char(:old.cod_curso)
      );
   end if;
end;
----------------------------------------------------
create or replace trigger testudiante before
   insert or update or delete on estudiante
   for each row
begin
   if inserting then
      insert_bitacora(
         p_nom_tabla  => 'ESTUDIANTE',
         p_nom_campo  => 'TODOS',
         p_v_nuevo    => :new.primer_nombre
                      || ' '
                      || :new.segundo_nombre
                      || ' '
                      || :new.primer_apellido
                      || ' '
                      || :new.segundo_apellido
                      || ' '
                      || :new.fecha_nac,
         p_v_anterior => 'N/A',
         p_tipo_trans => 'I',
         p_llave_p    => to_char(:new.carne)
      );
   elsif updating then
      insert_bitacora(
         p_nom_tabla  => 'ESTUDIANTE',
         p_nom_campo  => 'TODOS',
         p_v_nuevo    => :new.primer_nombre
                      || ' '
                      || :new.segundo_nombre
                      || ' '
                      || :new.primer_apellido
                      || ' '
                      || :new.segundo_apellido
                      || ' '
                      || :new.fecha_nac,
         p_v_anterior => :old.primer_nombre
                         || ' '
                         || :old.segundo_nombre
                         || ' '
                         || :old.primer_apellido
                         || ' '
                         || :old.segundo_apellido
                         || ' '
                         || :old.fecha_nac,
         p_tipo_trans => 'U',
         p_llave_p    => to_char(:old.carne)
      );
   elsif deleting then
      insert_bitacora(
         p_nom_tabla  => 'ESTUDIANTE',
         p_nom_campo  => 'TODOS',
         p_v_nuevo    => 'N/A',
         p_v_anterior => :old.primer_nombre
                         || ' '
                         || :old.segundo_nombre
                         || ' '
                         || :old.primer_apellido
                         || ' '
                         || :old.segundo_apellido
                         || ' '
                         || :old.fecha_nac,
         p_tipo_trans => 'D',
         p_llave_p    => to_char(:old.carne)
      );
   end if;
end;

----------------------------------------------------
create or replace trigger testudiate_curso before
   insert or update or delete on estudiante_curso
   for each row
begin
   if inserting then
      insert_bitacora(
         p_nom_tabla  => 'ESTUDIATE_CURSO',
         p_nom_campo  => 'TODOS',
         p_v_nuevo    => :new.anio
                      || ' '
                      || :new.semestre
                      || ' '
                      || :new.cod_curso
                      || ' '
                      || :new.carne
                      || ' '
                      || :new.nota
                      || ' '
                      || :new.fecha,
         p_v_anterior => 'N/A',
         p_tipo_trans => 'I',
         p_llave_p    => :old.anio
                      || ' '
                      || :old.semestre
                      || ' '
                      || :old.cod_curso
                      || ' '
                      || :old.carne
      );
   elsif updating then
      insert_bitacora(
         p_nom_tabla  => 'ESTUDIATE_CURSO',
         p_nom_campo  => 'TODOS',
         p_v_nuevo    => :new.anio
                      || ' '
                      || :new.semestre
                      || ' '
                      || :new.cod_curso
                      || ' '
                      || :new.carne
                      || ' '
                      || :new.nota
                      || ' '
                      || :new.fecha,
         p_v_anterior => :old.anio
                         || ' '
                         || :old.semestre
                         || ' '
                         || :old.cod_curso
                         || ' '
                         || :old.carne
                         || ' '
                         || :old.nota
                         || ' '
                         || :old.fecha,
         p_tipo_trans => 'U',
         p_llave_p    => :old.anio
                      || ' '
                      || :old.semestre
                      || ' '
                      || :old.cod_curso
                      || ' '
                      || :old.carne
      );
   elsif deleting then
      insert_bitacora(
         p_nom_tabla  => 'ESTUDIATE_CURSO',
         p_nom_campo  => 'TODOS',
         p_v_nuevo    => 'N/A',
         p_v_anterior => :old.anio
                         || ' '
                         || :old.semestre
                         || ' '
                         || :old.cod_curso
                         || ' '
                         || :old.carne
                         || ' '
                         || :old.nota
                         || ' '
                         || :old.fecha,
         p_tipo_trans => 'D',
         p_llave_p    => :old.anio
                      || ' '
                      || :old.semestre
                      || ' '
                      || :old.cod_curso
                      || ' '
                      || :old.carne
      );
   end if;
end;