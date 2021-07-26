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
    private var changeSwitchValue: ((Bool) -> Void)!

    static var identifier: String { String(describing: self) }
    static var nib: UINib { UINib(nibName: String(describing: self), bundle: nil) }

    func configure(data: AlarmData, colorModel: ColorModel, changeSwitchValue: @escaping  (Bool) -> Void) {
        self.alarmData = data
        alarmSwitch.isOn = alarmData.isSetting
        appearanceConfigure(model: colorModel)
        self.changeSwitchValue = changeSwitchValue
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

    @IBAction private func didChangeSwitchValue(_ sender: Any) {
        self.changeSwitchValue(self.alarmSwitch.isOn)
    }
}
