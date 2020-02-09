import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import an.qt.KSModel 1.0
Window{
    color:"red";
    id:root;
    Text{
        id:title
        /*anchors.top : parent*/
        text:"座次表打印QML实现"
    }
    Component{
        id:ksdelegate;
        Rectangle{
            width:200;
            height:160;
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
                     onClicked: gridView.currentIndex = index;
                     var data = gridView.model.get(gridView.currentIndex)
                     console.log(data.name)
                  }
            }
        }
    }
    GridView{
        anchors.top:title.bottom
        id:gridView
        cellHeight:170;
        cellWidth:205;
        anchors.fill: parent;
        delegate: ksdelegate;
        model: KaoshengListModel{
            Component.onCompleted:{
                console.log("IN");
            }
        }
        highlight: highlight
        highlightFollowsCurrentItem: false
        focus: true
    }
    Component.onCompleted:{
        root.showMaximized()
    }
}
