//
//  AnimatedButton.swift
//  Animations
//
//  Created by Paweł Brzozowski on 30/12/2021.
//

import UIKit

class AnimatedButton: UIButton {

    func shakeAnimation(shakeVal: CGFloat) {
        // Created a constant of type CABasicAnimation(keypath) where keypath is the property of the CALayer.
        let animation = CABasicAnimation(keyPath: "position")
        
        // Set the .fromValue of CABasicAnimation to a CGPoint(x, y) value. The value of x should be slightly at the left or right of the frame,( can be done simply by a self.frame.midX) then just add say 5 points to it. For the y there is no need to adjust so a simple self.frame.midY
        animation.fromValue = CGPoint(x: self.frame.midX - shakeVal, y: self.frame.midY)
        
        // Set the .toValue of CABasicAnimation to a CGPoint(x, y) value. The value of x should be the opposite of fromValue X, so simply a self.frame.midX, then  add or subtract  5 points to it. For the y there is no need to adjust so a simple self.frame.midY should do
        animation.toValue = CGPoint(x: self.frame.midX + shakeVal, y: self.frame.midY)
        
        // Set the .duration of CABasicAnimation to a Float value in seconds.
        animation.duration = 0.2
 
        // Set the .repeatCount of CABasicAnimation to an Int value.
        animation.repeatCount = 5
        
        // Set the .autoreverses of  CABasicAnimation to a Boolean value. Animation should go like a back and forth motion so it will look smooth and doesn't look like it's skipping frames. Autoreverses takes care of "reversing" the animation so it goes back the way it was.
        animation.autoreverses = true
        
        // Add the CABasicAnimation to CALayer by doing self.layer.add(animation,forKey). For the animation put in the CABasicAnimation that was created. As for the forKey you can set this simply to nil or the value of the keyPath.
        self.layer.add(animation, forKey: nil)
    }
    
    func fadeAnimation() {
        // Create a constant of type CABasicAnimation(keypath) where keypath is the opacity property.
        let animation = CABasicAnimation(keyPath: "opacity")
        
        // Set the .fromValue of CABasicAnimation to a Float value. The value ranges from 0 to 1, where 1 is 100% opacity and 0 is 0% opacity.
        animation.fromValue = 1
        
        // Set the .toValue of CABasicAnimation to a Float value. The value ranges from 0 to 1, where 1 is 100% opacity and 0 is 0% opacity.
        animation.toValue = 0
        
        //Set the .duration of CABasicAnimation to a Float value in seconds. To make the fading in and out only gradual, set it to range for a few seconds.
        animation.duration = 3
        
        // Set the .autoreverses of CABasicAnimation to a Boolean value. Animation should fade out and fade in back again not just an instant "on" again once its done fading.
        animation.autoreverses = true
        
        // Add the CABasicAnimation to CALayer by doing self.layer.add(animation, forKey).
        self.layer.add(animation, forKey: nil)
    }
    
    func scaleAnimation(startSize: Float=1, endSize: Float=2) {
        // Create a constant of type CABasicAnimation(keypath) where keypath is transform.scale property.
        let animation = CABasicAnimation(keyPath: "transform.scale")
        
        // Set the .fromValue of CABasicAnimation to a Float value. The value ranges from 0 and above, where 1 is 100% scale (normal size) and where 0 means 0%.
        animation.fromValue = startSize
        
        // Set the .toValue of CABasicAnimation to a Float value. The value ranges from 0 and above, where 1 is 100% scale (normal size) and where 0 means 0%.
        animation.toValue = endSize
        
        //Set the .duration of CABasicAnimation to a Float value in seconds. To make the scaling to be gradual set it to range for a few seconds.
        animation.duration = 1
        
        // Set the .autoreverses of CABasicAnimation to a Boolean value. Animation should scale big and back to small again not just an instant shrink to original size once it's done scaling.
        animation.autoreverses = true
        
        // Add the CABasicAnimation to CALayer by simply doing self.layer.add(animation,forKey). 
        self.layer.add(animation, forKey: nil)
    }

}
