
QT       += core gui opengl network

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = PhotoKit
TEMPLATE = app
LIBS += -lexif
PROJECTROOT = $$PWD/..
TRANSLATIONS += $${PROJECTROOT}/i18n/$${TARGET}_zh-cn.ts $${PROJECTROOT}/i18n/$${TARGET}_zh_CN.ts
!include(ezlog/src/libezlog.pri): error(could not find libezlog.pri)
!include(ProgramOptions/src/libProgramOptions.pri): error(could not find libProgramOptions.pri)
!include(NextEffect/src/libNextEffect.pri): error(could not find libNextEffect.pri)
include($${PROJECTROOT}/common.pri)

INCLUDEPATH += $$PWD
SOURCES += main.cpp \
	ThumbTask.cpp \
    Config.cpp \
    PhotoKitView.cpp \
    PhotoKitScene.cpp \
    ThumbItem.cpp \
    OutlineGlowItem.cpp \
    TransformMachine.cpp \
    ItemAnimation.cpp \
    ReflectEffectItem.cpp \
    ShareManager.cpp \
    UiManager.cpp \
    OptionParser.cpp \
    tools/Tools.cpp \
    SlideDisplay.cpp \
    SlidePlayControl.cpp \
    network/weiboapi.cpp \
    network/qput.cpp \
    network/WeiboDialog.cpp \
    tools/ConfigDialog.cpp \
    Guide.cpp \
    DemoItemAnimation.cpp \
    tools/ToolTip.cpp \
    network/ImageSearcher.cpp \
    ToolBar.cpp \
    Button.cpp \
    ProgressBarItem.cpp \
    score.cpp \
    BaseItem.cpp \
    FlipAnimation.cpp \
    tools/ExifReader.cpp \
    Dialog.cpp \
    tools/ImageInfoDialog.cpp

HEADERS  += \
	ThumbTask.h \
    Config.h \
    PhotoKit_Global.h \
    PhotoKitView.h \
    PhotoKitScene.h \
    ThumbItem.h \
    OutlineGlowItem.h \
    TransformMachine.h \
    ItemAnimation.h \
    ReflectEffectItem.h \
    ShareManager.h \
    UiManager.h \
    OptionParser.h \
    tools/Tools.h \
    SlideDisplay.h \
    SlidePlayControl.h \
    network/weiboapi.h \
    network/qput.h \
    network/WeiboDialog.h \
    tools/ConfigDialog.h \
    Guide.h \
    DemoItemAnimation.h \
    tools/ToolTip.h \
    network/ImageSearcher.h \
    ToolBar.h \
    Button.h \
    ProgressBarItem.h \
    score.h \
    BaseItem.h \
    FlipAnimation.h \
    tools/ExifReader.h \
    Dialog.h \
    tools/ImageInfoDialog.h \
    Dialog_p.h

CONFIG += mobility
MOBILITY = 

RESOURCES += \
    ../res/res.qrc \
    ../res/style.qrc

contains(MEEGO_EDITION,harmattan) {

}

maemo5 {
    target.path = /opt/PhotoKit/bin
    INSTALLS += target
}

contains(MEEGO_EDITION,harmattan) {
    DEFINES += CACHE_APPDIR
    target.path = /opt/PhotoKit/bin
    desktopfile.files = PhotoKit.desktop
    desktopfile.path = /usr/share/applications
    icon.files = PhotoKit.png
    icon.path = /usr/share/icons/hicolor/80x80/apps
    INSTALLS += target desktopfile icon
}

OTHER_FILES += \
    ../res/ui.css
