//
//  Group.swift
//  TestProject_AppV2
//
//  Created by Arman Akash on 9/17/24.
//

import RealmSwift

final class Group : Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var items = RealmSwift.List<Item>()
}
