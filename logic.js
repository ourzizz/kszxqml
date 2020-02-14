.pragma library // Shared game state
var component
function createCheckItem(parentItem,schoolName,kaochangCount){
    var i = 0
    for(i;i<kaochangCount;i++){
        var text = i + 1
        if(i<9){
            text = "0" + text
        }
    Qt.createQmlObject('import QtQuick 2.0;import QtQuick.Controls 1.4;CheckBox {text:"'
                       +text
                       +'";onClicked:{gridView.model.get("'
                       + schoolName
                       + '",'
                       +text
                       +')}}', parentItem);
////			    gridView.model.get("毕节一中",text)
//        Qt.createQmlObject('import QtQuick 2.0; CheckBox {text: "01"}', parentItem);
//        kaochangCheckBoxTemplate.createObject(kaochangGroupBox,{"text":text}
    }
}
function destroyAllCheckBox(kaochangGroupBox){//gourpCheckbox
    var count = kaochangGroupBox.children.length;
    for(var i = 0; i < count; i++){
        kaochangGroupBox.children[i].destroy()
    }
}
