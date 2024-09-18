//
//  Item.swift
//  TestProject_AppV2
//
//  Created by Arman Akash on 9/17/24.
//

import RealmSwift

struct LoremIpsum {
    static var name: String {
        "Sample Name" // Replace with any default text you want
    }
}

final class Item: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var name = "Default Name"  // This is a persisted property stored in Realm
    @Persisted(originProperty: "items") var group: LinkingObjects<Group>
}

