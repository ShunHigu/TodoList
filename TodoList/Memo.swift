//
//  Memo.swift
//  TodoList
//
//  Created by 日暮駿之介 on 2022/09/06.
//

import Foundation
import RealmSwift

class Memo:Object{
    @objc dynamic var title:String=""
    @objc dynamic var content:String=""
    @objc dynamic var day:String=""
}
