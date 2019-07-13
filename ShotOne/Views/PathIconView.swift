//
//  PathIconView.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 01/06/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import Utils

class PathIconView: BaseView {
    
    // MARK: - Constants
    
    private enum Constants {
        
        enum Shadow {
            
            static let radius: CGFloat = 3
            
            static let opacity: Float = 0.4
            
            static let dx: CGFloat = 0
            
            static let dy: CGFloat = 3
            
        }
        
    }
    
    // MARK: - Views
    
    lazy var pathLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        
        layer.contentsScale = UIScreen.main.nativeScale
        layer.fillColor = UIColor.clear.cgColor
        layer.lineWidth = 4.5
        
        return layer
    }()
    
    // MARK: - Properties
    
    var pathMaker: ((CGRect) -> CGPath)? {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var color: UIColor = .white {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var shouldShowShadow: Bool = true {
        didSet {
            setNeedsDisplay()
        }
    }
    
    // MARK: - Overrides
    
    override func commonInit() {
        super.commonInit()
        layer.addSublayer(pathLayer)
    }
    
    override func draw(_ rect: CGRect) {
        guard let pathMaker = pathMaker else { return }
        
        pathLayer.path = pathMaker(rect)
        pathLayer.strokeColor = color.cgColor
        
        if shouldShowShadow {
            pathLayer.addShadow(color: color,
                                radius: Constants.Shadow.radius,
                                opacity: Constants.Shadow.opacity,
                                dx: Constants.Shadow.dx,
                                dy: Constants.Shadow.dy)
        } else {
            pathLayer.shadowOpacity = 0
        }

        guard let box = pathLayer.path?.boundingBox else { return }
        
        pathLayer.position = CGPoint(x: rect.midX - box.width / 2,
                                     y: rect.midY - box.height / 2)
    }
    
}
