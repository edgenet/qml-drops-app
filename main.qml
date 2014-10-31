
import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1

import org.edgenet.qml.drops 1.0


ApplicationWindow {
  visible: true
  width: 640
  height: 480
  title: "Drops"
  
  menuBar: MenuBar {
    Menu {
      title: "&File"
      MenuItem { text: "&Start";  onTriggered: startButton.click() }
      MenuItem { text: "S&top";   onTriggered: stopButton.click() }
      MenuItem { text: "&Exit";   onTriggered: Qt.quit() }
    }
  }
  
  Drops { id: drops }
  
  Item {
    anchors.fill: parent
    anchors.margins: parent.width / 12
    
    GridLayout {
      anchors.fill: parent
      columns: 2
      
      Text {
        id: pathText
        text: drops.running ? "Drops is running in path: '%1'".arg(drops.path)
                            : "Drops is not running"
        color: drops.running ? "green" : "red"
        verticalAlignment:   Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        
        Layout.columnSpan: 2
        Layout.fillWidth: true
        Layout.fillHeight: true
      }
      
      Button {
        id: startButton
        text: "Start"
        onClicked: drops.start()
        
        Layout.fillWidth: true
        Layout.fillHeight: true
      }
      
      Button {
        id: stopButton
        text: "Stop"
        onClicked: drops.stop()
        
        Layout.fillWidth: true
        Layout.fillHeight: true
      }
      
      Button {
        id: selfTestButton
        text: "System Self-Test\n(prints to debugging console)"
        onClicked: Drops.selfTest(true)
        
        Layout.columnSpan: 2
        Layout.fillWidth: true
        Layout.fillHeight: true
      }
      
      TextField {
        id: pathField
        text: drops.path
        verticalAlignment:   TextInput.AlignVCenter
        horizontalAlignment: TextInput.AlignHCenter
        onAccepted: drops.path = text
        
        Layout.columnSpan: 2
        Layout.fillWidth: true
        Layout.fillHeight: true
      }
    }
  }
}
