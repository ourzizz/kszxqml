import QtQuick 2.7
import QtQuick.Controls 1.2
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import an.qt.KSModel 1.0
import an.qt.Printer 1.0

Component{
    id:ksdelegate
    Rectangle{
        width:200;
        height:120;
        border.width:1;
        border.color:"black"
          radius: 5
        Row{
            topPadding:10;
            leftPadding:10;
            Image{
                width:80;
                height:100;
                source:img;
                transformOrigin: Item.BottomRight;
                anchors.topMargin: 20
                anchors.leftMargin: 20
            }
            ColumnLayout{
                spacing: 2;
                Row{
                    Text{ text:"姓名:"; }
                    Text{ text:name; }
                }
                Row{
                    Text{ text:"年龄:"; }
                    Text{ text:age; }
                }
            }
        }
        MouseArea {
              anchors.fill: parent
              onClicked: {
//                 onClicked: gridView.currentIndex = index;
                 console.log(index)
                 gridView.model.get("毕节一中",index)//调用kaoshengModel的get刷新数据
                 console.log(gridView.model[index].name)
          }
        }
    }
}
