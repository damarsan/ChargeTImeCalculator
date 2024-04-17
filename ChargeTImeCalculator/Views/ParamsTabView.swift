//
//  ParamsTabView.swift
//  ChargeTImeCalculator
//
//  Created by David Martinez Sanz on 16/4/24.
//

import SwiftUI

struct ParamsTabView: View {
    var body: some View {
        TabView {
            ParamsViewAC()
                .tabItem {
                Label("AC Charge", systemImage: "alternatingcurrent")
            }
            ParamsViewDC()
                .tabItem {
                Label("DC Charge", systemImage: "directcurrent")
                }
        }
    }
}

#Preview {
    ParamsTabView()
}
