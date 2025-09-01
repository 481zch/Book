//
//  ch10.swift
//  Book
//
//  Created by zangconghui on 2025/9/1.
//

import UIKit

final class Ch10VC: UIViewController {
    
    private var containerView: UIView = UIView()
    private var ballView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        let ballImage = UIImage(named: "snowman")!
        ballView = UIImageView(image: ballImage)
        containerView.addSubview(ballView)
        
        animate()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(restart))
        view.addGestureRecognizer(tap)
    }
    
    @objc private func restart() {
        animate()
    }
    
    private func animate() {
        ballView.center = CGPoint(x: 150, y: 32)
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.duration = 1.0
        
        animation.values = [
            CGPoint(x: 150, y: 32),
            CGPoint(x: 150, y: 268),
            CGPoint(x: 150, y: 140),
            CGPoint(x: 150, y: 268),
            CGPoint(x: 150, y: 220),
            CGPoint(x: 150, y: 268),
            CGPoint(x: 150, y: 250),
            CGPoint(x: 150, y: 268)
        ].map { NSValue(cgPoint: $0) }
        
        animation.timingFunctions = [
            CAMediaTimingFunction(name: .easeIn),
            CAMediaTimingFunction(name: .easeOut),
            CAMediaTimingFunction(name: .easeIn),
            CAMediaTimingFunction(name: .easeOut),
            CAMediaTimingFunction(name: .easeIn),
            CAMediaTimingFunction(name: .easeOut),
            CAMediaTimingFunction(name: .easeIn)
        ]
        
        animation.keyTimes = [0.0, 0.3, 0.5, 0.7, 0.8, 0.9, 0.95, 1.0] as [NSNumber]
        
        ballView.layer.position = CGPoint(x: 150, y: 268)
        ballView.layer.add(animation, forKey: nil)
    }
}
