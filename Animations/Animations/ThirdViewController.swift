//
//  ThirdViewController.swift
//  Animations
//
//  Created by Paweł Brzozowski on 30/12/2021.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var springArrow: UIButton!
    @IBOutlet weak var springFlame: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func arrowBUttonPressed(_ sender: Any) {
        arrowSpring()
    }
    
    @IBAction func flameButtonPressed(_ sender: Any) {
        flameSpringAnimation()
    }
    
    func arrowSpring() {
        // Create a constant of type CASpringAnimation(keypath) where keypath is the position property.
        let animation = CASpringAnimation(keyPath: "positon")
        
        // Set the .fromValue of CASpringAnimation to a CGPoint(x,y) value. The position should be from origin so just set it to the current position.
        animation.fromValue = CGPoint(x: springArrow.frame.midX, y: springArrow.frame.midY)
        
        // Set the .toValue of CASpringAnimation to a CGPoint(x,y) value.
        animation.toValue = CGPoint(x: springArrow.frame.midX, y: springArrow.frame.midY + 200)
        
        // Set the .damping of CASpringAnimation to a Float value, the default value being 10. The damping property is responsible for the energy loss with each oscillation.
        animation.damping = 3
          
        // Set the .stiffness of CASpringAnimation to a Float value, the default value being 100. The stiffness property is responsible for how stiff the spring-like motion is.
        animation.stiffness = 50
            
        // Set the .mass of CASpringAnimation to a Float value, the default value being 1. The mass property is responsible for how heavy the object is.
        animation.mass = 2
           
        // Set the .duration of CASpringAnimation to a Float value in seconds. Dropping an object and wanting it to animate a spring-like animation a bit then the duration should be to be a bit longer.
        animation.duration = 5
            
        // Add the CASpringAnimation to  button's CALayer by simply doing button.layer.add(animation,forKey).
        springArrow.layer.add(animation, forKey: nil)
    }

    func flameSpringAnimation() {
        // Create a constant of type CASpringAnimation(keypath) where keypath is the transform.scale property.
        let animation = CASpringAnimation(keyPath: "transform.scale")
         
        // Set the .fromValue of CASpringAnimation to a Float value. The value ranges from 0 and above, where 1 is 100% scale (normal size) and where 0 means 0%.
        animation.fromValue = 1
         
        // Set the .toValue of CASpringAnimation to a Float value. The value ranges from 0 and above, where 1 is 100% scale (normal size) and where 0 means 0%.
        animation.toValue = 2
         
        // Set the .damping of CASpringAnimation to a Float value, the default value being 10. The damping property is responsible for the energy loss which each oscillation.
        animation.damping = 3
          
        // Set the .stiffness of CASpringAnimation to a Float value, the default value being 100. The stiffness property is responsible for how stiff the spring-like motion is.
        animation.stiffness = 5
          
        // Set the .mass of CASpringAnimation to a Float value, the default value being 1. The mass property is responsible for how heavy the object is.
        animation.mass = 2
          
        // Set the .duration of CASpringAnimation to a Float value in seconds.
        animation.duration = 4
         
        // Add the CASpringAnimation to button's CALayer by simply doing [button].layer.add([animation],[forKey]).
        springFlame.layer.add(animation, forKey: nil)
    }
}
