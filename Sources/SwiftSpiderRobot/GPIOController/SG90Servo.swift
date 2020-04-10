//
//  SG90Servo.swift
//  
//
//  Created by Michel Anderson Lutz Teixeira on 06/04/20.
//
#if os(Linux)

import Glibc

#elseif os(macOS)

import Darwin

#endif

import Foundation
import SwiftyGPIO

public enum Position: Int {
    case left = 5
    case middle = 8
    case right = 12
}

public class SG90Servo{
    var pwm: PWMOutput
    var period: Int

    public init(_ pwm: PWMOutput, period: Int = 20_000_000) { //Default period 20ms
        self.pwm = pwm
        self.period = period
    }

    public func enable() {
        pwm.initPWM()
    }

    public func disable() {
        pwm.stopPWM()
    }

    public func move(to: Position) {
        pwm.startPWM(period: period, duty: Float(to.rawValue))
    }
}
