.pragma library // Shared game state
function createCheckItem(kaochangCount){
    var i = 0
    for(i;i<kaochangCount;i++){
        var text = i + 1
        if(i<9){
            text = "0" + text
        }
        main.kaochangCheckBoxTemplate.createObject(kaochangGroupBox,{"text":text})
    }
}
function destroyAllCheckBox(){//gourpCheckbox
    var count = kaochangGroupBox.children.length;
    for(var i = 0; i < count; i++){
        kaochangs.children[i].destroy()
    }
}
