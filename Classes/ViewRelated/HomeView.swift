//
//  HomeView.swift
//  EdvoraTest
//
//  Created by Diya Kasliwal on 14/12/21.
//

import SwiftUI


struct HomeView: View {

    @Binding var isLoggedOut: Bool

    var body: some View {
        VStack(spacing: 20) {

            Spacer()

            Group {
                Text("Congratulations")
                    .font(.system(size: 60))
                Text("Successfully logged in")
                    .font(.system(size: 30))
            }

            Spacer()

            Button {
                isLoggedOut.toggle()
            } label: {
                Text(Localisation.logout)
                    .frame(maxWidth: .infinity)
                    .frame(width: 200, height: 52)
            }
            .buttonStyle(EdvoraButtonStyle())

            Spacer()
                .frame(height: 50)
        }
        .navigationTitle("Forgot Password")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(isLoggedOut: .constant(false))
    }
}

// MARK: - Localisation

private extension Localisation {
    static let logout = NSLocalizedString("LOGOUT", comment: "Title for logout button")
}
