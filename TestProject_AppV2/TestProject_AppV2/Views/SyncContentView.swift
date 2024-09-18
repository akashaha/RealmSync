//
//  SyncContentView.swift
//  TestProject_AppV2
//
//  Created by Arman Akash on 9/18/24.
//

import SwiftUI
import RealmSwift
struct SyncContentView: View {
    @ObservedObject var app : RealmSwift.App
    var body: some View {
        if let user = app.currentUser {
            OpenSyncedRealmView()
                .environment(\.partitionValue, user.id)
        }
        else {
            LoginView()
        }
    }
    
}
