//
//  ListViewModel.swift
//  MySwiftDemo
//
//  Created by clear on 2022/3/20.
//

import Foundation
// 页面状态流转
@MainActor class ListViewModel : ObservableObject
{
    // 是否首次加载数据
    @Published var hasLoadData = false
    // 是否加载完
    @Published var hasMore = true
    // 数据源
    @Published var dataSource: [ListCellModel] = []
    // 页码
    var page: Int = 0
    
    // 请求首页数据
    func loadFistPageData() async {
        do {
            let (errorCode,listData) = try await requestListData(page)
            if errorCode == 0 && listData.count > 0 {
                self.dataSource = listData
                self.page += 1
            }
            else if errorCode == 0 {
                // 空白页面
                self.dataSource = []
            }
            else {
                // 出错页面
                print("下拉刷新出错!")
            }
            self.hasLoadData = true
        } catch {
            print(error)
        }
    }
    
    // 重新加载首页数据
    func reloadFirstPageData() async {
        self.page = 0
        self.hasMore = true
        do {
            let (errorCode,listData) = try await requestListData(page)
            if errorCode == 0 && listData.count > 0 {
                self.dataSource = listData
                self.page += 1
            }
            else if errorCode == 0 {
                // 空白页面
                self.dataSource = []
            }
            else {
                // 出错页面
                print("下拉刷新出错!")
            }
        } catch {
            print(error)
        }
    }
    
    func loadMoreData() async {
        if self.hasMore == false {
            return
        }
        do {
            let (errorCode,listData) = try await requestListData(page)
            if errorCode == 0 && listData.count > 0 {
                self.dataSource += listData
                self.page += 1
            }
            else if errorCode == 0 {
                // 没数据了
                self.hasMore = false
            }
            else {
                // 出错
                print("翻页出错!")
            }
           
        } catch {
            print(error)
        }
    }
}
