#ifndef DATASOURCE_H
#define DATASOURCE_H
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlError>
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
};
#endif // DATASOURCE_H
