//
//  ViewController.swift
//  AnimationApp
//
//  Created by Никита  on 28.04.2021.
//

import Spring

class ViewController: UIViewController {

    @IBOutlet var animationView: SpringView!
    
    @IBOutlet var playButton: UIButton!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var forceLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var dampingLabel: UILabel!
    @IBOutlet var delayLabel: UILabel!
    @IBOutlet var velocityLabel: UILabel!
    
    private var animations = Animation.getAnimation()
    private var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStartValue()
        animationView.layer.cornerRadius = animationView.frame.height / 12
        playButton.layer.cornerRadius = playButton.frame.height / 6
    }

    @IBAction func getAnimationButton() {
        let currentAnimation = animations[currentIndex]
        
        nameLabel.text = "name: \(currentAnimation.name)"
        forceLabel.text = "force: \(currentAnimation.force)"
        durationLabel.text = "duration: \(currentAnimation.duration)"
        dampingLabel.text = "dampling: \(currentAnimation.damping)"
        delayLabel.text = "delay: \(currentAnimation.delay)"
        velocityLabel.text = "velocity: \(currentAnimation.velocity)"
        
        animationView.animation = currentAnimation.name
        animationView.force = CGFloat(currentAnimation.force)
        animationView.duration = CGFloat(currentAnimation.duration)
        animationView.delay = CGFloat(currentAnimation.delay)
        animationView.damping = CGFloat(currentAnimation.damping)
        animationView.velocity = CGFloat(currentAnimation.velocity)
        animationView.animate()
        
        if currentIndex < animations.count - 1 {
            currentIndex += 1
        } else {
            currentIndex = 0
            animations = Animation.getAnimation()
        }
        playButton.setTitle("Play \(animations[currentIndex].name)", for: .normal)
    }
    
    private func setStartValue() {
        playButton.setTitle("Play \(animations[0].name)", for: .normal)
        
        nameLabel.text = "name: \(animations[0].name)"
        forceLabel.text = "force: \(animations[0].force)"
        durationLabel.text = "duration: \(animations[0].duration)"
        dampingLabel.text = "dampling: \(animations[0].damping)"
        delayLabel.text = "delay: \(animations[0].delay)"
        velocityLabel.text = "velocity: \(animations[0].velocity)"
    }
}

