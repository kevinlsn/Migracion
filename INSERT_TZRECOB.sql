DECLARE
 
    l_contar_satpack number;
    l_contar_taispkg number;
 
BEGIN
 
    SELECT COUNT(*)
    INTO l_contar_satpack
    FROM SATPACK.TZRECOB;
    
    EXECUTE IMMEDIATE('TRUNCATE TABLE TAISPKG.TZRECOB ');
    
    INSERT INTO TAISPKG.TZRECOB 
    SELECT * 
    FROM SATPACK.TZRECOB;
    
    SELECT COUNT(*)
    INTO l_contar_taispkg
    FROM taispkg.TZRECOB;
    
    DBMS_OUTPUT.PUT_LINE('La tabla TZRECOB de SATPACK tiene -->'||l_contar_satpack);
    DBMS_OUTPUT.PUT_LINE('La tabla TZRECOB de TAISPKG tiene -->'||l_contar_taispkg);
 
    COMMIT;
 
    EXCEPTION WHEN OTHERS THEN
    raise_application_error (-20002,'Error al   '||sqlerrm);
    ROLLBACK;
    
END;