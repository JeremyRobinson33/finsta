//
//  UIImage+Size.swift
//  Fakestagram
//
//  Created by Jeremy Robinson on 11/1/18.
//  Copyright © 2018 Jeremy Robinson. All rights reserved.
//

import UIKit

extension UIImage {
    var aspectHeight: CGFloat {
        let heightRatio = size.height / 736
        let widthRatio = size.width / 414
        let aspectRatio = fmax(heightRatio,widthRatio)
        return size.height / aspectRatio
    }
}
