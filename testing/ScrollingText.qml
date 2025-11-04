import QtQuick
import Quickshell


    Item {
    property string text
    height:15
    width:240
    clip:true
    Text {
        id:textelement
        height:parent.height
        font.family: "JetBrainsMono Nerd Font"
        font.styleName: "SemiBold Italic"
        font.pointSize: 11
        verticalAlignment: Text.AlignVCenter
        text: parent.text// + [Mpris.players.values[0].trackArtist]
        color: "white"

        property int scrollTarget: 0

        onContentWidthChanged: {
            if (contentWidth > parent.width) {
                scrollTarget = parent.width - contentWidth
                textanimation.running = true
                textelement.x = 0
            }
            else {
                textanimation.running = false
                textelement.x = 0
            }
        }

        SequentialAnimation {
            id:textanimation
            running:false //true
            loops:Animation.Infinite
            PauseAnimation { duration: 2000 }
            NumberAnimation {
                target: textelement
                property: "x"
                from: 0
                to: textelement.scrollTarget
                duration: 3000
                running:false
            }
            PauseAnimation { duration: 2000 }
            NumberAnimation {
                target: textelement
                property: "x"
                from: textelement.scrollTarget
                to: 0
                duration: 3000
            }
        }
    }
}
