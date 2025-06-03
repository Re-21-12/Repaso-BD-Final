create sequence BITACORA_SEQ 
start with 1 
INCREMENT by 1
maxvalue 999999999999;

create or replace procedure INSERT_BITACORA (
    
    p_nom_tabla IN VARCHAR2,
    p_nom_campo IN VARCHAR2,
    p_v_nuevo IN VARCHAR2,
    p_v_anterior IN VARCHAR2,
    p_tipo_trans in char,
    p_llave_p in varchar2
) IS
  begin 
    insert into BITACORA 
    (
    NUM_TRANS, 
    NOM_TABLA, 
    NOM_CAMPO, 
    V_NUEVO, 
    V_ANTERIOR, 
    USR_TRANS, 
    FEC_TRANS, 
    TIPO_TRANS, 
    LLAVE_P
    ) 
    values 
    (
    BITACORA_SEQ.nextval,
    p_nom_tabla,
    p_nom_campo,
    p_v_nuevo,
    p_v_anterior,
    user,
    sysdate,
    p_tipo_trans,
    p_llave_p
    );
  end;

