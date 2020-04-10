//
//  File.swift
//  
//
//  Created by Michel Anderson Lutz Teixeira on 10/04/20.
//

import Foundation

public struct MathUtils {
    /// Reference: https://www.arduino.cc/reference/en/language/functions/math/map/
    private static func map(value: Int, minRange: Int, maxRange: Int, minDomain: Int, maxDomain: Int) -> Int {
        let diffDomain = (maxDomain - minDomain)
        let diffRange = (maxRange - minRange)

        return minDomain + diffDomain * (value - minRange) / diffRange
    }

    public static func angleToPulse(angle: Int) -> Int {
        let pulse = MathUtils.map(value: angle, minRange: 0, maxRange: 180, minDomain: SERVOMIN, maxDomain: SERVOMAX)

        return pulse
    }
}
