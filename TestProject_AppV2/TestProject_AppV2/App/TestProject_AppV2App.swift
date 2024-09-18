//
//  TestProject_AppV2App.swift
//  TestProject_AppV2
//
//  Created by Arman Akash on 9/17/24.
//

import SwiftUI
import RealmSwift

// Uncommenting this would declare a Realm app without initializing it.
// let app: RealmSwift.App? = nil

// Initializing the Realm app using the Sync app ID from Setup struct (syncAppId is necessary for server sync).
let app: RealmSwift.App? = RealmSwift.App(id: Setup.syncAppId)

@main
struct TestProject_AppV2App: SwiftUI.App {
    var body: some Scene {
        WindowGroup {
            // Check if sync is enabled by checking if 'app' is initialized.
            if let app = app {
                // If sync is available, load the SyncContentView (will handle syncing data).
                SyncContentView(app: app)
                // EmptyView() // Uncomment to replace content view with an empty view.
            } else {
                // If no sync, load the local-only view (no server sync).
                LocalOnlyContentView()
            }
        }
    }
}
