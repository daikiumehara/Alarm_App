//
//  AlarmData.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/07/24.
//

import UIKit

struct AlarmData: Comparable {
    var title: String
    var time: String
    var alarmName: String
    var alarmFileName: String
    var alarmIdentifier: String  //作成した年日時秒(アラームの識別に使用)
    var isSetting: Bool {
        didSet {
            settingAlarm()
        }
    }

    static func < (lhs: AlarmData, rhs: AlarmData) -> Bool {

    }

    private func settingAlarm() {
        let center = UNUserNotificationCenter.current()
        //アラームの解除
        guard isSetting else {
            center.removePendingNotificationRequests(withIdentifiers: [alarmIdentifier])
            return
        }
        center.getNotificationSettings { setting in
            guard setting.alertSetting == .enabled else {
                print("許可されていません")
                return
            }
        }
        let content = UNMutableNotificationContent()
        content.title = "アラーム"
        content.body = "起床の時間です"
        let sound = UNNotificationSound(named: UNNotificationSoundName(alarmFileName))
        content.sound = sound
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        let request = UNNotificationRequest(identifier: alarmIdentifier,
                                            content: content,
                                            trigger: trigger)
        center.add(request) { error in
            if let error = error {
                print("エラーが発生しました\(error)")
            }
        }
    }
}
