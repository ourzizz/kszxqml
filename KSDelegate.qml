import QtQuick 2.7
import QtQuick.Controls 1.2
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
//import an.qt.KSModel 1.0
//import an.qt.Printer 1.0

//Component{
Rectangle{
    id:ksdelegate
    Rectangle{
        width:200;
        height:130;
        border.width:1;
        border.color:"black"
                    /*radius: 5*/
        Column{
            Row{
                topPadding:10;
                leftPadding:10;
                Image{
                    id:ksphoto
                    width:80;
                    height:100;
                    source:img;
                    transformOrigin: Item.BottomRight;
                    anchors.topMargin: 20
                    anchors.leftMargin: 20
                }
                Column{
                    spacing: 2;
                    Row{
                        Text{ text:"姓名:"; }
                        Text{ text:name; }
                    }
                    Row{
                        Text{ text:"考号:"; }
                        Text{ text:zkzh; }
                    }
                    Row{
                        Text{ text:"科目:"; }
                        Text{ text:kemu; }
                    }
                }
            }
            Row{
                topPadding:5;
                leftPadding:8;
                spacing:5
                Text{ text:"身份证:";font.bold: true }
                Text{ text:sfzid;font.bold: true }
            }
        }
        MouseArea {
            anchors.rightMargin: 0
            anchors.bottomMargin: -8
            anchors.leftMargin: 0
            anchors.topMargin: 8
            anchors.fill: parent
            onClicked: { //index是delegate的固有属性直接获取
                console.log(index)
            }
        }
    }
}
