alter session set container = xepdb1;

create user prueba1 identified by prueba1;

grant dba,connect to prueba1;

/* Crear usuarios */
create user umg identified by umg;
create user admin identified by admin;
create user alumno identified by alumno;
create user invitado identified by invitado;

grant connect,dba to umg;
grant connect to admin;
grant connect to alumno;
grant connect to invitado;

create role r_admin;
create role r_alumno;

grant insert,update,delete,select on estudiante to r_admin;
grant insert,update,delete,select on curso to r_admin;
grant insert,update,delete,select on estudiante_curso to r_admin;

grant select on v_estudiante_curso to R_ALUMNO;
grant R_ADMIN to ADMIN 
grant r_alumno to alumno;
grant r_alumno to invitado;

revoke R_ALUMNO from invitado;
drop user ALUMNO cascade

CREATE OR REPLACE DIRECTORY DIR_EXP AS 'E:/Tareas a lo desgraciao/repasos/Repaso BD 2/Repaso BD 2';
GRANT READ, WRITE ON DIRECTORY DIR_EXP TO UMG_BKP; 
-- expdp UMG/UMG@localhost:1521/XEPDB1 schemas=UMG directory=DIR_EXP dumpfile=backup.dmp logfile=backup.log
-- impdp UMG_BKP/UMG_BKP@localhost:1521/XEPDB1 directory=DIR_EXP dumpfile=backup.dmp logfile=backup.log remap_schema=UMG:UMG_BKP

drop user ADMIN cascade;
drop user INVTADO cascade;
drop user UMG cascade;

--28
commit;
