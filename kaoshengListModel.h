#ifndef VIDEOLISTMODEL_H
#define VIDEOLISTMODEL_H
#include <QAbstractListModel>

class KaoshengDataPrivate;
class KaoshengListModel : public QAbstractListModel
{
    Q_OBJECT
//    Q_PROPERTY(QString source READ source WRITE setSource)

public:
    KaoshengListModel(QObject *parent = 0);
    ~KaoshengListModel();

    int rowCount(const QModelIndex &parent) const;
    QVariant data(const QModelIndex &index, int role) const;
    QHash<int, QByteArray> roleNames() const;


    Q_INVOKABLE QString errorString() const;
    Q_INVOKABLE bool hasError() const;
    Q_INVOKABLE bool insertRow() const;
    Q_INVOKABLE void remove(int index);
    Q_INVOKABLE void reload();
    Q_INVOKABLE void get();

private:
    KaoshengDataPrivate *m_dptr;
};

#endif // VIDEOLISTMODEL_H
