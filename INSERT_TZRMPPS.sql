DECLARE
 
    l_contar_taismgr number;
    l_contar_taispkg number;
 
BEGIN
 
    SELECT COUNT(*)
    INTO l_contar_taismgr
    FROM TAISMGR.TZRMPPS;
    
    EXECUTE IMMEDIATE('TRUNCATE TABLE TAISPKG.TZRMPPS ');
    
    INSERT INTO TAISPKG.TZRMPPS 
    SELECT * 
    FROM TAISMGR.TZRMPPS;
    
    SELECT COUNT(*)
    INTO l_contar_taispkg
    FROM taispkg.TZRMPPS;
    
    DBMS_OUTPUT.PUT_LINE('La tabla TZRMPPS de TAISMGR tiene -->'||l_contar_taismgr);
    DBMS_OUTPUT.PUT_LINE('La tabla TZRMPPS de TAISPKG tiene -->'||l_contar_taispkg);
 
    COMMIT;
 
    EXCEPTION WHEN OTHERS THEN
    raise_application_error (-20002,'Error al   '||sqlerrm);
    ROLLBACK;
    
END;