//
//  CurrencyView.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 25/03/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import UIKit

// MARK: - Constants

private struct Constants {
    
    struct Bar {
        
        struct Shadow {
            
            static let dx: CGFloat = -3
            
            static let opacity: Float = 0.7
            
            static let radius: CGFloat = 5
            
        }
        
    }
    
    struct Title {
        
        static let color = #colorLiteral(red: 0.6, green: 0.631372549, blue: 0.7843137255, alpha: 1)
        
        static let textAlignment: NSTextAlignment = .center
        
    }
    
    struct Value {
        
        static let color = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        static let textAlignment: NSTextAlignment = .center
        
    }
    
}

// MARK: - Defaults

private struct Defaults {
    
    struct Background {
        
        static let cornerRadius: CGFloat = 37
        
        static let topPadding: CGFloat = 26
        
        static let colors = [ #colorLiteral(red: 0.2235294118, green: 0.2352941176, blue: 0.4117647059, alpha: 1), #colorLiteral(red: 0.1529411765, green: 0.1882352941, blue: 0.2980392157, alpha: 1) ]
        
    }
    
    struct Bar {
        
        static let cornerRadius: CGFloat = 1.5
        
        static let height: CGFloat = 112
        
        static let leftMargin: CGFloat = 29.5
        
        static let width: CGFloat = 4
        
        static let color = #colorLiteral(red: 0.09803921569, green: 0.8235294118, blue: 0.4941176471, alpha: 1)
        
    }
    
    struct Title {
        
        static let text: String = .empty
        
        static let attributedText = NSAttributedString(string: .empty)
        
        static let bottomMargin: CGFloat = 48
        
        static let font: UIFont? = .systemFont(ofSize: 12, weight: .bold)
        
    }
    
    struct Value {
        
        static let text: String = .empty
        
        static let attributedText = NSAttributedString(string: .empty)
        
        static let offset: CGFloat = 12
        
        static let font: UIFont? = .systemFont(ofSize: 26, weight: .medium)
        
    }
    
}

class CurrencyView: BaseView {
    
    // MARK: - Layers
    
    private lazy var backgroundLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        
        layer.cornerRadius = Defaults.Background.cornerRadius
        layer.set(colors: Defaults.Background.colors)
        
        layer.layout(topPadding: Defaults.Background.topPadding, relativeTo: self)
        
        return layer
    }()
    
    private lazy var barLayer: CALayer = {
        let layer = CALayer()
        
        layer.cornerRadius = Defaults.Bar.cornerRadius
        layer.set(barColor: Defaults.Bar.color)
        
        layer.layout(leftMargin: Defaults.Bar.leftMargin,
                     width: Defaults.Bar.width,
                     height: Defaults.Bar.height)
        
        return layer
    }()
    
    // MARK: - Views
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.font = Defaults.Title.font
        label.textColor = Constants.Title.color
        label.textAlignment = Constants.Title.textAlignment
        
        return label
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        
        label.font = Defaults.Value.font
        label.textColor = Constants.Value.color
        label.textAlignment = Constants.Value.textAlignment
        
        return label
    }()
    
    // MARK: - Constraints
    
    lazy var titleBottomConstraint = titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                                        constant: -titleBottomMargin)
    
    
    lazy var valueCenterYConstraint = valueLabel.centerYAnchor.constraint(equalTo: centerYAnchor,
                                                                          constant: valueOffset)
    
    // MARK: - Properties
    
    @objc dynamic var attributedTitle = Defaults.Title.attributedText {
        didSet { titleLabel.attributedText = attributedTitle }
    }
    
    @objc dynamic var attributedValue = Defaults.Value.attributedText {
        didSet { valueLabel.attributedText = attributedValue }
    }
    
    @objc dynamic var backgroundColors = Defaults.Background.colors {
        didSet { backgroundLayer.set(colors: backgroundColors) }
    }
    
    @objc dynamic var backgroundCornerRadius = Defaults.Background.cornerRadius {
        didSet { backgroundLayer.cornerRadius = backgroundCornerRadius }
    }
    
    @objc dynamic var backgroundTopPadding = Defaults.Background.topPadding {
        didSet { layoutBackgroundLayer() }
    }
    
    @objc dynamic var barColor = Defaults.Bar.color {
        didSet { barLayer.set(barColor: barColor) }
    }
    
    @objc dynamic var barCornerRadius = Defaults.Bar.cornerRadius {
        didSet { barLayer.cornerRadius = barCornerRadius }
    }
    
    @objc dynamic var barHeight = Defaults.Bar.height {
        didSet { layoutBarLayer() }
    }
    
    @objc dynamic var barLeftMargin = Defaults.Bar.leftMargin {
        didSet { layoutBarLayer() }
    }
    
    @objc dynamic var barWidth = Defaults.Bar.width {
        didSet { layoutBarLayer() }
    }
    
    @objc dynamic var title = Defaults.Title.text {
        didSet { titleLabel.text = title }
    }
    
    @objc dynamic var titleBottomMargin = Defaults.Title.bottomMargin {
        didSet { titleBottomConstraint.constant = -titleBottomMargin }
    }
    
    @objc dynamic var titleFont = Defaults.Title.font {
        didSet { titleLabel.font = titleFont }
    }
    
    @objc dynamic var value = Defaults.Value.text {
        didSet { valueLabel.text = value }
    }
    
    @objc dynamic var valueFont = Defaults.Value.font {
        didSet { valueLabel.font = valueFont }
    }
    
    @objc dynamic var valueOffset = Defaults.Value.offset {
        didSet { valueCenterYConstraint.constant = valueOffset }
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layoutBackgroundLayer()
        layoutBarLayer()
    }
    
    // MARK: - Overrides
    
    override func initialize() {
        addViews()
        configureConstraints()
    }
    
}

// MARK: - Subviews

private extension CurrencyView {
    
    func addViews() {
        layer.addSublayers(
            backgroundLayer,
            barLayer
        )
        
        addSubviews(
            valueLabel,
            titleLabel
        )
    }
    
}

// MARK: - Layout

private extension CurrencyView {
    
    // MARK: - Manual
    
    func layoutBackgroundLayer() {
        backgroundLayer.layout(topPadding: backgroundTopPadding, relativeTo: self)
    }
    
    func layoutBarLayer() {
        barLayer.layout(leftMargin: barLeftMargin,
                        width: barWidth,
                        height: barHeight)
    }
    
    // MARK: - Auto
    
    func configureConstraints() {
        layoutTitleLabel()
        layoutValueLabel()
    }
    
    func layoutTitleLabel() {
        titleLabel.activate(
            titleLabel.widthAnchor.constraint(equalTo: widthAnchor),
            titleBottomConstraint
        )
    }
    
    func layoutValueLabel() {
        valueLabel.activate(
            valueLabel.widthAnchor.constraint(equalTo: widthAnchor),
            valueCenterYConstraint
        )
    }
    
}

// MARK: - Private

private extension CALayer {
    
    func set(barColor: UIColor) {
        backgroundColor = barColor.cgColor
        
        addShadow(color: barColor,
                  radius: Constants.Bar.Shadow.radius,
                  opacity: Constants.Bar.Shadow.opacity,
                  dx: Constants.Bar.Shadow.dx)
    }
    
}
