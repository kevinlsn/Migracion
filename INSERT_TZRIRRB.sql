DECLARE
 
    l_contar_satpack number;
    l_contar_taispkg number;
 
BEGIN
 
    SELECT COUNT(*)
    INTO l_contar_satpack
    FROM SATPACK.TZRIRRB;
    
    EXECUTE IMMEDIATE('TRUNCATE TABLE TAISPKG.TZRIRRB ');
    
    INSERT INTO TAISPKG.TZRIRRB 
    SELECT * 
    FROM SATPACK.TZRIRRB;
    
    SELECT COUNT(*)
    INTO l_contar_taispkg
    FROM taispkg.TZRIRRB;
    
    DBMS_OUTPUT.PUT_LINE('La tabla TZRIRRB de SATPACK tiene -->'||l_contar_satpack);
    DBMS_OUTPUT.PUT_LINE('La tabla TZRIRRB de TAISPKG tiene -->'||l_contar_taispkg);
 
    COMMIT;
 
    EXCEPTION WHEN OTHERS THEN
    raise_application_error (-20002,'Error al   '||sqlerrm);
    ROLLBACK;
    
END;