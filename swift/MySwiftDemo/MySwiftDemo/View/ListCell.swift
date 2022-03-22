//
//  ItemView.swift
//  MySwiftDemo
//
//  Created by clear on 2022/3/20.
//

import SwiftUI

// cell 卡片
struct ListCell: View {
    var model: ListCellModel
    var body: some View {
        HStack (alignment: .center){
            // icon
            IconImageView(imgUrl: self.model.picUrl)
                .frame(width: 50, height: 50)
            // 文案
            VStack (alignment:.leading){
                Text(model.title)
                    .lineLimit(1)
                    .font(.system(size: 14))
                Text(model.description)
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                    .lineLimit(2)
            }
            Spacer()
            // 收藏 icon
            FavoriteImageView(isFavorite: self.model.isFavorite, traskId: self.model.trackId)
        }
        .listRowBackground(Color.clear)
        .listRowSeparator(.hidden)
        .padding(EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12))
        .background(Color.white)
        .cornerRadius(8)
        .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
        // 以上cell设置顺序有要求
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListCell(model: previewsItem)
    }
}
