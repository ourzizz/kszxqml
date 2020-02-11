#ifndef DATASOURCE_H
#define DATASOURCE_H
class DataSource
{
private:
    QSqlDatabase m_db;
//    QString m_dbname;
//    QString m_host;
//    QString dabname;
public:
    DataSource();
    QVector<QString> GetAllDbName();

}
#endif // DATASOURCE_H
