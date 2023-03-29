//
//  PageModel.swift
//  WSTraining
//
//  Created by Глеб Голощапов on 29.03.2023.
//

import Foundation

struct Page: Identifiable, Equatable {
    
    let id = UUID()
    var name, description, imageName, buttonText: String
    var tag: Int
    
    static var samplePage = Page(name: "Анализы", description: "Экспресс сбор и получение проб", imageName: "analysis", buttonText: "Пропустить",  tag: 0)

    static var samplePages: [Page] = [
        Page(name: "Анализы", description: "Экспресс сбор и получение проб", imageName: "analysis", buttonText: "Пропустить",  tag: 0),
        Page(name: "Уведомления", description: "Вы быстро узнаете о результатах", imageName: "alerts", buttonText: "Пропустить",  tag: 1),
        Page(name: "Мониторинг", description: "Наши врачи всегда наблюдают за вашими показателями здоровья", imageName: "monitoring", buttonText: "Завершить",  tag: 2)


    ]
}
