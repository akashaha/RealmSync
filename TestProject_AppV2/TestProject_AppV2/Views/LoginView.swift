//
//  LoginView.swift
//  TestProject_AppV2
//
//  Created by Arman Akash on 9/18/24.
//

import SwiftUI
import RealmSwift

struct LoginView: View {
    @State var error : Error? // State to track login errors.
    @State var isLoggingIn = false // State to track login progress.
    var body: some View {
        VStack {
            if isLoggingIn {
                ProgressView() // Show a progress view during login.
            }
            if let error = error {
                // Display any login errors.
                Text("Error: \(error.localizedDescription)")
            }

            // Button to trigger anonymous login.
            Button(action: {
                login()
            }, label: {
                Text("Login Anonymously")
                    .bold()
            })
            .buttonBorderShape(.capsule)
            // Disable the button while logging in.
            .disabled(isLoggingIn)
        }
    }

    func login() {
        isLoggingIn = true
        // Perform anonymous login with Realm (syncs data with server).
        app!.login(credentials: .anonymous) { result in
            if case let .failure(error) = result {
                print("Failed to login \(error.localizedDescription)")
                self.error = error // Capture the error in state.
                return
            }
            print("Logged In") // Log success message.
        }
    }
}

