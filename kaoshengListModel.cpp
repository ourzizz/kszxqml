#include "KaoshengListModel.h"
#include <QVector>
#include <QDebug>

typedef QVector<QString> KaoshengData;
class KaoshengDataPrivate
{
public:
    KaoshengDataPrivate()
        : m_bError(false)
    {
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

    void load(){
//        char *element[] ={"车那还","nan","1233332123.png"};
        KaoshengData *ksdata;
        ksdata = new KaoshengData();
        ksdata->append("chenhai");
        ksdata->append("name");
        ksdata->append("https://bjks-1252192276.cos.ap-chengdu.myqcloud.com/kaosheng/2d079527ad8143b3a34c74e76c903b25-wxa8510d55a9cbdc9c.o6zAJs4k-xTiu0aU33eQS8Ng4sC4.p9ropHDyqJUn4761a680078a7833406f776fa25f4871.jpg");
//        ksdata->append(element[3]);
//        ksdata->append(element[4]);
//        ksdata->append(element[5]);
        for(int i=0;i<30;i++){
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

    QString m_strError;
    bool m_bError;
    QHash<int, QByteArray> m_roleNames;
    QVector<KaoshengData*> m_Kaoshengs;
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

bool KaoshengListModel::insertRow()const{
    return false;
}
void KaoshengListModel::remove(int index)
{
    beginRemoveRows(QModelIndex(), index, index);
    delete m_dptr->m_Kaoshengs.takeAt(index);
    endRemoveRows();
}
