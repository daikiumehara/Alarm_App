//
//  TimerViewController.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/07/24.
//

import UIKit
import ESTabBarController_swift

class TimerViewController: UIViewController {
    private var colorModel: ColorModel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

// MARK: - instantiate
extension TimerViewController {
    static func instantiate(_ colorModel: ColorModel) -> TimerViewController {
        guard let initialVC = UIStoryboard(name: "Timer", bundle: nil)
                .instantiateInitialViewController() as? TimerViewController else {
            fatalError("storyboardが見つかりません")
        }
        initialVC.colorModel = colorModel
        let contentView = BouncesContentView()
        contentView.configure(colorModel)
        initialVC.tabBarItem = ESTabBarItem(contentView,
                                     title: "タイマー",
                                     image: UIImage(systemName: "timer"),
                                     selectedImage: UIImage(systemName: "timer"),
                                     tag: 2)
        return initialVC
    }
}
