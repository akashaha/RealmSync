//
//  OpenSyncedRealmView.swift
//  TestProject_AppV2
//
//  Created by Arman Akash on 9/18/24.
//

import SwiftUI
import RealmSwift

struct OpenSyncedRealmView: View {
    // Async open for the Realm (syncs with server using appId and partitionValue).
    @AsyncOpen(appId: Setup.syncAppId, partitionValue: "", timeout: 4000) var asyncOpen
    var body: some View {
        switch asyncOpen {
        case .connecting:
            ProgressView() // Show a progress view while connecting.
        case .waitingForUser:
            ProgressView("Waiting for user to log in.") // Waiting for user to log in before syncing.
        case .open(let realm):
            // Successfully opened synced realm. Load ItemsView with synced group data.
            NavigationStack {
                ItemsView(group: {
                    if realm.objects(Group.self).count == 0 {
                        try! realm.write {
                            realm.add(Group()) // Add a new group if none exists (syncs data to server).
                        }
                    }
                    return realm.objects(Group.self).first! // Return the first group.
                }()).environment(\.realm, realm) // Provide the realm environment to the view.
            }
        case .progress(let progress):
            ProgressView() // Show progress of syncing.
        case .error(let error):
            ErrorView(error: error) // Show error view if there's an issue opening the realm.
        }
    }
}

#Preview {
    // Preview for the synced realm content.
    OpenSyncedRealmView()
}


