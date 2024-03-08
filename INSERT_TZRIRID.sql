DECLARE
 
    l_contar_satpack number;
    l_contar_taispkg number;
 
BEGIN
 
    SELECT COUNT(*)
    INTO l_contar_satpack
    FROM SATPACK.TZRIRID;
    
    EXECUTE IMMEDIATE('TRUNCATE TABLE TAISPKG.TZRIRID ');
    
    INSERT INTO TAISPKG.TZRIRID 
    SELECT * 
    FROM SATPACK.TZRIRID;
    
    SELECT COUNT(*)
    INTO l_contar_taispkg
    FROM taispkg.TZRIRID;
    
    DBMS_OUTPUT.PUT_LINE('La tabla TZRIRID de SATPACK tiene -->'||l_contar_satpack);
    DBMS_OUTPUT.PUT_LINE('La tabla TZRIRID de TAISPKG tiene -->'||l_contar_taispkg);
 
    COMMIT;
 
    EXCEPTION WHEN OTHERS THEN
    raise_application_error (-20002,'Error al   '||sqlerrm);
    ROLLBACK;
    
END;