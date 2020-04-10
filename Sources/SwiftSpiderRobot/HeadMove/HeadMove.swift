//
//  HeadMove.swift
//  
//
//  Created by Michel Anderson Lutz Teixeira on 10/04/20.
//

import Foundation
import SwiftyGPIO

//This class Using SwiftyGPIO Ports
class HeadMove {
    init() {
        guard let pwms = SwiftyGPIO.hardwarePWMs(for: .RaspberryPi2),
        let firstPwm = pwms[0] else { fatalError("No PWM") }

        if let pwm = firstPwm[.P18] {

            let s1 = SG90Servo(pwm)
            s1.enable()

            for _  in 0...5 {
                print("<- Left")
                s1.move(to: .left)
                sleep(1)

                print("^  Middle")
                s1.move(to: .middle)
                sleep(1)

                print("-> Right")
                s1.move(to: .right)
                sleep(1)
            }

            s1.disable()
        }
    }
}
