//
//  LoginView.swift
//  EdvoraTest
//
//  Created by Diya Kasliwal on 14/12/21.
//

import SwiftUI

struct LoginView: View {

    @ObservedObject var viewModel = LoginViewModel()

    @State private var isLoggedIn: Bool = false

    var body: some View {
        NavigationView {
            ScrollView {
                ZStack {
                    VStack(spacing: 26) {

                       
                        Image(uiImage: UIImage(named: "edvora-logo")!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 156)

                        Spacer(minLength: 40)

                        Group {

                            EdvoraTextField(title: Localisation.usernameTitle,
                                            image: UIImage(named: "username-icon")!,
                                            textContentType: .username,
                                            text: $viewModel.username)


                            EdvoraTextField(title: Localisation.passwordTitle,
                                            image: UIImage(named: "password-icon")!,
                                            textContentType: .password,
                                            text: $viewModel.password)

                            EdvoraTextField(title: Localisation.emailTitle,
                                            image: UIImage(named: "email-icon")!,
                                            textContentType: .emailAddress,
                                            text: $viewModel.email)
                        }


                        HStack() {
                            Spacer()
                            NavigationLink(destination: ForgotPasswordView()) {
                                Text(Localisation.forgotPasswordTitle)
                                    .foregroundColor(Color.ui.textColorBrown)
                                    .font(.system(size: 15, weight: .semibold))
                            }
                        }
                        .padding(.trailing, 36)
                        .padding(.top, 16)

                        Spacer(minLength: 40)

                        Button {
                            if viewModel.doLoginValidation() {
                                isLoggedIn.toggle()
                            }
                        } label: {
                            Text(Localisation.login)
                                .frame(maxWidth: .infinity)
                                .frame(height: 52)
                                .padding([.leading, .trailing], 36)
                        }
                        .buttonStyle(EdvoraButtonStyle())
                        .padding([.leading, .trailing], 36)
                        .fullScreenCover(isPresented: $isLoggedIn) {
                            HomeView(isLoggedOut: $isLoggedIn)
                        }

                        HStack {
                            Text(Localisation.noAccountTitle)
                                .foregroundColor(Color.ui.textLightForeground)
                                .font(.system(size: 15, weight: .regular))

                            NavigationLink(destination: SignupView()) {
                                Text(Localisation.signUpTitle)
                                    .foregroundColor(Color.ui.textColorBrown)
                                    .font(.system(size: 15, weight: .semibold))
                            }
                        }
                    }

                    Spacer()
                        .frame(height: 30)
                }
            }
        }
        .navigationViewStyle(.stack)
        .alert(isPresented: $viewModel.isInputsNotValid) {
            Alert(title: Text(viewModel.validationTitle),
                  message: Text(viewModel.validationMessage),
                  dismissButton: .default(Text(Localisation.alertOKTitle)))
        }
    }

}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

// MARK: - Localisation

private extension Localisation {
    static let login = NSLocalizedString("LOGIN", comment: "Title for login button")
    static let usernameTitle = NSLocalizedString("Username", comment: "Title for username")
    static let passwordTitle = NSLocalizedString("Password", comment: "Title for password")
    static let emailTitle = NSLocalizedString("Email", comment: "Title for email")
    static let forgotPasswordTitle = NSLocalizedString("Forgot password?", comment: "Title for forgot password button")
    static let noAccountTitle = NSLocalizedString("Don’t have an account?", comment: "Title for signup label")
    static let signUpTitle = NSLocalizedString("Sign up", comment: "Title for sign up button")
}
