//
//  ShadowExtension.swift
//  BitCoinTracker
//
//  Created by maneesh on 31/08/20.
//  Copyright © 2020 maneesh. All rights reserved.
//

import UIKit
extension UIView {
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowOffset = .zero
        layer.shadowRadius = 2
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
