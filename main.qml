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
    property string schoolName:"";
    property string kaochangId:"";
    property var checklist: new Array
    ColumnLayout{
        width: root.width
        ToolBar{
            width:50
            OPToolBar{
                id:toolbar
                width: root.width
                anchors.top:parent.top
            }
        }
        RowLayout{
            width:Layout.fillWidth
            x:0
            Layout.alignment: Qt.AlignLeft
            spacing: 10
            Rectangle{
                id:leftBox
                y:40
                width: 120
                anchors.top:dibanBox.top
                height: root.height - toolbar.height - 100
                ScrollView{
                    width: 100
                    height: parent.height
                    ColumnLayout {
                        id:kaochangGroupBox
                    }
                }
            }
            Rectangle{
                id:dibanBox
                width: 1230;
                height : 690;
                border.width: 1
                color:qsTr("white")
                Text{
                    id:title
                    fontSizeMode: Text.Fit; minimumPixelSize: 10; font.pixelSize: 32
                    anchors.horizontalCenter: parent.horizontalCenter;
                    /*anchors.top : parent*/
                    text:root.schoolName + "学校第" + root.kaochangId + "考场座次表"
                }
                GridView{
                    id:gridView;
                    anchors.top:title.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    verticalLayoutDirection : GridView.BottomToTop
                    layoutDirection: Qt.RightToLeft
                    cellWidth:200;
                    cellHeight:130;
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
    Printer {
        id: printer
        item: dibanBox
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
            //            var sz = printer.paperSizes;//testgit
            //            for( var x=0; x < sz.length; x++ )
            //                console.log(' - ' + sz[x]);

            // To use a standard size:
            printer.setPageSize( 'Letter / ANSI A' );
        }
    }
}
