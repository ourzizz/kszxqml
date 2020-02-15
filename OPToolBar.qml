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
            property string schoolName:""
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
            width:180;
            id:kaodianCombobox
            textRole: "key"
            model: ListModel {
                ListElement { key: "七星关区第二实验学校"; value: "60" }
                ListElement { key: "毕节市实验学校"; value: "60" }
                ListElement { key: "毕节一中"; value: "47" }
            }
            onCurrentIndexChanged:{
                root.schoolName = model.get(currentIndex).key
                destroyAllCheckBox()
                gridView.model.reload()
                createCheckItem(model.get(currentIndex).key,model.get(currentIndex).value)
            }
        }

        Button {
            id:printButton
            x: 249
            /*y: 18*/
            width: 77
            anchors {
                top: parent.top
            }
            text: '打印'
            onClicked: {
                var str = new Array();
                var index = 0;
                var kaochangs = kaochangGroupBox
                var count = kaochangs.children.length;
                for(var i = 0; i < count; i++){
                    if(kaochangs.children[i].checked){
                        str.push(kaochangs.children[i].text)
                        console.debug(str[i])
                        index++;
                    }    
                }    
                console.debug(str.length)
                if( printer.setup() )
                    printer.print();
            }
        }
    }
}
