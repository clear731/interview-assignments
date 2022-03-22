//
//  ListView.swift
//  MySwiftDemo
//
//  Created by clear on 2022/3/20.
//

import SwiftUI

struct ListContentView: View {
    @StateObject private var viewModel: ListViewModel = ListViewModel()
    var body: some View {
        if viewModel.hasLoadData {
            if viewModel.dataSource.count > 0 {
                List {
                    ForEach(0..<viewModel.dataSource.count, id: \.self) { index in
                        let item = viewModel.dataSource[index]
                        ListCell(model: item)
                    }
                    LoadingMoreView(hasMore: $viewModel.hasMore)
                    .onAppear(perform: {
                        Task {
                            await viewModel.loadMoreData()
                        }
                    })
                }
                .refreshable(action: {
                    await viewModel.reloadFirstPageData()
                })
                .background(Color(red: 0xEF/255.0, green: 0xEF/255.0, blue:0xEF/255.0))
                .ignoresSafeArea(edges: .bottom)

            }
            else {
                CenterView {
                    Text("暂无数据")
                }
            }
        }
        else {
            CenterView {
                ProgressView()
                    .onAppear {
                        Task {
                            await viewModel.loadFistPageData()
                        } 
                    }
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    let listData : ListCellModel = ListCellModel()
    static var previews: some View {
        ForEach(["iPhone XS Max"], id: \.self) { deviceName in
            ListContentView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
