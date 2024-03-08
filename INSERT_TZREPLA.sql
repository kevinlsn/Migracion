DECLARE
 
    l_contar_satpack number;
    l_contar_taispkg number;
 
BEGIN
 
    SELECT COUNT(*)
    INTO l_contar_satpack
    FROM SATPACK.TZREPLA;
    
    EXECUTE IMMEDIATE('TRUNCATE TABLE TAISPKG.TZREPLA ');
    
    INSERT INTO TAISPKG.TZREPLA 
    SELECT * 
    FROM SATPACK.TZREPLA;
    
    SELECT COUNT(*)
    INTO l_contar_taispkg
    FROM taispkg.TZREPLA;
    
    DBMS_OUTPUT.PUT_LINE('La tabla TZREPLA de SATPACK tiene -->'||l_contar_satpack);
    DBMS_OUTPUT.PUT_LINE('La tabla TZREPLA de TAISPKG tiene -->'||l_contar_taispkg);
 
    COMMIT;
 
    EXCEPTION WHEN OTHERS THEN
    raise_application_error (-20002,'Error al   '||sqlerrm);
    ROLLBACK;
    
END;