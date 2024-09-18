//
//  LogoutButton.swift
//  TestProject_AppV2
//
//  Created by Arman Akash on 9/18/24.
//

import SwiftUI
import RealmSwift

struct LogoutButton: View {
    @State var isLoggingOut = false // State to track if logout is in progress.
    var body: some View {
        if let app = app {
            Button  {
                guard let user = app.currentUser else {
                    return // Do nothing if there's no current user.
                }
                isLoggingOut = true
                // Log out the current user from Realm (sync operation).
                user.logOut() { error in
                    if let error = error {
                        print("\(String(describing: error.localizedDescription))")
                        return
                    }
                    print("Logged Out") // Log success message.
                }
            } label: {
                Text("Logout")
                    .bold()
            }
            // Disable the button if there is no user or logout is in progress.
            .disabled(app.currentUser == nil || isLoggingOut)
        }
        else {
            // Show an empty view if the app object is not available.
            EmptyView()
        }
    }
}

