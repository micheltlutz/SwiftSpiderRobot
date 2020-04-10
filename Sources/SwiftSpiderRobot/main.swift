//
//  main.swift
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

print("Spider robot with Swift \n")


let spider = Spider()
spider.wakeup()
//NotWorking =/
spider.moveLeg(to: .left)
spider.moveLeg(to: .middle)

//Simulate Head move left , center, right
//let _ = HeadMove()
