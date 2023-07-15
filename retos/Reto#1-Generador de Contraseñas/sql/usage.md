## Generador de Contraseñas Aleatorias en PL/SQL

Este programa PL/SQL genera contraseñas aleatorias con diferentes configuraciones según los parámetros especificados.

### Procedimiento `generar_contrasena`

```sql
CREATE OR REPLACE PROCEDURE generar_contrasena(
    p_longitud_min IN NUMBER,
    p_longitud_max IN NUMBER,
    p_usar_mayusculas IN BOOLEAN,
    p_usar_numeros IN BOOLEAN,
    p_usar_simbolos IN BOOLEAN,
    p_contrasena OUT VARCHAR2
)
Genera una contraseña aleatoria con los siguientes parámetros:

p_longitud_min (IN): La longitud mínima de la contraseña (valor numérico).
p_longitud_max (IN): La longitud máxima de la contraseña (valor numérico).
p_usar_mayusculas (IN): Indica si se deben incluir letras mayúsculas en la contraseña (valor booleano).
p_usar_numeros (IN): Indica si se deben incluir números en la contraseña (valor booleano).
p_usar_simbolos (IN): Indica si se deben incluir símbolos en la contraseña (valor booleano).
p_contrasena (OUT): Variable de salida que almacenará la contraseña generada.
Ejemplo de Uso
DECLARE
    v_contrasena_generada VARCHAR2(100);
BEGIN
    generar_contrasena(8, 16, TRUE, TRUE, TRUE, v_contrasena_generada);
    DBMS_OUTPUT.PUT_LINE('Contraseña generada: ' || v_contrasena_generada);
END;
En este ejemplo, se utiliza el procedimiento generar_contrasena para generar una contraseña aleatoria con las siguientes configuraciones:

Longitud mínima: 8 caracteres
Longitud máxima: 16 caracteres
Incluir letras mayúsculas: Sí
Incluir números: Sí
Incluir símbolos: Sí
La contraseña generada se muestra en la salida estándar utilizando DBMS_OUTPUT.PUT_LINE.

Puedes ajustar los parámetros en la llamada al procedimiento según tus necesidades para generar contraseñas con diferentes configuraciones.