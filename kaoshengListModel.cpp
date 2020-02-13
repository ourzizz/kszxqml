/***********************************
*打印底板逻辑其实很简单
*1指定数据库
*2取数据填充矩阵
*3打印 周而复始
************************************/
#include "KaoshengListModel.h"
#include <QVector>
#include <QDebug>
#include "DataSource.h"
typedef QVector<QString> KaoshengData;
class KaoshengDataPrivate
{
public:/*{{{*/
    KaoshengDataPrivate()
        : m_bError(false)
    {
        m_db = new DataSource();
        int role = Qt::UserRole;
        m_roleNames.insert(role++, "name");
        m_roleNames.insert(role++, "age");
        m_roleNames.insert(role++, "img");
//        m_roleNames.insert(role++, "kemu");
//        m_roleNames.insert(role++, "zuowei");
//        m_roleNames.insert(role++, "zkzh");
    }

    ~KaoshengDataPrivate()
    {
        clear();
    }

    void load(){//给出考点 考场两个参数 取数据库中对应的数据填充
        char *element[] ={"车那还","nan","1233332123.png"};
        qDebug()<<"test"<<element[0];
        KaoshengData *ksdata;
        for(int i=0;i<25;i++){
            ksdata = new KaoshengData();
            ksdata->append(element[1]);
            ksdata->append(QString::number(i));
            ksdata->append("./acy.jpg");
            m_Kaoshengs.append(ksdata);
        }
    }

    void reset()
    {
        m_bError = false;
        m_strError.clear();
        clear();
    }

    void clear()
    {
        int count = m_Kaoshengs.size();
        if(count > 0)
        {
            for(int i = 0; i < count; i++)
            {
                delete m_Kaoshengs.at(i);
            }
            m_Kaoshengs.clear();
        }
    }
    DataSource *m_db;
    QString m_strError;
    bool m_bError;
    QHash<int, QByteArray> m_roleNames;
    QVector<KaoshengData*> m_Kaoshengs;/*}}}*/
};

KaoshengListModel::KaoshengListModel(QObject *parent)
    : QAbstractListModel(parent)
    , m_dptr(new KaoshengDataPrivate)
{
    qDebug() << "VideoListModel,error - " << m_dptr->m_strError;
    m_dptr->load();
}

KaoshengListModel::~KaoshengListModel()
{
    delete m_dptr;
}

int KaoshengListModel::rowCount(const QModelIndex &parent) const
{
    return m_dptr->m_Kaoshengs.size();
}

QVariant KaoshengListModel::data(const QModelIndex &index, int role) const
{
    KaoshengData *d = m_dptr->m_Kaoshengs[index.row()];
    return d->at(role - Qt::UserRole);
}

QHash<int, QByteArray> KaoshengListModel::roleNames() const
{
    return m_dptr->m_roleNames;
}

QString KaoshengListModel::errorString() const
{
    return m_dptr->m_strError;
}

bool KaoshengListModel::hasError() const
{
    return m_dptr->m_bError;
}

void KaoshengListModel::reload()
{
    beginResetModel();

    m_dptr->reset();
    m_dptr->load();

    endResetModel();
}
void KaoshengListModel::get(QString schoolName,QString index){
//    QString a ="毕节市实验学校";
//    QString b ="01";
    QVector<KaoshengData*> *ksdata = m_dptr->m_db->getDiban(schoolName,index);
    beginResetModel();
    m_dptr->m_Kaoshengs.clear();
    for(int i=0;i<ksdata->count();i++){
        m_dptr->m_Kaoshengs.append(ksdata->at(i));
        qDebug()<<"debug"<<ksdata->at(i)[0];
    }
    endResetModel();
}
bool KaoshengListModel::insertRow()const{
    return false;
}
void KaoshengListModel::remove(int index)
{
    beginRemoveRows(QModelIndex(), index, index);
    delete m_dptr->m_Kaoshengs.takeAt(index);
    endRemoveRows();
}
