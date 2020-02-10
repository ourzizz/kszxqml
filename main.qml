import QtQuick 2.7
import QtQuick.Controls 1.2
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import an.qt.KSModel 1.0
import an.qt.Printer 1.0

Window{
    color:"gray";
    id:root;
    Column{
        anchors.horizontalCenter: parent.horizontalCenter;
        height: parent.height
            Text{
                id:title
                fontSizeMode: Text.Fit; minimumPixelSize: 10; font.pixelSize: 32
                anchors.horizontalCenter: parent.horizontalCenter;
                /*anchors.top : parent*/
                text:"座次表打印QML实现"
            }
        Component{
            id:ksdelegate;
            Rectangle{
                width:200;
                height:120;
                border.width:1;
                border.color:"black"
    //            radius: 5
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
                     gridView.model.get(gridView.currentIndex)
//                     var data = gridView.model.get(gridView.currentIndex)
//                     console.log(data.name)
                  }
            }
        }
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
                console.log('Page '+page+' printed.');
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
                var sz = printer.paperSizes;
                for( var x=0; x < sz.length; x++ )
                    console.log(' - ' + sz[x]);

                // To use a standard size:
                printer.setPageSize( 'Letter / ANSI A' );

                // Or custom:
    //             printer.setPageSize( 640, 480, Printer.DevicePixel );
                // Valid "units" are Millimeter, Point, Inch, Pica, Didot, Cicero, and DevicePixel.
                // These are resolution dependent (except DevicePixel) so I suggest having your resolution configured in advance.
            }
        }

    Button {
        anchors {
            top: parent.top
            left: parent.left
            margins: 5
        }
        text: 'Print'
        onClicked: {
            if( printer.setup() )
                printer.print();
//            printer.saveImage("test.png", 'png', 100);
        }
    }



}
