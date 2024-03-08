DELETE PRGNREP.TZRHLDD;

INSERT INTO PRGNREP.TZRHLDD(TZRHLDD_01_USER,
                            TZRHLDD_02_TIPO_MOV,
                            TZRHLDD_03_ID,
                            TZRHLDD_04_NOMBRE,
                            TZRHLDD_05_HLDD_CODE,
                            TZRHLDD_06_FROM_DATE,
                            TZRHLDD_07_TO_DATE,
                            TZRHLDD_08_REASON,
                            TZRHLDD_09_DATA_ORIGIN,
                            TZRHLDD_10_ACTIVITY_DATE)
SELECT TZRHLLG_USER_ID,
            TZRHLLG_OPER,
            (SELECT spriden_id 
            FROM  spriden
            WHERE 1 = 1
            AND spriden_pidm = a.TZRHLLG_PIDM 
            AND spriden_change_ind IS NULL)matricula,
            (SELECT spriden_first_name || ' ' || spriden_mi || ' ' || spriden_last_name 
            FROM  spriden
            WHERE 1 = 1
            AND spriden_pidm = a.TZRHLLG_PIDM 
            AND spriden_change_ind IS NULL)nombre,
            TZRHLLG_HLDD_CODE,
            TZRHLLG_FECHA_INICIO,
            TZRHLLG_FECHA_FIN,
            NULL,
            NULL,
            TZRHLLG_ACTIVITY_DATE
    FROM TAISMGR.TZRHLLG a
    WHERE TZRHLLG_FECHA_INICIO >= TO_DATE('01/01/2024', 'DD-MM-YYYY')
    AND TZRHLLG_FECHA_FIN <= TO_DATE('31/12/2024', 'DD-MM-YYYY')
    
    COMMIT;