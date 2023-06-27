#!/bin/bash

length=12
use_uppercase=false
use_numbers=false
use_symbols=false

# Función para generar una contraseña aleatoria
generate_password() {
    local chars=()
    
    if [ "$use_uppercase" = true ]; then
        chars+=({A..Z})
    fi
    
    if [ "$use_numbers" = true ]; then
        chars+=({0..9})
    fi
    
    if [ "$use_symbols" = true ]; then
        chars+=('!' '#' '$' '%' '&' '(' ')' '*' '+' ',' '-' '.' '/' ':' ';' '<' '=' '>' '?' '@' '[' '\' ']' '^' '_' '{' '|' '}' '~')
    fi
    
    local password=""
    local char_count=${#chars[@]}
    
    for ((i=0; i<length; i++)); do
        local random_index=$((RANDOM % char_count))
        password+=${chars[random_index]}
    done
    
    echo "$password"
}

# Función para mostrar el mensaje de ayuda
print_help() {
    echo "Uso: $0 [-l <longitud>] [-u] [-n] [-s]"
    echo "Genera una contraseña aleatoria con los parámetros configurados."
    echo ""
    echo "Opciones:"
    echo "  -l <longitud>   Especifica la longitud de la contraseña (por defecto: 12)."
    echo "  -u              Incluye letras mayúsculas."
    echo "  -n              Incluye números."
    echo "  -s              Incluye símbolos."
    echo "  -h              Muestra este mensaje de ayuda."
}

# Procesar los argumentos de línea de comandos
while getopts ":l:uns:h" opt; do
    case ${opt} in
        l)
            length=$OPTARG
            ;;
        u)
            use_uppercase=true
            ;;
        n)
            use_numbers=true
            ;;
        s)
            use_symbols=true
            ;;
        h)
            print_help
            exit 0
            ;;
        \?)
            echo "Opción inválida: -$OPTARG" >&2
            print_help
            exit 1
            ;;
    esac
done

# Generar y mostrar la contraseña
password=$(generate_password)
echo "Contraseña generada: $password"