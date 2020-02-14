#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlError>
#include <QtDebug>
#include "DataSource.h"
DataSource::DataSource()
{
    m_db=QSqlDatabase::addDatabase("QMYSQL");
//    m_db.setHostName("127.0.0.1");      //连接数据库主机名，这里需要注意（若填的为”127.0.0.1“，出现不能连接，则改为localhost)
    m_db.setHostName("192.168.1.107");      //连接数据库主机名，这里需要注意（若填的为”127.0.0.1“，出现不能连接，则改为localhost)
    m_db.setPort(3306);                 //连接数据库端口号，与设置一致
    m_db.setDatabaseName("1909bishi");      //连接数据库名，与设置一致
    m_db.setUserName("root");          //数据库用户名，与设置一致
    m_db.setPassword("123123");    //数据库密码，与设置一致
    m_db.open();
    if(!m_db.open())
    {
        qDebug()<<"不能连接"<<"connect to mysql error"<<m_db.lastError().text();
        return ;
    }
}
QVector<KaoshengData*>* DataSource::getDiban(QString kaodianName,QString kaochangId) {
    QVector<KaoshengData*> *res = new QVector<KaoshengData*>();
    QSqlQuery query(m_db);
    QString sqlstr = QString("select * from all_in_one where kaodian_name='%1'AND kaochang_id='%2'").arg(kaodianName).arg(kaochangId);
    query.exec(sqlstr);
    while(query.next()){
        KaoshengData * element = new KaoshengData();
        element->append(query.value("kaosheng_name").toString());
        element->append(query.value("sfzid").toString());
        element->append(QString("file:///D:/data/ksphoto/") + query.value("kaosheng_name").toString() +query.value("sfzid").toString() + QString(".jpg"));
        res->append(element);
    }
    return res;
}
DataSource::~DataSource(){}
