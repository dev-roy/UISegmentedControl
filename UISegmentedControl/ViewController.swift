//
//  ViewController.swift
//  UISegmentedControl
//
//  Created by Field Employee on 3/25/20.
//  Copyright © 2020 Field Employee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var shapeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var shapeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSquare()
    }
    
    @IBAction func indexDidChange(_ sender: Any) {
        switch shapeSegmentedControl.selectedSegmentIndex
        {
        case 0:
            setUpSquare()
            shapeView.layer.sublayers?.popLast()
        case 1:
            setUpBall()
            shapeView.layer.sublayers?.popLast()
        case 2:
            setUpTriangle()
            shapeView.layer.sublayers?.popLast()
        case 3:
            setUpPieSlice()
            shapeView.layer.sublayers?.popLast()
        default:
            break
        }
    }
    
    func setUpSquare() {
        let viewWidth = shapeView.frame.size.width
        let viewHeight = shapeView.frame.size.height
        let path = CGMutablePath()
        path.addRect(CGRect(x: viewWidth / 4 , y: 0, width: viewHeight , height: viewHeight))
        let shape = CAShapeLayer()
        shape.path = path
        shape.fillColor = UIColor.blue.cgColor
        shapeView.layer.insertSublayer(shape, at: 0)
    }
    
    func setUpBall()  {
        let viewWidth = shapeView.frame.size.width
        let viewHeight = shapeView.frame.size.height
        let path = CGMutablePath()
        path.addEllipse(in: CGRect(x: viewWidth / 4, y: 0, width: viewHeight, height: viewHeight))
        let shape = CAShapeLayer()
        shape.path = path
        shape.fillColor = UIColor.blue.cgColor
        shapeView.layer.insertSublayer(shape, at: 0)
    }
    
    func setUpRectangle()  {
        let viewWidth = shapeView.frame.size.width
        let viewHeight = shapeView.frame.size.height
        let path = CGMutablePath()
        path.addRect(CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight))
        let shape = CAShapeLayer()
        shape.path = path
        shape.fillColor = UIColor.blue.cgColor
        shapeView.layer.insertSublayer(shape, at: 0)
    }

    func setUpTriangle(){
        let viewWidth = shapeView.frame.size.width
        let viewHeight = shapeView.frame.size.height
        let path = CGMutablePath()
        path.move(to: CGPoint(x: viewWidth / 2, y: 0))
        path.addLine(to: CGPoint(x: viewWidth, y: viewHeight))
        path.addLine(to: CGPoint(x:0, y: viewHeight))
        let shape = CAShapeLayer()
        shape.path = path
        shape.fillColor = UIColor.blue.cgColor
        shapeView.layer.insertSublayer(shape, at: 0)
    }
    
    func setUpPieSlice()  {
        let viewWidth = shapeView.frame.size.width * 2
        let viewHeight = shapeView.frame.size.height * 2
        let center = CGPoint(x: shapeView.frame.size.width / 2, y: 0)
        let radius = min(viewHeight, viewWidth) * 0.5
        let startAngle = (CGFloat.pi * 3) / 4
        let endAngle = (CGFloat.pi) / 4
        let path = CGMutablePath()
        path.move(to: center)
        path.addArc(center: center , radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        let shape = CAShapeLayer()
        shape.path = path
        shape.fillColor = UIColor.blue.cgColor
        shapeView.layer.insertSublayer(shape, at: 0)
    }

}

