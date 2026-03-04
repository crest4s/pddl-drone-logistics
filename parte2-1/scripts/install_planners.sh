#!/bin/bash

# Script de instalación para planificadores
# Uso: ./install_planners.sh

echo "============================================"
echo "Instalación de Planificadores"
echo "============================================"
echo ""

# Crear directorio para herramientas
mkdir -p tools
cd tools

# 1. Instalar Pyperplan
echo "1. Instalando Pyperplan..."
echo "-------------------------------------------"

# Opción A: Intentar con pip
if command -v pip3 &> /dev/null; then
    echo "Instalando con pip3..."
    pip3 install pyperplan
    
    if [ $? -eq 0 ]; then
        echo "✅ Pyperplan instalado correctamente con pip"
    else
        echo "⚠️ Fallo instalación con pip, intentando desde código fuente..."
        
        # Opción B: Desde código fuente
        if [ ! -d "pyperplan" ]; then
            git clone https://github.com/aibasel/pyperplan.git
        fi
        
        cd pyperplan
        python3 setup.py install --user
        cd ..
        
        echo "✅ Pyperplan instalado desde código fuente"
    fi
else
    echo "❌ pip3 no encontrado. Por favor instala Python 3 y pip:"
    echo "   sudo apt install python3 python3-pip"
    exit 1
fi

echo ""
echo "2. Descargando FF Planner..."
echo "-------------------------------------------"

# Descargar FF si no existe
if [ ! -f "ff" ]; then
    # FF clásico (v2.3)
    if [ ! -f "FF-v2.3.tgz" ]; then
        echo "Descargando FF-v2.3..."
        wget http://fai.cs.uni-saarland.de/hoffmann/ff/FF-v2.3.tgz
    fi
    
    echo "Extrayendo..."
    tar -xzf FF-v2.3.tgz
    
    echo "Compilando FF..."
    cd FF-v2.3
    make
    
    if [ $? -eq 0 ]; then
        echo "✅ FF compilado correctamente"
        cp ff ../../ff
        echo "   Binario copiado a: $(pwd)/../../ff"
    else
        echo "❌ Error compilando FF"
    fi
    
    cd ..
else
    echo "✅ FF ya está instalado"
fi

echo ""
echo "3. Verificando instalaciones..."
echo "-------------------------------------------"

cd ..

# Verificar pyperplan
if command -v pyperplan &> /dev/null; then
    echo "✅ pyperplan: $(which pyperplan)"
    pyperplan --version 2>&1 | head -1
else
    echo "⚠️ pyperplan no encontrado en PATH"
    echo "   Intenta: export PATH=\"\$HOME/.local/bin:\$PATH\""
fi

# Verificar ff
if [ -f "tools/ff" ] || [ -f "ff" ]; then
    echo "✅ ff: Disponible"
    if [ -f "ff" ]; then
        echo "   Ubicación: $(pwd)/ff"
    else
        echo "   Ubicación: $(pwd)/tools/ff"
        cp tools/ff ./ff 2>/dev/null
    fi
else
    echo "⚠️ ff no compilado"
fi

echo ""
echo "============================================"
echo "Instalación completada"
echo "============================================"
echo ""
echo "Prueba los planificadores:"
echo "  pyperplan domain.pddl problem1.pddl"
echo "  ./ff -o domain.pddl -f problem1.pddl"
echo ""
echo "Si pyperplan no funciona, añade a tu ~/.bashrc:"
echo "  export PATH=\"\$HOME/.local/bin:\$PATH\""
echo ""
