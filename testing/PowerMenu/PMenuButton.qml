import Quickshell // for PanelWindow
import Quickshell.Io // process
import QtQuick // for Text

Rectangle {
    property string icon
    property var command: []
    radius: 8
    height:22
    width:22
    color: powerMouse.containsMouse ? "#B94141" : "#404040"
    border{
        width: powerMouse.containsPress ? 2 : 0
        color: '#e3e3e3'
    }
    Behavior on color {
        ColorAnimation {
        duration: 150
        }
    }
    Behavior on border.width {
        NumberAnimation {
        duration: 50
        }
    }
    
    MouseArea {
        anchors.fill:parent
        id:powerMouse
        hoverEnabled: true
        onPressed: procPower.running = true
    }
    Process {
        id: procPower
        command: ["systemctl", command]
        running: false
    }
    Item {
        x:3.5
        y:-1
        Text {
        
        anchors.centerIn: parent
        color: "white"
        font.pointSize: 14
        anchors.fill:parent
        text: icon
        }
    }
}