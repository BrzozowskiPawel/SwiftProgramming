//
//  FifthViewController.swift
//  Animations
//
//  Created by Paweł Brzozowski on 30/12/2021.
//

import UIKit

class FifthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func replicationAnimation(_ sender: Any) {
        // Create a constant of type CAReplicatorLayer().
        let replicatorLayer = CAReplicatorLayer()
        
        // Create a base CALayer that you will be using to replicate by creating a constant of type CALayer().
        let square = CALayer()
        
        // Set the .backgroundColor
        square.backgroundColor = UIColor.red.cgColor
        
        // Set the .frame object to CGRect(x: x, y: y, width: width, height: height). For width and height set it to 50, for x lets make it 20 away from the side, and y 200 away from the top.
        square.frame = CGRect(x: 20, y: 200, width: 50, height: 50)
        
        // Create a constant of type Int that calculates how many objects can fit on the x axis of the screen by: self.view.frame.maxX and divide it the the space that you will allocate.
        let instanceCount = Int(self.view.frame.maxX / 60)
        
        // Set the .instanceCount CAReplicatorLayer to the calculated val.
        replicatorLayer.instanceCount = instanceCount
        
        // Set the .instanceTransform CAReplicatorLayer to a CATransform3DMakeTranslation(x, y, z). Replicas should be only next to each other just move it by the x value to the width and a little extra space. For this example our square has a width or 50, we want it to have a bit of space inbetween so lets say 60 as the value of x. We can set y and z to 0 since we don't want to move them by these values.
        replicatorLayer.instanceTransform = CATransform3DMakeTranslation(60, 0, 0)
        
        // Since replicated squares should fade away in color slowly we can simply modify the alpha of each instances. CAReplicatorLayer has a property called instanceAlphaOffset tha we can use to automatically modify the alpha value for every replica it creates.
        replicatorLayer.instanceAlphaOffset = -1 / Float(instanceCount)
        
        // Add the square CALayer that was created to CAReplicatorLayer by doing a .addSublayer(layer). Where layer is the square layer that have been created.
        replicatorLayer.addSublayer(square)
        
        // Add the CAReplicatorLayer to view's CALayer by doing self.view.layer.addSublayer(layer).
        self.view.layer.addSublayer(replicatorLayer)
        
        // Now squares will be visible but without animation...
        
        // To fully utilize our CAReplicatorLayer add an animation to the CALayer. Use for example CABasicAnimation.
        let fade = CABasicAnimation(keyPath: "opacity")
        fade.fromValue = 1.0
        fade.toValue = 0.1
        fade.duration = 1.5
        fade.repeatCount = Float.infinity
        square.add(fade, forKey: nil)
        
        // Opt to delay how each instance is drawn/added. This can be done by simply setting the .instanceDelay in seconds. In order to do that divide the duration of the animation to the number of instances.
        replicatorLayer.instanceDelay = fade.duration / Double(replicatorLayer.instanceCount)
    }
    
    
    @IBAction func circleLoadingAnimation(_ sender: Any) {
    }
    
}
