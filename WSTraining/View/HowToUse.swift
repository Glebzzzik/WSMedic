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
                    Spacer()
                    PageView(page: page)
                    Spacer()
                }.tag(page.tag)
            }
        }
        .animation(.easeInOut, value: pageIndex)
        .tabViewStyle(PageTabViewStyle())

    }
}

struct HowToUse_Previews: PreviewProvider {
    static var previews: some View {
        HowToUse()
    }
}
