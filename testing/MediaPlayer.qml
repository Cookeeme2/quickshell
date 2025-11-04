import Quickshell
import QtQuick
import QtQuick // for Text
import Quickshell.Services.Mpris
import Qt5Compat.GraphicalEffects

Item {
    id:mediaplayer
    height: 30
    implicitWidth: 400
    //anchors.centerIn:
    anchors.left:clock.right
    anchors.leftMargin: 5
    anchors.verticalCenter: parent.verticalCenter
    clip:false

    OpacityMask {
        anchors.fill:parent
        source:albumcover
        maskSource:mask
    }
    Image {
        id:albumcover
        Rectangle {
            id:mask
            anchors.fill: parent
            width: mediaplayer.width
            color: "#75000000"
            radius: 10
            visible:false
            border{
                color: "#B94141"
                width: 0
            }
        }
        visible:false
        clip:true
        height: 30
        width: parent.width
        fillMode: Image.PreserveAspectCrop
        source: Mpris.players.values[0].trackArtUrl
        
    }
    Row {
        Item {
            id: buttonpanel1
            width:30
            height: parent.height
            Text {
                
                anchors.centerIn: parent
                id: skipback
                font.family: "JetBrainsMono Nerd Font"
                font.styleName: "SemiBold Italic"
                font.pointSize: 24
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                color: "white"
                text: "󰒮"
            }
        }
        Column {
            ScrollingText {
                text: Mpris.players.values[0].trackArtist
            }
            ScrollingText {
                text: Mpris.players.values[0].trackTitle
            }
        }
        Item {
            id: buttonpanel2
            width:30
            height:30
        
            Text {
                anchors.centerIn: parent
                id:forwardbutton
                font.family: "JetBrainsMono Nerd Font"
                font.styleName: "SemiBold Italic"
                font.pointSize: 24
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                color: "white"
                text: "󰒭"
            }
            MouseArea {
                anchors.fill:parent
                hoverEnabled:true
                onEntered: backbutton.color="blue"
                onExited: backbutton.color="white"
                onClicked: Mpris.players.values[0].next()
                cursorShape: Qt.PointingHandCursor
                
            }
        }
    }
}
//Icons:
//skip-forwards - 󰒭
//skip-backwards - 2 󰒮
//play - 󰐊
//pause - 󰏤 