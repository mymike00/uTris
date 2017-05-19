TEMPLATE = aux
TARGET = uTris

RESOURCES += uTris.qrc

QML_FILES += $$files(*.qml,true) \
             $$files(*.js,true)

CONF_FILES +=  uTris.apparmor \
               uTris.svg \
               uTrisLogo.svg \
               logo-ubuntu.svg \
               logo-canonical.svg \
               logo-ubuntuW.svg \
               logo-ubuntuB.svg \
               logo-ubuntuWB.svg \
               g1-vs-cpu.svg \
               uTrisSplah.svg \
               g1-vs-cpu-blue.svg \
               work-in-progress.svg

AP_TEST_FILES += tests/autopilot/run \
                 $$files(tests/*.py,true)               

OTHER_FILES += $${CONF_FILES} \
               $${QML_FILES} \
               $${AP_TEST_FILES} \
               uTris.desktop

#specify where the qml/js files are installed to
qml_files.path = /uTris
qml_files.files += $${QML_FILES}

#specify where the config files are installed to
config_files.path = /uTris
config_files.files += $${CONF_FILES}

#install the desktop file, a translated version is 
#automatically created in the build directory
desktop_file.path = /uTris
desktop_file.files = $$OUT_PWD/uTris.desktop
desktop_file.CONFIG += no_check_exist

INSTALLS+=config_files qml_files desktop_file

#DISTFILES += \
 #   triscript.js

