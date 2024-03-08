DECLARE
 
    l_contar_taismgr number;
    l_contar_taispkg number;
 
BEGIN
 
    SELECT COUNT(*)
    INTO l_contar_taismgr
    FROM TAISMGR.TZRMPSE;
    
    EXECUTE IMMEDIATE('TRUNCATE TABLE TAISPKG.TZRMPSE ');
    
    INSERT INTO TAISPKG.TZRMPSE 
    SELECT * 
    FROM TAISMGR.TZRMPSE;
    
    SELECT COUNT(*)
    INTO l_contar_taispkg
    FROM taispkg.TZRMPSE;
    
    DBMS_OUTPUT.PUT_LINE('La tabla TZRMPSE de TAISMGR tiene -->'||l_contar_taismgr);
    DBMS_OUTPUT.PUT_LINE('La tabla TZRMPSE de TAISPKG tiene -->'||l_contar_taispkg);
 
    COMMIT;
 
    EXCEPTION WHEN OTHERS THEN
    raise_application_error (-20002,'Error al   '||sqlerrm);
    ROLLBACK;
    
END;