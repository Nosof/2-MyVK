//
//  LikeControl.swift
//  MyVK
//
//  Created by Валерий on 31.12.2020.
//

import UIKit

class LikeControl: UIControl {
    
    var likesCount: Int = 0 {
        didSet {
            button.setTitle("\(likesCount)", for: .normal)
        }
    }
    
    var isLiked: Bool = false {
        didSet {
            button.setImage(isLiked ? self.likedlmage : self.unlikedlmage, for: .normal)
        }
    }
    
    private var button = UIButton(type: .custom)
    private let unlikedlmage = UIImage(systemName: "heart")?.withRenderingMode(.alwaysOriginal)
    private let likedlmage = UIImage(systemName: "heart.fill")?.withRenderingMode(.alwaysTemplate)
    private let unlikedScale: CGFloat = 0.8
    private let likedScale: CGFloat = 1.2
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupView()
    }
    
    func setupView(){
        backgroundColor = .white
        //настройки
        button.imageView?.contentMode = .scaleAspectFit
        button.setTitleColor(.black, for: .normal)
        button.tintColor = .red
        //добавляем таргет при нажатии на контрол
        button.addTarget(self, action: #selector(pushLikeButton(_:)), for: .touchUpInside)
        button.titleLabel?.font = .systemFont(ofSize: 12)
        
        self.addSubview(button)
        //self.contentHorizontalAlignment = .left //?? noKa He pa6oTaeT
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //расстягиваем кнопку на весь вью
        button.frame = bounds
    }
    
    
    //обработчик нажатия на контрол
    @objc private func pushLikeButton(_ sender: UIButton) {
        isLiked.toggle()
        likesCount = isLiked ? (likesCount + 1) : (likesCount - 1)
        animate()
        //отправляем экшн на ружу
        self.sendActions(for: .valueChanged)
    }
    
    //MARK: - анимация
    private func animate() {
        UIView.animate(withDuration: 0.1, animations: {
            let newlmage = self.isLiked ? self.likedlmage : self.unlikedlmage
            let newScale = self.isLiked ? self.likedScale : self.unlikedScale
            self.button.transform = self.transform.scaledBy(x: newScale, y: newScale)
            self.button.setImage(newlmage, for: .normal)
        }, completion: { _ in
            UIView.animate(withDuration: 0.1, animations: {
                self.button.transform = CGAffineTransform.identity
            })
        })
    }
}
