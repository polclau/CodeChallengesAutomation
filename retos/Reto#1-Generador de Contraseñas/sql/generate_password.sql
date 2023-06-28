-- Crear un procedimiento PL/SQL para generar contraseñas aleatorias
CREATE OR REPLACE PROCEDURE generar_contrasena(
    p_longitud_min IN NUMBER,
    p_longitud_max IN NUMBER,
    p_usar_mayusculas IN BOOLEAN,
    p_usar_numeros IN BOOLEAN,
    p_usar_simbolos IN BOOLEAN,
    p_contrasena OUT VARCHAR2
)
IS
    -- Declarar variables locales
    v_longitud NUMBER;
    v_caracteres VARCHAR2(100) := '';
    v_contrasena_generada VARCHAR2(100) := '';
BEGIN
    -- Calcular la longitud aleatoria dentro del rango especificado
    v_longitud := TRUNC(DBMS_RANDOM.VALUE(p_longitud_min, p_longitud_max + 1));
    
    -- Construir la cadena de caracteres permitidos según los parámetros
    IF p_usar_mayusculas THEN
        v_caracteres := v_caracteres || 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    END IF;
    
    IF p_usar_numeros THEN
        v_caracteres := v_caracteres || '0123456789';
    END IF;
    
    IF p_usar_simbolos THEN
        v_caracteres := v_caracteres || '!@#$%^&*()_+-={}[]|\:;"<>,.?/~`';
    END IF;
    
    -- Generar la contraseña aleatoria
    FOR i IN 1..v_longitud LOOP
        v_contrasena_generada := v_contrasena_generada || SUBSTR(v_caracteres, TRUNC(DBMS_RANDOM.VALUE(1, LENGTH(v_caracteres) + 1)), 1);
    END LOOP;
    
    -- Asignar la contraseña generada a la salida del procedimiento
    p_contrasena := v_contrasena_generada;
END;
/