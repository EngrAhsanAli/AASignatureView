//
//  AASignatureView+Helper.swift
//  AASignatureView
//
//  Created by Engr. Ahsan Ali on 19/01/2017.
//  Copyright (c) 2017 AA-Creations. All rights reserved.
//

import UIKit


// MARK: - UIImage extenison

extension UIImage {
    
    /// Responsible for converting UIView to UImage
    ///
    /// - Parameter view: view to convert
    convenience init(view: UIView) {
        UIGraphicsBeginImageContext(view.bounds.size)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.init(cgImage: (image?.cgImage)!)
    }
}

// MARK: - UIColor extenison

extension UIColor {
    
    /// hex value for color
    ///
    /// - Parameter rgb: hex value
    convenience init(rgb: UInt) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

// MARK: - AASignatureView extenison

extension AASignatureView {
    /// Insert Touch Point in array
    ///
    /// - Parameters:
    ///   - touch: touch location of first index
    ///   - index: control points index counter
    func insertTouch(touch: CGPoint, at index: Int) {
        ctr = index
        touches.insert(touch, at: ctr)
    }
}

// MARK: - UIBezierPath extenison

extension UIBezierPath {
    
    
    /// Responsible to move and add curve after calculating mid point between two specified indexes.
    ///
    /// - Parameters:
    ///   - a: point 1
    ///   - b: point 2
    ///   - c: point 3
    ///   - d: point 4
    /// - Returns: Calculated mid point
    func moveWithCurve(a: CGPoint, b: CGPoint, c: CGPoint, d: CGPoint) -> CGPoint {
        
        var midPoint = a
        move(to: midPoint)
        midPoint = getMidPoint(a: c, b: d)
        addCurve(to: midPoint, controlPoint1: b, controlPoint2: c)
        return midPoint
    }
    
    
    /// Add point in current path at specified point
    ///
    /// - Parameters:
    ///   - origin: Point to insert dot
    ///   - size: size of dot for equal width and height
    func addDot(origin: CGPoint, size: CGFloat) {
        let rect = CGRect(origin: origin, size: CGSize(width: size, height: size))
        let dotPath = UIBezierPath(ovalIn: rect)
        append(dotPath)

    }
    
    /// Calculation of midpoint between two points
    ///
    /// - Parameters:
    ///   - a: point 1
    ///   - b: point 2
    /// - Returns: resultant midpoint
    fileprivate func getMidPoint(a: CGPoint, b: CGPoint) -> CGPoint {
        return CGPoint(x: (a.x + b.x)/2.0, y: (a.y + b.y)/2.0)
    }
    
}
