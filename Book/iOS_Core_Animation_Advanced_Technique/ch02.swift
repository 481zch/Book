//
//  ch02.swift
//  Book
//
//  Created by zangconghui on 2025/8/25.
//

import UIKit
import SnapKit
import RxSwift
import Then


//final class Ch02VC: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupSubviews()
//    }
//    
//    private func setupSubviews() {
//        let layer = CALayer()
//        layer.frame = CGRectMake(0, 0, 200, 200)
//        layer.position = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
//        layer.contents = UIImage(named: "snowman")?.cgImage
//        view.layer.addSublayer(layer)
//    }
//}

//final class Ch02VC: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupSubviews()
//    }
//
//    private func setupSubviews() {
//        let layer = CALayer()
//        layer.frame = CGRectMake(0, 0, 400, 200)
//        layer.position = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
//        layer.contents = UIImage(named: "snowman")?.cgImage
//        layer.backgroundColor = UIColor.gray.cgColor
//        layer.contentsScale = UIScreen.main.scale
//        layer.contentsGravity = .resizeAspectFill
//        layer.masksToBounds = true
//        view.layer.addSublayer(layer)
//    }
//}

//final class Ch02VC: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupSubviews()
//    }
//    
//    private func setupSubviews() {
//        let image = UIImage(named: "combine4")?.cgImage
//        for i in 0..<2 {
//            for j in 0..<2 {
//                let layer = CALayer()
//                layer.frame = CGRectMake(0, 0, 50, 50)
//                layer.position = CGPoint(x: (view.bounds.midX / 2) * (CGFloat(i) + 1.0), y: (view.bounds.midY / 2) * (CGFloat(j) + 1.0))
//                layer.contents = image
//                layer.contentsRect = CGRect(x: CGFloat(i) * 0.5, y: CGFloat(j) * 0.5, width: 0.5, height: 0.5)
//                view.layer.addSublayer(layer)
//            }
//        }
//    }
//}

//final class Ch02VC: UIViewController {
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupSubviews()
//    }
//    
//    private func setupSubviews() {
//        let layer1 = CALayer()
//        layer1.backgroundColor = UIColor.gray.cgColor
//        layer1.contentsCenter = CGRectMake(0.25, 0.25, 0.5, 0.5)
//        layer1.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
//        layer1.contentsScale = UIScreen.main.scale
//        layer1.contents = UIImage(named: "snowman")?.cgImage
//        layer1.contentsGravity = .resizeAspect
//        layer1.position = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
//        view.layer.addSublayer(layer1)
//    }
//}

//final class Ch02VC: UIViewController, CALayerDelegate {
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupSubviews()
//    }
//    
//    private func setupSubviews() {
//        let layer = CALayer()
//        layer.frame = CGRectMake(0, 0, 100, 100)
//        layer.position = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
//        layer.backgroundColor = UIColor.gray.cgColor
//        view.layer.addSublayer(layer)
//        layer.delegate = self
//        view.setNeedsDisplay()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
//            layer.setNeedsDisplay()
//        }
//    }
//    
//    func display(_ layer: CALayer) {
//        layer.contents = UIImage(named: "snowman")?.cgImage
//    }
//    
//    func draw(_ layer: CALayer, in ctx: CGContext) {
//        layer.backgroundColor = UIColor.white.cgColor
//    }
//}
