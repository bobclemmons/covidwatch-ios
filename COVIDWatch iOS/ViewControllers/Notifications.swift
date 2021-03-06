//
//  Bluetooth.swift
//  COVIDWatch iOS
//
//  Created by Isaiah Becker-Mayer on 4/4/20.
//  Copyright © 2020 IZE. All rights reserved.
//

import UIKit

class Notifications: BaseViewController {
    var img = UIImageView(image: UIImage(named: "people-standing-01-blue-4"))
    var largeText = LargeText(text: "Recieve Alerts")
    //swiftlint:disable:next line_length
    var mainText = MainText(text: "Covid Watch uses notifications to send alerts when you may have come into contact with COVID-19.")
    var button = Button(text: "Allow Notifications", subtext: "This will help you find out when you may be at risk")

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(hexString: "FFFFFF")

//        Ratio is Figma image width to Figma screen width
        img.frame.size.width = 358.0 * figmaToiOSHorizontalScalingFactor
        img.frame.size.height = img.frame.size.width / (358.0/252.0)
        img.center.x = view.center.x
        img.center.y = header.frame.minY + (282.0 * figmaToiOSVerticalScalingFactor)
        view.addSubview(img)

        largeText.draw(parentVC: self,
                       centerX: view.center.x,
                       centerY: header.frame.minY + (512.0 * figmaToiOSVerticalScalingFactor))

        mainText.draw(parentVC: self,
                      centerX: view.center.x,
                      originY: header.frame.minY + (546.0 * figmaToiOSVerticalScalingFactor))

        self.button.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.nextScreen)))
        button.draw(parentVC: self,
                    centerX: view.center.x,
                    centerY: screenHeight - (114.0 * figmaToiOSVerticalScalingFactor))
    }

    @objc func nextScreen(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            performSegue(withIdentifier: "NotificationsToFinish", sender: self)
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
