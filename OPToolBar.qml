import QtQuick 2.7
import QtQuick.Controls 1.2
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import "logic.js" as Logic
Item{
    width: parent.width
    Row{
        x: 8
        y: 8
        ComboBox {//下拉列表
            id:kaodianCombobox
            textRole: "key"
            anchors.left : groupbox.right
            model: ListModel {
                ListElement { key: "毕节一小"; value: "30" }
                ListElement { key: "毕节市实验学校"; value: "40" }
                ListElement { key: "毕节一中"; value: "30" }
            }
            onCurrentIndexChanged:{
//                Logic.destroyAllCheckBox()
                Logic.createCheckItem(model.get(currentIndex).value)
            }
        }
//	    ComboBox {
//		    id:combox
//		    currentIndex: 0
//		    model: ListModel {
//			    id: cbItems
//		    }
//		    width: 162
//		    onCurrentIndexChanged: {
//			    if(currentIndex==0){
//				    console.debug(cbItems.get(currentIndex).text + ", " + cbItems.get(currentIndex).color)
//				    console.debug("0")
//			    }
//			    if(currentIndex==1){
//				    console.debug("1")
//			    }
//		    }
//	    }

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

