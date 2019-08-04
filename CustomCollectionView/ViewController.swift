//
//  ViewController.swift
//  CustomCollectionView
//
//  Created by Evren Yaşar on 4.08.2019.
//  Copyright © 2019 Evren Yaşar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let cellName = "CollectionCell"
    let data: [String] = ["orem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır ","Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat numune kitabı oluşturmak üzere bir yazı galerisini alarak karıştırdığı 1500'lerden beri endüstri standardı sahte metinler ","Beşyüz yıl boyunca varlığını sürdürmekle ","1960'larda Lorem Ipsum pasajları da içeren Letraset yapraklarının yayınlanması ile ve yakın zamanda Aldus PageMaker gibi Lorem Ipsum sürümleri içeren masaüstü yayıncılık yazılımları ile popüler olmuştur.","Nereden Gelir?"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createCollectionView()
    }


}

extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    
    fileprivate func createCollectionView(){
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        flowLayout.estimatedItemSize = CGSize(width: 100, height: 50)
        
        let collectionRect = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        let collectionView = UICollectionView(frame: collectionRect, collectionViewLayout: flowLayout)
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CustomCollectionCell.self, forCellWithReuseIdentifier: cellName)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellName, for: indexPath) as! CustomCollectionCell
        cell.explainLbl.text = data[indexPath.row]
        return cell
    }
    
}



class CustomCollectionCell: UICollectionViewCell {
    
    
    lazy var explainLbl: UILabel = {
        let lbl = UILabel(frame: CGRect.zero)
        lbl.text = "Explain Label"
        lbl.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.light)
        lbl.textColor = UIColor.lightGray
        lbl.numberOfLines = 0
        return lbl
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.addSubview(explainLbl)
        backgroundColor = UIColor.yellow
        contentView.backgroundColor = UIColor.purple
        explainLbl.translatesAutoresizingMaskIntoConstraints = false
        explainLbl.widthAnchor.constraint(equalToConstant: 250).isActive = true
        explainLbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        explainLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        explainLbl.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        explainLbl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        
        //if you use complex view, U can add this
        /*if let last = contentView.subviews.last {
            contentView.heightAnchor.constraint(equalTo: last.heightAnchor, constant: 10).isActive = true
        }*/
    }
}
