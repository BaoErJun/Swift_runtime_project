//
//  MuixSwiftClass.swift
//  Demo_o1_project
//
//  Created by cibn on 2019/7/26.
//  Copyright © 2019 cibn. All rights reserved.
//

import UIKit


class MuixSwiftClass: UIViewController {

    @objc var bolValue: Bool = false
    @objc var age: Int = 0
    @objc var height: Float = 0
    @objc var name: String?
    @objc var exName: String?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @objc func createSubView(view : UIView) {
        print("MuixSwiftClass.createSubView")
    }
    
    @objc func testVoidWithBool(boolValue : Bool , tempInt : Int , tempFloat : Float , str : String , obj : AnyObject) {
        print("MuixSwiftClass.testVoidWithBool")
    }
    
//    @objc func testVoidWithTuple(boolValue : Bool , tempInt : Int , tempFloat : Float) -> (Bool , Int , Float){
//        print("MuixSwiftClass.testVoidWithTuple")
//        return (boolValue,tempInt,tempFloat)
//    }
//
//    @objc func testVoidWithCharacter(char : Character ) {
//        print("MuixSwiftClass.testVoidWithCharacter")
//    }
    

}


extension MuixSwiftClass {

    @objc func swizzle_viewWillAppear(_ animated: Bool) {
        swizzle_viewWillAppear(animated)
        print("swizzle_viewWillAppear")
    }
}



extension MuixSwiftClass: SelfAware{
    static func awake() {
        takeOnceTime
    }
    private static let takeOnceTime: Void = {
        let originalSelector = #selector(viewWillAppear(_:))
        let swizzledSelector = #selector(swizzle_viewWillAppear(_:))
        swizzlingForClass(MuixSwiftClass.self, originalSelector: originalSelector, swizzledSelector: swizzledSelector)
    }()
}
