TEMPLATE = app

QT += qml quick widgets

SOURCES += main.cpp

RESOURCES += qml.qrc

# URIs of plugins with shared libraries to bundle on android
uri_drops = org.edgenet.qml.drops

ANDROID_EXTRA_LIBS = \
  $$[QT_INSTALL_QML]/$$replace(uri_drops,  \\., /)/libzmq.so \
  $$[QT_INSTALL_QML]/$$replace(uri_drops,  \\., /)/libczmq.so \
  $$[QT_INSTALL_QML]/$$replace(uri_drops,  \\., /)/libzyre.so \
  $$[QT_INSTALL_QML]/$$replace(uri_drops,  \\., /)/libdrops.so \
  $$[QT_INSTALL_QML]/$$replace(uri_drops,  \\., /)/libdropsplugin.so

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)
