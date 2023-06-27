Opciones:
-l <longitud>   Especifica la longitud de la contraseña (por defecto: 12).
-u              Incluye letras mayúsculas.
-n              Incluye números.
-s              Incluye símbolos.
-h              Muestra este mensaje de ayuda.
Ejemplos:
# Generar una contraseña de longitud 10 con letras mayúsculas y números
 bash generate_password.sh -l 10 -u -n

# Generar una contraseña de longitud 16 con símbolos
 bash generate_password.sh -l 10 -u -n -l 16 -s

# Generar una contraseña de longitud 12 con letras mayúsculas, números y símbolos
 bash generate_password.sh -l 10 -u -n -u -n -s
