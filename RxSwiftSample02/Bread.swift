//
//  Bread.swift
//  RxSwiftSample02
//
//  Created by 伊藤静那(Ito Shizuna) on 2018/01/14.
//  Copyright © 2018年 ShizunaIto. All rights reserved.
//

import UIKit
import RxDataSources

struct Bread {
    let name: String
    let taste: String
    let imageId: String
    var image: UIImage?

    init(name: String, taste: String, imageId: String) {
        self.name = name
        self.taste = taste
        self.imageId = imageId
        image = UIImage(named: imageId)
    }
}

extension Bread: IdentifiableType {
    typealias Identity = String
    var identity: Identity { return imageId }
}
