//
//  AboutViewController.swift
//  Random Color
//
//  Created by Jude Wilson on 11/21/20.
//

import UIKit
// import FLAnimatedImage

class AboutViewController :UIViewController {
    @IBOutlet weak var BuyMeCoffeeImage: UIImageView!
    @IBOutlet weak var BuyMeCoffeeButton: UIButton!
    /*@IBOutlet weak var ConfettiImage: UIImageView!*/
    
    @IBAction func BuyMeCoffeeDidClick(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://buymeacoff.ee/mrwinson")! as URL, options: [:], completionHandler: nil)
        
        /*let path1 : String = Bundle.main.path(forResource: "iu", ofType: "gif")!
        let url = URL(fileURLWithPath: path1)
        let gifData = Data(contentsOf: url)
        let imageData1 = try? FLAnimatedImage(animatedGIFData: gifData)
        
        ConfettiImage.animatedImage = imageData1*/
    }
}
