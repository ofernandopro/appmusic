//
//  MusicDetailsScreen.swift
//  AppMusicBF
//
//  Created by Fernando Moreira on 09/01/23.
//

import UIKit

protocol MusicDetailsScreenDelegate: AnyObject{
    func tappedCloseButton()
}

class MusicDetailsScreen: UIView {
    
    private weak var delegate: MusicDetailsScreenDelegate?
    
    //var music = Music?
    
    lazy var view: UIView = {
       let v = UIButton()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor(red: 70/255, green: 50/255, blue: 55/255, alpha: 0.95)
        return v
    }()

    lazy var closeButton: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("", for: .normal)
        btn.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        btn.tintColor = .white
        btn.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
        return btn
    }()
    
    lazy var musicImageView: UIImageView = {
       let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "deixa_pra_amanha_dilsinho")
        img.clipsToBounds = true
        img.layer.cornerRadius = 10
        return img
    }()
    
    lazy var musicNameLabel: UILabel = {
       let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "Deixa Pra Amanhã (Ao Vivo)"
        l.numberOfLines = 1
        l.font = UIFont.boldSystemFont(ofSize: 26)
        l.textColor = .white
        return l
    }()
    
    lazy var musicProgressView: UIProgressView = {
       let pv = UIProgressView()
        pv.translatesAutoresizingMaskIntoConstraints = false
        pv.progress = 0.3
        pv.backgroundColor = .white
        pv.progressTintColor = .systemPink
        return pv
    }()
    
    lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        return sv
    }()
    
    lazy var goBackButton: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "go_back_music"), for: .normal)
        return btn
    }()
    
    lazy var playButton: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "play_button"), for: .normal)
        btn.tintColor = .white
        return btn
    }()
    
    lazy var goNextButton: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "go_next_music"), for: .normal)
        return btn
    }()
    
    init() {
        super.init(frame: CGRect())
        DispatchQueue.main.async {
            self.setupViews()
            self.setupConstraints()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.addSubview(self.view)
        self.view.addSubview(self.closeButton)
        self.view.addSubview(self.musicImageView)
        self.view.addSubview(self.musicNameLabel)
        self.view.addSubview(self.musicProgressView)
        self.view.addSubview(self.stackView)
        self.stackView.addArrangedSubview(self.goBackButton)
        self.stackView.addArrangedSubview(self.playButton)
        self.stackView.addArrangedSubview(self.goNextButton)
    }
    
    private func setupConstraints(){
        
        NSLayoutConstraint.activate([
            
            self.view.topAnchor.constraint(equalTo: self.topAnchor),
            self.view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.closeButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 70),
            self.closeButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.closeButton.heightAnchor.constraint(equalToConstant: 40),
            self.closeButton.widthAnchor.constraint(equalToConstant: 40),
            
            self.musicImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200),
            self.musicImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
            self.musicImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50),
            //self.musicImageView.heightAnchor.constraint(equalToConstant: self.musicImageView.frame.width),
            self.musicImageView.heightAnchor.constraint(equalToConstant: 300),
            
            self.musicNameLabel.topAnchor.constraint(equalTo: self.musicImageView.bottomAnchor, constant: 20),
            self.musicNameLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            self.musicNameLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            
            self.musicProgressView.topAnchor.constraint(equalTo: self.musicNameLabel.bottomAnchor, constant: 40),
            self.musicProgressView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40),
            self.musicProgressView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -40),
            self.musicProgressView.heightAnchor.constraint(equalToConstant: 5),
            
            self.stackView.topAnchor.constraint(equalTo: self.musicProgressView.bottomAnchor, constant: 15),
            self.stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            self.stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            self.stackView.heightAnchor.constraint(equalToConstant: 70),
            
            self.playButton.widthAnchor.constraint(equalToConstant: 50),

        ])
        
    }
    
    public func configDelegates(delegate: MusicDetailsScreenDelegate) {
        self.delegate = delegate
    }
    
    @objc func closeButtonPressed() {
        self.delegate?.tappedCloseButton()
    }

}
