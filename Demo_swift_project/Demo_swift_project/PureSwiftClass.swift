//
//  PureSwiftClass.swift
//  Demo_o1_project
//
//  Created by cibn on 2019/7/26.
//  Copyright © 2019 cibn. All rights reserved.
//

import UIKit
//MARK: - 纯SwiftClass
class PureSwiftClass {
    @objc var bolValue: Bool = false
    @objc var age: Int = 0
    @objc var height: Float = 0
    @objc var name: String?
    @objc var exName: String?
    @objc func testPureAction() {
        print("PureSwiftClass.testPureAction")
    }
}


extension PureSwiftClass {
    @objc func swizzle_testPureAction() {
        swizzle_testPureAction()
        print("swizzle_testPureAction")
    }
}

extension PureSwiftClass: SelfAware {
    static func awake() {
        self.takeOnceTime
    }
    
    private static let takeOnceTime: Void = {
        let originalSelector = #selector(testPureAction)
        let swizzledSelector = #selector(swizzle_testPureAction)
        swizzlingForClass(PureSwiftClass.self, originalSelector: originalSelector, swizzledSelector: swizzledSelector)
    }()
}

