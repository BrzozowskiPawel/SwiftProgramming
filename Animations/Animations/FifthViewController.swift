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
        // Create a constant of type CAReplicatorLayer().
        let replicatorLayer = CAReplicatorLayer()
        
        // We want this circle loading animation to be at the center of the screen.
        replicatorLayer.position = CGPoint(x: self.view.frame.midX, y: self.view.frame.midY)
        
        // Create a base CALayer that will be replicated.
        let circle = CALayer()
        
        // Set the .backgroundColor
        circle.backgroundColor = UIColor.blue.cgColor
        
        // Set the .frame of our object to CGRect(origin: origin, size: CGSize(width:width, height: height)) - it will create a square
        circle.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: 15, height: 15))
        
        // To change it to circle shape round the corners of the square. The value should be half the width and height.
        circle.cornerRadius = 7.5
        
        // Set the .position our object to a CGPoint(x, y).
        circle.position = CGPoint(x: 0, y: 50)
        
        // Create a constant of type Int - how many circles.
        let instanceCount = 15
        
        // Set the .instanceCount of  CAReplicatorLayer to the calculated val.
        replicatorLayer.instanceCount = instanceCount
        
        // Now we need to calculate the angle of each object/replica to make a big circle shape. To do this multiply PI by 2 and divide it based on the number of instances.
        // This will look like this PI * 2 / instanceCount. Make sure the PI is a CGFloat, simply do a CGFloat.pi
        let angle = -CGFloat.pi * 2 / CGFloat(instanceCount)
        
        // Set the .instanceTransform our  CAReplicatorLayer to a CATransform3DMakeRotation(angle, x, y, z). Set the angle to the value calculated. Set x and y to 0, but set z to 1 to bring it to the front so that it will not be hidden by our layer.
        replicatorLayer.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1)
        
        // Add the circle CALayer to our CAReplicatorLayer by doing a .addSublayer(layer).
        replicatorLayer.addSublayer(circle)
        
        // Add the CAReplicatorLayer to view's CALayer by doing self.view.layer.addSublayer(layer). F
        self.view.layer.addSublayer(replicatorLayer)
        
        // Now circle will be displayed but it won't animate
        
        // To fully utilize CAReplicatorLayer add an animation to the CALayer. Use for ex.  CABasicAnimation
        let scale = CABasicAnimation(keyPath: "transform.scale")
        scale.fromValue = 1
        scale.toValue = 0
        scale.duration = 1.5
        scale.repeatCount = Float.infinity
        circle.add(scale, forKey: nil)
        
        // Opt to delay how each instance is drawn/added. This can be done by simply setting the .instanceDelay in seconds. In order to do that divide the duration of the animation to the number of instances.
        replicatorLayer.instanceDelay = scale.duration / Double(replicatorLayer.instanceCount)
        
        // OPTIONAL: Notice that the start of the animation looks weird because all the "circles". To make it look better and cleaner transform the scale to make circle to an almost none existent scale (0.01) so it won't be visible until the animation kicks in.
        circle.transform = CATransform3DMakeScale(0.01, 0.01, 0.01)
    }
    
}
