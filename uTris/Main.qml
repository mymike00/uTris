import QtQuick 2.4
import Ubuntu.Components 1.3
import "triscript.js" as Script
import QtFeedback 5.0

/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "utris.mike"

    width: units.gu(40)
    height: units.gu(75)


    PageStack {
        id: pagestack
        onWidthChanged: row.x =  -pagestack.width

        HapticsEffect {
            id: rumbleEffect
            intensity: 0.4
            duration: 30
        }
        HapticsEffect {
            id: wrong
            intensity: 1.0
            duration: 300
            fadeIntensity: 0.0
            fadeTime: 100
        }
        Page {
            header: PageHeader {
                id: pageHeader
                title: i18n.tr("uTris")
                trailingActionBar {
                    actions: [
                        Action {
                            iconName: "reset"
                            text: i18n.tr("Reset")
                            onTriggered: Script.reset2p()
                        }
                    ]
                }
            }

            Column {
                height: pagestack.height
                width: pagestack.width
                spacing: units.gu("1")
                y: pageHeader.height+units.gu("1")

                Row {
                    anchors.horizontalCenter: parent.horizontalCenter
                    MouseArea {
                        width: img1p.width
                        height: img1p.height
                        onClicked: {section.selectedIndex = 0; rumbleEffect.start()}
                        Image {
                            id: img1p
                            source: "g1-vs-cpu.svg"
                            smooth: true;
                            height: section.height
                            width: height
                        }
                    }
                    Sections {
                        id: section
                        actions: [
                            Action {text: i18n.tr("One player"); onTriggered: Script.toOnePlayer() },
                            Action {text: i18n.tr("Two player"); onTriggered: Script.toTwoPlayers() }
                        ]
                    }
                    MouseArea {
                        width: img2p.width
                        height: img2p.height
                        onClicked: {section.selectedIndex = 1; rumbleEffect.start()}
                        Icon {
                            id: img2p
                            name: "contact-group"
                            height: section.height
                            width: height
                        }
                    }
                }

                Row {
                    id: row
                    height: pagestack.height-pageHeader.height+units.gu("1")

                    PropertyAnimation {
                        id: toTwoP
                        target: row
                        duration: 1000
                        easing.type: Easing.InOutBack
                        properties: "x"
                        to: -pagestack.width
                    }
                    PropertyAnimation {
                        id: toOneP
                        target: row
                        easing.type: Easing.InOutBack
                        properties: "x"
                        to: 0
                        duration: 1000
                    }

                    Column {
                        id: col1p
                        width: pagestack.width
                        height: parent.height
                        spacing: units.gu(2)
                        Grid {
                            id: grid1p
                            visible: false
                            spacing: pagestack.width/24
                            anchors.horizontalCenter: parent.horizontalCenter
                            columns: 3

                            Button {
                                id: pA1
                                width: height
                                height: (pagestack.width-grid1p.spacing*2-pagestack.width/6)/3
                                Image {
                                    source: ""
                                    height: parent.height*2/3
                                    width: height
                                    y: parent.height/6
                                    x: y
                                }
                            }
                            Button {
                                width: height; height: pA1.width; id: pA2
                                Image {
                                    source: ""
                                    height: parent.height*2/3
                                    width: height
                                    y: parent.height/6
                                    x: y
                                }
                            }
                            Button {
                                width: height; height: pA1.width; id: pA3
                                Image {
                                    source: ""
                                    height: parent.height*2/3
                                    width: height
                                    y: parent.height/6
                                    x: y
                                }
                            }
                            Button {
                                width: height; height: pA1.width; id: pB1
                                Image {
                                    source: ""
                                    height: parent.height*2/3
                                    width: height
                                    y: parent.height/6
                                    x: y
                                }
                            }
                            Button {
                                width: height; height: pA1.width; id: pB2
                                Image {
                                    source: ""
                                    height: parent.height*2/3
                                    width: height
                                    y: parent.height/6
                                    x: y
                                }
                            }
                            Button {
                                width: height; height: pA1.width; id: pB3
                                Image {
                                    source: ""
                                    height: parent.height*2/3
                                    width: height
                                    y: parent.height/6
                                    x: y
                                }
                            }
                            Button {
                                width: height; height: pA1.width; id: pC1
                                Image {
                                    source: ""
                                    height: parent.height*2/3
                                    width: height
                                    y: parent.height/6
                                    x: y
                                }
                            }
                            Button {
                                width: height; height: pA1.width; id: pC2
                                Image {
                                    source: ""
                                    height: parent.height*2/3
                                    width: height
                                    y: parent.height/6
                                    x: y
                                }
                            }
                            Button {
                                width: height; height: pA1.width; id: pC3
                                Image {
                                    source: ""
                                    height: parent.height*2/3
                                    width: height
                                    y: parent.height/6
                                    x: y
                                }
                            }
                        }
                        Image {
                            source: "work-in-progress.svg"
                            width: units.gu(30)
                            height: width
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        Text {
                            color: UbuntuColors.inkstone
                            text: i18n.tr("Work in progress!")
                            font.family: "Ubuntu Condensed"
                            font.bold: true
                            font.pointSize: units.gu(4)
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                    Column {
                        id: col2p
                        width: pagestack.width
                        height: parent.height
                        spacing: units.gu("2")
                        Grid {
                            id: grid2p
                            horizontalItemAlignment: Grid.AlignHCenter
                            verticalItemAlignment: Grid.AlignVCenter
                            spacing: pagestack.width/24
                            anchors.horizontalCenter: parent.horizontalCenter
                            columns: 3

                            Button {
                                id: ppA1
                                width: height
                                height: (pagestack.width-grid1p.spacing*2-pagestack.width/6)/3
                                onClicked: Script.click2p(ppA1, imgppA1, "A", 1, "DX")
                                color: UbuntuColors.blue
                                Image {
                                    id: imgppA1
                                    source: ""
                                    height: parent.height*2/3
                                    width: height
                                    y: parent.height/6
                                    x: y
                                }
                            }
                            Button {
                                width: height; height: ppA1.width; id: ppA2
                                color: UbuntuColors.blue
                                onClicked: Script.click2p(ppA2, imgppA2, "A", 2, "")
                                Image {
                                    id: imgppA2
                                    source: ""
                                    height: parent.height*2/3
                                    width: height
                                    y: parent.height/6
                                    x: y
                                }
                            }
                            Button {
                                width: height; height: ppA1.width; id: ppA3
                                color: UbuntuColors.blue
                                onClicked: Script.click2p(ppA3, imgppA3, "A", 3, "DY")
                                Image {
                                    id: imgppA3
                                    source: ""
                                    height: parent.height*2/3
                                    width: height
                                    y: parent.height/6
                                    x: y
                                }
                            }
                            Button {
                                width: height; height: ppA1.width; id: ppB1
                                color: UbuntuColors.blue
                                onClicked: Script.click2p(ppB1, imgppB1, "B", 1, "")
                                Image {
                                    id: imgppB1
                                    source: ""
                                    height: parent.height*2/3
                                    width: height
                                    y: parent.height/6
                                    x: y
                                }
                            }
                            Button {
                                width: height; height: ppA1.width; id: ppB2
                                color: UbuntuColors.blue
                                onClicked: Script.click2p(ppB2, imgppB2, "B", 2, "DX-Y")
                                Image {
                                    id: imgppB2
                                    source: ""
                                    height: parent.height*2/3
                                    width: height
                                    y: parent.height/6
                                    x: y
                                }
                            }
                            Button {
                                width: height; height: ppA1.width; id: ppB3
                                color: UbuntuColors.blue
                                onClicked: Script.click2p(ppB3, imgppB3, "B", 3, "")
                                Image {
                                    id: imgppB3
                                    source: ""
                                    height: parent.height*2/3
                                    width: height
                                    y: parent.height/6
                                    x: y
                                }
                            }
                            Button {
                                width: height; height: ppA1.width; id: ppC1
                                color: UbuntuColors.blue
                                onClicked: Script.click2p(ppC1, imgppC1, "C", 1, "DY")
                                Image {
                                    id: imgppC1
                                    source: ""
                                    height: parent.height*2/3
                                    width: height
                                    y: parent.height/6
                                    x: y
                                }
                            }
                            Button {
                                width: height; height: ppA1.width; id: ppC2
                                color: UbuntuColors.blue
                                onClicked: Script.click2p(ppC2, imgppC2, "C", 2, "")
                                Image {
                                    id: imgppC2
                                    source: ""
                                    height: parent.height*2/3
                                    width: height
                                    y: parent.height/6
                                    x: y
                                }
                            }
                            Button {
                                width: height; height: ppA1.width; id: ppC3
                                color: UbuntuColors.blue
                                onClicked: Script.click2p(ppC3, imgppC3, "C", 3, "DX")
                                Image {
                                    id: imgppC3
                                    source: ""
                                    height: parent.height*2/3
                                    width: height
                                    y: parent.height/6
                                    x: y
                                }
                            }

                            Text {text: "A: "+Script.rowA2p; id: textA }
                            Text {text: "B: "+Script.rowB2p; id: textB }
                            Text {text: "C: "+Script.rowC2p; id: textC }
                            Text {text: "1: "+Script.col12p; id: text1 }
                            Text {text: "2: "+Script.col22p; id: text2 }
                            Text {text: "3: "+Script.col32p; id: text3 }
                            Text {text: "X: "+Script.diagX2p; id: textX }
                            Text {text: "Y: "+Script.diagY2p; id: textY }
                        }

                        Label {
                            anchors.horizontalCenter: parent.horizontalCenter; id : textTurn2p
                            text: Script.turno2p === Script.turno2pEnum.P1 ? i18n.tr("It's the turn of the player 1") : i18n.tr("It's the turn of the player 2")
                        }
                        Label {
                            anchors.horizontalCenter: parent.horizontalCenter; id : textVictory2p
                        }
                    }
                }
            }
            Timer {
                id: inizTimer
                interval: 50;
                onTriggered: section.selectedIndex = 1
            }

            Component.onCompleted: {inizTimer.start()}
        }
    }
}
