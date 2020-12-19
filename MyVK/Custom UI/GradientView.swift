//
//  GradientView.swift
//  Weather
//
//  Created by Валерий on 17.12.2020.
//
import UIKit

@IBDesignable class GradientView: UIView {
    
    @IBInspectable var startColor: UIColor = .white { // Начальный цвет градиента
        didSet {
            self.updateColors()
        }
    }
    @IBInspectable var endColor: UIColor = .black { // Конечный цвет градиента
        didSet {
            self.updateColors()
        }
    }
    @IBInspectable var startLocation: CGFloat = 0 { // Начало градиента
        didSet {
            self.updateLocations()
        }
    }
    @IBInspectable var endLocation: CGFloat = 1 { //Конец градиента
        didSet {
            self.updateLocations()
        }
    }
    @IBInspectable var startPoint: CGPoint = .zero { // Точка начала градиента
        didSet {
            self.updateStartPoint()
        }
    }
    @IBInspectable var endPoint: CGPoint = CGPoint(x: 0, y: 1) { // Точка конца градиента
        didSet {
            self.updateEndPoint()
        }
    }
    override static var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    // Можно создать вычисляемую переменную для удобной работы со слоем:
    var gradientLayer: CAGradientLayer {
        return self.layer as! CAGradientLayer
    }
    
    //методы, которые будут обновлять параметры слоя с градиентом:
    func updateLocations() {
        self.gradientLayer.locations = [self.startLocation as NSNumber,
                                        self.endLocation as NSNumber]
    }
    func updateColors() {
        self.gradientLayer.colors = [self.startColor.cgColor,
                                     self.endColor.cgColor]
    }
    func updateStartPoint() {
        self.gradientLayer.startPoint = startPoint
    }
    func updateEndPoint() {
        self.gradientLayer.endPoint = endPoint
    }
}

    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */


