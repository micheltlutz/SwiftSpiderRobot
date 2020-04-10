#if os(Linux)

import Glibc

#elseif os(macOS)

import Darwin

#endif

import SwiftyGPIO
import Foundation

let SERVOMIN = 125
let SERVOMAX = 575

final class Spider {
    private let busNumber: Int = 1
    private var module: PCA9685Module

    init() {
        guard let smbusUnwraped = try? SMBus(busNumber: busNumber),
              let moduleUnwraped = try? PCA9685Module(smBus: smbusUnwraped, address: 0x40) else {
            fatalError("It has not been possible to open the System Managed/I2C bus")
        }

        self.module = moduleUnwraped

        self.setupFrequency()
    }

    private func setupFrequency() {
        do {
            let _ = try module.set(pwmFrequency: 60)
        } catch let error {
            print("ERRO: \(error.localizedDescription))")
        }
    }

    public func wakeup() {
        do {
            let _ = try module.resetAllChannels()

            print("Wakeup")
        } catch let error {
            print("ERRO: \(error.localizedDescription))")
        }
    }

    public func moveLeg(to position: Position) {
        let leg1 = Leg(module: module)

        leg1.move(to: position)
    }
}

class Leg {
    private let module: PCA9685Module
    private let s0 = PCA9685Module.Channel.channelNo0
    private let s1 = PCA9685Module.Channel.channelNo1
    private let s2 = PCA9685Module.Channel.channelNo2
    private let s4 = PCA9685Module.Channel.channelNo4

    init(module: PCA9685Module) {
        self.module = module
    }


    public func move(to: Position) {


        let exampleDuration = Double(to.rawValue)
        let cycleDuration: Double = 0.01
        let numberExampleCycles = exampleDuration / cycleDuration

        print("numberExampleCycles: \(Int(numberExampleCycles))")
        for index in 0 ... Int(numberExampleCycles) {

//            let dutyCycle = 1.0 / numberExampleCycles * Double(index)


            guard let _ = try? module.write(channel: s4, dutyCycle: dutyCycle)
                else {
                    fatalError("Failed to set the values for the given channels")
            }

            print("cycleDuration: \(Double(cycleDuration))")


            sleep(UInt32(cycleDuration))
        }

        // Wait still a bit when duty cycle 100%
        sleep(3)
        ///
//
//        guard let _ = try? module.write(channel: s4, dutyCycle: 1.0)
//            else {
//                fatalError("Failed to set the values for the given channels")
//        }

    }

    public func moveOLD() {
        print("MoveLeg 1")

        let exampleDuration: TimeInterval = 5.0
        let cycleDuration: TimeInterval = 0.01
        let numberExampleCycles = exampleDuration / cycleDuration

        //for index in 0 ... Int(numberExampleCycles) {
        for index in 0 ... 9 {

//            let dutyCycle = 1.0 / numberExampleCycles * Double(index)
            let angle = index * 10

            let dutyCycle = 1.0 * Double(angle) / 180

            let pulse = Double(MathUtils.angleToPulse(angle: angle))

            

            guard let _ = try? module.write(channel: s4, dutyCycle: dutyCycle)
//                , let _ = try? module.write(channel: s2, dutyCycle: dutyCycle)
//                let _ = try? module.write(channel: s2, dutyCycle: dutyCycle)
                else {
                    fatalError("Failed to set the values for the given channels")
            }
//            print("dutyCycle: \(UInt32(dutyCycle))")
            print("\n\n--------------------------------------")
            print("pulse: \(pulse) for angle: \(angle)")
            print("\ndutyCycle: \(dutyCycle) for index: \(index)")
            print("--------------------------------------")

            sleep(3)
            let _ = try? module.resetAllChannels()
        }




//        guard let _ = try? module.write(channel: s2, dutyCycle: dutyCycle) else {
//                fatalError("Failed to set the values for the given channels")
//        }
    }
}
