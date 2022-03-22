//
//  ContentView.swift
//  MySwiftDemo
//
//  Created by clear on 2022/3/20.
//

import SwiftUI


struct ContentView: View {

    init(){
        let backgroundGrayColor = UIColor.init(Color(red: 0xEF/255.0, green: 0xEF/255.0, blue:0xEF/255.0))
        // 设置导航栏背景色
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithOpaqueBackground()
        coloredAppearance.shadowColor = backgroundGrayColor
        coloredAppearance.backgroundColor = backgroundGrayColor
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    }
    
    var body: some View {
        NavigationView {
            ListContentView()
                .navigationViewStyle(StackNavigationViewStyle())
                .navigationTitle("App")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
