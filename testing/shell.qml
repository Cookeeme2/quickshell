//@ pragma UseQApplication
import Quickshell // for PanelWindow
import Quickshell.Io // process
import QtQuick // for Text
import Quickshell.Services.SystemTray
import Quickshell.Services.Mpris
import Quickshell.Services.UPower
import Qt5Compat.GraphicalEffects

Scope {
  id:root
  
  Variants {
    model: Quickshell.screens

    PanelWindow{
      required property var modelData
      id: taskbar
      anchors{
        top: true
        left:true
        right:true
      }
      height: 40
      color: '#00000000'
      Rectangle {
        id:base
        anchors.fill: parent
        color:'#48000000'
        radius: 10
        anchors{
          fill: parent
          rightMargin: 10
          leftMargin: 10
          topMargin: 5
        }
        Rectangle {
          width: 200
          height:30
          anchors.verticalCenter: parent.verticalCenter
          anchors.right: tray.left
          
        }
        StandardBarModule {
          anchors.left: cpustat.right
          anchors.leftMargin: 10
          text: "fuck me"
          width: contWidth +10
        }

        //Battery
        StandardBarModule {
          x: 2
          id: batteryModule
          property int percentage: UPower.devices.values[1].percentage*100 + UPower.devices.values[0].percentage*100
          property int power: UPower.devices.values[1].changeRate + UPower.devices.values[0].changeRate
          
          text: percentage + "% - " + power + "W"
          width: contWidth + 10
        }

        //CPU Load
        
        StandardBarModule {
          width: contWidth + 10
          property int test
          id: cpustat
          text: "CPU - " + test + "%"
          anchors.left:batteryModule.right
          anchors.leftMargin: 10
          Process {
            
            id: cpuProc
            running: true
            command: ["sh","/home/douglasbeer/.config/quickshell/scripts/get-cpu-idle.sh"]//vmstat 1 2|tail -1|awk '{print $15}'
            
            stdout: StdioCollector {
              onStreamFinished: cpustat.test = 100 - parseInt(this.text) 
            
            }
            
          }
          Timer {
            interval: 1000
            running: true
            repeat: true
            onTriggered: cpuProc.running=true
          }
        }
        
        //MEDIAPLAYER

        MediaPlayer {}
        //CLOCK
        StandardBarModule {
          id:clock
          SystemClock {
            id: sysclock
            precision: SystemClock.Seconds
          }
          width: 220
          anchors.centerIn: parent
          text: Qt.formatDateTime(sysclock.date, "hh:mm:ss - dd-MM-yyyy")
          anchors.horizontalCenterOffset: -85
        }

        //SYSTRAY
        
        Rectangle {
          radius: 12
          id: tray
          anchors.right: parent.right
          anchors.rightMargin: 2
          anchors.verticalCenter: parent.verticalCenter
          
          color: "#404040"
          height: 30
          implicitWidth: trayrow.width
          Row {
            anchors.centerIn: parent
            id: trayrow
            spacing: 5
            Repeater {
              model: SystemTray.items
              Rectangle {
                height: 30
                width: 30
                color: "#404040"
                radius: 12
                
                MouseArea {
                  anchors.fill:parent
                  id: trayItem
                  property SystemTrayItem item: modelData
                  // implicitWidth: Config.settings.bar.trayIconSize
                  // implicitHeight: Config.settings.bar.trayIconSize
                  onEntered: parent.color = "#B94141"
                  onExited: parent.color = "#404040"
                  hoverEnabled: true

                  onClicked: event => {
                    switch (event.button) {
                    case Qt.LeftButton:
                      if (item.hasMenu) {
                        menu.open();
                      }
                      else {
                        modelData.activate()
                      }
                      break;
                    case Qt.RightButton:
                      if (item.hasMenu) {
                        menu.open();
                      }
                      break;
                    }

                    event.accepted = true;
                  }

                  
                  Image {
                    smooth:true
                    source: modelData.icon
                    anchors.centerIn:parent
                    width: 25
                    height: 25
                    fillMode: Image.PreserveAspectFit
                    QsMenuAnchor {
                      id: menu

                      menu: trayItem.item.menu
                      anchor.window: taskbar
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}