//
//  ListDataModel.swift
//  MySwiftDemo
//
//  Created by clear on 2022/3/20.
//

import Foundation

// 网络数据解析struct
struct ListDataModel: Hashable, Codable {
    var results : [ItemDataModel]? // 数据列表
    var resultCount: Int = 0 // 数据条数
}
