#ifndef FONCTION_H
#define FONCTION_H
#include <QObject>
#include <QString>
#include <QDebug>
#include <QSql>
#include <QSqlRecord>
#include <QSqlQuery>
#include <QSqlQueryModel>
#include <unistd.h>

//CLASSE QUI GERE LES DONNEES VISITEURS
class DatabaseVisiteur : public QObject
{
    Q_OBJECT

public:
    explicit DatabaseVisiteur (QObject *parent = nullptr);
    Q_INVOKABLE bool createDatabase ();
    Q_INVOKABLE bool ajoutVisiteur (const QString nom, const QString adresse, const QString provenance);
    Q_INVOKABLE bool modifieVisiteur (const int num, const QString nouvNom, const QString nouvAdresse, const QString nouvProvenance);
    Q_INVOKABLE bool supprimeVisiteur (const int num);
    Q_INVOKABLE bool open ();
    Q_INVOKABLE bool check(int num);


private:
    QSqlDatabase m_db;
};

//PERMET L'AFFICHAGE DES DATA DES VISITEURS
class ListVisiteur : public QSqlQueryModel
{
    Q_OBJECT

public:
    using QSqlQueryModel::QSqlQueryModel;

    QVariant data(const QModelIndex &index, int role) const override {
        if (role >= Qt::UserRole) {
            int columnIdx = role - Qt::UserRole;
            QModelIndex modelIndex = this->index(index.row(), columnIdx);
            return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
        }
        return QSqlQueryModel::data(index, role);
    }

    QHash<int, QByteArray> roleNames() const override {
        QHash<int, QByteArray> roles;
        for (int i = 0; i < record().count(); i++) {
            roles.insert(Qt::UserRole + i, record().fieldName(i).toUtf8());
        }
        return roles;
    }

    Q_INVOKABLE void setupModel(QString req) {
        // Ouvrir la base de données SQLite
        QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
        db.setDatabaseName("C:/Qt/Data/data.db");
        if (!db.open()) {
             qDebug() << "Ouverture liste échouée";
        }

        //Créer le modèle ListVisiteur
        QSqlQuery query;
        query.exec(req);

        // Informer la vue que le modèle va être réinitialisé
        beginResetModel();

        // Mettre à jour le modèle
        this->setQuery(query);

        // Informer la vue que le modèle a été réinitialisé
        endResetModel();
    }

};




/*************************************************************************************************************/




//CLASSE QUI GERE LES DONNEES SITES
class DatabaseSite : public QObject
{
    Q_OBJECT

public:
    explicit DatabaseSite (QObject *parent = nullptr);
    Q_INVOKABLE bool createDatabase ();
    Q_INVOKABLE bool ajoutSite (const QString nom, const QString lieu, const int tarif);
    Q_INVOKABLE bool modifieSite (const int num, const QString nouvNom, const QString nouvLieu, const int nouvTarif);
    Q_INVOKABLE bool supprimeSite (const int num);
    Q_INVOKABLE bool open ();
    Q_INVOKABLE bool check(int num);


private:
    QSqlDatabase m_dbSite;
};


//PERMET L'AFFICHAGE DES DATA DES SITES
class ListSite : public QSqlQueryModel
{
    Q_OBJECT

public:
    using QSqlQueryModel::QSqlQueryModel;

    QVariant data(const QModelIndex &index, int role) const override {
        if (role >= Qt::UserRole) {
            int columnIdx = role - Qt::UserRole;
            QModelIndex modelIndex = this->index(index.row(), columnIdx);
            return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
        }
        return QSqlQueryModel::data(index, role);
    }

    QHash<int, QByteArray> roleNames() const override {
        QHash<int, QByteArray> roles;
        for (int i = 0; i < record().count(); i++) {
            roles.insert(Qt::UserRole + i, record().fieldName(i).toUtf8());
        }
        return roles;
    }

    Q_INVOKABLE void setupModel(QString req) {
        // Ouvrir la base de données SQLite
        QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
        db.setDatabaseName("C:/Qt/Data/data.db");
        if (!db.open()) {
             qDebug() << "Ouverture liste échouée";
        }

        //Créer le modèle ListVisiteur
        QSqlQuery query;
        query.exec(req);

        // Informer la vue que le modèle va être réinitialisé
        beginResetModel();

        // Mettre à jour le modèle
        this->setQuery(query);

        // Informer la vue que le modèle a été réinitialisé
        endResetModel();
    }

};

//AFFICHAGE DES EFFECTIFS ET MONTANTS SITE
class InfoSite : public QSqlQueryModel
{
    Q_OBJECT

public:
    using QSqlQueryModel::QSqlQueryModel;

    QVariant data(const QModelIndex &index, int role) const override {
        if (role >= Qt::UserRole) {
            int columnIdx = role - Qt::UserRole;
            QModelIndex modelIndex = this->index(index.row(), columnIdx);
            return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
        }
        return QSqlQueryModel::data(index, role);
    }

    QHash<int, QByteArray> roleNames() const override {
        QHash<int, QByteArray> roles;
        for (int i = 0; i < record().count(); i++) {
            roles.insert(Qt::UserRole + i, record().fieldName(i).toUtf8());
        }
        return roles;
    }

    Q_INVOKABLE void setupModel(QString req) {
        // Ouvrir la base de données SQLite
        QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
        db.setDatabaseName("C:/Qt/Data/data.db");
        if (!db.open()) {
             qDebug() << "Ouverture liste échouée";
        }

        //Créer le modèle ListVisiteur
        QSqlQuery query;
        query.exec(req);

        // Informer la vue que le modèle va être réinitialisé
        beginResetModel();

        // Mettre à jour le modèle
        this->setQuery(query);

        // Informer la vue que le modèle a été réinitialisé
        endResetModel();
    }

};



/*************************************************************************************************************/




//CLASSE QUI GERE LES DONNEES VISITES
class DatabaseVisite : public QObject
{
    Q_OBJECT

public:
    explicit DatabaseVisite (QObject *parent = nullptr);
    Q_INVOKABLE bool createDatabase ();
    Q_INVOKABLE bool ajoutVisite (const int numVisiteur, const int numSite, const int jour, const QString date);
    Q_INVOKABLE bool modifieVisite (const int ancienNumVisiteur, const int ancienNumSite, const int nouveauNumVisiteur, const int nouveauNumSite, const int nouveauJour, const QString nouvelleDate);
    Q_INVOKABLE bool supprimeVisite (const QString q);
    Q_INVOKABLE bool open ();
    Q_INVOKABLE bool checkVisiteur(int num);
    Q_INVOKABLE bool checkSite(int num);
    Q_INVOKABLE bool checkVisiteVisiteur(int num);
    Q_INVOKABLE bool checkVisiteSite(int num);

private:
    QSqlDatabase m_db;
};

//PERMET L'AFFICHAGE DES DATA DES VISITES
class ListVisite : public QSqlQueryModel
{
    Q_OBJECT

public:
    using QSqlQueryModel::QSqlQueryModel;

    QVariant data(const QModelIndex &index, int role) const override {
        if (role >= Qt::UserRole) {
            int columnIdx = role - Qt::UserRole;
            QModelIndex modelIndex = this->index(index.row(), columnIdx);
            return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
        }
        return QSqlQueryModel::data(index, role);
    }

    QHash<int, QByteArray> roleNames() const override {
        QHash<int, QByteArray> roles;
        for (int i = 0; i < record().count(); i++) {
            roles.insert(Qt::UserRole + i, record().fieldName(i).toUtf8());
        }
        return roles;
    }

    Q_INVOKABLE void setupModel(QString req) {
        // Ouvrir la base de données SQLite
        QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
        db.setDatabaseName("C:/Qt/Data/data.db");
        if (!db.open()) {
             qDebug() << "Ouverture liste échouée";
        }

        //Créer le modèle ListVisiteur
        QSqlQuery query;
        query.exec(req);

        // Informer la vue que le modèle va être réinitialisé
        beginResetModel();

        // Mettre à jour le modèle
        this->setQuery(query);

        // Informer la vue que le modèle a été réinitialisé
        endResetModel();
    }

};

/*******************************************************************/
//Classe pour imiter la fonction sleep()
class wait: public QObject
{
    Q_OBJECT
public:
    explicit wait (QObject *parent = nullptr);

    Q_INVOKABLE void sleep (int ms);
};

#endif // FONCTION_H
