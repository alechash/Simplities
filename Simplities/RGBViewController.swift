//
//  ViewController.swift
//  Random Color
//
//  Created by Jude Wilson on 11/20/20.
//

import UIKit

class RGBViewController: UIViewController {

    @IBOutlet weak var randomColorButton: UIButton!
    @IBOutlet weak var copyColorButton: UIButton!
    @IBOutlet weak var rgbLabel: UILabel!
    
    @IBAction func randomColorButtonDidClick(_ sender: Any) {
        var coreImageColor: CIColor {
            return CIColor(color: self.view.backgroundColor!)
        }
        self.view.backgroundColor = .random()
        self.rgbLabel.text = "rgb(\(UInt(coreImageColor.red * 255 + 0.5)), \(UInt(coreImageColor.green * 255 + 0.5)), \(UInt(coreImageColor.blue * 255 + 0.5)))"
        }
    
    @IBAction func copyColorButtonDidClick(_ sender: Any) {
        var coreImageColor: CIColor {
            return CIColor(color: self.view.backgroundColor!)
        }
        UIPasteboard.general.string = "rgb(\(UInt(coreImageColor.red * 255 + 0.5)), \(UInt(coreImageColor.green * 255 + 0.5)), \(UInt(coreImageColor.blue * 255 + 0.5)))"
        
    }
    
    
    

}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(
           red:   .random(),
           green: .random(),
           blue:  .random(),
           alpha: 1.0
        )
    }
}
