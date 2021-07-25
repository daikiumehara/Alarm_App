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
        cell.configure(colorModel: colorModel)
        return cell
    }
}
