import QtQuick 6.5

Window {
    width: mainScreen.width
    height: mainScreen.height
    title: "ByteBoard"

    visible: true
    color: "transparent"
    flags: Qt.Widget | Qt.FramelessWindowHint

    Splash {
        id: mainScreen
    }
}