//
//  EdvoraTextField.swift
//  EdvoraTest
//
//  Created by Diya Kasliwal on 14/12/21.
//

import SwiftUI
import Combine


protocol EdvoraTextFieldProtocol {
    var title: String { get }
    var image: UIImage { get }
    var textContentType: UITextContentType { get }

    func doValidationBasedOnValidationType(contentType: UITextContentType?, value: String)
    func setKeyboardType() -> UIKeyboardType
}


struct EdvoraTextField: EdvoraTextFieldProtocol, View {

    var title: String
    var image: UIImage
    var textContentType: UITextContentType

    @State private var isVisiblePassword: Bool = false
    @Binding var text: String
    @FocusState private var isFocused: Bool

    var body: some View {
        
        VStack (alignment: .leading) {

            Text(title)
                .foregroundColor(Color.ui.textLightForeground)
                .font(.system(size: 14))
                .padding(.leading, 16)
                .padding(.bottom, -2)

            ZStack {

                RoundedRectangle(cornerRadius: 10)
                    .stroke((isFocused || text.count > 0) ? Color.ui.borderSelected : Color.ui.borderNormal,
                            lineWidth: 1)

                HStack {

                    Image(uiImage: image)
                        .padding(.leading, 10)

                    if textContentType == .password {
                        if !isVisiblePassword {
                            SecureField("", text: $text)
                                .focused($isFocused)
                                .onChange(of: isFocused, perform: { changed in
                                    isFocused = changed
                                })
                                .font(.system(size: 17))
                                .frame(height: 58)
                                .disableAutocorrection(true)
                                .textContentType(.password)
                                .keyboardType(setKeyboardType())
                                .autocapitalization(.none)
                        }
                        else {
                            TextField("", text: $text)
                                .focused($isFocused)
                                .onChange(of: isFocused, perform: { changed in
                                    isFocused = changed
                                })
                                .font(.system(size: 17))
                                .frame(height: 58)
                                .disableAutocorrection(true)
                                .textContentType(.password)
                                .keyboardType(setKeyboardType())
                                .autocapitalization(.none)
                        }

                        Button {
                            isVisiblePassword.toggle()
                        } label: {
                            Image(systemName: isVisiblePassword ? "eye.fill" : "eye.slash.fill")
                                .foregroundColor(Color.ui.textColorBrown)
                                .imageScale(.large)
                        }
                        .padding()

                    }
                    else {

                        TextField("", text: $text)
                            .focused($isFocused)
                            .onChange(of: isFocused, perform: { changed in
                                isFocused = changed
                            })
                            .font(.system(size: 17))
                            .frame(height: 58)
                            .disableAutocorrection(true)
                            .textContentType(textContentType)
                            .keyboardType(setKeyboardType())
                            .autocapitalization(.none)
                            .onReceive(Just(text)) { newValue in
                                doValidationBasedOnValidationType(contentType: textContentType, value: newValue)
                            }
                    }
                }
            }
        }
        .padding(36)
        .frame(height: 70)
    }
}

// MARK: - On-edit validations

extension EdvoraTextField {

    
    func doValidationBasedOnValidationType(contentType: UITextContentType?, value: String) {
        guard let validationType = self.getValidationType(contentType: contentType) else { return }
        switch validationType {
        case .username: usernameOnEditValidation(value: value)
        default: break
        }
    }

   
    private func getValidationType(contentType: UITextContentType?) -> ValidationType? {
        guard let contentType = contentType else { return nil }
        switch contentType {
        case .username: return .username
        case .password: return .password
        case .emailAddress: return .email
        default:
            return nil
        }
    }

    
    private func usernameOnEditValidation(value: String) {
        guard let enteredText = value.last else { return }
        let allowedSpecialChars = [".", "_", "-"]
        if (allowedSpecialChars.contains(where: { Character($0) == enteredText })) {
            
        }
        else if enteredText == " " || enteredText.isNumber || (enteredText == Character(enteredText.uppercased())) {
            let _ = text.removeLast()
        }
    }

  
    func setKeyboardType() -> UIKeyboardType {
        switch textContentType {
        case .emailAddress: return .emailAddress
        default:
            return .default
        }
    }
}
