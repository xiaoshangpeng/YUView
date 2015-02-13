#-------------------------------------------------
#
# Project created by QtCreator 2010-10-28T14:12:12
#
#-------------------------------------------------

QT       += core gui opengl xml

TARGET = YUView
TEMPLATE = app

SOURCES += main.cpp\
        mainwindow.cpp \
    renderwidget.cpp \
    yuvfile.cpp \
    yuvobject.cpp \
    yuvlistitem.cpp \
    yuvlistitemvid.cpp \
    yuviewapp.cpp \
    videofile.cpp \
    statisticsparser.cpp \
    statslistmodel.cpp \
    sliderdelegate.cpp \
    playlisttreewidget.cpp \
    statslistview.cpp \
    settingswindow.cpp

HEADERS  += mainwindow.h \
    renderwidget.h \
    yuvfile.h \
    yuvobject.h \
    yuvlistitem.h \
    yuvlistitemvid.h \
    yuviewapp.h \
    videofile.h \
    statisticsparser.h \
    statslistmodel.h \
    sliderdelegate.h \
    playlisttreewidget.h \
    statslistview.h \
    settingswindow.h

FORMS    += mainwindow.ui \
    settingswindow.ui

OTHER_FILES += \
    docs/YUView ToDo.txt

RESOURCES += \
    images.qrc \
    resources.qrc

macx {
    CONFIG(debug, debug|release) {
        DESTDIR = build/debug
    } else {
        DESTDIR = build/release
    }
    OBJECTS_DIR = $$DESTDIR/.obj
    MOC_DIR = $$DESTDIR/.moc
    RCC_DIR = $$DESTDIR/.qrc
    UI_DIR = $$DESTDIR/.ui

    QMAKE_MAC_SDK = macosx

    ICON = images/YUView.icns
    QMAKE_INFO_PLIST = Info.plist
    SVNN   = $$system("svn info | grep \"Revision\" | awk '{print $2}'")

# GCC only :-(
    #QMAKE_CXXFLAGS += -fopenmp
    #QMAKE_LFLAGS *= -fopenmp
}

linux {
    CONFIG(debug, debug|release) {
        DESTDIR = build/debug
    } else {
        DESTDIR = build/release
    }
    OBJECTS_DIR = $$DESTDIR/.obj
    MOC_DIR = $$DESTDIR/.moc
    RCC_DIR = $$DESTDIR/.qrc
    UI_DIR = $$DESTDIR/.ui

    QMAKE_CXXFLAGS += -fopenmp
    QMAKE_LFLAGS *= -fopenmp
    SVNN   = $$system("svn info | grep \"Revision\" | awk '{print $2}'")
}

win32 {

    QMAKE_CXXFLAGS += -openmp
#QMAKE_LFLAGS_DEBUG    = /INCREMENTAL:NO
    RC_FILE += WindowsAppIcon.rc

    SVNN = $$system("svnversion -n")
    SVNN = $$replace(SVNN,"M","")
    SVNN = $$replace(SVNN,"S","")
    SVNN = $$replace(SVNN,"P","")
    SVNN = $$section(SVNN, :, 0, 0)

}

isEmpty(SVNN) {
 SVNN = 0
}
VERSTR = '\\"$${SVNN}\\"'
DEFINES += VER=\"$${VERSTR}\"
