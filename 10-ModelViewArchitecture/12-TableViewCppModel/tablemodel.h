// Copyright (c) Daniel Gakwaya.
// SPDX-License-Identifier: MIT

#ifndef TABLEMODEL_H
#define TABLEMODEL_H

#include <QObject>
#include <QAbstractTableModel>

class TableModel : public QAbstractTableModel
{
    Q_OBJECT
    enum TableRoles{
        TableDataRole = Qt::UserRole + 1,
    };
public:
    explicit TableModel(QObject *parent = nullptr);
    int rowCount(const QModelIndex & = QModelIndex()) const override;
    int columnCount(const QModelIndex & = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role) const override;
    QVariant headerData(int section, Qt::Orientation orientation, int role) const override;
    QHash<int, QByteArray> roleNames() const override;

    Q_INVOKABLE
    QVariant get_display_data(const QModelIndex& index);

private:
    QVector<QVector<QString>> table;
};

#endif // TABLEMODEL_H
