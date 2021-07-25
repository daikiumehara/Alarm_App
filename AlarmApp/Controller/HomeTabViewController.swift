//
//  HomeTabViewController.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/07/24.
//

import UIKit
import ESTabBarController_swift

class HomeTabViewController: ESTabBarController {
    let colorModel = ColorModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureVC()
    }

    func configureVC() {
        let alarmVC = AlarmViewController.instantiate(colorModel)
        let timerVC = TimerViewController.instantiate(colorModel)
        let settingVC = SettingViewController.instantiate(colorModel)
        self.viewControllers = [alarmVC, timerVC, settingVC]
    }
}
