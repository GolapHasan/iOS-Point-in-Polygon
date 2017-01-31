//
//  ViewController.swift
//  iOS Point in Polygon
//
//  Created by Md. Kamrul Hasan on 1/31/17.
//  Copyright © 2017 MKHG Lab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var pointArray = [CGPoint]()
        pointArray.append(CGPoint(x: 0, y: 0))
        pointArray.append(CGPoint(x: 10, y: 10))
        pointArray.append(CGPoint(x: 0, y: 10))
        pointArray.append(CGPoint(x: 10, y: 0))
        
        let currentPoint = CGPoint(x: 5, y: 5)
        
        print("result: ", containsPointIn(polygon: pointArray, test: currentPoint))
        print("result: ", containsPointIn(polygon: pointArray, test: CGPoint(x: 15, y: 5)))
        print("result: ", containsPointIn(polygon: pointArray, test: CGPoint(x: 5, y: 9)))
        print("result: ", containsPointIn(polygon: pointArray, test: CGPoint(x: 5, y: 10)))
        print("result: ", containsPointIn(polygon: pointArray, test: CGPoint(x: 10, y: 10)))
        print("result: ", containsPointIn(polygon: pointArray, test: CGPoint(x: 20, y: 10)))
        
        /*

         //the output is:
         
         result:  true
         result:  false
         result:  true
         result:  true
         result:  true
         result:  false

        */
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func containsPointIn(polygon: [CGPoint], test: CGPoint) -> Bool {
        
        if polygon.count <= 1 {
            return false //or if first point = test -> return true
        }
        
        let p = UIBezierPath()
        let firstPoint = polygon[0] as CGPoint
        
        p.move(to: firstPoint)
        
        for index in 1...polygon.count-1 {
            p.addLine(to: polygon[index] as CGPoint)
        }
        
        p.close()
        
        return p.contains(test)
    }

}

