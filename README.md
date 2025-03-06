# 👗 Sistema de Gestión Integral para Talleres de Costura - Inversiones Rosalía

## Descripción  
Este proyecto surge para resolver las necesidades críticas del taller familiar **Inversiones Rosalía**, especializado en alta costura desde 2019. Ante su expansión, los registros manuales en papel han generado problemas como:  
- Gestión ineficiente de inventario de materia prima.  
- Dificultades en cobros/pagos y seguimiento de clientes.  
- Falta de planificación de producción y análisis financiero.  

La aplicación, desarrollada con **Python, PyQt6 y Qt WebEngine**, ofrece un sistema integrado para:  
✔️ Gestionar inventario, producción, clientes y personal.  
✔️ Automatizar pagos y generar informes financieros/ventas.  
✔️ Mantener una biblioteca digital de diseños y patrones.  
✔️ Optimizar relaciones con clientes mediante segmentación y seguimiento.  

## Características Clave  
- **Interfaz gráfica intuitiva** con PyQt6 y diseño responsive (Bootstrap).  
- **Módulos especializados**:  
  - 📐 Diseño: Creación de patrones, fichas técnicas y biblioteca de telas.  
  - 🏭 Producción: Planificación, órdenes de trabajo y seguimiento en tiempo real.  
  - 💵 Ventas: Catálogo digital, carrito de compras y pasarelas de pago.  
  - 📊 Contabilidad: Reportes financieros, costos y control de inventario.  
  - 👥 Clientes: Historial de compras, marketing personalizado y análisis de datos.  
- **Seguridad**: Autenticación de dos factores, encriptación SSL y copias de seguridad.  
- **Multiplataforma**: Funciona en Windows, Linux y macOS.  

## Requisitos Previos  
- Python 3.8+  
- PyQt6 >= 6.4.0  
- QtWebEngine (requiere Qt 5.15+)  
- MySQL Server (para base de datos)  

## Instalación  
```bash
# Clonar repositorio
git clone https://github.com/tu-usuario/inversiones-rosalia.git
cd inversiones-rosalia

# Instalar dependencias
pip install -r requirements.txt

```
## Uso
### Ejecutar la aplicación:

```bash
python main.py
```

## Estructura del Proyecto

```bash

├── main.py              # Punto de entrada
├── modelos/             # Clases de datos (Clientes, Inventario, etc.)
├── vistas/              # Interfaces gráficas (.ui y .py)
├── controladores/       # Lógica de negocio
├── recursos/            # Imágenes, CSS, plantillas
├── docs/                # Manuales y diagramas
└── requirements.txt     # Dependencias

```
## Dependencias Principales

```bash
PyQt6==6.4.0
PyQt6-WebEngine==6.4.0
reportlab==3.6.12       # Para generación de informes
cryptography==39.0.1    # Encriptación

```
## Contribución

## Haz un fork del proyecto.

Crea una rama: git checkout -b feature/nueva-funcionalidad.

Sigue las convenciones de código PEP8.

Envía un Pull Request con una descripción detallada.


## Reconocimientos
Qt Framework: Por las herramientas de interfaz gráfica y WebEngine.

Tecnologías web: Bootstrap para diseño responsive.

Inspirado en los requisitos técnicos del PDF (PHP/Laravel adaptados a Python).