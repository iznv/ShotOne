//
//  CGPath+Paths.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 01/06/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import UIKit

extension CGPath {
    
    static func circlePath(for rect: CGRect) -> CGPath {
        let radius: CGFloat = rect.width / 2
        
        return UIBezierPath(roundedRect: CGRect(x: 0,
                                                y: 0,
                                                width: 2.0 * radius,
                                                height: 2.0 * radius),
                            cornerRadius: radius).cgPath
    }
    
    static func trianglePath(for rect: CGRect) -> CGPath {
        let width = rect.width * 1.45
        let topMargin = rect.height * 0.05
        
        let path = CGMutablePath()
        path.move(to: CGPoint(x: width / 2, y: rect.height))
        path.addArc(tangent1End: CGPoint(x: 0, y: rect.height), tangent2End: CGPoint(x: width / 2, y: topMargin), radius: 0.5)
        path.addArc(tangent1End: CGPoint(x: width / 2, y: topMargin), tangent2End: CGPoint(x: width, y: rect.height), radius: 0.5)
        path.addArc(tangent1End: CGPoint(x: width, y: rect.height), tangent2End: CGPoint(x: width / 2, y: rect.height), radius: 0.5)
        path.closeSubpath()
        
        return path
    }
    
    static func rectanglePath(for rect: CGRect) -> CGPath {
        let delta = rect.width / 26
        let cornerRadius = rect.width / 4.33
        
        let path = UIBezierPath(roundedRect: rect.insetBy(dx: -delta, dy: -delta),
                            cornerRadius: cornerRadius)
        
        path.apply(CGAffineTransform(translationX: delta, y: 0))
        
        return path.cgPath
    }
    
    static func dropPath(for rect: CGRect) -> CGPath {
        let angleMargin = rect.height * 0.4
        let widthQuarter = rect.width / 4
        let widthMargin = rect.height / 5
        let translationX = rect.width / 2.6
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: rect.height))
        path.addQuadCurve(to: CGPoint(x: 0, y: angleMargin), controlPoint: CGPoint(x: -widthQuarter, y: (rect.height) / 2 + widthMargin))
        path.addQuadCurve(to: CGPoint(x: rect.width, y: angleMargin), controlPoint: CGPoint(x: rect.width / 2, y: 0))
        path.addQuadCurve(to: CGPoint(x: rect.width, y: rect.height), controlPoint: CGPoint(x: rect.width + widthQuarter, y: rect.height / 2 + widthMargin))
        path.addQuadCurve(to: CGPoint(x: 0, y: rect.height), controlPoint: CGPoint(x: rect.width / 2, y: rect.height + widthQuarter))
        path.close()
        
        path.apply(CGAffineTransform(translationX: translationX, y: 0))
        
        return path.cgPath
    }
    
}
