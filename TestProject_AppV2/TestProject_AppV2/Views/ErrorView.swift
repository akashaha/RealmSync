//
//  ErrorView.swift
//  TestProject_AppV2
//
//  Created by Arman Akash on 9/17/24.
//

import SwiftUI

struct ErrorView: View {
    var error: Error
    var body: some View {
        VStack {
            // Display the error message in case the Realm fails to open.
            Text("Error opening the realm: \(error.localizedDescription)")
        }
    }
}
