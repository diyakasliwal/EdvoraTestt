//
//  SignupView.swift
//  EdvoraTest
//
//  Created by Diya Kasliwal on 14/12/21.
//

import SwiftUI


struct SignupView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("🚀")
                .font(.system(size: 60))

            Text("Signup View")
                .font(.system(size: 30))
        }
        .navigationTitle(Localisation.createAccountTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}

// MARK: - Localisation

private extension Localisation {
    static let createAccountTitle = NSLocalizedString("Create Account", comment: "Navigation title for signup view")
}
