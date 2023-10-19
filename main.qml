import QtQuick 2.9
import QtQuick.Window 2.12
import QtCharts 2.3

//Module crée pour gerer les bases de données
import com.databaseVisiteur 1.0
import com.databaseSite 1.0
import com.databaseVisite 1.0

//importation des fonctions
import "qrc:/fonction.js" as Fonction


//DEFINITION DE L'INTERFACE
Window {
    id: root
    width: 900
    height: 600
    visible: true
    title: qsTr("Gestion de Visites")
    color: backgroundColor
    //LES MODULES QUI GERENT LES BD
    DataVisiteur{
        id: datavisiteur
    }
    DataSite{
        id: datasite
    }
    DataVisite{
        id: datavisite
    }

    //Definiton variables
    property int mode: 0
    property int choix: 0
    property int a_modifier: 0
    property int a_modifier1: 0
    property int a_supprimer: 0
    property int a_supprimer1: 0
    property int alterner: 0
    property string hoverColor: "#DF5656"
    property string backgroundColor: "#272428"
    property string darkerBackgrounColor: "#020210"
    property string input: "#242633"
    property string listColor: "#322e3b"
    property string white: "#EEEEEE"
    property string black: "#212121"
    property string gray: "#9E9E9E"

    //INITIALISATION DE L'Application

    //LA BARRE LATERALE
    Rectangle{
        anchors.left: parent.left
        height: parent.height
        width: parent.width * 0.2
        color: "transparent"
        Image {
            anchors.fill: parent
            source: "qrc:/Media/fond2.png"
        }

        //BARRE DES MENUS
        Column{
            id: menu
            anchors.top: parent.top
            anchors.topMargin: 40
            height: parent.height * 0.3
            width: parent.width

            Rectangle{
                id: menu_choix_1
                color: "transparent"
                width: parent.width
                height: parent.height * 0.3
                radius: 30
                anchors.left: parent.left
                anchors.leftMargin: 25
                MouseArea{
                    id: menu_choix_1_mouse
                    anchors.fill: parent
                    hoverEnabled: true
                    onHoveredChanged: if (containsMouse){
                                          opt1.font.pixelSize = 16
                                      }
                                       else{
                                          opt1.font.pixelSize = 15
                                      }
                    onClicked: {
                        Fonction.choix1()
                    }
                }
                Text {
                    id: opt1
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 50
                    font.pixelSize: 15
                    text: qsTr("• Visiteurs")
                    color: white
                    Behavior on font.pixelSize {
                        NumberAnimation{
                            duration: 100
                        }
                    }

                }
            }
            Rectangle{
                id: menu_choix_2
                color: "transparent"
                width: parent.width
                height: parent.height * 0.3
                radius: 30
                anchors.left: parent.left
                anchors.leftMargin: 25
                MouseArea{
                    id: menu_choix_2_mouse
                    anchors.fill: parent
                    hoverEnabled: true
                    onHoveredChanged: if (containsMouse){
                                          opt2.font.pixelSize = 16
                                      }
                                       else{
                                          opt2.font.pixelSize = 15
                                      }
                    onClicked: {
                        Fonction.choix2()
                    }
                }
                Text {
                    id: opt2
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 50
                    font.pixelSize: 15
                    text: qsTr("• Sites")
                    color: "white"
                    Behavior on font.pixelSize {
                        NumberAnimation{
                            duration: 100
                        }
                    }

                }
            }
            Rectangle{
                id: menu_choix_3
                color: "transparent"
                width: parent.width
                height: parent.height * 0.3
                radius: 30
                anchors.left: parent.left
                anchors.leftMargin: 25
                MouseArea{
                    id: menu_choix_3_mouse
                    anchors.fill: parent
                    hoverEnabled: true
                    onHoveredChanged: if (containsMouse){
                                          opt3.font.pixelSize = 16
                                      }
                                       else{
                                          opt3.font.pixelSize = 15
                                      }
                    onClicked: {
                        Fonction.choix3()
                    }
                }
                Text {
                    id: opt3
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 50
                    font.pixelSize: 15
                    text: qsTr("• Visites")
                    color: "white"
                    Behavior on font.pixelSize {
                        NumberAnimation{
                            duration: 100
                        }
                    }

                }
            }

        }

        //LA BARRE DES SOUS-MENUS

        Rectangle{
            id: sous_menu
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            height: parent.height * 0.4
            width: parent.width
            color: "transparent"

            Column{
                anchors.fill: parent

                Rectangle{
                    id: sous_menu_choix_1
                    color: "transparent"
                    width: parent.width
                    height: parent.height * 0.4
                    enabled: false

                    MouseArea{
                        anchors.fill: parent

                        hoverEnabled: true
                        onHoveredChanged: if (containsMouse){
                                              visiteur_opt_1.color = hoverColor
                                          }
                                           else{
                                              visiteur_opt_1.color = gray
                                          }
                        onClicked: {
                            Fonction.creation_fichier()
                            Fonction.reset()
                        }
                    }
                    Text {
                        id: visiteur_opt_1
                        anchors.centerIn: parent
                        font.pixelSize: 13
                        text: qsTr("○ Nouveau fichier ○")
                        color: gray
                        Behavior on font.pixelSize {
                            NumberAnimation{
                                duration: 100
                            }
                        }

                    }
                }
            }
        }
    }


    //CONTENU
    Rectangle{
        id: contenu
        height: parent.height
        width: parent.width * 0.8
        anchors.right: parent.right
        color: white
        focus: true
        Shortcut{
            sequence: "Ctrl+1"
            onActivated: {
                Fonction.choix1()
            }
        }
        Shortcut{
            sequence: "Ctrl+2"
            onActivated: {
                Fonction.choix2()
            }
        }
        Shortcut{
            sequence: "Ctrl+3"
            onActivated: {
                Fonction.choix3()
            }
        }

        Rectangle{
             visible: false
             enabled: false
             id: visiteur
             anchors.fill: parent
             color: white
             Rectangle{
                 anchors.bottom: parent.bottom
                 anchors.right: parent.right
                 anchors.bottomMargin: 40
                 anchors.rightMargin: 40
                 width: 50
                 z: 200
                 height: 50
                 color: "transparent"
                 Image {
                     anchors.fill: parent
                     source: "qrc:/Media/plus.png"
                 }
                 MouseArea{
                     anchors.fill: parent
                     onClicked: {
                        Fonction.ajout()
                     }
                 }
             }
             Rectangle{
                 width: contenu.width * 0.9
                 color: "transparent"
                 height: 120
                 anchors.horizontalCenter: parent.horizontalCenter
                 anchors.top: parent.top

                 Rectangle{
                     width: parent.width
                     anchors.top: parent.top
                     color: "transparent"
                     height: 50
                     Text{
                         anchors.bottom: visiteurLabelSite.top
                         anchors.bottomMargin: 5
                         color: gray
                         text: qsTr("Site à visiter")
                         anchors.horizontalCenter: visiteurLabelSite.horizontalCenter
                     }
                     Text{
                         anchors.bottom: visiteurLabelDate.top
                         anchors.bottomMargin: 5
                         color: gray
                         text: qsTr("Date de visite")
                         anchors.horizontalCenter: visiteurLabelDate.horizontalCenter
                     }

                     Rectangle{
                         color: "white"
                         radius: 7
                         border.width: 1
                         border.color: backgroundColor
                         anchors.bottom: parent.bottom
                         id: visiteurLabelSite
                         width: parent.width * 0.3
                         height: 20
                         anchors.left: parent.left
                         MouseArea{
                             anchors.fill: parent
                             onClicked: {
                                 visiteurSite.focus = true
                             }
                         }

                         TextInput {
                             id: visiteurSite
                             anchors.centerIn: parent
                             color: black
                             onTextChanged: {
                                 Fonction.searchVisiteur()
                             }
                         }

                     }

                     Rectangle{
                         color: "transparent"
                         id: visiteurLabelDate
                         width: parent.width * 0.3
                         anchors.left: parent.left
                         anchors.bottom: parent.bottom
                         anchors.leftMargin: 0.6 * parent.width
                         height: 20
                         Text {
                             color: gray
                             text: qsTr("à")
                             anchors.centerIn: parent
                         }

                         Rectangle{
                             anchors.left: parent.left
                             width: visiteurLabelDate.width * 0.4
                             height: 20
                             radius: 7
                             color: "white"
                             border.width: 1
                             border.color: backgroundColor
                             MouseArea{
                                 anchors.fill: parent
                                 onClicked: {
                                     visiteurDateDepart.focus = true
                                 }
                             }

                             TextInput {
                                 id: visiteurDateDepart
                                 anchors.centerIn: parent
                                 color: "Black"
                                 onTextChanged: {
                                     Fonction.searchVisiteur()
                                 }
                             }
                         }
                         Rectangle{
                             anchors.left: parent.left
                             anchors.leftMargin: parent.width * 0.6
                             width: visiteurLabelDate.width * 0.4
                             height: 20
                             radius: 7
                             color: "white"
                             border.width: 1
                             border.color: backgroundColor
                             MouseArea{
                                 anchors.fill: parent
                                 onClicked: {
                                     visiteurDateArrivee.focus = true
                                 }
                             }

                             TextInput {
                                 id: visiteurDateArrivee
                                 anchors.centerIn: parent
                                 color: "Black"
                                 onTextChanged: {
                                     Fonction.searchVisiteur()
                                 }
                             }
                         }


                     }

                 }

                 Rectangle{
                     color: "transparent"
                     width: parent.width
                     anchors.horizontalCenter: parent.horizontalCenter
                     anchors.bottom: parent.bottom
                     Rectangle{
                         color: "transparent"
                         id: visiteurLabel
                         width: parent.width
                         anchors.bottom: visiteurInput.top
                         anchors.bottomMargin: 25
                         height: 20
                         Rectangle{
                             anchors.left: parent.left
                             anchors.bottom: parent.bottom
                             id: visiteurLabelNum
                             width: parent.width * 0.1
                             height: 20
                             color: "transparent"
                             Text {
                                 anchors.centerIn: parent
                                 text: qsTr("ID")
                                 color: gray
                             }
                         }
                         Rectangle{
                             anchors.bottom: parent.bottom
                             anchors.left: visiteurLabelNum.right
                             id: visiteurLabelNom
                             width: parent.width * 0.4
                             height: 20
                             color: "transparent"
                             Text {
                                 anchors.centerIn: parent
                                 text: qsTr("Nom")
                                 color: gray
                             }
                         }
                         Rectangle{
                             anchors.bottom: parent.bottom
                             anchors.left: visiteurLabelNom.right
                             width: parent.width * 0.2
                             color: "transparent"
                             id: visiteurLabelLieu
                             height: 20
                             Text {
                                 anchors.centerIn: parent
                                 text: qsTr("Adresse")
                                 color: gray
                             }
                         }
                         Rectangle{
                             anchors.bottom: parent.bottom
                             anchors.left: visiteurLabelLieu.right
                             id: visiteurLabelProvenance
                             width: parent.width * 0.2
                             color: "transparent"
                             height: 20
                             Text {
                                 anchors.centerIn: parent
                                 text: qsTr("Provenance")
                                 color: gray
                             }
                         }
                     }
                     Rectangle{
                         color: "transparent"
                         id: visiteurInput
                         width: parent.width
                         Rectangle{
                             anchors.left: parent.left
                             anchors.bottom: parent.bottom
                             anchors.margins: 2
                             id: visiteurLabel2Num
                             width: parent.width * 0.09
                             height: 25
                             color: "white"
                             border.width: 1
                             radius: 10
                             border.color: backgroundColor
                             MouseArea{
                                 anchors.fill: parent
                                 onClicked: {
                                     visiteurNum.focus = true
                                 }
                             }

                             TextInput {
                                 id: visiteurNum
                                 anchors.centerIn: parent
                                 color: "Black"
                                 onTextChanged: {
                                     Fonction.searchVisiteur()
                                 }
                             }
                         }
                         Rectangle{
                             anchors.bottom: parent.bottom
                             anchors.left: visiteurLabel2Num.right
                             anchors.margins: 2
                             id: visiteurLabel2Nom
                             width: parent.width * 0.4
                             height: 25
                             color: "white"
                             border.width: 1
                             radius: 10
                             border.color: backgroundColor
                             MouseArea{
                                 anchors.fill: parent
                                 onClicked: {
                                     visiteurNom.focus = true
                                 }
                             }
                             TextInput {
                                 id: visiteurNom
                                 anchors.centerIn: parent
                                 color: "Black"
                                 onTextChanged: {
                                     Fonction.searchVisiteur()
                                 }
                             }
                         }
                         Rectangle{
                             anchors.bottom: parent.bottom
                             anchors.left: visiteurLabel2Nom.right
                             width: parent.width * 0.2
                             color: "white"
                             id: visiteurLabel2Lieu
                             height: 25
                             border.width: 1
                             anchors.margins: 2
                             radius: 10
                             border.color: backgroundColor
                             MouseArea{
                                 anchors.fill: parent
                                 onClicked: {
                                     visiteurLieu.focus = true
                                 }
                             }
                             TextInput {
                                 id: visiteurLieu
                                 anchors.centerIn: parent
                                 color: "Black"
                                 onTextChanged: {
                                     Fonction.searchVisiteur()
                                 }
                             }
                         }
                         Rectangle{
                             anchors.bottom: parent.bottom
                             anchors.left: visiteurLabel2Lieu.right
                             id: visiteurLabel2Provenance
                             anchors.margins: 2
                             width: parent.width * 0.2
                             color: "white"
                             height: 25
                             border.width: 1
                             radius: 10
                             border.color: backgroundColor

                             MouseArea{
                                 anchors.fill: parent
                                 onClicked: {
                                     visiteurProvenance.focus = true
                                 }
                             }
                             TextInput {
                                 id: visiteurProvenance
                                 anchors.centerIn: parent
                                 color: "Black"
                                 onTextChanged: {
                                     Fonction.searchVisiteur()
                                 }
                             }
                         }
                     }
                 }
             }

             ListView {
                        id: listView
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top
                        anchors.topMargin: 200
                        width: contenu.width * 0.9
                        model: listVisiteur
                        height: contenu.height - 200

                        delegate: Row {
                            width: parent.width
                            Rectangle {
                                color: listColor
                                width: listView.width * 0.1
                                height: 50
                                border.color: white
                                border.width: 2
                                radius: 10

                                Text {
                                    color: "white"
                                    anchors.centerIn: parent
                                    text: model.numVisiteur
                                }
                            }

                            Rectangle {
                                color: listColor
                                width: listView.width * 0.40
                                height: 50
                                border.color: white
                                border.width: 2
                                radius: 10
                                Text {
                                    color: "white"
                                    anchors.centerIn: parent
                                    text: model.nom
                                }
                            }
                            Rectangle {
                                color: listColor
                                width: listView.width * 0.2
                                height: 50
                                border.color: white
                                border.width: 2
                                radius: 10
                                Text {
                                    color: "white"
                                    anchors.centerIn: parent
                                    text: model.adresse
                                }
                            }
                            Rectangle {
                                color: listColor
                                width: listView.width * 0.2
                                height: 50
                                border.color: white
                                border.width: 2
                                radius: 10
                                Text {
                                    color: "white"
                                    anchors.centerIn: parent
                                    text: model.provenance
                                }
                            }
                            Rectangle{
                                width: listView.width * 0.05
                                height: 50
                                opacity: 0.5
                                color: "transparent"
                                border.width: 2
                                border.color: white
                                visible: true
                                Image {
                                    visible: true
                                    height: 15
                                    width: 15
                                    anchors.centerIn: parent
                                    source: "qrc:/Media/pencil-7-svgrepo-com.svg"
                                }
                                MouseArea{
                                    anchors.fill: parent
                                    onClicked: {
                                        root.a_modifier = parent.parent.children[0].children[0].text
                                        Fonction.modifie()
                                        modifier_input_1.text = parent.parent.children[1].children[0].text
                                        modifier_input_2.text = parent.parent.children[2].children[0].text
                                        modifier_input_3.text = parent.parent.children[3].children[0].text
                                    }
                                }
                            }
                            Rectangle{
                                width: listView.width * 0.1
                                height: 50
                                color: "transparent"
                                border.width: 2
                                border.color: white
                                opacity: 0.5
                                visible: true
                                Image {
                                    visible: true
                                    height: 15
                                    width: 15
                                    anchors.centerIn: parent
                                    source: "qrc:/Media/edit-delete-svgrepo-com.svg"
                                }
                                MouseArea{
                                    anchors.fill: parent
                                    onClicked: {
                                        root.a_supprimer =  parent.parent.children[0].children[0].text
                                        root.mode = 3
                                        Fonction.popUpShow("Voulez-vous supprimer ce Visiteur?")
                                    }
                                }
                            }
                        }
                    }


         }

        Rectangle{
             visible: false
             enabled: false
             id: site
             anchors.fill: parent
             color: backgroundColor
             Rectangle{
                 id: list
                 z: 50
                 width: parent.width
                 height: parent.height - 30
                 anchors.top: parent.top
                 anchors.topMargin: 30
                 color: white
                 Rectangle{
                     z: 200
                     width: parent.width / 2
                     height: 60
                     anchors.bottom: parent.top
                     anchors.bottomMargin: -20
                     anchors.left: parent.left
                     color: white
                     Text {
                         id: list_bouton
                         anchors.centerIn: parent
                         color: black
                         text: qsTr("Liste des Visites")
                     }
                     MouseArea{
                         anchors.fill: parent
                         onClicked: {
                             list.z = 50
                             statistique.z = 30
                             list_bouton.color = backgroundColor
                             list_bouton.parent.color = white
                             statistique_bouton.color = white
                             statistique_bouton.parent.color = backgroundColor
                             graphe.clear()
                             listSite.setupModel("SELECT * FROM Sites")
                             Fonction.reset()
                         }
                     }
                 }

                 Rectangle{
                     anchors.bottom: parent.bottom
                     anchors.right: parent.right
                     anchors.bottomMargin: 40
                     anchors.rightMargin: 40
                     width: 50
                     z: 200
                     height: 50
                     color: "transparent"
                     Image {
                         anchors.fill: parent
                         source: "qrc:/Media/plus.png"
                     }
                     MouseArea{
                         anchors.fill: parent
                         onClicked: {
                            Fonction.ajout()
                         }
                     }
                 }
                 Rectangle{
                     width: contenu.width * 0.9
                     color: "transparent"
                     height: 120
                     anchors.horizontalCenter: parent.horizontalCenter
                     anchors.top: parent.top
                     anchors.topMargin: 20

                     Rectangle{
                         width: parent.width
                         anchors.top: parent.top
                         color: "transparent"
                         height: 50
                         Text{
                             anchors.bottom: siteLabelSite.top
                             anchors.bottomMargin: 5
                             color: gray
                             text: qsTr("Visiteur")
                             anchors.horizontalCenter: siteLabelSite.horizontalCenter
                         }
                         Text{
                             anchors.bottom: siteLabelDate.top
                             anchors.bottomMargin: 5
                             color: gray
                             text: qsTr("Date de visite")
                             anchors.horizontalCenter: siteLabelDate.horizontalCenter
                         }

                         Rectangle{
                             color: "white"
                             radius: 7
                             border.width: 1
                             border.color: backgroundColor
                             anchors.bottom: parent.bottom
                             id: siteLabelSite
                             width: parent.width * 0.3
                             height: 20
                             anchors.left: parent.left
                             MouseArea{
                                 anchors.fill: parent
                                 onClicked: {
                                     siteSite.focus = true
                                 }
                             }

                             TextInput {
                                 id: siteSite
                                 anchors.centerIn: parent
                                 color: black
                                 onTextChanged: {
                                     Fonction.searchSite()
                                 }
                             }

                         }

                         Rectangle{
                             color: "transparent"
                             id: siteLabelDate
                             width: parent.width * 0.3
                             anchors.left: parent.left
                             anchors.bottom: parent.bottom
                             anchors.leftMargin: 0.6 * parent.width
                             height: 20
                             Text {
                                 color: gray
                                 text: qsTr("à")
                                 anchors.centerIn: parent
                             }

                             Rectangle{
                                 anchors.left: parent.left
                                 width: siteLabelDate.width * 0.4
                                 height: 20
                                 radius: 7
                                 color: "white"
                                 border.width: 1
                                 border.color: backgroundColor
                                 MouseArea{
                                     anchors.fill: parent
                                     onClicked: {
                                         siteDateDepart.focus = true
                                     }
                                 }

                                 TextInput {
                                     id: siteDateDepart
                                     anchors.centerIn: parent
                                     color: "Black"
                                     onTextChanged: {
                                         Fonction.searchSite()
                                     }
                                 }
                             }
                             Rectangle{
                                 anchors.left: parent.left
                                 anchors.leftMargin: parent.width * 0.6
                                 width: siteLabelDate.width * 0.4
                                 height: 20
                                 radius: 7
                                 color: "white"
                                 border.width: 1
                                 border.color: backgroundColor
                                 MouseArea{
                                     anchors.fill: parent
                                     onClicked: {
                                         siteDateArrivee.focus = true
                                     }
                                 }

                                 TextInput {
                                     id: siteDateArrivee
                                     anchors.centerIn: parent
                                     color: "Black"
                                     onTextChanged: {
                                         Fonction.searchSite()
                                     }
                                 }
                             }


                         }

                     }

                     Rectangle{
                         color: "transparent"
                         width: parent.width
                         anchors.horizontalCenter: parent.horizontalCenter
                         anchors.bottom: parent.bottom
                         Rectangle{
                             color: "transparent"
                             id: siteLabel
                             width: parent.width
                             anchors.bottom: siteInput.top
                             anchors.bottomMargin: 25
                             height: 20
                             Rectangle{
                                 anchors.left: parent.left
                                 anchors.bottom: parent.bottom
                                 id: siteLabelNum
                                 width: parent.width * 0.1
                                 height: 20
                                 color: "transparent"
                                 Text {
                                     anchors.centerIn: parent
                                     text: qsTr("ID")
                                     color: gray
                                 }
                             }
                             Rectangle{
                                 anchors.bottom: parent.bottom
                                 anchors.left: siteLabelNum.right
                                 id: siteLabelNom
                                 width: parent.width * 0.4
                                 height: 20
                                 color: "transparent"
                                 Text {
                                     anchors.centerIn: parent
                                     text: qsTr("Nom")
                                     color: gray
                                 }
                             }
                             Rectangle{
                                 anchors.bottom: parent.bottom
                                 anchors.left: siteLabelNom.right
                                 width: parent.width * 0.2
                                 color: "transparent"
                                 id: siteLabelLieu
                                 height: 20
                                 Text {
                                     anchors.centerIn: parent
                                     text: qsTr("Lieu")
                                     color: gray
                                 }
                             }
                             Rectangle{
                                 anchors.bottom: parent.bottom
                                 anchors.left: siteLabelLieu.right
                                 id: siteLabelProvenance
                                 width: parent.width * 0.2
                                 color: "transparent"
                                 height: 20
                                 Text {
                                     anchors.centerIn: parent
                                     text: qsTr("Tarif")
                                     color: gray
                                 }
                             }
                         }
                         Rectangle{
                             color: "transparent"
                             id: siteInput
                             width: parent.width
                             Rectangle{
                                 anchors.left: parent.left
                                 anchors.bottom: parent.bottom
                                 anchors.margins: 2
                                 id: siteLabel2Num
                                 width: parent.width * 0.09
                                 height: 25
                                 color: "white"
                                 border.width: 1
                                 radius: 10
                                 border.color: backgroundColor
                                 MouseArea{
                                     anchors.fill: parent
                                     onClicked: {
                                         siteNum.focus = true
                                     }
                                 }

                                 TextInput {
                                     id: siteNum
                                     anchors.centerIn: parent
                                     color: "Black"
                                     onTextChanged: {
                                         Fonction.searchSite()
                                     }
                                 }
                             }
                             Rectangle{
                                 anchors.bottom: parent.bottom
                                 anchors.left: siteLabel2Num.right
                                 anchors.margins: 2
                                 id: siteLabel2Nom
                                 width: parent.width * 0.4
                                 height: 25
                                 color: "white"
                                 border.width: 1
                                 radius: 10
                                 border.color: backgroundColor
                                 MouseArea{
                                     anchors.fill: parent
                                     onClicked: {
                                         siteNom.focus = true
                                     }
                                 }
                                 TextInput {
                                     id: siteNom
                                     anchors.centerIn: parent
                                     color: "Black"
                                     onTextChanged: {
                                         Fonction.searchSite()
                                     }
                                 }
                             }
                             Rectangle{
                                 anchors.bottom: parent.bottom
                                 anchors.left: siteLabel2Nom.right
                                 width: parent.width * 0.2
                                 color: "white"
                                 id: siteLabel2Lieu
                                 height: 25
                                 border.width: 1
                                 anchors.margins: 2
                                 radius: 10
                                 border.color: backgroundColor
                                 MouseArea{
                                     anchors.fill: parent
                                     onClicked: {
                                         siteLieu.focus = true
                                     }
                                 }
                                 TextInput {
                                     id: siteLieu
                                     anchors.centerIn: parent
                                     color: "Black"
                                     onTextChanged: {
                                         Fonction.searchSite()
                                     }
                                 }
                             }
                             Rectangle{
                                 anchors.bottom: parent.bottom
                                 anchors.left: siteLabel2Lieu.right
                                 id: siteLabel2Provenance
                                 anchors.margins: 2
                                 width: parent.width * 0.2
                                 color: "white"
                                 height: 25
                                 border.width: 1
                                 radius: 10
                                 border.color: backgroundColor

                                 MouseArea{
                                     anchors.fill: parent
                                     onClicked: {
                                         siteProvenance.focus = true
                                     }
                                 }
                                 TextInput {
                                     id: siteProvenance
                                     anchors.centerIn: parent
                                     color: "Black"
                                     onTextChanged: {
                                         Fonction.searchSite()
                                     }
                                 }
                             }
                         }
                     }
                 }

                 ListView {
                            id: listView2
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.top: parent.top
                            anchors.topMargin: 200
                            width: contenu.width * 0.9
                            model: listSite
                            height: contenu.height - 200

                            delegate: Row {
                                width: parent.width
                                Rectangle {
                                    color: listColor
                                    width: listView.width * 0.1
                                    height: 50
                                    border.color: white
                                    border.width: 2
                                    radius: 10

                                    Text {
                                        color: "white"
                                        anchors.centerIn: parent
                                        text: model.numSite
                                    }
                                }

                                Rectangle {
                                    color: listColor
                                    width: listView.width * 0.40
                                    height: 50
                                    border.color: white
                                    border.width: 2
                                    radius: 10
                                    Text {
                                        color: "white"
                                        anchors.centerIn: parent
                                        text: model.nom
                                    }
                                }
                                Rectangle {
                                    color: listColor
                                    width: listView.width * 0.2
                                    height: 50
                                    border.color: white
                                    border.width: 2
                                    radius: 10
                                    Text {
                                        color: "white"
                                        anchors.centerIn: parent
                                        text: model.lieu
                                    }
                                }
                                Rectangle {
                                    color: listColor
                                    width: listView.width * 0.2
                                    height: 50
                                    border.color: white
                                    border.width: 2
                                    radius: 10
                                    Text {
                                        color: "white"
                                        anchors.centerIn: parent
                                        text: model.tarif
                                    }
                                }
                                Rectangle{
                                    width: listView.width * 0.05
                                    height: 50
                                    opacity: 0.5
                                    color: "transparent"
                                    border.width: 2
                                    border.color: white
                                    visible: true
                                    Image {
                                        visible: true
                                        height: 15
                                        width: 15
                                        anchors.centerIn: parent
                                        source: "qrc:/Media/pencil-7-svgrepo-com.svg"
                                    }
                                    MouseArea{
                                        anchors.fill: parent
                                        onClicked: {
                                            root.a_modifier = parent.parent.children[0].children[0].text
                                            modifier_input_1.text = parent.parent.children[1].children[0].text
                                            modifier_input_2.text = parent.parent.children[2].children[0].text
                                            modifier_input_3.text = parent.parent.children[3].children[0].text

                                            Fonction.modifie()
                                        }
                                    }
                                }
                                Rectangle{
                                    width: listView.width * 0.1
                                    height: 50
                                    color: "transparent"
                                    border.width: 2
                                    border.color: white
                                    opacity: 0.5
                                    visible: true
                                    Image {
                                        visible: true
                                        height: 15
                                        width: 15
                                        anchors.centerIn: parent
                                        source: "qrc:/Media/edit-delete-svgrepo-com.svg"
                                    }
                                    MouseArea{
                                        anchors.fill: parent
                                        onClicked: {
                                            root.a_supprimer =  parent.parent.children[0].children[0].text
                                            root.mode = 6
                                            Fonction.popUpShow("Voulez-vous supprimer ce Site?")
                                        }
                                    }
                                }
                            }
                        }

             }
             Rectangle{
                 id: statistique
                 z: 30
                 width: parent.width
                 height: parent.height - 30
                 anchors.top: parent.top
                 anchors.topMargin: 30
                 color: white
                 Rectangle{
                     z: 200
                     width: parent.width / 2
                     height: 60
                     anchors.bottom: parent.top
                     anchors.bottomMargin: -20
                     anchors.right: parent.right
                     color: black

                     Text {
                         id: statistique_bouton
                         anchors.centerIn: parent
                         color: white
                         text: qsTr("Statistiques")
                     }
                     MouseArea{
                         anchors.fill: parent
                         onClicked: {
                             list.z = 30
                             statistique.z = 50
                             list_bouton.color = white
                             list_bouton.parent.color = backgroundColor
                             statistique_bouton.color = backgroundColor
                             statistique_bouton.parent.color = white
                             graphe.clear()
                             InfoSite.setupModel("SELECT Sites.nom AS a, COUNT (Visiteurs.numVisiteur) AS b, SUM(Sites.tarif * Visites.jour) AS c FROM Sites JOIN Visites ON Sites.numSite = Visites.numSite JOIN Visiteurs ON Visiteurs.numVisiteur = Visites.numVisiteur GROUP BY Sites.nom")
                             Fonction.reset()
                         }
                     }
                 }
                 Rectangle{
                     id: graphe_conteneur
                     width: parent.width
                     height: 500
                     z: 20
                     color: backgroundColor
                     anchors.horizontalCenter: parent.horizontalCenter
                     anchors.top: parent.bottom
                     anchors.topMargin: -50
                     function changeMargin (value){
                         graphe_conteneur.anchors.topMargin = value
                     }

                     Behavior on anchors.topMargin {
                         NumberAnimation{
                             duration: 300
                         }
                     }

                     Rectangle{
                         color: "transparent"
                         height: 50
                         width: parent.width
                         anchors.top: parent.top
                         Text {
                             anchors.centerIn: parent
                             color: white
                             font.underline: true
                             text: qsTr("Afficher/Masquer Graphe")

                             MouseArea{
                                 anchors.fill: parent
                                 cursorShape: "PointingHandCursor"
                                 onClicked: {
                                     if (root.alterner == 0){
                                         graphe_conteneur.changeMargin(-500)
                                     }else{
                                         graphe_conteneur.changeMargin(-50)
                                     }

                                     root.alterner ++;
                                     root.alterner %= 2

                                 }
                             }

                         }
                     }

                     Rectangle{
                         width: 160
                         height: 50
                         radius: 10
                         color: hoverColor
                         anchors.horizontalCenter: parent.horizontalCenter
                         anchors.bottom: parent.bottom
                         Text {
                             anchors.centerIn: parent
                             text: qsTr("EXPORTER PDF")
                             font.pixelSize: 16
                             color: white
                         }
                         MouseArea{
                             anchors.fill: parent
                             cursorShape: "PointingHandCursor"
                         }
                     }

                     ChartView{
                         width: 400
                         height: 400
                         anchors.horizontalCenter: parent.horizontalCenter
                         anchors.top: parent.top
                         anchors.topMargin: 50
                         z: 200
                         title: "Graphe des recettes obtenues par site"
                         PieSeries{
                             id: graphe
                         }
                     }
                 }
                 Rectangle{
                     width: contenu.width * 0.9
                     color: "transparent"
                     height: 60
                     anchors.horizontalCenter: parent.horizontalCenter
                     anchors.top: parent.top
                     anchors.topMargin: 20

                     Rectangle{
                         color: "transparent"
                         width: parent.width
                         anchors.horizontalCenter: parent.horizontalCenter
                         anchors.bottom: parent.bottom
                         Rectangle{
                             color: "transparent"
                             id: statLabel
                             width: parent.width
                             anchors.bottom: statInput.top
                             anchors.bottomMargin: 35
                             height: 20
                             Rectangle{
                                 anchors.left: parent.left
                                 anchors.bottom: parent.bottom
                                 id: statLabelNum
                                 width: parent.width * 0.4
                                 height: 20
                                 color: "transparent"
                                 Text {
                                     anchors.centerIn: parent
                                     text: qsTr("Nom")
                                     color: gray
                                 }
                             }
                             Rectangle{
                                 anchors.bottom: parent.bottom
                                 anchors.left: statLabelNum.right
                                 id: statLabelNom
                                 width: parent.width * 0.3
                                 height: 20
                                 color: "transparent"
                                 Text {
                                     anchors.centerIn: parent
                                     text: qsTr("Effectif")
                                     color: gray
                                 }
                             }
                             Rectangle{
                                 anchors.bottom: parent.bottom
                                 anchors.left: statLabelNom.right
                                 width: parent.width * 0.3
                                 color: "transparent"
                                 id: statLabelLieu
                                 height: 20
                                 Text {
                                     anchors.centerIn: parent
                                     text: qsTr("Montant Total")
                                     color: gray
                                 }
                             }
                         }
                         Rectangle{
                             color: "transparent"
                             id: statInput
                             width: parent.width
                             Rectangle{
                                 anchors.left: parent.left
                                 anchors.bottom: parent.bottom
                                 anchors.margins: 2
                                 id: statLabel2Num
                                 width: parent.width * 0.4
                                 height: 25
                                 color: "white"
                                 border.width: 1
                                 radius: 10
                                 border.color: backgroundColor
                                 MouseArea{
                                     anchors.fill: parent
                                     onClicked: {
                                         statNum.focus = true
                                     }
                                 }

                                 TextInput {
                                     id: statNum
                                     anchors.centerIn: parent
                                     color: "Black"
                                     onTextChanged: {
                                         Fonction.searchInfo()
                                     }
                                 }
                             }
                             Rectangle{
                                 anchors.bottom: parent.bottom
                                 anchors.left: statLabel2Num.right
                                 anchors.margins: 2
                                 id: statLabel2Nom
                                 width: parent.width * 0.3
                                 height: 25
                                 color: "white"
                                 border.width: 1
                                 radius: 10
                                 border.color: backgroundColor
                                 MouseArea{
                                     anchors.fill: parent
                                     onClicked: {
                                         statNom.focus = true
                                     }
                                 }
                                 TextInput {
                                     id: statNom
                                     anchors.centerIn: parent
                                     color: "Black"
                                     onTextChanged: {
                                         Fonction.searchInfo()
                                     }
                                 }
                             }
                             Rectangle{
                                 anchors.bottom: parent.bottom
                                 anchors.left: statLabel2Nom.right
                                 width: parent.width * 0.3
                                 color: "white"
                                 id: statLabel2Lieu
                                 height: 25
                                 border.width: 1
                                 anchors.margins: 2
                                 radius: 10
                                 border.color: backgroundColor
                                 MouseArea{
                                     anchors.fill: parent
                                     onClicked: {
                                         statLieu.focus = true
                                     }
                                 }
                                 TextInput {
                                     id: statLieu
                                     anchors.centerIn: parent
                                     color: "Black"
                                     onTextChanged: {
                                         Fonction.searchInfo()
                                     }
                                 }
                             }
                         }
                     }
                 }

                 ListView {
                            id: listView3
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.top: parent.top
                            anchors.topMargin: 120
                            width: contenu.width * 0.9
                            model: InfoSite
                            height: contenu.height - 170
                            cacheBuffer: 9000

                            delegate: Row {
                                Component.onCompleted: {
                                    graphe.append(this.children[0].children[0].text, this.children[2].children[0].text,)
                                }
                                width: parent.width
                                Rectangle {
                                    color: listColor
                                    width: listView.width * 0.4
                                    height: 50
                                    border.color: white
                                    border.width: 2
                                    radius: 10
                                    Text {
                                        color: "white"
                                        anchors.centerIn: parent
                                        text: model.a
                                    }
                                }

                                Rectangle {
                                    color: listColor
                                    width: listView.width * 0.3
                                    height: 50
                                    border.color: white
                                    border.width: 2
                                    radius: 10
                                    Text {
                                        color: "white"
                                        anchors.centerIn: parent
                                        text: model.b
                                    }
                                }
                                Rectangle {
                                    color: listColor
                                    width: listView.width * 0.3
                                    height: 50
                                    border.color: white
                                    border.width: 2
                                    radius: 10
                                    Text {
                                        color: "white"
                                        anchors.centerIn: parent
                                        text: model.c
                                    }
                                }
                            }
                        }
             }

         }

        Rectangle{
             visible: false
             enabled: false
             id: visite
             anchors.fill: parent
             color: white
             Rectangle{
                 anchors.bottom: parent.bottom
                 anchors.right: parent.right
                 anchors.bottomMargin: 40
                 anchors.rightMargin: 40
                 width: 50
                 z: 200
                 height: 50
                 color: "transparent"
                 Image {
                     anchors.fill: parent
                     source: "qrc:/Media/plus.png"
                 }
                 MouseArea{
                     anchors.fill: parent
                     onClicked: {
                        Fonction.ajout()
                     }
                 }
             }
             Rectangle{
                 width: contenu.width * 0.9
                 color: "transparent"
                 height: 80
                 anchors.horizontalCenter: parent.horizontalCenter
                 anchors.top: parent.top


                 Rectangle{
                     color: "transparent"
                     width: parent.width
                     anchors.horizontalCenter: parent.horizontalCenter
                     anchors.bottom: parent.bottom
                     Rectangle{
                         color: "transparent"
                         id: visiteLabel
                         width: parent.width
                         anchors.bottom: visiteInput.top
                         anchors.bottomMargin: 25
                         height: 20
                         Rectangle{
                             anchors.left: parent.left
                             anchors.bottom: parent.bottom
                             id: visiteLabelNum
                             width: parent.width * 0.2
                             height: 20
                             color: "transparent"
                             Text {
                                 anchors.centerIn: parent
                                 text: qsTr("ID Visiteur")
                                 color: gray
                             }
                         }
                         Rectangle{
                             anchors.bottom: parent.bottom
                             anchors.left: visiteLabelNum.right
                             id: visiteLabelNom
                             width: parent.width * 0.2
                             height: 20
                             color: "transparent"
                             Text {
                                 anchors.centerIn: parent
                                 text: qsTr("ID Site")
                                 color: gray
                             }
                         }
                         Rectangle{
                             anchors.bottom: parent.bottom
                             anchors.left: visiteLabelNom.right
                             width: parent.width * 0.15
                             color: "transparent"
                             id: visiteLabelLieu
                             height: 20
                             Text {
                                 anchors.centerIn: parent
                                 text: qsTr("Nb Jours")
                                 color: gray
                             }
                         }
                         Rectangle{
                             anchors.bottom: parent.bottom
                             anchors.left: visiteLabelLieu.right
                             id: visiteLabelProvenance
                             width: parent.width * 0.3
                             color: "transparent"
                             height: 20
                             Text {
                                 anchors.centerIn: parent
                                 text: qsTr("Date")
                                 color: gray
                             }
                         }
                     }
                     Rectangle{
                         color: "transparent"
                         id: visiteInput
                         width: parent.width
                         Rectangle{
                             anchors.left: parent.left
                             anchors.bottom: parent.bottom
                             anchors.margins: 2
                             id: visiteLabel2Num
                             width: parent.width * 0.2
                             height: 25
                             color: "white"
                             border.width: 1
                             radius: 10
                             border.color: backgroundColor
                             MouseArea{
                                 anchors.fill: parent
                                 onClicked: {
                                     visiteNum.focus = true
                                 }
                             }

                             TextInput {
                                 id: visiteNum
                                 anchors.centerIn: parent
                                 color: "Black"
                                 onTextChanged: {
                                     Fonction.searchvisite()
                                 }
                             }
                         }
                         Rectangle{
                             anchors.bottom: parent.bottom
                             anchors.left: visiteLabel2Num.right
                             anchors.margins: 2
                             id: visiteLabel2Nom
                             width: parent.width * 0.2
                             height: 25
                             color: "white"
                             border.width: 1
                             radius: 10
                             border.color: backgroundColor
                             MouseArea{
                                 anchors.fill: parent
                                 onClicked: {
                                     visiteNom.focus = true
                                 }
                             }
                             TextInput {
                                 id: visiteNom
                                 anchors.centerIn: parent
                                 color: "Black"
                                 onTextChanged: {
                                    Fonction.searchvisite()
                                 }
                             }
                         }
                         Rectangle{
                             anchors.bottom: parent.bottom
                             anchors.left: visiteLabel2Nom.right
                             width: parent.width * 0.15
                             color: "white"
                             id: visiteLabel2Lieu
                             height: 25
                             border.width: 1
                             anchors.margins: 2
                             radius: 10
                             border.color: backgroundColor
                             MouseArea{
                                 anchors.fill: parent
                                 onClicked: {
                                     visiteLieu.focus = true
                                 }
                             }
                             TextInput {
                                 id: visiteLieu
                                 anchors.centerIn: parent
                                 color: "Black"
                                 onTextChanged: {
                                     Fonction.searchvisite()
                                 }
                             }
                         }
                         Rectangle{
                             anchors.bottom: parent.bottom
                             anchors.left: visiteLabel2Lieu.right
                             id: visiteLabel2Provenance
                             anchors.margins: 2
                             width: parent.width * 0.3
                             color: "white"
                             height: 25
                             border.width: 1
                             radius: 10
                             border.color: backgroundColor

                             MouseArea{
                                 anchors.fill: parent
                                 onClicked: {
                                     visiteProvenance.focus = true
                                 }
                             }
                             TextInput {
                                 id: visiteProvenance
                                 anchors.centerIn: parent
                                 color: "Black"
                                 onTextChanged: {
                                     Fonction.searchvisite()
                                 }
                             }
                         }
                     }
                 }
             }

             ListView {
                        id: listView4
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top
                        anchors.topMargin: 100
                        width: contenu.width * 0.9
                        model: listVisite
                        height: contenu.height - 100

                        delegate: Row {
                            width: parent.width
                            Rectangle {
                                color: listColor
                                width: listView.width * 0.2
                                height: 50
                                border.color: white
                                border.width: 2
                                radius: 10

                                Text {
                                    color: "white"
                                    anchors.centerIn: parent
                                    text: model.numVisiteur
                                }
                            }

                            Rectangle {
                                color: listColor
                                width: listView.width * 0.2
                                height: 50
                                border.color: white
                                border.width: 2
                                radius: 10
                                Text {
                                    color: "white"
                                    anchors.centerIn: parent
                                    text: model.numSite
                                }
                            }
                            Rectangle {
                                color: listColor
                                width: listView.width * 0.15
                                height: 50
                                border.color: white
                                border.width: 2
                                radius: 10
                                Text {
                                    color: "white"
                                    anchors.centerIn: parent
                                    text: model.jour
                                }
                            }
                            Rectangle {
                                color: listColor
                                width: listView.width * 0.3
                                height: 50
                                border.color: white
                                border.width: 2
                                radius: 10
                                Text {
                                    color: "white"
                                    anchors.centerIn: parent
                                    text: model.date
                                }
                            }
                            Rectangle{
                                width: listView.width * 0.05
                                height: 50
                                opacity: 0.5
                                color: "transparent"
                                border.width: 2
                                border.color: white
                                visible: true
                                Image {
                                    visible: true
                                    height: 15
                                    width: 15
                                    anchors.centerIn: parent
                                    source: "qrc:/Media/pencil-7-svgrepo-com.svg"
                                }
                                MouseArea{
                                    anchors.fill: parent
                                    onClicked: {
                                        root.a_modifier = parent.parent.children[0].children[0].text
                                        root.a_modifier1 = parent.parent.children[1].children[0].text
                                        modifier_input_1.text = parent.parent.children[0].children[0].text
                                        modifier_input_2.text = parent.parent.children[1].children[0].text
                                        modifier_input_3.text = parent.parent.children[2].children[0].text
                                        ajout_input_4_2_annee.text = parent.parent.children[3].children[0].text.split("-")[0]
                                        ajout_input_4_2_mois.text = parent.parent.children[3].children[0].text.split("-")[1]
                                        ajout_input_4_2_jour.text = parent.parent.children[3].children[0].text.split("-")[2]
                                        Fonction.modifie()
                                    }
                                }
                            }
                            Rectangle{
                                width: listView.width * 0.1
                                height: 50
                                color: "transparent"
                                border.width: 2
                                border.color: white
                                opacity: 0.5
                                visible: true
                                Image {
                                    visible: true
                                    height: 15
                                    width: 15
                                    anchors.centerIn: parent
                                    source: "qrc:/Media/edit-delete-svgrepo-com.svg"
                                }
                                MouseArea{
                                    anchors.fill: parent
                                    onClicked: {
                                        root.a_supprimer =  parent.parent.children[0].children[0].text
                                        root.a_supprimer1 =  parent.parent.children[1].children[0].text
                                        root.mode = 9
                                        Fonction.popUpShow("Voulez-vous supprimer ce visite?")
                                    }
                                }
                            }
                        }
                    }


         }

        Column{
            spacing: 50
            id: bienvenue
            enabled: false
            anchors.centerIn: parent
            Text {
                text: qsTr("BIENVENUE")
                font.pixelSize: 28
                color: gray
                font.family: "Cantarell"
            }
            Text {
                text: qsTr("Ouvrir le fichier Visiteur: Ctrl + 1 \nOuvrir le fichier Site: Ctrl + 2 \nOuvrir le fichier Visite: Ctrl + 3")
                font.pixelSize: 14
                color: gray
                font.family: "Verdana"
            }
        }

    }
    Rectangle{
        id: add
        z: 200
        visible: false
        enabled: false
        anchors.centerIn: parent
        width: 600
        height: 350
        radius: 20
        color: "transparent"
        Image {
            anchors.fill: parent
            source: "qrc:/Media/fond.png"
        }

        Column{
            spacing: 20
            anchors.fill: parent
            topPadding: 50
            Rectangle{
                width: 500
                anchors.horizontalCenter: parent.horizontalCenter
                height: 30
                color: "transparent"
                Text {
                    id: ajout_label_input_1
                    font.pixelSize: 15
                    text: qsTr("Nom: ")
                    width: 150
                    color: "white"
                    anchors.verticalCenter: parent.verticalCenter

                }
                Rectangle{
                    anchors.left: ajout_label_input_1.right
                    id: ajout_input_1_conteneur
                    anchors.leftMargin: 20
                    anchors.verticalCenter: parent.verticalCenter
                    width: 300
                    height: 30
                    radius: 20
                    color: backgroundColor
                    TextInput{
                        id: ajout_input_1
                        font.pixelSize: 13
                        anchors.fill: parent
                        anchors.leftMargin: 10
                        anchors.topMargin: 8
                        width: parent.width
                        color: "white"
                    }
                }

            }
            Rectangle{
                width: 500
                height: 30
                anchors.horizontalCenter: parent.horizontalCenter
                color: "transparent"
                Text {
                    width: 150
                    id: ajout_label_input_2
                    font.pixelSize: 15
                    text: qsTr("Lieu: ")
                    color: "white"
                    anchors.verticalCenter: parent.verticalCenter

                }
                Rectangle{
                    id:ajout_input_2_conteneur
                    anchors.left: ajout_label_input_2.right
                    anchors.leftMargin: 20
                    anchors.verticalCenter: parent.verticalCenter
                    width: 300
                    height: 30
                    radius: 10
                    color: backgroundColor
                    TextInput{
                        id: ajout_input_2
                        anchors.fill: parent
                        anchors.leftMargin: 10
                        anchors.topMargin: 8
                        width: parent.width
                        color: "white"
                    }
                }

            }

            Rectangle{
                width: 500
                height: 30
                anchors.horizontalCenter: parent.horizontalCenter
                color: "transparent"
                Text {
                    width: 150
                    id: ajout_label_input_3
                    font.pixelSize: 15
                    text: qsTr("Tarif Journalier: ")
                    color: "white"
                    anchors.verticalCenter: parent.verticalCenter

                }
                Rectangle{
                    id: ajout_input_3_conteneur
                    anchors.left: ajout_label_input_3.right
                    anchors.leftMargin: 20
                    anchors.verticalCenter: parent.verticalCenter
                    width: 300
                    height: 30
                    radius: 10
                    color: backgroundColor
                    TextInput{
                        id: ajout_input_3
                        anchors.fill: parent
                        anchors.leftMargin: 10
                        anchors.topMargin: 8
                        width: parent.width
                        color: "white"
                    }
                }

            }

            Rectangle{
                id: input4
                width: 500
                visible: false
                enabled: false
                height: 30
                anchors.horizontalCenter: parent.horizontalCenter
                color: "transparent"
                Text {
                    id: ajout_label_input_4
                    text: qsTr("Date du Visite: ")
                    font.pixelSize: 15
                    color: "white"
                    anchors.verticalCenter: parent.verticalCenter

                }
                Text {
                    anchors.leftMargin: 10
                    anchors.left: ajout_label_input_4.right
                    id: ajout_label_input_4_annee
                    font.pixelSize: 12
                    color: "gray"
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("Annee(AAAA): ")
                }
                Rectangle{
                    anchors.left: ajout_label_input_4_annee.right
                    anchors.verticalCenter: parent.verticalCenter
                    width: 80
                    height: 30
                    radius: 10
                    color: backgroundColor
                    TextInput{
                        id: ajout_input_4_annee
                        anchors.fill: parent
                        anchors.leftMargin: 10
                        anchors.topMargin: 8
                        width: parent.width
                        color: "white"
                        validator: IntValidator{
                            top: 2050
                            bottom: 2023
                        }
                    }
                }
                Text {
                    anchors.leftMargin: 10
                    anchors.left: ajout_input_4_annee.parent.right
                    id: ajout_label_input_4_mois
                    font.pixelSize: 12
                    color: "gray"
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("Mois(MM): ")
                }
                Rectangle{
                    anchors.left: ajout_label_input_4_mois.right
                    anchors.verticalCenter: parent.verticalCenter
                    width: 50
                    height: 30
                    radius: 10
                    color: backgroundColor
                    TextInput{
                        id: ajout_input_4_mois
                        anchors.fill: parent
                        anchors.leftMargin: 10
                        anchors.topMargin: 8
                        width: parent.width
                        color: "white"
                        validator: IntValidator {
                            top: 12
                            bottom: 1
                        }
                    }
                }
                Text {
                    anchors.leftMargin: 10

                    anchors.left: ajout_input_4_mois.parent.right
                    id: ajout_label_input_4_jour
                    font.pixelSize: 12
                    color: "gray"
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("Jour(JJ): ")
                }
                Rectangle{
                    anchors.left: ajout_label_input_4_jour.right
                    anchors.verticalCenter: parent.verticalCenter
                    width: 50
                    height: 30
                    radius: 10
                    color: backgroundColor
                    TextInput{
                        id: ajout_input_4_jour
                        anchors.fill: parent
                        anchors.leftMargin: 10
                        anchors.topMargin: 8
                        width: parent.width
                        color: "white"
                        validator: IntValidator {
                            bottom: 1
                            top: 31
                        }
                    }
                }
            }
            Rectangle{
                height: 40
                width: parent.width
                color: "transparent"
                Text {
                    id: ajoutErreur
                    text: qsTr("")
                    color: hoverColor
                    anchors.centerIn: parent
                }
            }


            Row {
                id: ajoutBouton
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 100
                Rectangle{
                    width: 100
                    height: 40
                    radius: 10
                    color: backgroundColor
                    Text {
                        anchors.centerIn: parent
                        color: "white"
                        font.pixelSize: 15
                        text: qsTr("Annuler")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            Fonction.annuler_ajout()
                        }
                    }
                }
                Rectangle{
                    width: 100
                    height: 40
                    radius: 10
                    clip: true
                    color: hoverColor
                    Text {
                        anchors.centerIn: parent
                        color: "white"
                        font.pixelSize: 15
                        text: qsTr("OK")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: Fonction.confirmer_ajout()
                    }
                }
            }
        }
    }
    Rectangle{
        id: modifier
        z: 200
        visible: false
        enabled: false
        anchors.centerIn: parent
        width: 600
        height: 350
        radius: 20
        color: "transparent"
        Image{
            anchors.fill: parent
            source: "qrc:/Media/fond.png"
        }

        Column{
            spacing: 20
            anchors.fill: parent
            topPadding: 50
            Rectangle{
                width: 500
                anchors.horizontalCenter: parent.horizontalCenter
                height: 30
                color: "transparent"
                Text {
                    id: modifier_label_input_1
                    font.pixelSize: 15
                    width: 150
                    text: qsTr("Nouveau Nom: ")
                    color: "white"
                    anchors.verticalCenter: parent.verticalCenter

                }
                Rectangle{
                    anchors.left: modifier_label_input_1.right
                    anchors.leftMargin: 20
                    anchors.verticalCenter: parent.verticalCenter
                    width: 300
                    height: 30
                    radius: 10
                    color: input
                    TextInput{
                        id: modifier_input_1
                        anchors.fill: parent
                        anchors.leftMargin: 10
                        anchors.topMargin: 8
                        width: parent.width
                        color: "white"
                    }
                }

            }
            Rectangle{
                width: 500
                height: 30
                anchors.horizontalCenter: parent.horizontalCenter
                color: "transparent"
                Text {
                    id: modifier_label_input_2
                    font.pixelSize: 15
                    width: 150
                    text: qsTr("Nouveau Lieu: ")
                    color: "white"
                    anchors.verticalCenter: parent.verticalCenter

                }
                Rectangle{
                    anchors.left: modifier_label_input_2.right
                    anchors.leftMargin: 20
                    anchors.verticalCenter: parent.verticalCenter
                    width: 300
                    height: 30
                    radius: 10
                    color: input
                    TextInput{
                        id: modifier_input_2
                        anchors.fill: parent
                        anchors.leftMargin: 10
                        anchors.topMargin: 8
                        width: parent.width
                        color: "white"
                    }
                }

            }

            Rectangle{
                width: 500
                height: 30
                anchors.horizontalCenter: parent.horizontalCenter
                color: "transparent"
                Text {
                    id: modifier_label_input_3
                    font.pixelSize: 15
                    width: 150
                    text: qsTr("Tarif Journalier: ")
                    color: "white"
                    anchors.verticalCenter: parent.verticalCenter

                }
                Rectangle{
                    anchors.left: modifier_label_input_3.right
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 20
                    width: 300
                    height: 30
                    radius: 10
                    color: input
                    TextInput{
                        id: modifier_input_3
                        anchors.fill: parent
                        anchors.leftMargin: 10
                        anchors.topMargin: 8
                        width: parent.width
                        color: "white"
                    }
                }

            }
            Rectangle{
                id: input4_2
                width: 500
                visible: false
                enabled: false
                height: 30
                anchors.horizontalCenter: parent.horizontalCenter
                color: "transparent"
                Text {
                    id: ajout_label_input_4_2
                    text: qsTr("Date du Visite: ")
                    font.pixelSize: 15
                    color: "white"
                    anchors.verticalCenter: parent.verticalCenter

                }
                Text {
                    anchors.leftMargin: 10
                    anchors.left: ajout_label_input_4_2.right
                    id: ajout_label_input_4_2_annee
                    font.pixelSize: 12
                    color: "gray"
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("Annee(AAAA): ")
                }
                Rectangle{
                    anchors.left: ajout_label_input_4_2_annee.right
                    anchors.verticalCenter: parent.verticalCenter
                    width: 80
                    height: 30
                    radius: 10
                    color: input
                    TextInput{
                        id: ajout_input_4_2_annee
                        anchors.fill: parent
                        anchors.leftMargin: 10
                        anchors.topMargin: 8
                        width: parent.width
                        color: "white"
                        validator: IntValidator{
                            top: 2050
                            bottom: 2023
                        }
                    }
                }
                Text {
                    anchors.leftMargin: 10
                    anchors.left: ajout_input_4_2_annee.parent.right
                    id: ajout_label_input_4_2_mois
                    font.pixelSize: 12
                    color: "gray"
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("Mois(MM): ")
                }
                Rectangle{
                    anchors.left: ajout_label_input_4_2_mois.right
                    anchors.verticalCenter: parent.verticalCenter
                    width: 50
                    height: 30
                    radius: 10
                    color: input
                    TextInput{
                        id: ajout_input_4_2_mois
                        anchors.fill: parent
                        anchors.leftMargin: 10
                        anchors.topMargin: 8
                        width: parent.width
                        color: "white"
                        validator: IntValidator {
                            top: 12
                            bottom: 1
                        }
                    }
                }
                Text {
                    anchors.leftMargin: 10

                    anchors.left: ajout_input_4_2_mois.parent.right
                    id: ajout_label_input_4_2_jour
                    font.pixelSize: 12
                    color: "gray"
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("Jour(JJ): ")
                }
                Rectangle{
                    anchors.left: ajout_label_input_4_2_jour.right
                    anchors.verticalCenter: parent.verticalCenter
                    width: 50
                    height: 30
                    radius: 10
                    color: input
                    TextInput{
                        id: ajout_input_4_2_jour
                        anchors.fill: parent
                        anchors.leftMargin: 10
                        anchors.topMargin: 8
                        width: parent.width
                        color: "white"
                        validator: IntValidator {
                            bottom: 1
                            top: 31
                        }
                    }
                }
            }
            Rectangle{
                height: 40
                width: parent.width
                color: "transparent"
                Text {
                    id: modifierErreur
                    text: qsTr("")
                    color: hoverColor
                    anchors.centerIn: parent
                }
            }

            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 100
                Rectangle{
                    width: 100
                    height: 40
                    radius: 10
                    color: gray
                    Text {
                        anchors.centerIn: parent
                        color: "white"
                        font.pixelSize: 15
                        text: qsTr("Annuler")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            Fonction.annuler_modifier()
                        }
                    }
                }
                Rectangle{
                    width: 100
                    height: 40
                    radius: 10
                    color: hoverColor
                    Text {
                        anchors.centerIn: parent
                        color: "white"
                        font.pixelSize: 15
                        text: qsTr("OK")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: Fonction.confirmer_modifier()
                    }
                }
            }
        }
    }



    //POPUP
    Rectangle{
          anchors.verticalCenter: parent.verticalCenter
          x: parent.width / 2 + parent.width * 0.2 - 320
          width: 400
          property alias text: popupContent.text
          height: 200
          z: 1500
          visible: false
          enabled: false
          id: popup
          color: "transparent"
          radius: 30
          Image {
              anchors.fill: parent
              source: "qrc:/Media/fond.png"
          }
          Column{
              width: parent.width
              anchors.centerIn: parent
              Text {
                  anchors.horizontalCenter: parent.horizontalCenter
                  width: parent.width * 0.8
                  id: popupContent
                  color: "white"
                  horizontalAlignment: Text.AlignHCenter
                  wrapMode: Text.Wrap
                  text: qsTr("text")
              }
              Rectangle{
                  height: 30
                  width: 10
                  color: "transparent"
              }

              Row{
                  anchors.horizontalCenter: parent.horizontalCenter
                  Rectangle{

                      color: backgroundColor
                      width: 100
                      height: 40
                      radius: 20
                      MouseArea{
                          id: popupAnnuler
                          anchors.fill: parent
                          onClicked: {
                              Fonction.popUpCancel()
                          }
                      }
                      Text {
                          anchors.centerIn: parent
                          color: "white"
                          text: qsTr("Annuler")
                      }
                  }
                  Rectangle{
                      height: 10
                      width: 40
                      color: "transparent"
                  }

                  Rectangle{
                      color: hoverColor
                      radius: 20
                      width: 100
                      height: 40

                      MouseArea{
                          id: popupConfirmer
                          anchors.fill: parent
                          onClicked: {
                              Fonction.popUpConfirm()
                          }
                      }
                      Text {
                          color: "white"
                          anchors.centerIn: parent
                          text: qsTr("Confirmer")
                      }
                  }
              }
          }
      }
    Rectangle{
        id: brouille
        enabled: false
        visible: false
        anchors.fill: parent
        opacity: 0.7
        color: black
        z: 150
    }
    Rectangle{
           id: notification
           width: parent.width * 0.7
           height: parent.height * 0.1
           anchors.horizontalCenter: parent.horizontalCenter
           //y: parent.height - height - 20
           y: parent.height
           z: 200
           visible: false
           radius: 10
           border.color: hoverColor
           border.width:  2
           clip: true
           color: input
               Text {
                   id: notificationContent
                   text: qsTr("Une notification")
                   color: "#FFFFFF"
                   anchors.centerIn: parent

               }

               Rectangle{
                   anchors.right: parent.right
                   anchors.verticalCenter: parent.verticalCenter
                   color: "red"
                   Text {
                       width: 45
                       height: 23
                       text: qsTr("Ok")
                       anchors.verticalCenterOffset: 1
                       anchors.horizontalCenterOffset: -28
                       color: hoverColor
                       anchors.centerIn: parent
                       MouseArea{
                           anchors.fill: parent
                           onClicked: function (){
                            Fonction.notif_ok()
                           }
                       }
                   }

           }


           Behavior on y {
               NumberAnimation{
                   duration: 250
               }
           }

       }

}
