import sys
from pathlib import Path
from PyQt6.QtCore import QUrl, QObject, pyqtSlot
from PyQt6.QtWidgets import QApplication
from PyQt6.QtWebEngineWidgets import QWebEngineView
from PyQt6.QtWebChannel import QWebChannel
from PyQt6.QtGui import QIcon



class Bridge(QObject):
    def __init__(self, webview):
        super().__init__()
        self.webview = webview

app = QApplication(sys.argv)
view = QWebEngineView()

view.setWindowTitle("Rosalia's") 

icon_path = Path(__file__).parent / 'views/public/image/icono.png' # Asume que el icono está en el mismo nivel
if icon_path.exists():
    view.setWindowIcon(QIcon(str(icon_path.absolute())))
else:
    print(f"Advertencia: El archivo de ícono '{icon_path}' no se encontró. Usando ícono predeterminado.")

channel = QWebChannel()
bridge = Bridge(view)
channel.registerObject('pyObject', bridge)
view.page().setWebChannel(channel)

html_path = Path(__file__).parent / 'views' / 'inicio.html'
view.load(QUrl.fromLocalFile(str(html_path.absolute())))

view.show()
sys.exit(app.exec())
