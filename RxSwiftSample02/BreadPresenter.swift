//
//  BreadPresenter.swift
//  RxSwiftSample02
//
//  Created by 伊藤静那(Ito Shizuna) on 2018/01/14.
//  Copyright © 2018年 ShizunaIto. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources

class BreadPresenter {
    enum Taste: String {
        case moist = "しっとり"
        case fluffy = "ふわふわ"
    }
    
    let breads = Observable.just([
        SectionModel(model: "メロンパン", items: [
            Bread(name: "木村屋", taste: Taste.moist.rawValue, imageId: "kimuraya"),
            Bread(name: "花月堂", taste: Taste.fluffy.rawValue, imageId: "kagetsudo")
        ]),
        
        SectionModel(model: "あんぱん", items: [
            Bread(name: "セントル　ザ・ベーカリー", taste: Taste.moist.rawValue, imageId: "centre"),
            Bread(name: "シニフィアン　シニフィエ", taste: Taste.fluffy.rawValue, imageId: "shinifian"),
            Bread(name: "一本堂", taste: Taste.fluffy.rawValue, imageId: "ippondo")
        ]),
        
        SectionModel(model: "ベーグル", items: [
            Bread(name: "ぐるぐるべーぐる", taste: Taste.moist.rawValue, imageId: "guruguru")
        ])
    ])
}
