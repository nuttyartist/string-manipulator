import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Universal

Window {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("String Manipulator")
    color: root.theme === "Dark" ? "black" : "white"

    property string theme: "Light"
    property var charsArray: text1.text.split("")


    Text {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: 5
        anchors.leftMargin: 5
        text: root.theme
        color: root.theme === "Dark" ? "white" : "black"

        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor

            onClicked: {
                root.theme = root.theme === "Dark" ? "Light" : "Dark"
            }
        }
    }

    Column {
        anchors.fill: parent
        spacing: 15

        Item {
            width: 1
            height: 5
        }

        RowLayout {
            spacing: 10
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                text: "Enter text:"
                Layout.alignment: Qt.AlignVCenter
                color: root.theme === "Dark" ? "white" : "black"
            }

            TextArea {
                id: text1
                text: "Hello, World!"
                textFormat: TextEdit.PlainText
                Layout.alignment: Qt.AlignVCenter
                color: root.theme === "Dark" ? "white" : "black"
                background: Rectangle {
                    color: "transparent"
                    border.color: "lightblue"
                    border.width: 1
                }
            }
        }

        ScrollView {
            height: root.height - y

            GridLayout {
                columns: root.width / (35 + columnSpacing)
                columnSpacing: 5

                Repeater {
                    model: charsArray
                    delegate: Rectangle {
                        width: 35
                        height: 42
                        color: "transparent"

                        Rectangle {
                            anchors.top: parent.top
                            anchors.horizontalCenter: parent.horizontalCenter
                            width: 35
                            height: 25
                            color: root.theme === "Dark" ? "black" : "white"
                            border.color: root.theme === "Dark" ? "white" : "black"
                            border.width: 1

                            Text {
                                anchors.centerIn: parent
                                text: modelData
                                color: root.theme === "Dark" ? "white" : "black"
                            }
                        }

                        Text {
                            anchors.bottom: parent.bottom
                            anchors.horizontalCenter: parent.horizontalCenter
                            text: model.index
                            font.pointSize: 10
                            color: root.theme === "Dark" ? "yellow" : "green"
                        }
                    }
                }
            }
        }
    }
}
