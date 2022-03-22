//
//  LoadingMoreView.swift
//  MySwiftDemo
//
//  Created by clear on 2022/3/20.
//

import SwiftUI

// 加载更多 + 加载完
struct LoadingMoreView : View
{
    @Binding var hasMore :Bool
    var body: some View {
        HStack (alignment: .center){
            Spacer()
            if hasMore {
                HStack (alignment: .center, spacing: 10){
                    ProgressView()
                    Text("Loading")
                        .foregroundColor(Color.gray)
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 12, trailing: 0))
            }
            else {
                Text("No More Data.")
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 12, trailing: 0))
                    .foregroundColor(Color.gray)
            }
            Spacer()
        }
        .listRowBackground(Color.clear)
    }
}
