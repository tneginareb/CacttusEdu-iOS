
//
//  ProduktetViewController.swift
//  CacttusEdu
//
//  Created by Gent Berani on 4/18/18.
//  Copyright © 2018 CacttusEdu. All rights reserved.
//

import UIKit

class ProduktetViewController: UIViewController{

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension ProduktetViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 32
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        cell.backgroundColor = .gray
        
        return cell
    }
}

extension ProduktetViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("indexpath.row: \(indexPath.row)")
    }
}

extension ProduktetViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellSpace: CGFloat = 10.0
        let divider: CGFloat = 2
        let width = collectionView.bounds.width / divider - (cellSpace / divider)
        let size: CGSize = CGSize.init(width: width, height: width)
        
        return size
    }
}

