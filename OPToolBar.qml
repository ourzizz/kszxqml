import QtQuick 2.7
import QtQuick.Controls 1.2
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
Item{
    Row{
        x: 8
        y: 8
        ComboBox {
            id:combox
            currentIndex: 0
            model: ListModel {
                id: cbItems
                ListElement { text: "毕节一小"; color: "Yellow" }
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

    RowLayout {
        id: rowLayout
        x: 328
        y: 12
        width: 202
        height: 35
        Label {
            id: label
            x: 346
            y: 19
            text: qsTr("起始考场")
        }

        TextField {
            id: textField
            x: 403
            y: 15
            placeholderText: qsTr("Text Field")
        }
    }
    RowLayout {
        id: rowLayout2
        x: 328
        y: 12
        width: 202
        height: 35
        Label {
            id: label2
            x: 346
            y: 19
            text: qsTr("起始考场")
        }

        TextField {
            id: textFieldend
            x: 403
            y: 15
            placeholderText: qsTr("Text Field")
        }
    }

}

