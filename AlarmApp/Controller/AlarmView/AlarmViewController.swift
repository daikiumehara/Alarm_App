//
//  AlarmViewController.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/07/24.
//

import UIKit
import ESTabBarController_swift

class AlarmViewController: UIViewController {
    @IBOutlet private var alarmView: UICollectionView!
    @IBOutlet private var topSafeAreaView: UIView!

    private var colorModel: ColorModel!
    private let alarmViewDelegate = AlarmViewDelegate()
    private lazy var alarmViewDataSource = AlarmViewDataSource(colorModel)

    override func viewDidLoad() {
        super.viewDidLoad()
        askPermissionNontification()
        self.topSafeAreaView.backgroundColor = colorModel.themeColor.backgroundColor
        configureCollectionView()
    }

    func askPermissionNontification() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if let error = error {
                print(error)
            }
        }
    }

    func configureCollectionView() {
        alarmView.register(AlarmCell.nib,
                                forCellWithReuseIdentifier: AlarmCell.identifier)
        alarmView.delegate = alarmViewDelegate
        alarmView.dataSource = alarmViewDataSource
        alarmView.collectionViewLayout = AlarmViewLayout()
        alarmView.backgroundColor = colorModel.themeColor.backgroundColor
    }
}

// MARK: - instantiate
extension AlarmViewController {
    static func instantiate(_ colorModel: ColorModel) -> AlarmViewController {
        guard let initialVC = UIStoryboard(name: "Alarm", bundle: nil)
                .instantiateInitialViewController()as? AlarmViewController else {
            fatalError("storyboardが見つかりません")
        }
        initialVC.colorModel = colorModel
        let contentView = BouncesContentView()
        contentView.configure(colorModel)
        initialVC.tabBarItem = ESTabBarItem(contentView,
                                     title: "アラーム",
                                     image: UIImage(systemName: "alarm"),
                                     selectedImage: UIImage(systemName: "alarm"),
                                     tag: 1)
        return initialVC
    }
}
