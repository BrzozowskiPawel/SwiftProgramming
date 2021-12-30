//
//  FourthViewController.swift
//  Animations
//
//  Created by Paweł Brzozowski on 30/12/2021.
//

import UIKit

class FourthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func circularEmission(_ sender: Any) {
        // Create a constant of type CAEmitterLayer().
        let emitterLayer = CAEmitterLayer()
        
        // Circle particle emission should be at the center of the screen. To do so we need to modify the .emitterPosition of the CAEmitterLayer by doing a CGPoint(x,y).
        emitterLayer.emitterPosition = CGPoint(x: self.view.frame.midX, y: self.view.frame.midY)
        
        // Create a CAEmitterCell that you will be using to emit particles by create a constant of type CAEmitterCell().
        let cell = CAEmitterCell()
        
        // Set the .birthRate of object to a Float value.
        cell.birthRate = 20
        
        // Set the .lifetime of object to a Float value.
        cell.lifetime = 10
        
        // Set the .velocity of our object to a Float value.
        cell.velocity = 100
        
        // Set the .velocityRange of  object to a Float value. For this example set it to half of our velocity or velocity/2, since velocity is 100 then this means that the velocity can range from 50 - 100
        cell.velocityRange = cell.velocity / 2
        
        // Set the .emissionRange of object to a Float value. To set angle of the emission of particles to be circular, set it to .pi
        cell.emissionRange = .pi
        
        // Set the .spinRange of object to a Float value. For this example set it to 10, since our default spin is 0 then the range of spin is from 0 - 10
        cell.spinRange = 10
        
        // Set the .scaleRange of object to a Float value. Particles should vary in sizes a bit to add a bit of variety. For this example we set it to 0.5, since our default scale is 1 then the range of sizes is from 0.5 - 1
        cell.scaleRange = 0.5
        
        // Set the .contents of object to a cgImage value. To make it to use the built-in system icon named snow by simply doing UIImage(systemName: "snow")?.cgImage
        cell.contents = UIImage(systemName: "snow")?.cgImage
        
        // Set the .emitterCells of CAEmitterLayer to an array of CAEmitterCell. Because there is only one CAEmitterCell,simply enclose it in an array to easily add it.
        emitterLayer.emitterCells = [cell]
        
        // Add the CAEmitterLayer to view's CALayer by simply doing self.view.layer.addSublayer(layer). For the layer we put in the CAEmitterLayer that we created.
        self.view.layer.addSublayer(emitterLayer)
        
        // OPTIONAL: Notice that the emitter does not stop emitting particles. In order to make the CAEmitterLayer to stop emitting particles is to set the birthRate to 0.
        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { timer in
            print("timer fired!")
            emitterLayer.birthRate = 0
            timer.invalidate()
         }

    }
    
    @IBAction func fallingEmission(_ sender: Any) {
        // Create a constant of type CAEmitterLayer().
        let emitterLayer = CAEmitterLayer()
        
        // CAEmitterLayer should have have a flat shape so that it will rest at the top of the screen. To do so set the .emitterShape to .line
        emitterLayer.emitterShape = .line
        
        // Size of the CAEmitterLayer should be as flat as possible so that it will rest at the top of the screen.To do so set the .emitterSize to a CGSize(width: width, height: height). Where width is the size of the screen's frame or self.view.frame.width, and the height to 1
        emitterLayer.emitterSize = CGSize(width: self.view.frame.width, height: 1)
        
        // CAEmitterLayer should  be at the top of the screen. Modify the .emitterPosition of the CAEmitterLayer by doing a CGPoint(x,y) where x is the center of the screen or self.view.frame.midX, and y is 0
        emitterLayer.emitterPosition = CGPoint(x: self.view.frame.midX, y: 0)
        
        // Create a CAEmitterCell that you will emit particles by createing a constant of type CAEmitterCell().
        let cell = CAEmitterCell()
       
        // Set the .birthRate of object to a Float value.
        cell.birthRate = 5
        
        // Set the .lifetime of object to a Float value.
        cell.lifetime = 10
        
        // Set the .velocity of object to a Float value.
        cell.velocity = 100
        
        // Set the .velocityRange of object to a Float value. For this example set it to half of our velocity or velocity/2, since our velocity is 100 then this means that the velocity can range from 50 - 100
        cell.velocityRange = cell.velocity / 2
        
        // Set the .emissionLongitude of our object to a Float value. Angle of the emission should to be at the bottom direction. Set it to .pi. Othercase emission will be pointing upwards.
        cell.emissionLongitude = .pi
        
        // Set the .emissionRangeof our object to a Float value. We want the angle of the emission of particles be in a general direction with not too much angle. To do this we can simply set it to .pi / 4 to make the particle emission tighter
        cell.emissionRange = .pi / 4
        
        // Set the .spinRange of object to a Float value. For this example we set it to 4, since our default spin is 0 then the range of spin is from 0 - 4
        cell.spinRange = 4
        
        // Set the .scaleRange of object to a Float value. For this example we set it to 0.5, since our default scale is 1 then the range of sizes is from 0.5 - 1
        cell.scaleRange = 0.5
        
        // Set the .contents of object to a cgImage value. For ex. use the built-in system icon.
        cell.contents = UIImage(systemName: "snow")?.cgImage
        
        // Set the .emitterCells of CAEmitterLayer to an array of CAEmitterCell. Becasue there is only one CAEmitterCell the just simply enclose it in an array to easily add it.
        emitterLayer.emitterCells = [cell]
        
        // Add the CAEmitterLayer to  view's CALayer by doing self.view.layer.addSublayer(layer).
        self.view.layer.addSublayer(emitterLayer)
        
        // OPTIONAL: Notice that the emitter does not stop emitting particles. In order to make the CAEmitterLayer to stop emitting particles is to set the birthRate to 0.
        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { timer in
            print("timer fired!")
            emitterLayer.birthRate = 0
            timer.invalidate()
         }
    }
    
}
