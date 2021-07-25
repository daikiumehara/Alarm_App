//
//  SettingViewController.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/07/24.
//

import UIKit
import ESTabBarController_swift

class SettingViewController: UIViewController {
    private var colorModel: ColorModel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

// MARK: - instantiate
extension SettingViewController {
    static func instantiate(_ colorModel: ColorModel) -> SettingViewController {
        guard let initialVC = UIStoryboard(name: "Setting", bundle: nil)
                .instantiateInitialViewController() as? SettingViewController else {
            fatalError("storyboardが見つかりません")
        }
        initialVC.colorModel = colorModel
        let contentView = BouncesContentView()
        contentView.configure(colorModel)
        initialVC.tabBarItem = ESTabBarItem(contentView,
                                     title: "設定",
                                     image: UIImage(systemName: "gearshape"),
                                     selectedImage: UIImage(systemName: "gearshape"),
                                     tag: 3)
        return initialVC
    }
}
