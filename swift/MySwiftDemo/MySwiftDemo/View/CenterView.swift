//
//  LoadingView.swift
//  MySwiftDemo
//
//  Created by clear on 2022/3/20.
//

import SwiftUI

// 默认 loading 背景色
let defaultBgColor: Color = Color(red: 0xEF/255.0, green: 0xEF/255.0, blue:0xEF/255.0)

// content居中
struct CenterView<Content: View>: View {
    let content: Content
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                self.content
                Spacer()
            }
            Spacer()
        }
        .background(defaultBgColor)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        CenterView {
            ProgressView()
        }
    }
}
