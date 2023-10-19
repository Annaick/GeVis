#include "fonction.h"
#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlQuery>
#include <QDebug>
#include <QFile>

/*************************************************************************************************************/
//ALGO POUR LES DONNEES VISITEURS

DatabaseVisiteur::DatabaseVisiteur(QObject *parent) : QObject(parent){

}

bool DatabaseVisiteur::check(int num){
    QSqlQuery query;
    query.prepare("SELECT EXISTS (SELECT 1 FROM Visiteurs WHERE numVisiteur = :num)");
    query.bindValue(":num", num);
    if (query.exec()){
        if (query.next()){
            return query.value(0).toBool();
        }
    }

    return false;
}



bool DatabaseVisiteur::createDatabase()
{

    m_db = QSqlDatabase::addDatabase("QSQLITE");
    QFile file ("C:/Visiteur.db");
    file.open(QIODevice::WriteOnly);
    m_db.setDatabaseName("C:/Qt/Data/data.db");
    if (m_db.open()) {
        QSqlQuery query;
        query.exec("DROP TABLE Visiteurs");
        query.exec("DELETE FROM Visites WHERE 1=1");
        qDebug() << "Ouverture reussie";
        if (!query.exec("CREATE TABLE IF NOT EXISTS Visiteurs (numVisiteur INTEGER PRIMARY KEY AUTOINCREMENT, nom TEXT NOT NULL COLLATE NOCASE, adresse TEXT NOT NULL COLLATE NOCASE,provenance TEXT NOT NULL COLLATE NOCASE);")) {
            qDebug() << "Création de tableau échoué : ";
            return false;
        }
        return true;
    }else{
        qDebug() << "Ouverture échouée : ";
        return false;

    }

}

bool DatabaseVisiteur::ajoutVisiteur(const QString nom, const QString adresse, const QString provenance){
    QSqlQuery query;
    query.prepare("INSERT INTO Visiteurs (nom, adresse, provenance) VALUES (:nom, :adresse, :provenance)");
    query.bindValue(":nom", nom);
    query.bindValue(":adresse", adresse);
    query.bindValue(":provenance", provenance);


    if ( query.exec()){
        qDebug() << "Ajout reussi";
        return true;
    }
    else{
        qDebug() << "Ajout échoué";
        return false;
    }

}


bool DatabaseVisiteur::open(){
    QFile visiteur ("C:/Qt/Data/data.db");
    if (visiteur.exists()) {
        qDebug() << "fichierVisiteur trouvé";
        m_db = QSqlDatabase::addDatabase("QSQLITE");
        m_db.setDatabaseName("C:/Qt/Data/data.db");
        if (m_db.open()) {
            qDebug() << "Connection automatique au donneesVisiteurs";
        }
        return true;
    } else {
        qDebug() << "Erreur de connection automatique au donneesVisiteurs";
        return false;
    }
}


bool DatabaseVisiteur::modifieVisiteur(const int num, const QString nouvNom, const QString nouvAdresse, const QString nouvProvenance){
    QSqlQuery query(m_db);
    query.prepare("UPDATE Visiteurs SET nom = :nouvNom, adresse = :nouvAdresse, provenance = :nouvProvenance WHERE numVisiteur = :num ");
    query.bindValue(":nouvNom", nouvNom);
    query.bindValue(":nouvAdresse", nouvAdresse);
    query.bindValue(":nouvProvenance", nouvProvenance);
    query.bindValue(":num", num);

    if (query.exec()) {
        qDebug() << "Modification réussie";
        return true;
    }else{
        qDebug() << "Erreur lors de la modification : ";
        return false;
    }

}

bool DatabaseVisiteur::supprimeVisiteur(const int num){
     QSqlQuery query(m_db);
     query.prepare("DELETE FROM Visiteurs WHERE numVisiteur = :num");
     query.bindValue(":num", num);
     if (query.exec()) {
         qDebug() << "Suppression réussie";
         return true;
     }else{
         qDebug() << "Erreur lors de la suppression : " ;
         return false;
     }
}


/*************************************************************************************************************/
//ALGO POUR LES DONNEES SITES


DatabaseSite::DatabaseSite(QObject *parent) : QObject(parent){

}

bool DatabaseSite::check(int num){
    QSqlQuery query;
    query.prepare("SELECT EXISTS (SELECT 1 FROM Sites WHERE numSite = :num)");
    query.bindValue(":num", num);
    if (query.exec()){
        if (query.next()){
            return query.value(0).toBool();
        }
    }

    return false;
}


bool DatabaseSite::createDatabase()
{
    QFile file ("C:/Site.db");
    file.open(QIODevice::WriteOnly);
    m_dbSite = QSqlDatabase::addDatabase("QSQLITE");
    m_dbSite.setDatabaseName("C:/Qt/Data/data.db");
    if (m_dbSite.open()) {
        QSqlQuery query;
        query.exec("DROP TABLE Sites");
        query.exec("DELETE FROM Visites WHERE 1=1");
        qDebug() << "Ouverture reussie";
        if (!query.exec("CREATE TABLE IF NOT EXISTS Sites (numSite INTEGER PRIMARY KEY AUTOINCREMENT, nom TEXT NOT NULL COLLATE NOCASE, lieu TEXT NOT NULL COLLATE NOCASE, tarif INTEGER NOT NULL);")) {
            qDebug() << "Création de tableau échoué : ";
            return false;
        }
        return true;
    }else{
        qDebug() << "Ouverture échouée : ";
        return false;

    }

}

bool DatabaseSite::ajoutSite(const QString nom, const QString lieu, const int tarif){
    QSqlQuery query;
    query.prepare("INSERT INTO Sites (nom, lieu, tarif) VALUES (:nom, :lieu, :tarif)");
    query.bindValue(":nom", nom);
    query.bindValue(":lieu", lieu);
    query.bindValue(":tarif", tarif);

    if ( query.exec()){
        qDebug() << "Ajout reussi";
        return true;
    }
    else{
        qDebug() << "Ajout échoué";
        return false;
    }

}


bool DatabaseSite::open(){
    QFile site ("C:/Qt/Data/data.db");
    if (site.exists()) {
        qDebug() << "fichierSite trouvé";
        m_dbSite = QSqlDatabase::addDatabase("QSQLITE");
        m_dbSite.setDatabaseName("C:/Qt/Data/data.db");
        if (m_dbSite.open()) {
            qDebug() << "Connection automatique au donneesSites";
        }
        return true;
    } else {
        qDebug() << "Erreur de connection automatique au donneesSitess";
        return false;

    }
}


bool DatabaseSite::modifieSite(const int num, const QString nouvNom, const QString nouvLieu, const int nouvTarif){
    QSqlQuery query(m_dbSite);
    query.prepare("UPDATE Sites SET nom = :nouvNom, lieu = :nouvLieu, tarif = :nouvTarif WHERE numSite = :num ");
    query.bindValue(":nouvNom", nouvNom);
    query.bindValue(":nouvLieu", nouvLieu);
    query.bindValue(":nouvTarif", nouvTarif);
    query.bindValue(":num", num);

    if (query.exec()) {
        qDebug() << "Modification réussie";
        return true;
    }else{
        qDebug() << "Erreur lors de la modification : ";
        return false;
    }

}

bool DatabaseSite::supprimeSite(const int num){
     QSqlQuery query(m_dbSite);
     query.prepare("DELETE FROM Sites WHERE numSite = :num");
     query.bindValue(":num", num);
     if (query.exec()) {
         qDebug() << "Suppression site réussie";
         return true;
     }else{
         qDebug() << "Erreur lors de la suppression du site: " ;
         return false;
     }
}



/*************************************************************************************************************/
//ALGO POUR LES DONNEES VISITES

DatabaseVisite::DatabaseVisite(QObject *parent) : QObject(parent){

}

bool DatabaseVisite::createDatabase()
{
    QFile file ("C:/Visite.db");
    file.open(QIODevice::WriteOnly);
    m_db = QSqlDatabase::addDatabase("QSQLITE");
    m_db.setDatabaseName("C:/Qt/Data/data.db");
    if (m_db.open()) {
        QSqlQuery query;
        query.exec("DROP TABLE Visites");
        qDebug() << "Ouverture reussie";
        if (!query.exec("CREATE TABLE IF NOT EXISTS Visites (numVisiteur INTEGER, numSite INTEGER, jour INTEGER, date TEXT NOT NULL, FOREIGN KEY(numVisiteur) REFERENCES Visiteurs(numVisiteur), FOREIGN KEY(numSite) REFERENCES Sites (numSite));")) {
            qDebug() << "Création de tableau échoué : ";
            return false;
        }
        return true;
    }else{
        qDebug() << "Ouverture échouée : ";
        return false;

    }

}

bool DatabaseVisite::ajoutVisite(const int numVisiteur, const int numSite, const int jour, const QString date){
    QSqlQuery query;
    query.prepare("INSERT INTO Visites (numVisiteur, numSite, jour, date) VALUES (:numVisiteur, :numSite, :jour, DATE('"+date+"'));");
    query.bindValue(":numVisiteur", numVisiteur);
    query.bindValue(":numSite", numSite);
    query.bindValue(":jour", jour);

    if ( query.exec()){
        qDebug() << "Ajout reussi";
        return true;
    }
    else{
        qDebug() << "Ajout échoué";
        return false;
    }

}


bool DatabaseVisite::open(){
    QFile site ("C:/Qt/Data/data.db");
    if (site.exists()) {
        qDebug() << "fichierVisite trouvé";
        m_db = QSqlDatabase::addDatabase("QSQLITE");
        m_db.setDatabaseName("C:/Qt/Data/data.db");
        if (m_db.open()) {
            QSqlQuery Q;
            Q.exec("pragma foreign_key = on");
            qDebug() << "Connection automatique au donneesVisites";
        }
        return true;
    } else {
        qDebug() << "Erreur de connection automatique au donneesVisites";
        return false;

    }
}


bool DatabaseVisite::modifieVisite(const int ancienNumVisiteur, const int ancienNumSite, const int nouveauNumVisiteur, const int nouveauNumSite, const int nouveauJour, const QString nouvelleDate){
    QSqlQuery query(m_db);
    query.prepare("UPDATE Visites SET numVisiteur = :nouvNumVisiteur, numSite = :nouvNumSite, jour = :nouvJour, date = :nouvelledate WHERE numVisiteur = :ancienNumVisiteur AND numSite = :ancienNumSite");
    query.bindValue(":nouvNumVisiteur", nouveauNumVisiteur);
    query.bindValue(":nouvNumSite", nouveauNumSite);
    query.bindValue(":nouvJour", nouveauJour);
    query.bindValue(":nouvelledate", nouvelleDate);
    query.bindValue(":ancienNumVisiteur", ancienNumVisiteur);
    query.bindValue(":ancienNumSite", ancienNumSite);

    if (query.exec()) {
        qDebug() << "Modification réussie";
        return true;
    }else{
        qDebug() << "Erreur lors de la modification : ";
        return false;
    }

}

bool DatabaseVisite::supprimeVisite(const QString q){
     QSqlQuery query(m_db);
     if (query.exec(q)) {
         qDebug() << "Suppression de la visite réussie";
         return true;
     }else{
         qDebug() << "Erreur lors de la suppression de la visite: " ;
         return false;
     }
}

bool DatabaseVisite::checkVisiteur(int num){
    QSqlQuery query;
    query.prepare("SELECT EXISTS (SELECT 1 FROM Visiteurs WHERE numVisiteur = :num)");
    query.bindValue(":num", num);
    if (query.exec()){
        if (query.next()){
            return query.value(0).toBool();
        }
    }

    return false;
}

bool DatabaseVisite::checkVisiteVisiteur(int num){
    QSqlQuery query;
    query.prepare("SELECT EXISTS (SELECT 1 FROM Visites WHERE numVisiteur = :num)");
    query.bindValue(":num", num);
    if (query.exec()){
        if (query.next()){
            return query.value(0).toBool();
        }
    }

    return false;
}

bool DatabaseVisite::checkSite(int num){
    QSqlQuery query;
    query.prepare("SELECT EXISTS (SELECT 1 FROM Sites WHERE numSite = :num)");
    query.bindValue(":num", num);
    if (query.exec()){
        if (query.next()){
            return query.value(0).toBool();
        }
    }

    return false;
}

bool DatabaseVisite::checkVisiteSite(int num){
    QSqlQuery query;
    query.prepare("SELECT EXISTS (SELECT 1 FROM Visites WHERE numSite = :num)");
    query.bindValue(":num", num);
    if (query.exec()){
        if (query.next()){
            return query.value(0).toBool();
        }
    }

    return false;
}


/*************************************************************************************/
//ALGO POUR LA FONCTION SLEEP
wait::wait(QObject *parent) : QObject(parent){

}

void wait::sleep(int ms)
{
    usleep(ms * 1000);
}
