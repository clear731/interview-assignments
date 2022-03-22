//
//  FavoriteImageView.swift
//  MySwiftDemo
//
//  Created by clear on 2022/3/20.
//

import SwiftUI

// 收藏标记
struct FavoriteImageView: View {
    @State var isFavorite: Bool = false
    var traskId: Int = 0
    var body: some View {
        VStack {
            Spacer()
            Button(action: {
                // 请求网络接口
                addFavorite(self.traskId, !self.isFavorite)
                withAnimation() {
                    // 先记录本地的
                    self.isFavorite = !self.isFavorite
                }
            }) {
                Image(self.isFavorite ? "favoriteHL" : "favorite")
                    .scaleEffect(self.isFavorite ? 1.2 : 1.0)
            }
            Spacer()
        }
    }
}

struct FavoriteImageView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteImageView()
    }
}
