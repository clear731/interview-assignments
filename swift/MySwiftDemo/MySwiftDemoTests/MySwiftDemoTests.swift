//
//  MySwiftDemoTests.swift
//  MySwiftDemoTests
//
//  Created by clear on 2022/3/20.
//

import XCTest
@testable import MySwiftDemo
import SwiftUI

class MySwiftDemoTests: XCTestCase {

    // 页面状态流转
    func testListViewState() async -> Void {
        let viewModel: ListViewModel = ListViewModel()
        
        // 首页是否加载标记位
        XCTAssertFalse(viewModel.hasLoadData)
        await viewModel.loadFistPageData()
        XCTAssertTrue(viewModel.hasLoadData)
        
        // 翻页结束标记位 固定3页，四次请求返空
        XCTAssertTrue(viewModel.hasMore)
        await viewModel.loadMoreData()
        await viewModel.loadMoreData()
        XCTAssertTrue(viewModel.hasMore)
        await viewModel.loadMoreData()
        XCTAssertFalse(viewModel.hasMore)

        // 检查页数
        XCTAssertTrue(viewModel.page == 3)
        
        // 下拉刷新
        await viewModel.reloadFirstPageData()
        XCTAssertTrue(viewModel.page == 1)
    }
    
    // 收藏数据存储
    func testFavorite()->Void {
        // 增加收藏
        XCTAssertTrue(favoriteList.isEmpty)
        addFavorite(3456, true)
        let result1:Bool = readFavorite(3456)
        XCTAssertTrue(result1)
        
        // 取消收藏
        addFavorite(3456, false)
        let result2:Bool = readFavorite(3456)
        XCTAssertFalse(result2)
    }

}
