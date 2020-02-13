import QtQuick 2.0

Column {
    anchors.top:toolbar.bottom
    anchors.horizontalCenter: parent.horizontalCenter;
    height: parent.height
    Text{
        id:title
        fontSizeMode: Text.Fit; minimumPixelSize: 10; font.pixelSize: 32
        anchors.horizontalCenter: parent.horizontalCenter;
        /*anchors.top : parent*/
        text:"QML"
    }
    Item{
        width: 1230;
        height : 600;
        GridView{
            id:gridView;
            verticalLayoutDirection : GridView.BottomToTop
            layoutDirection: Qt.RightToLeft
            cellWidth:200;
            cellHeight:120;
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
}
