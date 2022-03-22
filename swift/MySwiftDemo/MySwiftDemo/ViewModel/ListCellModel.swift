//
//  ListModel.swift
//  MySwiftDemo
//
//  Created by clear on 2022/3/20.
//

import Foundation
import SwiftUI

// cell卡片的视觉数据
class ListCellModel : ObservableObject
{
    var trackId: Int = 0
    var picUrl: String = ""
    var title: String = ""
    var description: String = ""
    var isFavorite: Bool = false
}

// 预览数据初始化
let previewsItem: ListCellModel = getPreviewsItem()
func getPreviewsItem() -> ListCellModel
{
    let item: ListCellModel = ListCellModel()
    previewsItem.picUrl = "https://is2-ssl.mzstatic.com/image/thumb/Purple116/v4/06/8c/e5/068ce5a0-8a33-41ee-488a-95067d2b241a/source/60x60bb.jpg"
    item.title = "Every update has behind-the-scenes upgrades to make Viber better ;) Always get the latest version for the best Viber experience\n\nViber respects your privacy and it is a top priority for us, just like it is for you."
    item.description = "Viber is the FREE, simple, fast, and secure messaging and calling app. It’s the messenger of choice for hundreds of millions of users worldwide!\n\nViber is the perfect chat and video messaging app to stay connected!\n\nMake Free Audio and Video Calls\n\nMake crystal-clear audio and video calls to friends and family."
    return item
}
