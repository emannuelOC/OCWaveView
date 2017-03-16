//
//  ViewController.swift
//  Example
//
//  Created by Emannuel Carvalho on 15/03/17.
//  Copyright © 2017 OC. All rights reserved.
//

import UIKit
import OCWaveView

class ViewController: UIViewController {

    @IBOutlet weak var waveView: WaveView!

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let value = touches.first?.location(in: view) {
            waveView.value = value
            
        }
    }

}

