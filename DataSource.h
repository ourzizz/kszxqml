#ifndef DATASOURCE_H
#define DATASOURCE_H
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlError>
#include <QString>
typedef QVector<QString> KaoshengData;
class DataSource
{
private:
    QSqlDatabase m_db;
public:
    DataSource();
    ~DataSource();
//    QVector<QString> GetAllDbName();
    QVector<KaoshengData*>* getDiban(QString kaodianName,QString kaochangId) ;
    QString getFirstLetter(QString strName);
};
#endif // DATASOURCE_H
