//
//  ch11.swift
//  Book
//
//  Created by zangconghui on 2025/9/1.
//

import UIKit
import SnapKit
import RxSwift
import Then

//final class Ch11VC: UIViewController {
//    
//    private let frequency = 1.0 / 60.0
//    private var duration: TimeInterval = 1
//    private var timeOffset: TimeInterval = 0
//    private var fromValue: Any?
//    private var toValue: Any?
//    private var timer: Timer?
//    
//    private let imageView = UIImageView(image: UIImage(named: "basketball"))
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupSubviews()
//        animate()
//    }
//    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        animate()
//    }
//    
//    private func setupSubviews() {
//        view.backgroundColor = .white
//        view.addSubview(imageView)
//        imageView.frame = CGRectMake(0, 0, 100, 100)
//        imageView.center = CGPointMake(AppConstants.midX, AppConstants.midY)
//    }
//    
//    private func animate() {
//        timeOffset = 0
//        imageView.center = CGPointMake(AppConstants.midX, AppConstants.midY)
//        fromValue = CGPointMake(AppConstants.midX, AppConstants.midY)
//        toValue = CGPointMake(AppConstants.midX, AppConstants.midY + 100)
//        timer = Timer.scheduledTimer(withTimeInterval: frequency, repeats: true) { [weak self] time in
//            guard let self else { return }
//            step(time)
//        }
//    }
//    
//    private func step(_ step: Timer) {
//        timeOffset = min(timeOffset + frequency, duration)
//        var time = timeOffset / duration
//        time = bounceEaseOut(time)
//        let position = interpolateFromValue(fromValue, toValue, time)
//        imageView.center = position as! CGPoint
//        if timeOffset >= duration {
//            timer?.invalidate()
//            timer = nil
//        }
//    }
//    
//    private func bounceEaseOut(_ t: TimeInterval) -> TimeInterval {
//        if (t < 4/11.0) {
//            return (121 * t * t)/16.0;
//        } else if (t < 8/11.0) {
//            return (363/40.0 * t * t) - (99/10.0 * t) + 17/5.0;
//        } else if (t < 9/10.0) {
//            return (4356/361.0 * t * t) - (35442/1805.0 * t) + 16061/1805.0;
//        }
//        return (54/5.0 * t * t) - (513/25.0 * t) + 268/25.0
//    }
//    
//    private func interpolateFromValue(_ fromValue: Any, _ toValue: Any, _ time: TimeInterval) -> Any {
//        if fromValue is CGPoint {
//            let from = fromValue as! CGPoint
//            let to = toValue as! CGPoint
//            let x = interpolate(from.x, to.x, time)
//            let y = interpolate(from.y, to.y, time)
//            return CGPoint(x: x, y: y)
//        }
//        return time < 0.5 ? fromValue : toValue
//    }
//    
//    private func interpolate(_ from: CGFloat, _ to: CGFloat, _ time: CGFloat) -> CGFloat {
//        return (to - from) * time + from
//    }
//}

// 改用CADisplayLink
//final class Ch11VC: UIViewController {
//
//    private let frequency = 1.0 / 60.0
//    private var duration: TimeInterval = 1
//    private var timeOffset: TimeInterval = 0
//    private var fromValue: Any?
//    private var toValue: Any?
//    private var timer: CADisplayLink?
//    private var lastStep: CFTimeInterval?
//
//    private let imageView = UIImageView(image: UIImage(named: "basketball"))
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupSubviews()
//        animate()
//    }
//
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        animate()
//    }
//
//    private func setupSubviews() {
//        view.backgroundColor = .white
//        view.addSubview(imageView)
//        imageView.frame = CGRectMake(0, 0, 100, 100)
//        imageView.center = CGPointMake(AppConstants.midX, AppConstants.midY)
//    }
//
//    private func animate() {
//        timeOffset = 0
//        imageView.center = CGPointMake(AppConstants.midX, AppConstants.midY)
//        fromValue = CGPointMake(AppConstants.midX, AppConstants.midY)
//        toValue = CGPointMake(AppConstants.midX, AppConstants.midY + 100)
//        timer?.invalidate()
//        lastStep = CACurrentMediaTime()
//        timer = CADisplayLink(target: self, selector: #selector(step(_:)))
//        timer?.add(to: .main, forMode: .default)
//    }
//
//    @objc private func step(_ step: CADisplayLink) {
//        let thisStep = CACurrentMediaTime()
//        let stepDuration = thisStep - lastStep!
//        lastStep = thisStep
//        timeOffset = min(timeOffset + stepDuration, duration)
//        var time = timeOffset / duration
//        time = bounceEaseOut(time)
//        let position = interpolateFromValue(fromValue, toValue, time)
//        imageView.center = position as! CGPoint
//        if timeOffset >= duration {
//            timer?.invalidate()
//            timer = nil
//        }
//    }
//
//    private func bounceEaseOut(_ t: TimeInterval) -> TimeInterval {
//        if (t < 4/11.0) {
//            return (121 * t * t)/16.0;
//        } else if (t < 8/11.0) {
//            return (363/40.0 * t * t) - (99/10.0 * t) + 17/5.0;
//        } else if (t < 9/10.0) {
//            return (4356/361.0 * t * t) - (35442/1805.0 * t) + 16061/1805.0;
//        }
//        return (54/5.0 * t * t) - (513/25.0 * t) + 268/25.0
//    }
//
//    private func interpolateFromValue(_ fromValue: Any, _ toValue: Any, _ time: TimeInterval) -> Any {
//        if fromValue is CGPoint {
//            let from = fromValue as! CGPoint
//            let to = toValue as! CGPoint
//            let x = interpolate(from.x, to.x, time)
//            let y = interpolate(from.y, to.y, time)
//            return CGPoint(x: x, y: y)
//        }
//        return time < 0.5 ? fromValue : toValue
//    }
//
//    private func interpolate(_ from: CGFloat, _ to: CGFloat, _ time: CGFloat) -> CGFloat {
//        return (to - from) * time + from
//    }
//}

import include_chipmunk

//let MASS: cpFloat = 100
//
//final class Crate: UIImageView {
//    var body: UnsafeMutablePointer<cpBody>?
//    var shape: UnsafeMutablePointer<cpShape>?
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupSubviews()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    private func setupSubviews() {
//        backgroundColor = .white
//        image = UIImage(named: "crate")
//        contentMode = .scaleAspectFill
//        body = cpBodyNew(MASS, cpMomentForBox(MASS, frame.size.width, frame.size.height))
//        var corners: [cpVect] = [
//            cpv(0, 0),
//            cpv(0, frame.size.height),
//            cpv(frame.size.width, 0),
//            cpv(frame.size.width, frame.size.height)
//        ]
//        corners.withUnsafeMutableBufferPointer { buffer in
//            shape = cpPolyShapeNew(body, 4, buffer.baseAddress, cpv(-frame.size.width / 2, -frame.size.height / 2))
//        }
//        cpShapeSetFriction(shape, 0.5)
//        cpShapeSetElasticity(shape, 0.5)
//        shape
//        cpBodySetPos(body, cpv(frame.origin.x + frame.size.width / 2, 300 - frame.origin.y - frame.size.height/2))
//    }
//}

//final class Ch11VC: UIViewController {
//    
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupSubviews()
//    }
//    
//    private func setupSubviews() {
//        
//    }
//}

//import QuartzCore
//
//final class Crate: UIImageView {
//    var body: UnsafeMutablePointer<cpBody>!
//    var shape: UnsafeMutablePointer<cpShape>!
//    
//    private let mass: cpFloat = 100
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        self.image = UIImage(named: "crate.png")
//        self.contentMode = .scaleAspectFill
//        
//        // 创建刚体
//        body = cpBodyNew(mass, cpMomentForBox(mass, frame.size.width, frame.size.height))
//        
//        // 多边形顶点
//        var corners = [
//            cpv(0, 0),
//            cpv(0, frame.size.height),
//            cpv(frame.size.width, frame.size.height),
//            cpv(frame.size.width, 0)
//        ]
//        
//        // 创建 shape
//        shape = cpPolyShapeNew(body, 4, &corners, cpv(-frame.size.width/2, -frame.size.height/2))
//        
//        // 设置摩擦和弹性
//        cpShapeSetFriction(shape, 0.5)
//        cpShapeSetElasticity(shape, 0.8)
//        
//        // 绑定 crate 到 shape 的 userData
//        shape.pointee.data = UnsafeMutableRawPointer(Unmanaged.passUnretained(self).toOpaque())
//        
//        // 设置初始位置
//        cpBodySetPos(body, cpv(frame.midX, 300 - frame.midY))
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    deinit {
//        cpShapeFree(shape)
//        cpBodyFree(body)
//    }
//}
//
//final class Ch11VC: UIViewController {
//    
//   private var containerView = UIView()
//    
//    private var space: UnsafeMutablePointer<cpSpace>!
//    private var timer: CADisplayLink!
//    private var lastStep: CFTimeInterval = 0
//    
//    private let gravity: cpFloat = 1000
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        // 翻转坐标系
//        containerView.layer.isGeometryFlipped = true
//        
//        // 创建物理空间
//        space = cpSpaceNew()
//        cpSpaceSetGravity(space, cpv(0, -gravity))
//        
//        // 添加一个木箱
//        let crate = Crate(frame: CGRect(x: 100, y: 0, width: 100, height: 100))
//        containerView.addSubview(crate)
//        
//        cpSpaceAddBody(space, crate.body)
//        cpSpaceAddShape(space, crate.shape)
//        
//        // 启动定时器
//        lastStep = CACurrentMediaTime()
//        timer = CADisplayLink(target: self, selector: #selector(step))
//        timer.add(to: .main, forMode: .default)
//    }
//    
//    @objc private func step() {
//        let thisStep = CACurrentMediaTime()
//        let stepDuration = thisStep - lastStep
//        lastStep = thisStep
//        
//        // 更新物理世界
//        cpSpaceStep(space, stepDuration)
//        
//        // 遍历所有 shape 并更新对应的 crate
//        cpSpaceEachShape(space, { (shape, _) in
//            guard let shape = shape else { return }
//            if let userData = shape.pointee.data {
//                let crate = Unmanaged<Crate>.fromOpaque(userData).takeUnretainedValue()
//                let body = cpShapeGetBody(shape)
//                
//                let pos = cpBodyGetPos(body)
//                crate.center = CGPoint(x: pos.x, y: pos.y)
//                
//                let angle = cpBodyGetAngle(body)
//                crate.transform = CGAffineTransform(rotationAngle: CGFloat(angle))
//            }
//        }, nil)
//    }
//    
//    deinit {
//        cpSpaceFree(space)
//        timer.invalidate()
//    }
//}
