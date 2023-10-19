
function popUpShow (enonce){
    popup.enabled = true
    popup.visible = true
    brouille.visible = true
    contenu.enabled = false
    menu.enabled = false
    popupContent.text = enonce
}
function popUpCancel (){
    menu.enabled = true
    contenu.enabled = true
    popup.visible = false
    popup.enabled = false
    brouille.visible = false
}
function popUpConfirm (mode){

    popup.visible = false
    popup.enabled = false
    switch (root.mode){
    case 1:
        brouille.visible = false
        visiteurChoix2.enabled = true
        dataVisiteur.ajoutVisiteur (choix2Nom.text, choix2Adresse.text, choix2Provenance.text)
        notificationContent.text = "Un nouveau visiteur a été ajouté"
        notification.visible = true; notification.y = root.height - notification.height - 20
        choix2Nom.text = ""
        choix2Adresse.text = ""
        choix2Provenance.text = ""
        break
    case 2:
        brouille.visible = false
        visiteurChoix3.enabled = true
        notificationContent.text = "Le Visiteur a bien été modifié"
        notification.visible = true; notification.y = root.height - notification.height - 20
        dataVisiteur.modifieVisiteur(choix3Num.text, choix3Nom.text, choix3Adresse.text, choix3Provenance.text)
        choix3Num.text = ""
        choix3Nom.text = ""
        choix3Adresse.text = ""
        choix3Provenance.text = ""
        break
    case 3:
        datavisiteur.supprimeVisiteur(root.a_supprimer)
        datavisite.supprimeVisite("DELETE FROM Visites WHERE numVisiteur = '" + root.a_supprimer +"'")
        notif("Le visiteur a été supprimé")
        listVisiteur.setupModel("SELECT * FROM Visiteurs")
        break
    case 4:
        brouille.visible = false
        siteChoix2.enabled = true
        dataSite.ajoutSite(siteChoix2Nom.text, siteChoix2Lieu.text, siteChoix2Tarif.text)
        notificationContent.text = "Un nouveau site a été ajouté"
        notification.visible = true; notification.y = root.height - notification.height - 20
        siteChoix2Nom.text = ""
        siteChoix2Lieu.text = ""
        siteChoix2Tarif.text = ""
        break
    case 5:
        brouille.visible = false
        siteChoix3.enabled = true
        dataSite.modifieSite(siteChoix3Num.text, siteChoix3Nom.text, siteChoix3Lieu.text, siteChoix3Tarif.text)
        notificationContent.text = "Le Site a bien été modifié"
        notification.visible = true; notification.y = root.height - notification.height - 20
        siteChoix3Nom.text = ""
        siteChoix3Num.text = ""
        siteChoix3Tarif.text = ""
        siteChoix3Lieu.text = ""
        break
    case 6:
        datasite.supprimeSite(root.a_supprimer)
        datavisite.supprimeVisite("DELETE FROM Visites WHERE numSite = '"+ root.a_supprimer +"'")
        notif("Le Site a été supprimé")
        listSite.setupModel("SELECT * FROM Sites")
        break
    case 7:
        let date = visiteChoix2DateAnnee.text + "-" + visiteChoix2DateMois.text + "-" + visiteChoix2DateJour.text
        brouille.visible = false
        visiteChoix2.enabled = true
        notificationContent.text = "Une visite a été ajouté"
        notification.visible = true; notification.y = root.height - notification.height - 20
        console.log(date)
        if (!dataVisite.ajoutVisite(visiteChoix2NumVisiteur.text, visiteChoix2NumSite.text, visiteChoix2Jour.text, date)){
            notificationContent.text = "Le format de la date n'est pas valide (AAAA-MM-JJ)"
            notification.visible = true; notification.y = root.height - notification.height - 20
            brouille.visible = true
            visiteChoix2.enabled = false
        }
        visiteChoix2NumSite.text = ""
        visiteChoix2NumVisiteur.text = ""
        visiteChoix2Jour.text = ""
        visiteChoix2DateAnnee.text = ""
        visiteChoix2DateJour.text = ""
        visiteChoix2DateMois.text = ""
        break
    case 8:
        let date1 = visiteChoix3DateAnnee.text + "-" + visiteChoix3DateMois.text + "-" + visiteChoix3DateJour.text
        brouille.visible = false
        visiteChoix3.enabled = true
        notificationContent.text = "La visite a bien été modifié"
        notification.visible = true; notification.y = root.height - notification.height - 20
        dataVisite.modifieVisite(visiteChoix3AncienNumVisituer.text, visiteChoix3AncienNumSite.text, visiteChoix3NumVisiteur.text, visiteChoix3NumSite.text, visiteChoix3Jour.text, date1)
        visiteChoix3AncienNumVisituer.text = ""
        visiteChoix3AncienNumSite.text = ""
        visiteChoix3NumSite.text = ""
        visiteChoix3NumVisiteur.text = ""
        visiteChoix3DateAnnee.text = ""
        visiteChoix3DateJour.text = ""
        visiteChoix3DateMois.text = ""
        visiteChoix3Jour.text = ""
        break
    case 9:
        datavisite.supprimeVisite("DELETE FROM Visites WHERE numVisiteur = '"+ root.a_supprimer +"' AND numSite = '"+root.a_supprimer1+"'")
        notif("La visite a été supprimé")
        listVisite.setupModel("SELECT * FROM Visites")
        break
    case 10:
        if (datavisiteur.createDatabase()){
            notif("Le fichier Visiteur a bien été crée")
        }else{
            notif("Erreur! Un erreur est survenu lors de la création du fichier Visiteur")
        }
        listVisiteur.setupModel("SELECT * FROM Visiteurs")
        break
    case 11:
        if (datasite.createDatabase()){
            notif ("Le fichier Site a bien été crée")
        }else{
            notif("Erreur! Un erreur est survenu lors de la création du fichier Site")
        }
        listSite.setupModel("SELECT * FROM Sites")
        break;
    case 12:
        if (datavisite.createDatabase()){
            notif ("Le fichier Visite a bien été crée")
        }else{
            notif("Erreur! Un erreur est survenu lors de la création du fichier Visite")
        }
        listVisite.setupModel("SELECT * FROM Visites")
        break;
    }
}
function approxDate(chaine)
{
    let reg = /^\+.*$/
    return reg.test(chaine)
}

function notif_ok () {
    notification.y= root.height + 100
    notification.visible = false
    brouille.visible = false
    menu.enabled = true
    contenu.enabled = true
    switch (root.choix){
    case 1:
        visiteur.enabled = true
        listVisiteur.setupModel("SELECT * FROM Visiteurs")
        break
    case 2:
        break
    case 3:
        break
    }
}

function notif (chaine){
    contenu.enabled = false
    menu.enabled = false
    brouille.visible = true
    notification.visible = true
    notificationContent.text = chaine
    notification.y = root.height - notification.height - 20

}




//LES FONCTIONS DE VALIDATION
function testVide (chaine){
    if (chaine === "")
        return true;
    else
        return false;
}

function testNonChiffre (chaine){
    let regex = /[^0-9]/g;
    return regex.test(chaine)
}
function testDate (opt, visiteur, site, Jour, annee, mois, jour){
    if (!testChiffre(annee.text) || annee.text < 2023){
        notificationContent.text = "L'annee doit etre un entier AAAA qui fait réference à une date actuelle ou future"
        notification.visible = true; notification.y = root.height - notification.height - 20
        brouille.visible = true
        opt.enabled = false
        return false;
    }
    else if (!testChiffre(mois.text) || (mois.text > 12 || mois.text < 0)){
        notificationContent.text = "Le mois doit etre un entier MM (1-12)"
        notification.visible = true; notification.y = root.height - notification.height - 20
        brouille.visible = true
        opt.enabled = false
        return false;
    }
    else if (!testChiffre(jour.text)){
        notificationContent.text = "Le jour doit etre un entier JJ"
        notification.visible = true; notification.y = root.height - notification.height - 20
        brouille.visible = true
        opt.enabled = false
        return false;
    }
    else if (jour.text > 32 || jour.text < 0){
        notificationContent.text = "Le jour dois être un entier positif (1-31)"
        notification.visible = true; notification.y = root.height - notification.height - 20
        brouille.visible = true
        opt.enabled = false
        return false;
    }
    else if (jour.text < 32 && jour.text > 0){
        if ((mois.text === "4" || mois.text === "6" || mois.text === "9" || mois.text === "11") && jour.text === "31"){
            notificationContent.text = "Le mois ne comporte que 30 jours"
            notification.visible = true; notification.y = root.height - notification.height - 20
            brouille.visible = true
            opt.enabled = false
            return false;
        }
        else if (mois.text === "2" && (jour.text === "31" || jour.text === "30")){
            notificationContent.text = "Le mois ne comporte que 29 jours"
            notification.visible = true; notification.y = root.height - notification.height - 20
            brouille.visible = true
            opt.enabled = false
            return false;
        }
        else{
            return true;
        }
    }
    else{
        return true;
    }
}





//LES FONCTIONS DE RECHERHE
function searchVisiteur (){
    let query = "SELECT * FROM Visiteurs ";
    if (!(visiteurSite.text === "")){
        query += "JOIN Visites ON Visiteurs.numVisiteur = Visites.numVisiteur JOIN Sites ON Visites.numSite = Sites.numSite WHERE UPPER(Sites.nom) GLOB UPPER('" + visiteurSite.text + "*')"
    }
    else{
        query += "WHERE 1=1"
    }

    if (!(visiteurNum.text === "")){
        query += " AND Visiteurs.numVisiteur GLOB '" + visiteurNum.text + "*'"
    }
    if (!(visiteurNom.text === "")){
        query += " AND UPPER(Visiteurs.nom) GLOB UPPER('" + visiteurNom.text + "*') COLLATE NOCASE "
    }
    if (!(visiteurLieu.text === "")){
        query += " AND UPPER(Visiteurs.adresse) GLOB UPPER('" + visiteurLieu.text + "*') COLLATE NOCASE "
    }
    if (!(visiteurProvenance.text === "")){
        query += " AND UPPER(Visiteurs.provenance) GLOB UPPER('" + visiteurProvenance.text + "*') COLLATE NOCASE "
    }

    if ((visiteurDateDepart.text !== "") && (visiteurDateArrivee.text !== "")){
        if (approxDate(visiteurDateDepart.text))
        {
            if (approxDate(visiteurDateArrivee.text)){
                 query += " AND Visites.date BETWEEN DATE('now', '"+visiteurDateDepart.text+"') AND DATE('now', '"+visiteurDateArrivee.text+"')"
            }
            else{
                query += " AND Visites.date BETWEEN DATE('now', '"+visiteurDateDepart.text+"') AND DATE('"+visiteurDateArrivee.text+"')"
            }
        }
        else if (approxDate(visiteurDateArrivee.text))
        {
            query += " AND Visites.date BETWEEN DATE('"+visiteurDateDepart.text +"') AND DATE('now', '"+visiteurDateArrivee.text+"')"
        }
        else{
            query += " AND Visites.date BETWEEN DATE('" + visiteurDateDepart.text + "') AND DATE('" + visiteurDateArrivee.text + "')"
        }

    }
    listVisiteur.setupModel(query)
}
function searchSite (){
    let query = "SELECT * FROM Sites";
    if (!(siteSite.text === "")){
        query += " JOIN Visites ON Visites.numSite = Sites.numSite JOIN Visiteurs ON Visiteurs.numVisiteur = Visites.numVisiteur WHERE UPPER(Visiteurs.nom) GLOB UPPER('" + siteSite.text + "*')"
    }
    else{
        query += " WHERE 1=1"
    }

    if (!(siteNum.text === "")){
        query += " AND Sites.numSite GLOB '" + siteNum.text + "' "
    }
    if (!(siteNom.text === "")){
        query += " AND UPPER(Sites.nom) GLOB UPPER('" + siteNom.text + "*') "
    }
    if (!(siteLieu.text === "")){
        query += " AND UPPER(Sites.lieu) GLOB UPPER('" + siteLieu.text + "*') "
    }
    if (!(siteProvenance.text === "")){
        query += " AND Sites.tarif GLOB'" + siteProvenance.text + "*' "
    }
    if ((siteDateDepart.text !== "") && (siteDateArrivee.text !== "")){
        if (approxDate(siteDateDepart.text))
        {
            if (approxDate(siteDateArrivee.text)){
                 query += " AND Visites.date BETWEEN DATE('now', '"+siteDateDepart.text+"') AND DATE('now', '"+siteDateArrivee.text+"')"
            }
            else{
                query += " AND Visites.date BETWEEN DATE('now', '"+siteDateDepart.text+"') AND DATE('"+siteDateArrivee.text+"')"
            }
        }
        else if (approxDate(siteDateArrivee.text))
        {
            query += " AND Visites.date BETWEEN DATE('"+siteDateDepart.text +"') AND DATE('now', '"+siteDateArrivee.text+"')"
        }
        else{
            query += " AND Visites.date BETWEEN DATE('" + siteDateDepart.text + "') AND DATE('" + siteDateArrivee.text + "')"
        }

    }

    listSite.setupModel(query)
}
function searchvisite (){
    let query = "SELECT * FROM Visites WHERE 1=1";
    if (!(visiteNum.text === "")){
        query += " AND numVisiteur = '" + visiteNum.text + "' "
    }
    if (!(visiteNom.text === "")){
        query += " AND numSite = '" + visiteNom.text + "' "
    }
    if (!(visiteLieu.text === "")){
        query += " AND jour = '" + visiteLieu.text + "' "
    }
    if (!(visiteProvenance.text === "")){
        query += " AND date = '" + visiteProvenance.text + "' "
    }

    listVisite.setupModel(query)
}
function searchInfo (){
    let query = "SELECT Sites.nom AS a, COUNT (Visiteurs.numVisiteur) AS b, SUM(Sites.tarif * Visites.jour) AS c FROM Sites JOIN Visites ON Sites.numSite = Visites.numSite JOIN Visiteurs ON Visiteurs.numVisiteur = Visites.numVisiteur GROUP BY Sites.nom HAVING 1=1";
    if (!(statNum.text === "")){
        query += " AND UPPER(a) GLOB UPPER('"+ statNum.text +"*')"
    }
    if (!(statNom.text === "")){
        query += " AND b GLOB '" + statNom.text + "*'"
    }
    if (!(statLieu.text === "")){
        query += " AND c GLOB '" + statLieu.text + "*'"
    }
    InfoSite.setupModel(query)
}






//FONCTION DE CREATION DE D'AJOUT

function creation_fichier (){
    switch (root.choix){
    case 1:
        root.mode = 10
        Fonction.popUpShow("Voulez-vous créer un nouveau fichier Visiteur? Le fichier existant sera écrasé")

        break
    case 2:
        root.mode = 11
        Fonction.popUpShow("Voulez-vous créer un nouveau fichier Site? Le fichier existant sera écrasé")
        break
    case 3:
        root.mode = 12
        Fonction.popUpShow("Voulez-vous créer un nouveau fichier Visite? Le fichier existant sera écrasé")
        break
    }
}

function ajout (){
    add.visible = true
    add.enabled = true
    contenu.enabled = false
    menu.enabled = false
    brouille.visible = true
    switch (root.choix){
    case 1:
        ajout_label_input_1.text = "Nom Visiteur :"
        ajout_label_input_2.text = "Adresse :"
        ajout_label_input_3.text = "Provenance :"
        break
    case 2:
        ajout_label_input_1.text = "Nom:"
        ajout_label_input_2.text = "Lieu :"
        ajout_label_input_3.text = "Tarif :"
        break
    case 3:
        ajout_label_input_1.text = "ID Visiteur:"
        ajout_label_input_2.text = "ID Site:"
        ajout_label_input_3.text = "Nb Jours :"
        input4.visible = true
        input4.enabled = true
        add.height = 400
        break
    }
}

function confirmer_ajout (){
    if (testVide(ajout_input_1.text) || testVide(ajout_input_2.text) || testVide(ajout_input_3.text)){
        ajoutErreur.text = "Erreur! Les cases ne peuvent être vides"
    }else{
        switch (root.choix){
        case 1:

            brouille.visible = false
            add.visible = false
            add.enabled = false
            contenu.enabled = true
            visiteur.enabled = true
            datavisiteur.ajoutVisiteur(ajout_input_1.text, ajout_input_2.text, ajout_input_3.text)
            listVisiteur.setupModel("SELECT * FROM Visiteurs")
            ajoutErreur.text = ""
            input4.visible = false
            input4.enabled = false
            add.height = 350
            menu.enabled = true
            reset()
            break
        case 2:
            if (testNonChiffre(ajout_input_3.text)){
                ajoutErreur.text = "Erreur! Le champ 'tarif' doit être un entier positif"
            }else{
                brouille.visible = false
                add.visible = false
                add.enabled = false
                contenu.enabled = true
                datasite.ajoutSite(ajout_input_1.text, ajout_input_2.text, ajout_input_3.text)
                listSite.setupModel("SELECT * FROM Sites")
                ajoutErreur.text = ""
                input4.visible = false
                input4.enabled = false
                add.height = 350
                menu.enabled = true
                reset()
            }
            break
        case 3:
            if (ajout_input_4_annee.text === "" || ajout_input_4_jour.text === "" || ajout_input_4_mois.text === ""){
                ajoutErreur.text = "Erreur! Les cases ne peuvent être vides"
            }else{
               if (!datavisiteur.check(ajout_input_1.text)){
                   ajoutErreur.text = "Erreur! L'ID ne correspond à aucun Visiteur"
               }
               else if (!datasite.check(ajout_input_2.text)){
                   ajoutErreur.text = "Erreur! L'ID ne correspond à aucun Site"
               }
               else if (testNonChiffre(ajout_input_3.text)){
                   ajoutErreur.text = "Erreur! Le nombre de jours doit être un entier positif"
               }
               else{
                   if (ajout_input_4_jour.text.length == 1){
                       ajout_input_4_jour.text = "0" + ajout_input_4_jour.text
                   }
                   if (ajout_input_4_mois.text.length == 1){
                       ajout_input_4_mois.text = "0" + ajout_input_4_mois.text
                   }

                   let date = ajout_input_4_annee.text + "-" + ajout_input_4_mois.text + "-" + ajout_input_4_jour.text
                   console.log(date);
                   if (!datavisite.ajoutVisite(ajout_input_1.text, ajout_input_2.text, ajout_input_3.text, date)){
                       ajoutErreur.text = "Erreur! La date entrée n'est pas valide"
                   }
                   else{
                       brouille.visible = false
                       add.visible = false
                       add.enabled = false
                       contenu.enabled = true
                       ajoutErreur.text = ""
                       input4.visible = false
                       input4.enabled = false
                       add.height = 350
                       menu.enabled = true
                       listVisite.setupModel("SELECT * FROM Visites")
                       reset()
                   }
               }
            }

            break

        }
    }
}

function annuler_ajout (){
    brouille.visible = false
    menu.enabled = true
    contenu.enabled = true
    add.visible = false
    add.enabled = false
    ajoutErreur.text = ""
    input4.visible = false
    input4.enabled = false
    add.height = 350
    reset()
}






//FONCTION DE MODIFICATION
function modifie (){
    switch (root.choix){
    case 1:
        brouille.visible = true
        modifier_label_input_1.text = "Nouveau Nom :"
        modifier_label_input_2.text = "Nouvelle Adresse :"
        modifier_label_input_3.text = "Nouvelle Provenance :"
        modifier.visible = true
        modifier.enabled = true
        contenu.enabled = false
        menu.enabled = false
        break
    case 2:
        brouille.visible = true
        modifier_label_input_1.text = "Nouveau Nom :"
        modifier_label_input_2.text = "Nouveau lieu :"
        modifier_label_input_3.text = "Nouveau tarif:"
        modifier.visible = true
        modifier.enabled = true
        contenu.enabled = false
        menu.enabled = false
        break
    case 3:
        brouille.visible = true
        modifier_label_input_1.text = "Nouvel ID Visieur :"
        modifier_label_input_2.text = "Nouvel ID Site :"
        modifier_label_input_3.text = "Nb de Jours:"
        modifier.visible = true
        modifier.enabled = true
        modifier.height = 400
        contenu.enabled = false
        menu.enabled = false
        input4_2.visible = true
        input4_2.enabled= true
        break
    }
}

function annuler_modifier (){
    brouille.visible = false
    menu.enabled = true
    contenu.enabled = true
    modifier.visible = false
    modifier.enabled = false
    modifierErreur.text = ""
    input4_2.visible = false
    input4_2.enabled= false
    modifier.height = 350
    reset()
}

function confirmer_modifier (){
    if (testVide(modifier_input_1.text) || testVide(modifier_input_2.text) || testVide(modifier_input_3.text)){
        modifierErreur.text = "Erreur! Les cases ne peuvent être vides"
    }else{
        switch (root.choix){
        case 1:
            brouille.visible = false
            modifier.visible = false
            modifier.enabled = false
            menu.enabled = true
            contenu.enabled = true
            datavisiteur.modifieVisiteur(root.a_modifier, modifier_input_1.text, modifier_input_2.text, modifier_input_3.text)
            listVisiteur.setupModel("SELECT * FROM Visiteurs")
            modifierErreur.text = ""
            input4_2.visible = false
            input4_2.enabled= false
            modifier.height = 350
            reset()
            break
        case 2:
            if (testNonChiffre(modifier_input_3.text)){
                modifierErreur.text = "Erreur! Le champ 'tarif' doit être un entier positif"
            }else{
                brouille.visible = false
                modifier.visible = false
                modifier.enabled = false
                menu.enabled = true
                contenu.enabled = true
                datasite.modifieSite(root.a_modifier, modifier_input_1.text, modifier_input_2.text, modifier_input_3.text)
                listSite.setupModel("SELECT * FROM Sites")
                modifierErreur.text = ""
                input4_2.visible = false
                input4_2.enabled= false
                modifier.height = 350
                reset()
            }
            break
        case 3:
            if (ajout_input_4_2_annee.text === "" || ajout_input_4_2_jour.text === "" || ajout_input_4_2_mois.text === ""){
                modifierErreur.text = "Erreur! Les cases ne peuvent être vides"
            }else{
               if (!datavisiteur.check(modifier_input_1.text)){
                   modifierErreur.text = "Erreur! L'ID ne correspond à aucun Visiteur"
               }
               else if (!datasite.check(modifier_input_2.text)){
                   modifierErreur.text = "Erreur! L'ID ne correspond à aucun Site"
               }
               else if (testNonChiffre(modifier_input_3.text)){
                   modifierErreur.text = "Erreur! Le nombre de jours doit être un entier positif"
               }
               else{
                   if (ajout_input_4_2_jour.text.length == 1){
                       ajout_input_4_2_jour.text = "0" + ajout_input_4_jour.text
                   }
                   if (ajout_input_4_2_mois.text.length == 1){
                       ajout_input_4_2_mois.text = "0" + ajout_input_4_mois.text
                   }

                   let date = ajout_input_4_2_annee.text + "-" + ajout_input_4_2_mois.text + "-" + ajout_input_4_2_jour.text
                   console.log(date);
                   if (!datavisite.modifieVisite(root.a_modifier, root.a_modifier1, modifier_input_1.text, modifier_input_2.text, modifier_input_3.text, date)){
                       ajoutErreur.text = "Erreur! La date entrée n'est pas valide"
                   }
                   else{
                       brouille.visible = false
                       modifier.visible = false
                       modifier.enabled = false
                       contenu.enabled = true
                       modifierErreur.text = ""
                       input4_2.visible = false
                       input4_2.enabled = false
                       modifier.height = 350
                       menu.enabled = true
                       listVisite.setupModel("SELECT * FROM Visites")
                       reset()
                   }
               }
            }
            break

        }
    }
}
function choix1 (){
    menu_choix_1.color = white
    opt1.color = black
    menu_choix_2.color = "transparent"
    opt2.color = white
    menu_choix_3.color = "transparent"
    opt3.color = white
    visiteur.visible = true
    visiteur.enabled = true
    site.visible = false
    site.enabled = false
    visite.enabled = false
    visite.visible = false
    root.choix = 1
    bienvenue.visible = false
    sous_menu_choix_1.enabled = true
    listVisiteur.setupModel("SELECT * FROM Visiteurs")
    reset()
}
function choix2 (){
    bienvenue.visible = false
    menu_choix_2.color = white
    opt2.color = black
    menu_choix_1.color = "transparent"
    opt1.color = white
    menu_choix_3.color = "transparent"
    opt3.color = white
    site.visible = true
    site.enabled = true
    visiteur.visible = false
    visiteur.enabled = false
    visite.enabled = false
    visite.visible = false
    root.choix = 2
    sous_menu_choix_1.enabled = true
    listSite.setupModel("SELECT * FROM Sites")
    graphe.clear()
    InfoSite.setupModel("SELECT Sites.nom AS a, COUNT (Visiteurs.numVisiteur) AS b, SUM(Sites.tarif * Visites.jour) AS c FROM Sites JOIN Visites ON Sites.numSite = Visites.numSite JOIN Visiteurs ON Visiteurs.numVisiteur = Visites.numVisiteur GROUP BY Sites.nom")
    reset ()
}

function choix3 (){
    bienvenue.visible = false
    menu_choix_3.color = white
    opt3.color = black
    menu_choix_1.color = "transparent"
    opt1.color = white
    menu_choix_2.color = "transparent"
    opt2.color = white
    site.visible = false
    site.enabled = false
    visiteur.visible = false
    visiteur.enabled = false
    visite.enabled = true
    visite.visible = true
    root.choix = 3
    sous_menu_choix_1.enabled = true
    listVisite.setupModel("SELECT * FROM Visites")
    reset()
}

//FONCTION DE NAVIGATION


//FONCTION DE RESET
function reset (){
    ajout_input_1.text = ""
    ajout_input_2.text = ""
    ajout_input_3.text = ""
    ajout_input_4_annee.text = ""
    ajout_input_4_mois.text = ""
    ajout_input_4_jour.text = ""
    ajout_input_4_2_annee.text = ""
    ajout_input_4_2_mois.text = ""
    ajout_input_4_2_jour.text = ""
    modifier_input_1.text = ""
    modifier_input_2.text = ""
    modifier_input_3.text = ""
    siteDateDepart.text = ""
    siteDateArrivee.text = ""
    siteSite.text = ""
    siteNum.text = ""
    siteNom.text = ""
    siteLieu.text = ""
    siteProvenance.text = ""
    visiteNum.text = ""
    visiteNom.text = ""
    visiteLieu.text = ""
    visiteProvenance.text = ""
    visiteurDateDepart.text = ""
    visiteurDateArrivee.text = ""
    visiteurSite.text = ""
    visiteurNum.text = ""
    visiteurNom.text = ""
    visiteurLieu.text = ""
    visiteurProvenance.text = ""



}
