//
//  DonutView.swift
//  UIKitHomework
//
//  Created by Анна Ереськина on 18.05.2021.
//

import UIKit

final class DonutView: UIImageView {
    
    /// Радиус основного вью
    private var donutRadius: CGFloat = 0
    /// Радиус выреза
    private var holeRadius: CGFloat = 0
    
    /// Квадрат внутри donut
    private  var rectangleInside: CGRect {
        CGRect(x: bounds.width / 2 - holeRadius,
               y: bounds.height / 2 - holeRadius,
               width: holeRadius * 2,
               height: holeRadius * 2)
    }
    
    convenience init(x: CGFloat,
                     y: CGFloat,
                     donutRadius: CGFloat,
                     holeRadius: CGFloat,
                     with image: UIImage?) {
        self.init(frame: CGRect(x: x,
                                y: y,
                                width: donutRadius * 2,
                                height: donutRadius * 2))
        
        self.donutRadius = donutRadius
        self.holeRadius = holeRadius
        self.image = image
        
        setupView()
        cutHoleIntoDonut()
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard isUserInteractionEnabled else { return nil }
        guard !isHidden else { return nil }
        guard isDonutContaints(point) else { return nil }
        
        return super.hitTest(point, with: event)
    }
}

//MARK: User methods

extension DonutView {
    
    /// Нажатие только по donut
    /// - Parameter point: точка нажатия
    /// - Returns: true, если нажали по овалу donut
    private func isDonutContaints(_ point: CGPoint) -> Bool {
        let innerPath = UIBezierPath(ovalIn: rectangleInside)
        let mainPath = UIBezierPath(ovalIn: bounds)
        if !innerPath.contains(point) && mainPath.contains(point) {
            return true
        }
        return false
    }
    
    /// Настраиваем вью
    private func setupView() {
        layer.cornerRadius = donutRadius
        clipsToBounds = true
        
        isUserInteractionEnabled = true
    }
    
    /// Вырезаем дырку в картинке
    private func cutHoleIntoDonut() {
        
        let path = CGMutablePath()
        path.addRoundedRect(in: rectangleInside,
                            cornerWidth: holeRadius,
                            cornerHeight: holeRadius)
        
        path.addRect(CGRect(origin: .zero, size: frame.size))
        
        let maskLayer = CAShapeLayer()
        maskLayer.backgroundColor = UIColor.clear.cgColor
        maskLayer.path = path
        maskLayer.fillRule = .evenOdd
        
        layer.mask = maskLayer
        clipsToBounds = true
        
    }
}


