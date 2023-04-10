//
//  TryActionSheets.swift
//  WSTraining
//
//  Created by Глеб Голощапов on 10.04.2023.
//

import SwiftUI
import HalfModal

struct TryActionSheets: View {
    
    @State private var showingHalfModal = false
    
    var body: some View {
        ZStack {
             Button(action: {
                 withAnimation {
                     self.showingHalfModal = true
                 }
             }, label: {
                 Text("Show HalfModalView")
             })
             
             if showingHalfModal {
                 HalfModalView(content: AnyView(
                    VStack() {
                        VStack(spacing: 20) {
                            Text("описание")
                            Text("Клинический анализ крови – это самое важное комплексное лабораторное исследование при обследовании человека с любым заболеванием. Изменение исследуемых показателей, как правило, происходит задолго до появления видимых симптомов болезни. ")
                        }
                    }
                 
                 ), header: AnyView(Text("Клинический анализ крови с лейкоцитарной формулой").font(.system(size: 20).bold())), isPresented: $showingHalfModal)
             }
         }
    }
}

struct actionSheetView: View {
    var body: some View {
        VStack {
            Text("")
        }
    }
}

struct TryActionSheets_Previews: PreviewProvider {
    static var previews: some View {
        TryActionSheets()
    }
}
