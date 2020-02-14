import QtQuick 2.7
import QtQuick.Controls 1.2
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import an.qt.KSModel 1.0
import an.qt.Printer 1.0
import "logic.js" as LG
Window{
    color:"#55aa7f"
    id:root;
    property var checklist: new Array
    ColumnLayout{
        width: root.width
        OPToolBar{
            id:toolbar
            width: root.width
            anchors.top:parent.top
        }
        RowLayout{
            GroupBox{
                title: qsTr("请选择考场号")
                ScrollView{
                    height: 300
                    ColumnLayout {
                        id:kaochangGroupBox
                    }
                }
            }
            Column{
                id:dibanPage
                anchors.top:toolbar.bottom
                anchors.horizontalCenter: parent.horizontalCenter;
                height: parent.height
                Text{
                    id:title
                    fontSizeMode: Text.Fit; minimumPixelSize: 10; font.pixelSize: 32
                    anchors.horizontalCenter: parent.horizontalCenter;
                    /*anchors.top : parent*/
                    text:"**考试**学校底板打印"
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
                        delegate: KSDelegate{}
                        model: KaoshengListModel{}
                        highlight: highlight
                        highlightFollowsCurrentItem: true
                        focus: true
                    }
                    Component.onCompleted:{
                        root.showMaximized()
                    }
                }
            }
        }
    }
    Printer {
        id: printer
        item: gridView
        antialias: false
        property int page: 1
        onPrintComplete: {
            printer.setMonochrome(0)
            if( printer.page < 1 )
            {
                // Pretend we're printing multiple pages here...
                printer.page++;
                printer.print();
            }
        }
        onPrintError: {
            console.log("Print error!");
        }

        Component.onCompleted: {
            console.log( "Sizes: " );
            //            var sz = printer.paperSizes;
            //            for( var x=0; x < sz.length; x++ )
            //                console.log(' - ' + sz[x]);

            // To use a standard size:
            printer.setPageSize( 'Letter / ANSI A' );
        }
    }
}
