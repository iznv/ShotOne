//
//  BottomPanel.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 23/04/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import UIKit

// MARK: - Constants

private enum Constants {
    
    enum Animation {
        
        enum Duration {
            
            static let slow: TimeInterval = 0.5
            
            static let fast: TimeInterval = 0.25
            
        }
        
        static let options: UIView.AnimationOptions = [
            .curveEaseOut,
            .beginFromCurrentState,
            .allowUserInteraction
        ]
        
        static let initialSpringVelocity: CGFloat = 0.8
        
        static let springDamping: CGFloat = 0.7
        
    }

    enum TranslationMultiplier {
        
        static let isOutside: CGFloat = 0.1
        
        static let isNotOutside: CGFloat = 1
        
    }
    
    static let transitionThreshold: CGFloat = 100
    
}

class BottomPanel {
    
    // MARK: - Properties
    
    private var isOutside = false
    
    private let positions: [BottomPanelPosition]
    
    // MARK: - Content
    
    let contentViewController: UIViewController
    
    // MARK: - Init
    
    init(contentViewController: UIViewController,
         positions: [BottomPanelPosition]) {
        
        self.contentViewController = contentViewController
        self.positions = positions
        
        addPanGestureRecognizer()
    }
    
}

// MARK: - Computed Properties

extension BottomPanel {
    
    private var contentView: UIView {
        return contentViewController.view
    }
    
}

// MARK: - Public

extension BottomPanel {
    
    func embed(in parentViewController: UIViewController) {
        guard let lastPosition = positions.last else { return }
        
        parentViewController.addChild(contentViewController)
        parentViewController.view.addSubview(contentView)
        contentViewController.didMove(toParent: parentViewController)

        contentView.frame = CGRect(x: 0,
                                   y: parentViewController.view.frame.maxY - lastPosition.value,
                                   width: parentViewController.view.frame.width,
                                   height: parentViewController.view.frame.height)
    }
    
}

// MARK: - Gestures

private extension BottomPanel {
    
    @objc func pan(_ recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .began, .changed:
            onPanChanged(recognizer)
        case .cancelled, .ended, .failed:
            onPanCompleted(recognizer)
        default:
            return
        }
    }
    
    func onPanChanged(_ recognizer: UIPanGestureRecognizer) {
        guard let max = positions.max()?.value else { return }
        guard let min = positions.min()?.value else { return }
        
        let translation = recognizer.translation(in: contentView).y
        let targetY = contentView.frame.origin.y + translation

        isOutside = targetY > max || targetY < min
        
        let multiplier: CGFloat = isOutside
            ? Constants.TranslationMultiplier.isOutside
            : Constants.TranslationMultiplier.isNotOutside
        
        contentView.frame = CGRect(x: 0,
                                   y: contentView.frame.origin.y + translation * multiplier,
                                   width: contentView.frame.width,
                                   height: contentView.frame.height)
        
        recognizer.setTranslation(.zero, in: contentView)
    }

    func onPanCompleted(_ recognizer: UIPanGestureRecognizer) {
        let velocity = recognizer.velocity(in: contentView).y
        
        if abs(velocity) < Constants.transitionThreshold {
            moveToNearestPosition()
            return
        }
        
        guard let nextPosition = nearPosition(for: velocity) else { return }

        if isOutside {
            normalTransition(to: nextPosition, duration: Constants.Animation.Duration.slow)
        } else {
            springTransition(to: nextPosition, duration: Constants.Animation.Duration.slow)
        }
    }
    
}

// MARK: - Animations

private extension BottomPanel {
    
    func normalTransition(to position: BottomPanelPosition,
                          duration: TimeInterval) {
        
        UIView.animate(withDuration: duration,
                       delay: 0,
                       options: Constants.Animation.options,
                       animations: { [weak self] in
            self?.changeFrame(for: position)
        }, completion: nil)
    }
    
    func springTransition(to position: BottomPanelPosition,
                          duration: TimeInterval) {
        
        UIView.animate(withDuration: duration,
                       delay: 0,
                       usingSpringWithDamping: Constants.Animation.springDamping,
                       initialSpringVelocity: Constants.Animation.initialSpringVelocity,
                       options: Constants.Animation.options,
                       animations: { [weak self] in
            self?.changeFrame(for: position)
        }, completion: nil)
    }
    
}

// MARK: - Private

private extension BottomPanel {
    
    func addPanGestureRecognizer() {
        contentViewController.view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(pan)))
    }

    func changeFrame(for position: BottomPanelPosition) {
        contentView.frame = CGRect(x: 0,
                                   y: position.value,
                                   width: contentView.frame.width,
                                   height: contentView.frame.height)
    }
    
    func nearPosition(for velocity: CGFloat) -> BottomPanelPosition? {
        let currentPosition = contentView.frame.origin.y
        let candidatePositions = self.candidatePositions(for: velocity)

        if !candidatePositions.isEmpty,
           let nearPositionIndex = candidatePositions.nearPositionIndex(for: currentPosition) {
            return candidatePositions[nearPositionIndex]
        } else if let nearPositionIndex = positions.nearPositionIndex(for: currentPosition) {
            return positions[nearPositionIndex]
        }
        
        return nil
    }

    func moveToNearestPosition() {
        let currentPosition = contentView.frame.origin.y
        
        if let nearPositionIndex = positions.nearPositionIndex(for: currentPosition) {
            normalTransition(to: positions[nearPositionIndex], duration: Constants.Animation.Duration.fast)
        }
    }

    func candidatePositions(for velocity: CGFloat) -> [BottomPanelPosition] {
        let currentPosition = contentView.frame.origin.y
        
        if velocity.isPositive {
            return positions.filter { $0.value > currentPosition }
        } else if velocity.isNegative {
            return positions.filter { $0.value < currentPosition }
        }
        
        return []
    }
    
}

private extension Array where Element == BottomPanelPosition {
    
    func nearPositionIndex(for currentPosition: CGFloat) -> Int? {
        return enumerated()
            .map { ($0.offset, abs(currentPosition - $0.element.value)) }
            .min(by: { $0.1 < $1.1 })?
            .0
    }
    
}
