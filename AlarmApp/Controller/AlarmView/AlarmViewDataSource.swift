//
//  AlarmViewDataSource.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/07/24.
//

import UIKit

class AlarmViewDataSource: NSObject, UICollectionViewDataSource {
    private var colorModel: ColorModel

    init(_ colorModel: ColorModel) {
        self.colorModel = colorModel
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView
                .dequeueReusableCell(withReuseIdentifier: AlarmCell.identifier, for: indexPath) as? AlarmCell else {
            fatalError("セルが見つかりません")
        }
        //TODO -Dataの取得
        let data = AlarmData(title: "目覚まし",
                             time: "11:00",
                             alarmName: "ポテトの音",
                             fileName: "poteto",
                             identifier: "2020:11:24:22:21:11",
                             setting: false)
        cell.configure(data: data, colorModel: colorModel)
        return cell
    }
}
