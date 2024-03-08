DECLARE
 
    l_contar_taismgr number;
    l_contar_taispkg number;
 
BEGIN
 
    SELECT COUNT(*)
    INTO l_contar_taismgr
    FROM TAISMGR.TZRMPPP;
    
    EXECUTE IMMEDIATE('TRUNCATE TABLE TAISPKG.TZRMPPP ');
    
    INSERT INTO TAISPKG.TZRMPPP 
    SELECT * 
    FROM TAISMGR.TZRMPPP;
    
    SELECT COUNT(*)
    INTO l_contar_taispkg
    FROM taispkg.TZRMPPP;
    
    DBMS_OUTPUT.PUT_LINE('La tabla TZRMPPP de TAISMGR tiene -->'||l_contar_taismgr);
    DBMS_OUTPUT.PUT_LINE('La tabla TZRMPPP de TAISPKG tiene -->'||l_contar_taispkg);
 
    COMMIT;
 
    EXCEPTION WHEN OTHERS THEN
    raise_application_error (-20002,'Error al   '||sqlerrm);
    ROLLBACK;
    
END;