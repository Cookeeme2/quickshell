

import Quickshell // for PanelWindow
import Quickshell.Io // process
import QtQuick // for Text


Rectangle {
    anchors.verticalCenter: parent.verticalCenter
    property int maxWidth: 100
    property string text: ""
    property double contWidth: textelement.contentWidth
    implicitHeight: 30
    // implicitWidth: 100
    width: 100
    // : if(textelement.contentWidth > this.implicitWidth) {
    //     this.implicitWidth = textelement.contentWidth + 5
    // }
    color: "#404040"
    border.width: 2
    border.color: color
    radius: 10
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: parent.border.color = "#B94141"
        onExited: parent.border.color = parent.color
    }
    Text {
        id:textelement
        anchors.centerIn: parent
        color: "white"
        font.pointSize: 12
        font.family: "JetBrainsMono Nerd Font"
        font.styleName: "SemiBold Italic"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        text: parent.text
    }
    Behavior on width {
        NumberAnimation {
            duration:500
            
        }
    }
    Behavior on border.color {
        ColorAnimation {
            duration: 150
        }
    }
}
