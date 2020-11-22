//
//  ViewController.swift
//  Random Color
//
//  Created by Jude Wilson on 11/20/20.
//

import UIKit

class ColorPickerViewController: UIViewController {
    
    @IBOutlet weak var CopyColorCodeButton: UIButton!
    @IBOutlet weak var rgbLabel: UILabel!
    
    @IBAction func copyColorButtonDidClick(_ sender: Any) {
        var coreImageColor: CIColor {
            return CIColor(color: self.view.backgroundColor!)
        }
        UIPasteboard.general.string = "rgb(\(UInt(coreImageColor.red * 255 + 0.5)), \(UInt(coreImageColor.green * 255 + 0.5)), \(UInt(coreImageColor.blue * 255 + 0.5)))"
        
    }

    var colorWell: UIColorWell!
    override func viewDidLoad() {
        super.viewDidLoad()
        addColorWell()
    }
    
    func addColorWell() {
            colorWell = UIColorWell(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
    self.view.addSubview(colorWell)
            colorWell.center = view.center
            colorWell.title = "Select Color"
            colorWell.addTarget(self, action: #selector(colorWellChanged(_:)), for: .valueChanged)
        }
    
    
    @objc func colorWellChanged(_ sender: Any) {
        self.view.backgroundColor = colorWell.selectedColor
        
        var coreImageColor: CIColor {
            return CIColor(color: self.view.backgroundColor!)
        }
        
        if(Double(UInt(coreImageColor.alpha * 10) + 1) == 11 || Double(UInt(coreImageColor.alpha * 10) + 1) == 10) {
            self.rgbLabel.text = "rgb(\(UInt(coreImageColor.red * 255 + 0.5)), \(UInt(coreImageColor.green * 255 + 0.5)), \(UInt(coreImageColor.blue * 255 + 0.5)), 1)"
        } else {
            self.rgbLabel.text = "rgb(\(UInt(coreImageColor.red * 255 + 0.5)), \(UInt(coreImageColor.green * 255 + 0.5)), \(UInt(coreImageColor.blue * 255 + 0.5)), 0.\(Double(UInt(coreImageColor.alpha * 10) + 1)))".replacingOccurrences(of: ".0", with: "")
            }
        }
    }

