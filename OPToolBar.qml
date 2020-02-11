import QtQuick 2.7
import QtQuick.Controls 1.2
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
Item{
    width: parent.width
    Row{
        x: 8
        y: 8
        ComboBox {
            id:combox
            currentIndex: 0
            model: ListModel {
                id: cbItems
                ListElement { text: "毕节小"; color: "Yellow" }
                ListElement { text: "毕节一中"; color: "Green" }
            }
            width: 162
            onCurrentIndexChanged: {
                if(currentIndex==0){
                    console.debug(cbItems.get(currentIndex).text + ", " + cbItems.get(currentIndex).color)
                    console.debug("0")
                }
                if(currentIndex==1){
                     console.debug("1")
                }
            }
        }
        Button {
            id:previewButton
            x: 202
            anchors {
                top: parent.top
                margins: 5
            }
            text: '预览-'
            onClicked: {
                if( printer.setup() )
                    printer.print();
        //        printer.saveImage("test.png", 'png', 100);
            }
        }

        Button {
            id:printButton
            x: 249
            width: 77
            anchors {
                top: parent.top
                margins: 5
            }
            text: '打印'
            onClicked: {
                if( printer.setup() )
                    printer.print();
            }
        }
    }
}

