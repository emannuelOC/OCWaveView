//
//  Senoid+OCWaveView.swift
//  OCWaveView
//
//  Created by Emannuel Carvalho on 08/05/20.
//

import UIKit

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
