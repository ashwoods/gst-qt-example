from PySide2.QtWidgets import QApplication
from PySide2.QtQuick import QQuickView
from PySide2.QtCore import QUrl

import gi
gi.require_version('Gst', '1.0')
from gi.repository import Gst, GObject
Gst.init(None)
Gst.ElementFactory.make('qmlglsink')

app = QApplication([])

view = QQuickView()

url = QUrl("/src/gst-examples/playback/player/qt/main.qml")


view.setSource(url)

view.show()

app.exec_()






