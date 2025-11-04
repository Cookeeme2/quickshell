import Quickshell // for PanelWindow
import Quickshell.Io // process
import QtQuick // for Text
import Quickshell.Services.SystemTray
import Quickshell.Services.Mpris
import Qt5Compat.GraphicalEffects
import Quickshell.Wayland

PanelWindow {
    width: 300
    height:300
    anchors {
        bottom:true
        right:true
    }
    Rectangle {
        anchors.fill:parent
        Rectangle {
            id:shape
            anchors.centerIn:parent
            color: "gray"
            implicitHeight: 200
            implicitWidth: 200
            radius: 40
            Text {text: "LOCK SCREEN"}
            MouseArea {
                hoverEnabled:true
                anchors.fill:parent
                onClicked:lock.locked=true
                onEntered: parent.color= "blue"
                onExited:parent.color="grey"
            }
        }    
    }
    WlSessionLock {
        id: lock
        WlSessionLockSurface {
            Rectangle {
                Text {text: "unlock"}
                color:"grey"
                height: 500
                width: 500
                id: button
                MouseArea {
                    hoverEnabled: true
                    onClicked:lock.locked = false
                    anchors.fill:parent
                     onEntered: parent.color= "blue"
                onExited:parent.color="grey"
                }
            }
        }
    }
}