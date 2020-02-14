import QtQuick 2.7
import QtQuick.Controls 1.2
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import "logic.js" as Logic
Item{
    Component{
        id:checkBoxTemplate
        CheckBox {//考场Item的checkBox
            text: ""
            property var schoolName:""
            onCheckedChanged: {
                console.debug(schoolName,text)
                gridView.model.get(schoolName,text)
            }
        }
    }
    function createCheckItem(schoolName,kaochangCount){
        var i = 0
        for(i;i<kaochangCount;i++){
            var text = i + 1
            if(i<9){
                text = "0" + text
            }
            checkBoxTemplate.createObject(kaochangGroupBox,{"schoolName":schoolName,"text":text})
        }
    }
//    function destroyAllCheckBox(kaochangGroupBox){//gourpCheckbox
    function destroyAllCheckBox(){//gourpCheckbox
        var count = kaochangGroupBox.children.length;
        for(var i = 0; i < count; i++){
            kaochangGroupBox.children[i].destroy()
        }
    }
    width: parent.width
    Row{
        x: 8
        y: 8
        ComboBox {//下拉列表
            id:kaodianCombobox
            textRole: "key"
            anchors.left : groupbox.right
            model: ListModel {
                ListElement { key: "七星关区第二实验学校"; value: "68" }
                ListElement { key: "毕节市实验学校"; value: "60" }
                ListElement { key: "毕节一中"; value: "47" }
            }
            onCurrentIndexChanged:{
                destroyAllCheckBox()
                createCheckItem(model.get(currentIndex).key,model.get(currentIndex).value)
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

