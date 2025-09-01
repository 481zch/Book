//
//  ch08.swift
//  Book
//
//  Created by zangconghui on 2025/8/29.
//

import UIKit
import SnapKit
import RxSwift
import Then

//final class Ch08VC: UIViewController {
//    
//    private let bag = DisposeBag()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupSubviews()
//    }
//    
//    private func setupSubviews() {
//        view.backgroundColor = .white
//        let button = UIButton(frame: CGRectMake(100, 100, 40, 40))
//        button.backgroundColor = .red
//        view.addSubview(button)
//        
//        button.rx.tap.subscribeNext { [weak self] in
//            guard let self else { return }
//            let animation = CABasicAnimation()
//            animation.keyPath = "backgroundColor"
//            animation.toValue = UIColor.green.cgColor
//            animation.duration = 10
//            animation.delegate = self
//            animation.setValue(view, forKey: "view")
//            view.layer.add(animation, forKey: nil)
//        }.disposed(by: bag)
//    }
//}
//
//extension Ch08VC: CAAnimationDelegate {
//    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
//        let view = anim.value(forKey: "view")
//        
//        print("hello world")
//    }
//}

//final class Ch08VC: UIViewController {
//
//    private let bag = DisposeBag()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupSubviews()
//    }
//
//    private func setupSubviews() {
//        view.backgroundColor = .white
//        let button = UIButton(frame: CGRectMake(100, 100, 40, 40))
//        button.backgroundColor = .red
//        view.addSubview(button)
//
//        button.rx.tap.subscribeNext { [weak self] in
//            guard let self else { return }
//            var keyFrameAnimation = CAKeyframeAnimation()
//            keyFrameAnimation.keyPath = "backgroundColor"
//            keyFrameAnimation.duration = 3
//            keyFrameAnimation.values = [UIColor.random().cgColor, UIColor.random().cgColor, UIColor.random().cgColor]
//            view.layer.add(keyFrameAnimation, forKey: nil)
//        }.disposed(by: bag)
//    }
//}

//final class Ch08VC: UIViewController {
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupSubviews()
//    }
//    
//    private func setupSubviews() {
//        view.backgroundColor = .white
//        let layer = CALayer()
//        layer.frame = CGRectMake(0, 0, 60, 60)
//        layer.position = CGPointMake(30, 150)
//        layer.contents = UIImage(named: "snowman")?.cgImage
//        view.layer.addSublayer(layer)
//        
//        let path = UIBezierPath()
//        path.move(to: CGPoint(x: 30, y: 150))
//        
//        path.addQuadCurve(
//            to: CGPoint(x: 130, y: 150),
//            controlPoint: CGPoint(x: 80, y: 200)
//        )
//        
//        path.addQuadCurve(
//            to: CGPoint(x: 230, y: 150),
//            controlPoint: CGPoint(x: 180, y: 100)
//        )
//        
//        let shapeLayer = CAShapeLayer()
//        shapeLayer.path = path.cgPath
//        shapeLayer.strokeColor = UIColor.red.cgColor
//        shapeLayer.lineWidth = 3
//        shapeLayer.fillColor = UIColor.clear.cgColor
//        view.layer.addSublayer(shapeLayer)
//        
//        let animation = CAKeyframeAnimation(keyPath: "position")
//        animation.path = path.cgPath
//        animation.duration = 4
//        animation.fillMode = .forwards
//        animation.isRemovedOnCompletion = false
//        animation.rotationMode = .rotateAuto
//                
//        layer.add(animation, forKey: "sPathAnimation")
//    }
//}

//final class Ch08VC: UIViewController {
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupSubviews()
//    }
//    
//    private func setupSubviews() {
//        view.backgroundColor = .white
//        let layer = CALayer()
//        layer.frame = CGRectMake(0, 0, 100, 100)
//        layer.position = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
//        
//        let animation1 = CABasicAnimation(keyPath: "opacity")
//        animation1.fromValue = 0.0
//        animation1.toValue = 1.0
//        
//        let animation2 = CABasicAnimation(keyPath: "backgroundColor")
//        animation2.fromValue = UIColor.white.cgColor
//        animation2.toValue = UIColor.purple.cgColor
//        
//        var group = CAAnimationGroup()
//        group.animations = [animation1, animation2]
//        group.duration = 3
//        
//        layer.add(group, forKey: nil)
//        view.layer.addSublayer(layer)
//    }
//}

//final class Ch08VC: UIViewController {
//    
//    private let bag = DisposeBag()
//
//    private var curIndex = 0
//    
//    private let images = [
//        UIImage(named: "snowman"),
//        UIImage(named: "bird"),
//        UIImage(named: "combine4"),
//    ]
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupSubviews()
//    }
//    
//    private func setupSubviews() {
//        view.backgroundColor = .white
//        let layer = CALayer()
//        layer.frame = CGRectMake(0, 0, 100, 100)
//        layer.position = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
//        view.layer.addSublayer(layer)
//        
//        Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { [weak self] _ in
//            guard let self else { return }
//            
//            let transition = CATransition()
//            transition.type = .reveal
//            transition.duration = 1
//            transition.subtype = .fromLeft
//            layer.add(transition, forKey: nil)
//            curIndex = (curIndex + 1) % images.count
//            layer.contents = images[curIndex]?.cgImage
//        }
//    }
//}

//final class Ch08VC: UITabBarController {
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupSubviews()
//    }
//    
//    private func setupSubviews() {
//        let vc1 = UIViewController()
//        vc1.view.backgroundColor = .white
//        vc1.tabBarItem = UITabBarItem(title: "1",
//                                      image: UIImage(systemName: "square.and.arrow.up"),
//                                      tag: 0)
//        
//        let vc2 = UIViewController()
//        vc2.view.backgroundColor = .white
//        vc2.tabBarItem = UITabBarItem(title: "2",
//                                      image: UIImage(systemName: "pencil.circle.fill"),
//                                      tag: 1)
//
//        let vc3 = UIViewController()
//        vc3.view.backgroundColor = .white
//        vc3.tabBarItem = UITabBarItem(title: "3",
//                                      image: UIImage(systemName: "eraser.fill"),
//                                      tag: 2)
//
//        self.viewControllers = [vc1, vc2, vc3]
//    }
//    
//    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        let transitoin = CATransition()
//        transitoin.duration = 1
//        view.layer.add(transitoin, forKey: nil)
//    }
//}

//final class Ch08VC: UIViewController {
//
//    private let bag = DisposeBag()
//
//    private var curIndex = 0
//
//    private let images = [
//        UIImage(named: "snowman"),
//        UIImage(named: "bird"),
//        UIImage(named: "combine4"),
//    ]
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupSubviews()
//    }
//
//    private func setupSubviews() {
//        view.backgroundColor = .white
//        let layer = CALayer()
//        layer.frame = CGRectMake(0, 0, 100, 100)
//        layer.position = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
//        view.layer.addSublayer(layer)
//
//        Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { [weak self] _ in
//            guard let self else { return }
//
//            let renderer = UIGraphicsImageRenderer(bounds: view.bounds)
//            let coverImage = renderer.image { [weak self] ctx in
//                guard let self else { return }
//                view.layer.render(in: ctx.cgContext)
//            }
//            
//            let coverView = UIImageView(image: coverImage)
//            coverView.frame = view.bounds
//            view.addSubview(coverView)
//            
//            view.backgroundColor = UIColor.random()
//            
//            UIView.animate(withDuration: 1.0, animations: {
//                var transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
//                transform = transform.rotated(by: .pi / 2)
//                coverView.transform = transform
//                coverView.alpha = 0.0
//            }, completion: { _ in
//                coverView.removeFromSuperview()
//            })
//            
//            curIndex = (curIndex + 1) % images.count
//            layer.contents = images[curIndex]?.cgImage
//        }
//    }
//}
