//
//  WaveView.swift
//  WaveViewStudies
//
//  Created by Emannuel Carvalho on 15/03/17.
//  Copyright © 2017 OC. All rights reserved.
//

import UIKit

@IBDesignable
public class WaveView: UIView {
    
    /// The first color
    @IBInspectable public var color1: UIColor = #colorLiteral(red: 0.9964973922, green: 1, blue: 0.9946105148, alpha: 0.7882063356)
    
    /// The second color
    @IBInspectable public var color2: UIColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 0.6632598459)
    
    /// The third color
    @IBInspectable public var color3: UIColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 0.6898812072)
    
    /// The value to be used in the senoid function
    @IBInspectable
    public var value: CGFloat = 200 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    
    private var spin1 = 0.1
    private var spin2 = 0.6
    private var spin3 = 0.1
    
    private var signal1 = 1.0
    private var signal2 = 1.0
    private var signal3 = 1.0
    
    private func updateSpin() {
        
        let factor1 = 0.65
        let factor2 = 0.41
        let factor3 = 0.7
        
        if spin1 >= 1.0 {
            signal1 = -1.0
        } else if spin1 <= 0.1 {
            signal1 = 1.0
        }
        spin1 += signal1 * factor1
        
        if spin2 >= 1.0 {
            signal2 = -1.0
        } else if spin2 <= 0.1 {
            signal2 = 1.0
        }
        spin2 += signal2 * factor2
        
        if spin3 >= 1.0 {
            signal3 = -1.0
        } else if spin3 <= 0.1 {
            signal3 = 1.0
        }
        spin3 += signal3 * factor3
        
    }
    
    
    var s = 0.0
    
    override public func draw(_ rect: CGRect) {
        
        let height = frame.height/2
        
        let bowlSenoid = BowlSenoid(center: Double(frame.width)/2.0)
        bowlSenoid.s = s
        bowlSenoid.s += 0.5
        if bowlSenoid.s >= Double(frame.width) {
            bowlSenoid.s = 0.0
        }
        s = bowlSenoid.s
        
        var points = [CGPoint]()
        var mirrorPoints = [CGPoint]()
        
        let curveSizes = [20, 24, 25]
        let colors = [color1, color2, color3]
        
        for i in 0..<curveSizes.count {
            
            let path1 = UIBezierPath()
            let path2 = UIBezierPath()
            
            points = []
            mirrorPoints = []
            
            path1.move(to: CGPoint(x: 0, y: height))
            path2.move(to: CGPoint(x: 0, y: height))
            
            updateSpin()
            
            let size = CGFloat(curveSizes[i])
            let color = colors[i]
            
            for x in 0...Int(frame.width/size) {
                let newX = CGFloat(x) * size
                
                let y = height + value * CGFloat(bowlSenoid.f(newX)) * 0.000002
                let point = CGPoint(x: newX, y: y)
                
                let mirrorY = height - value * CGFloat(bowlSenoid.f(newX)) * 0.000002
                let mirror = CGPoint(x: newX, y: mirrorY)
                
                points += [point]
                mirrorPoints += [mirror]
            }
            
            path1.interpolatePointsWithHermite(interpolationPoints: points)
            path2.interpolatePointsWithHermite(interpolationPoints: mirrorPoints)
            
            path1.addLine(to: CGPoint(x: frame.width, y: frame.height/2))
            path1.addLine(to: CGPoint(x: 0, y: frame.height/2))
            path2.addLine(to: CGPoint(x: frame.width, y: frame.height/2))
            path2.addLine(to: CGPoint(x: 0, y: frame.height/2))
            
            color.set()
            path1.lineWidth = 1
            //            path1.stroke()
            path1.fill()
            path2.lineWidth = 1
            //            path2.stroke()
            path2.fill()
            
        }
        
    }
    
}

public class BowlSenoid {
    
    var center: Double
    
    var s = 0.0
    
    private func senoid(_ x: Double) -> Double {
        return sin(s + x)
    }
    
    private func bowl(_ x: Double, center: Double = 0) -> Double {
        let x = abs(x - center)
        return -x * x + (center * center)
    }
    
    public init(center: Double) {
        self.center = center
    }
    
    public func f(_ x: Double) -> Double {
        return bowl(x, center: center) * senoid(x)
    }
    
    public func f(_ x: CGFloat) -> CGFloat {
        return CGFloat(f(Double(x)))
    }
    
}

extension UIBezierPath
{
    func interpolatePointsWithHermite(interpolationPoints : [CGPoint], alpha : CGFloat = 1.0/3.0)
    {
        guard !interpolationPoints.isEmpty else { return }
        self.move(to: interpolationPoints[0])
        
        let n = interpolationPoints.count - 1
        
        for index in 0..<n
        {
            var currentPoint = interpolationPoints[index]
            var nextIndex = (index + 1) % interpolationPoints.count
            var prevIndex = index == 0 ? interpolationPoints.count - 1 : index - 1
            var previousPoint = interpolationPoints[prevIndex]
            var nextPoint = interpolationPoints[nextIndex]
            let endPoint = nextPoint
            var mx : CGFloat
            var my : CGFloat
            
            if index > 0
            {
                mx = (nextPoint.x - previousPoint.x) / 2.0
                my = (nextPoint.y - previousPoint.y) / 2.0
            }
            else
            {
                mx = (nextPoint.x - currentPoint.x) / 2.0
                my = (nextPoint.y - currentPoint.y) / 2.0
            }
            
            let controlPoint1 = CGPoint(x: currentPoint.x + mx * alpha, y: currentPoint.y + my * alpha)
            currentPoint = interpolationPoints[nextIndex]
            nextIndex = (nextIndex + 1) % interpolationPoints.count
            prevIndex = index
            previousPoint = interpolationPoints[prevIndex]
            nextPoint = interpolationPoints[nextIndex]
            
            if index < n - 1
            {
                mx = (nextPoint.x - previousPoint.x) / 2.0
                my = (nextPoint.y - previousPoint.y) / 2.0
            }
            else
            {
                mx = (currentPoint.x - previousPoint.x) / 2.0
                my = (currentPoint.y - previousPoint.y) / 2.0
            }
            
            let controlPoint2 = CGPoint(x: currentPoint.x - mx * alpha, y: currentPoint.y - my * alpha)
            
            self.addCurve(to: endPoint, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
        }
    }
}


