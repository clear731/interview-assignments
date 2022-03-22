//
//  CircleImageView.swift
//  MySwiftDemo
//
//  Created by clear on 2022/3/20.
//

import SwiftUI

// 网络图片loading + 展示
struct IconImageView: View {
    var imgUrl: String = ""
    @State var hasLoadImage: Bool = false
    @State var resultImage: UIImage? = nil
    var body: some View {
        if hasLoadImage {
            Image(uiImage: self.resultImage! )
                .resizable()
                .cornerRadius(8)
                .shadow(radius: 4)
        }
        else {
            ProgressView()
                .onAppear {
                    fetchWebImage(self.imgUrl){ webImage in
                        self.resultImage = webImage
                        self.hasLoadImage = true
                    }
                }
        }
        
    }
}

struct iconImageView_Previews: PreviewProvider {
    static var previews: some View {
        IconImageView(imgUrl: previewsItem.picUrl)
    }
}
