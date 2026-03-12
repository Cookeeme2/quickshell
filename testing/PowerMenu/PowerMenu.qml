import Quickshell // for PanelWindow
import Quickshell.Io // process
import QtQuick // for Text

Rectangle {
    id: powerMenu
    color: "#404040"
    width: 10 + powerRow.width
    height:30
    anchors.verticalCenter: parent.verticalCenter
    anchors.right: parent.right

    radius: 10
    anchors {
        leftMargin: 10
        rightMargin:10  
    }
    Row {
        id:powerRow
        anchors.centerIn: parent
        spacing: 2
        //["󰤆", "󰤄", ""]
        PMenuButton {
            icon: "󰤆"
            command: "poweroff"
        }
        PMenuButton {
            icon: "󰤄"
            command: ["systemctl", "sleep"]//"sleep"//"/bin/systemctl sleep"
        }
        PMenuButton {
            icon: ""
            command: "reboot"
        }
        // Rectangle {
        //     radius: 8
        //     required property string modelData
        //     height:22
        //     width:22
        //     color: powerMouse.containsMouse ? "#B94141" : "#404040"
        //     border{
        //         width: powerMouse.containsPress ? 2 : 0
        //         color: '#e3e3e3'
        //     }
        //     Behavior on color {
        //         ColorAnimation {
        //         duration: 150
        //         }
        //     }
        //     Behavior on border.width {
        //         NumberAnimation {
        //         duration: 50
        //         }
        //     }
            
        //     MouseArea {
        //         anchors.fill:parent
        //         id:powerMouse
        //         hoverEnabled: true
        //     }
        //     Item {
        //         x:3.5
        //         y:-1
        //         Text {
                
        //         anchors.centerIn: parent
        //         color: "white"
        //         font.pointSize: 14
        //         anchors.fill:parent
        //         text: modelData
        //         }
        //     }

        // }
    }
}
