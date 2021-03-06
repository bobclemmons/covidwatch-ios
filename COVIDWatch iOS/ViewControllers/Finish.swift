//
//  Bluetooth.swift
//  COVIDWatch iOS
//
//  Created by Isaiah Becker-Mayer on 4/4/20.
//  Copyright © 2020 IZE. All rights reserved.
//

import UIKit

class Finish: BaseViewController {
    var img = UIImageView(image: UIImage(named: "people-group-blue-2"))
    var largeText = LargeText(text: "You're all set!")
    //swiftlint:disable:next line_length
    var mainText = MainText(text: "Thank you for helping protect your communities. You will be notified of potential contact with COVID-19.")
    var button = Button(text: "Finish", subtext: nil)
    var backgroundGradient = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
//            Layout image first and then layout background gradient compared to it

        img.frame.size.width = screenWidth * 0.832
        img.frame.size.height = img.frame.size.width / (312.0/326.0)
        img.center.x = view.center.x
        img.center.y = header.frame.minY + (282.0 * figmaToiOSVerticalScalingFactor)

        backgroundGradient.frame.size.width = screenWidth
        backgroundGradient.frame.size.height = screenHeight + 40
        backgroundGradient.frame.origin.y = img.frame.minY
        backgroundGradient.layer.contents = UIImage(named: "background-gradient-blue")?.cgImage
        self.view.addSubview(backgroundGradient)
        view.addSubview(img)

        largeText.draw(parentVC: self,
                       centerX: view.center.x,
                       centerY: header.frame.minY + (512.0 * figmaToiOSVerticalScalingFactor))
        largeText.textColor = .white

        mainText.textColor = .white
        mainText.draw(parentVC: self,
                      centerX: view.center.x,
                      originY: header.frame.minY + (546.0 * figmaToiOSVerticalScalingFactor))

        self.button.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.nextScreen)))
        button.draw(parentVC: self,
                    centerX: view.center.x,
                    centerY: screenHeight - (114.0 * figmaToiOSVerticalScalingFactor))
        button.text.textColor = UIColor(hexString: "585858")
        button.backgroundColor = .white
    }

    @objc func nextScreen(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            performSegue(withIdentifier: "FinishToHome", sender: self)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
