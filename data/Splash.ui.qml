import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Timeline 1.0
import QtQuick.Effects

Item {
    id: item1
    width: 750
    height: 475

    Rectangle {
        id: rdr
        width: 144
        height: 41.7
        color: "#1a1a1a"
        radius: 72
        opacity: 1
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        BusyIndicator {
            id: busyIndicator
            width: 72
            height: 72
            opacity: rdr.opacity
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            running: busyTimer.running
            enabled: false

            Timer {
                id: busyTimer
                interval: 1600
                running: true
            }
        }

        Text {
            id: logo
            x: 57
            y: 60
            opacity: 0
            color: "#606674"
            text: qsTr("Byte Board")
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 36
            z: 1
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    MultiEffect {
        id: multiEffect
        source: rdr
        anchors.fill: rdr
        shadowEnabled: true
        shadowColor: "#40000000"
    }

    Timeline {
        id: timeline
        animations: [
            TimelineAnimation {
                id: startAnimation
                running: true
                loops: 1
                duration: 1000
                to: 1000
                from: 0
            }
        ]
        enabled: true
        startFrame: 0
        endFrame: 350

        KeyframeGroup {
            target: rdr
            property: "opacity"

            Keyframe {
                frame: 0
                value: 0
            }

            Keyframe {
                frame: 288
                value: 1.0202
            }
        }

        KeyframeGroup {
            target: rdr
            property: "width"
            Keyframe {
                easing.bezierCurve: [0.445, 0.05, 0.55, 0.95, 1, 1]
                frame: 0
                value: 0
            }

            Keyframe {
                easing.bezierCurve: [0.445, 0.05, 0.55, 0.95, 1, 1]
                frame: 349
                value: 136
            }
        }

        KeyframeGroup {
            target: rdr
            property: "height"
            Keyframe {
                easing.bezierCurve: [0.445, 0.05, 0.55, 0.95, 1, 1]
                frame: 0
                value: 0
            }

            Keyframe {
                easing.bezierCurve: [0.445, 0.05, 0.55, 0.95, 1, 1]
                frame: 349
                value: 136
            }
        }

        KeyframeGroup {
            target: busyIndicator
            property: "width"
            Keyframe {
                easing.bezierCurve: [0.445, 0.05, 0.55, 0.95, 1, 1]
                frame: 0
                value: 0
            }

            Keyframe {
                easing.bezierCurve: [0.445, 0.05, 0.55, 0.95, 1, 1]
                frame: 349
                value: 72
            }
        }

        KeyframeGroup {
            target: busyIndicator
            property: "height"
            Keyframe {
                easing.bezierCurve: [0.445, 0.05, 0.55, 0.95, 1, 1]
                frame: 0
                value: 0
            }

            Keyframe {
                easing.bezierCurve: [0.445, 0.05, 0.55, 0.95, 1, 1]
                frame: 349
                value: 72
            }
        }
    }

    Timeline {
        id: signTimeline
        animations: [
            TimelineAnimation {
                id: signupAnim
                running: false
                loops: 1
                duration: 5000
                to: 5000
                from: 0
            }
        ]
        enabled: false
        startFrame: 0
        endFrame: 5000

        KeyframeGroup {
            target: rdr
            property: "height"
            Keyframe {
                frame: 0
                value: 136
            }

            Keyframe {
                easing.bezierCurve: [0.445, 0.05, 0.55, 0.95, 1, 1]
                frame: 997
                value: 122
            }

            Keyframe {
                easing.bezierCurve: [0.445, 0.05, 0.55, 0.95, 1, 1]
                frame: 603
                value: 136
            }
        }

        KeyframeGroup {
            target: rdr
            property: "width"
            Keyframe {
                frame: 0
                value: 136
            }

            Keyframe {
                easing.bezierCurve: [0.445, 0.05, 0.55, 0.95, 1, 1]
                frame: 997
                value: 348
            }

            Keyframe {
                easing.bezierCurve: [0.445, 0.05, 0.55, 0.95, 1, 1]
                frame: 603
                value: 136
            }
        }

        KeyframeGroup {
            target: rdr
            property: "radius"
            Keyframe {
                frame: 0
                value: 72
            }

            Keyframe {
                easing.bezierCurve: [0.445, 0.05, 0.55, 0.95, 1, 1]
                frame: 997
                value: 28
            }

            Keyframe {
                easing.bezierCurve: [0.445, 0.05, 0.55, 0.95, 1, 1]
                frame: 603
                value: 72
            }
        }

        KeyframeGroup {
            target: logo
            property: "opacity"
            Keyframe {
                frame: 1811
                value: 0
            }

            Keyframe {
                frame: 2014
                value: 1
            }
        }
    }

    states: [
        State {
            name: "SignOnTransition"
            when: !busyIndicator.running

            PropertyChanges {
                target: timeline
                enabled: false
                currentFrame: 0
            }

            PropertyChanges {
                target: startAnimation
                running: false
            }

            PropertyChanges {
                target: signupAnim
                running: true
            }

            PropertyChanges {
                target: signTimeline
                enabled: true
            }

            PropertyChanges {
                target: busyIndicator
                width: 72
                height: 72
            }

            PropertyChanges {
                target: rdr
                width: 136
                height: 136
                opacity: 1
            }

            PropertyChanges {
                target: multiEffect
                shadowOpacity: 1
            }
        }
    ]
}