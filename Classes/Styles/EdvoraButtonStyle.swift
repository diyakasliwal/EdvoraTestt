//
//  EdvoraButtonStyle.swift
//  EdvoraTest
//
//  Created by Diya Kasliwal on 14/12/21.
//

import SwiftUI

struct EdvoraButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        return configuration.label
            .foregroundColor(.white)
            .background(Color("button-brown"))
            .font(.system(size: 20, weight: .regular))
            .cornerRadius(13)
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
            .animation(.easeInOut, value: 0.2)
    }
}
