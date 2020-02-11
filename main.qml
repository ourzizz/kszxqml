import QtQuick 2.7
import QtQuick.Controls 1.2
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import an.qt.KSModel 1.0
import an.qt.Printer 1.0

Window{
    color:"#55aa7f"
    id:root;
    KSDelegate{
        id:ksdelegate
    }
    OPToolBar{
        id:toolbar
//        width: parent.width
        anchors.top:parent.top
        Component.onCompleted:{
            console.log("toolbar");
        }
    }
    Column{
        anchors.top:toolbar.bottom
        anchors.horizontalCenter: parent.horizontalCenter;
        height: parent.height
        Text{
            id:title
            fontSizeMode: Text.Fit; minimumPixelSize: 10; font.pixelSize: 32
            anchors.horizontalCenter: parent.horizontalCenter;
            /*anchors.top : parent*/
            text:"座次表打印QML"
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
