//
//  AlarmCell.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/07/24.
//

import UIKit

class AlarmCell: UICollectionViewCell {
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var timeLabel: UILabel!
    @IBOutlet private var alameNameLabel: UILabel!
    @IBOutlet private var bellImage: UIImageView!
    @IBOutlet private var alarmSwitch: UISwitch!

    private var alarmData: AlarmData!

    static var identifier: String { String(describing: self) }
    static var nib: UINib { UINib(nibName: String(describing: self), bundle: nil) }

    func configure(data: AlarmData, colorModel: ColorModel) {
        self.alarmData = data
        alarmSwitch.isOn = alarmData.isSetting
        appearanceConfigure(model: colorModel)
    }

    private func appearanceConfigure(model: ColorModel) {
        self.layer.cornerRadius = 10
        self.backgroundColor = model.themeColor.cellBackgroundColor
        self.layer.borderWidth = 0.5
        self.titleLabel.textColor = model.themeColor.textColor
        self.timeLabel.textColor = model.themeColor.textColor
        self.alameNameLabel.textColor = model.themeColor.textColor
        self.bellImage.tintColor = model.themeColor.textColor
        self.alarmSwitch.tintColor = model.mainColor
        self.alarmSwitch.onTintColor = model.mainColor
    }

    @IBAction func didChangeSwitchValue(_ sender: Any) {
        self.alarmData.isSetting = alarmSwitch.isOn
    }
}
