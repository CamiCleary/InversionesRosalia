import mysql.connector
import csv
from reportlab.lib.pagesizes import A4
from reportlab.pdfgen import canvas

def get_connection():
    return mysql.connector.connect(
        host='localhost',
        user='root',
        password='123456',
        database='inv_rosalia'
    )

def crear_base_de_datos():
    """
    Carga el esquema de la base de datos a partir de un script .sql
    """
    conn = mysql.connector.connect(
        host='localhost',
        user='root',
        password='123456'
    )
    cursor = conn.cursor()

    with open('src/inv_rosalia.sql', 'r') as f:
        script = f.readlines()

    script = " ".join(script)
    for command in script.split(';'):
        cmd = command.strip()
        if cmd:
            try:
                cursor.execute(cmd)
            except mysql.connector.Error as e:
                print(f"Error al ejecutar {cmd}: {e}")

    conn.commit()
    cursor.close()
    conn.close()
    print("Base de datos creada o actualizada.")


def generar_reporte(mes):
    """
    Genera el reporte contable para el mes especificado (formato 01-12).
    """
    conn = get_connection()
    cursor = conn.cursor()

    query = """
    SELECT 
      DATE(v.fecha_contrato) AS fecha,
      SUM(v.monto) AS ingreso,
      SUM(p.metraje * a.precio_unidad) AS gasto,
      SUM(v.monto) - SUM(p.metraje * a.precio_unidad) AS ganancia
    FROM 
      ventas v
    JOIN produccion p ON p.ventas_id = v.id
    JOIN almacen a ON p.almacen_id = a.id
    WHERE 
      MONTH(v.fecha_contrato) = %s
    GROUP BY 
      DATE(v.fecha_contrato);
    """
    cursor.execute(query, (mes,))
    resultados = cursor.fetchall()
    conn.close()
    return resultados


def guardar_reporte_pdf(reporte, nombre_file='reporte.pdf'):
    """
    Función que genera un PDF resumido del reporte contable.
    """
    c = canvas.Canvas(nombre_file, pagesize=A4)
    c.setFont("Helvetica", 14)
    c.drawString(100, 750, "Reporte contable")

    y = 720
    for row in reporte:
        fecha, ingreso, gasto, ganancia = row
        linea = f"Fecha: {fecha} | Ingresos: {ingreso} | Gasto: {gasto} | Utilidad: {ganancia}"
        c.drawString(100, y, linea)
        y -= 20
    
    c.save()


def guardar_reporte_csv(reporte, nombre_file='reporte.csv'):
    """
    Función que exporta el reporte contable en CSV.
    """
    with open(nombre_file, mode='w', newline='',encoding='utf-8') as f:
        writer = csv.writer(f)
        writer.writerow(['Fecha', 'Ingresos', 'Gasto', 'Utilidad'])

        for row in reporte:
            writer.writerow(row)


# Uncomment if you want to create or reset the database when you start
# crear_base_de_datos()
