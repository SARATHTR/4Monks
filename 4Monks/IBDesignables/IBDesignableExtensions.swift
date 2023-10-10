//
//  ShadowViewButtonLabel.swift
//  4Monks
//
//  Created by Mac User on 11/23/18.
//  Copyright © 2018 Mac User. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class IBDesignableView: UIView {
}
@IBDesignable
class GradientView: UIView {
    
    override class var layerClass: AnyClass { return CAGradientLayer.self }
    
    private var gradientLayer: CAGradientLayer { return layer as! CAGradientLayer }
    
    @IBInspectable var color1: UIColor = .white { didSet { updateColors() } }
    @IBInspectable var color2: UIColor = .blue  { didSet { updateColors() } }
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        configureGradient()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureGradient()
    }
    
    private func configureGradient() {
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        updateColors()
    }
    
    private func updateColors() {
        gradientLayer.colors = [color1.cgColor, color2.cgColor]
    }
    
}
extension UIView {

    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            setNeedsLayout()
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            setNeedsLayout()
        }
    }

    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }

    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }

    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }

    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }

    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
                setNeedsLayout()
            } else {
                layer.shadowColor = nil
                setNeedsLayout()
            }
        }
    }
}

