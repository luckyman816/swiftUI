//
//  PreferenceDisplayView.swift
//  eul
//
//  Created by Gao Sun on 2020/8/15.
//  Copyright © 2020 Gao Sun. All rights reserved.
//

import SwiftUI
import Localize_Swift

extension Preference {
    struct DisplayView: View {
        let temperatureUnits: [TemperatureUnit] = [.celius, .fahrenheit]
        let textDisplays = TextDisplay.allCases

        @EnvironmentObject var preference: PreferenceStore

        var body: some View {
            VStack(spacing: 12) {
                HStack(spacing: 0) {
                    Picker("language".localized(), selection: $preference.language) {
                        ForEach(PreferenceStore.availableLanguages, id: \.self) {
                            Text("language.\($0)".localized())
                                .tag($0)
                        }
                    }
                    .frame(width: 200)
                }
                HStack(spacing: 0) {
                    Picker("temp.temperature".localized(), selection: $preference.temperatureUnit) {
                        ForEach(temperatureUnits, id: \.self) {
                            Text($0.description)
                                .tag($0)
                        }
                    }
                    .frame(width: 200)
                }
                HStack(spacing: 0) {
                    Picker("text_display".localized(), selection: $preference.textDisplay) {
                        ForEach(textDisplays) {
                            Text($0.description)
                                .tag($0)
                        }
                    }
                    .frame(width: 200)
                }
            }
            .padding(.vertical, 8)
        }
    }
}