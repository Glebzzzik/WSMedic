//
//  REG.swift
//  WSTraining
//
//  Created by Глеб Голощапов on 08.04.2023.
//

import SwiftUI

struct REG: View {
    
    @State private var pol = false
    @State private var text = "SEX"
    
    var body: some View {
        VStack {
            
            DisclosureGroup(text, isExpanded: $pol) {
                Button {
                    self.text = "MAle"
                } label: {
                    Text("male")
                }

                Button {
                    self.text = "feMAle"
                } label: {
                    Text("female")
                }
            }
            .padding(.all, 20)
            .accentColor(.white)
            .foregroundColor(Color.white)
            .background(Color.blue)
            .cornerRadius(10)
            .padding(.all, 20)
            
        }
    }
}

struct REG_Previews: PreviewProvider {
    static var previews: some View {
        REG()
    }
}
