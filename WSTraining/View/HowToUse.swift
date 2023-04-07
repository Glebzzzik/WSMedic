//
//  HowToUse.swift
//  WSTraining
//
//  Created by Глеб Голощапов on 29.03.2023.
//

import SwiftUI

struct HowToUse: View {

    @State private var pageIndex: Int = 0
    private let pages: [Page] = Page.samplePages

    
    var body: some View {
        TabView(selection: $pageIndex) {
            ForEach(pages) { page in
                VStack() {
                    
                    PageView(page: page)
                    
                }.tag(page.tag)
            }
        }
        .animation(.easeInOut, value: pageIndex)
        .tabViewStyle(.page)

    }
}

struct HowToUse_Previews: PreviewProvider {
    static var previews: some View {
        HowToUse()
    }
}
