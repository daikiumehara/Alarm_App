//
//  SoundData.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/07/24.
//

import Foundation

struct SoundData: Codable {
    let fileName: String
    let soundName: String

    init(soundName: String, fileName: String) {
        self.fileName = fileName
        self.soundName = soundName
    }
}
