# Ruta del entorno virtual
$venvPath = "venv"

# Verificar si el entorno virtual ya existe
if (Test-Path $venvPath) {
    Write-Host "El entorno virtual ya existe. Activandolo..."
    & "$venvPath\Scripts\Activate.ps1"
} else {
    # Crear el entorno virtual si no existe
    Write-Host "El entorno virtual no existe. Creandolo en la carpeta raiz"
    python -m venv $venvPath

    # Activar el entorno virtual despues de crearlo
    Write-Host "Activando entorno virtual recién creado..."
    & "$venvPath\Scripts\Activate.ps1"
}

# Siempre instalar dependencias de Django desde requirements.txt si existe
Write-Host "Instalando dependencias de PyQt..."
if (Test-Path requeriments.txt) {
    pip install -r requeriments.txt
} else {
    Write-Host "No se encontró el archivo requirements.txt."
}


Write-Host "Instalacion completada. ¡Ya estas listo para trabajar!, Corriendo el main"

& C:\Users\pc\Desktop\inversiones-rosalia\InversionesRosalia\venv\Scripts\python.exe C:\Users\pc\Desktop\inversiones-rosalia\InversionesRosalia\src\main.py
