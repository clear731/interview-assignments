//
//  NetworkHelper.swift
//  MySwiftDemo
//
//  Created by clear on 2022/3/20.
//  网络接口

import Foundation
import SwiftUI

func requestListData(_ page: Int) async throws -> (errorCode: Int,arrayModel:[ListCellModel]) {
    let urlString: String = String(format: "https://itunes.apple.com/search?entity=software&limit=10&term=chat&page=%ld",page)
    var url: URL!
    url = URL(string:urlString)
    //发出请求
    let request = URLRequest(url: url)
    let (data, response) = try await URLSession.shared.data(for: request)
    var code:Int = -1
    if let responsed =  response as? HTTPURLResponse {
        let httpCode: Int = responsed.statusCode
        if httpCode >= 200 && httpCode < 300 {
            code = 0
        }
    }
    guard code == 0 else {
        let errorDesc = "网络出错!"
        print(errorDesc)
        return (-1, [])
    }
    // 翻页暂时解决方案，强制第四页翻页结束
    guard page < 3 else {
        print("数据为空!")
        return (0, [])
    }
    // 数据转换
    let resultModel: ListDataModel = parseData(data)
    let arrayModel : [ListCellModel] = covertModes(resultModel)
    return (0, arrayModel)
}


// 数据转化
func covertModes(_ resultModel: ListDataModel)->[ListCellModel]
{
    let results :[ItemDataModel] = resultModel.results!
    let resultCount :Int = resultModel.resultCount - 1
    
    var arrayModel : [ListCellModel] = []
    for index in 0...resultCount {
        let viewModel : ListCellModel = ListCellModel()
        let item = results[index]
        viewModel.trackId = item.trackId
        viewModel.picUrl = item.artworkUrl60
        viewModel.title = item.releaseNotes
        viewModel.description = item.description
        viewModel.isFavorite = readFavorite(item.trackId)
        arrayModel += [viewModel]
    }
    return arrayModel;
}

// 解析数据
func parseData<T: Decodable>(_ data: Data) -> T {
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(error)")
    }
}

// 收藏状态变化,存储本地
var favoriteList: Set<String> = []
func addFavorite(_ trackID: Int, _ isFavorite: Bool)
{
    let trackIDKey: String = String(format:"%ld",trackID)
    if favoriteList.contains(trackIDKey) {
        favoriteList.remove(trackIDKey)
    }
    if isFavorite {
        favoriteList.insert(trackIDKey)
    }
}

// 读取本地收藏记录
func readFavorite(_ trackID: Int)->Bool
{
    if favoriteList.isEmpty {
        return false
    }
    let trackIDKey: String = String(format:"%ld",trackID)
    if favoriteList.contains(trackIDKey) {
        return true
    }
    return false
}

// 加载网络图片
typealias completeBlock = (_ webImage: UIImage)->Void;
func fetchWebImage(_ imgUrl: String,_ complete: @escaping completeBlock)
{
    guard let url = URL(string: imgUrl) else { return } //初始化一个字符串常量，作为网络图片的地址
    URLSession.shared.dataTask(with: url){ (data, response, error) in
        if let webImage = UIImage(data: data!){
            complete(webImage)
        }
        else{
            let placeholder: UIImage = UIImage(named: "previews_img")! //占位图
            complete(placeholder)
            print(error ?? "") //如果图片下载失败之后，则在控制台输出错误信息
        }
    }.resume()
}
