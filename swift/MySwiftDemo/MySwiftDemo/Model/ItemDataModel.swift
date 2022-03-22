//
//  ItemModel.swift
//  MySwiftDemo
//
//  Created by clear on 2022/3/20.
//

import Foundation

// 网络数据解析struct
struct ItemDataModel: Hashable, Codable {
    var trackId: Int
    var artworkUrl60: String // 图
    var releaseNotes: String // 标题
    var description: String // 副标题
}

