//
//  SecondViewController.swift
//  Animations
//
//  Created by Paweł Brzozowski on 30/12/2021.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var arrow: UIButton!
    @IBOutlet weak var lightbulb: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func lightbulbPressed(_ sender: UIButton) {
        
        // Moving arrow:
        moveArrow()
        
        // Lightbulb change BG
        changeLightbuldBG()
       
    }
    
    func moveArrow() {
        // Created a constant of type CAKeyframeAnimation(keypath) where keypath is the property of the CALayer.
        let movingKeyframeAnimation = CAKeyframeAnimation(keyPath: "position")
       
        // Set the .values of CAKeyframeAnimation to an Array of CGPoint(x,y) value. The value of first CGPoint(x,y) should the original position of the button.
        // For the second CGPoint(x,y) should be the original position + the length of the screen, the x position should be a button.frame.midX + self.view.frame.maxX. and the y position is just the button.frame.midY. Or modify it.
        
        movingKeyframeAnimation.values = [
         CGPoint(x: arrow.frame.midX, y: arrow.frame.midY),
         CGPoint(x: self.view.frame.maxX - 20 - arrow.frame.midX, y: arrow.frame.midY)
         ]
        
        // Set the .timingFunctions of CAKeyframeAnimation to an array of CAMediaTimingFunction. Using the easeOut causes an animation to begin quickly and then slow down as it progresses.
        
        movingKeyframeAnimation.timingFunctions = [CAMediaTimingFunction(name: .linear)]
        
        // Set the .duration of CAKeyframeAnimation to a Float value in seconds.
        movingKeyframeAnimation.duration = 0.5
        
        // Set how many times it should repeat
        movingKeyframeAnimation.repeatCount = 3
        
        // Set the .autoreverses of CAKeyframeAnimation to a Boolean value. Set this if you want lightbulb to cycle through the colors again.
        movingKeyframeAnimation.autoreverses = true
        
        // Add the CAKeyframeAnimation to button's CALayer by doing [button].layer.add([animation],[forKey]).
        arrow.layer.add(movingKeyframeAnimation, forKey: nil)
    }
    
    func changeLightbuldBG() {
        // Create a constant of type CAKeyframeAnimation(keypath) where keypath is the property of the CALayer. For this example we used the backgroundColor property.
        let colorKeyframeAnimation = CAKeyframeAnimation(keyPath: "backgroundColor")
        
        // Set the .values of your CAKeyframeAnimation to an Array of cgColor value and add three values to array, which are the colors red, green, and yellow.
        colorKeyframeAnimation.values = [
         UIColor.red.cgColor,
         UIColor.green.cgColor,
         UIColor.yellow.cgColor
         ]
        
        // Set the .keyTimes of CAKeyframeAnimation to an Array of Float values. The values range from 0 to 1, where 0 is the start time and 1 is the end time based on the duration. Since there is entries inside the .values array that we set, we should also add the same number of keyTimes.
        // For this example the values 0, 0.5, and 0.8. Which means first color at the start (0), second color at the middle (0.5) and third color at around 80% (0.8).If you add a keyTime of 1 to the array earlier than the other values (for example [0, 1, 0.8]). then the keyTime and animation after the the 1 will not be applied.
        colorKeyframeAnimation.keyTimes = [0, 0.5, 0.8]
        
        // Set the .duration of CAKeyframeAnimation to a Float value in seconds.
        colorKeyframeAnimation.duration = 3
        
        // Set the .autoreverses of CAKeyframeAnimation to a Boolean value. Set this if you want lightbulb to cycle through the colors again.
        colorKeyframeAnimation.autoreverses = true
        
        // Add the CAKeyframeAnimation to button's CALayer by simply doing [button].layer.add(animation,forKey).
        lightbulb.layer.add(colorKeyframeAnimation, forKey: nil)
    }

}
