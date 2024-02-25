//
//  CarouselView.swift
//  MarketplaceApp
//
//  Created by Куат Оралбеков on 08.09.2023.
//

import Foundation
import UIKit

class CarouselView: UIView, UICollectionViewDelegate {
    
    var imagesNames: [String]
    
    override init(frame: CGRect) {
        self.imagesNames = []
        super.init(frame: frame)
        
    }
    
    init(imagesNames: [String]) {
        
        self.imagesNames = imagesNames
        print(self.imagesNames)
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

   // MARK: - Subviews
   private lazy var carouselCollectionView: UICollectionView = {
      let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
      collection.showsHorizontalScrollIndicator = false
      collection.dataSource = self
      collection.delegate = self
      collection.backgroundColor = .clear
      return collection
   }()

   private lazy var pageControl: UIPageControl = {
      let pageControl = UIPageControl()
      pageControl.pageIndicatorTintColor = .gray
      pageControl.currentPageIndicatorTintColor = .white
      return pageControl
   }()
    
    public func configureView() {
            let carouselLayout = UICollectionViewFlowLayout()
            carouselLayout.scrollDirection = .horizontal
            carouselLayout.itemSize = .init(width: 300, height: 400)
            carouselLayout.sectionInset = .zero
            carouselCollectionView.collectionViewLayout = carouselLayout
            carouselCollectionView.reloadData()
        }

   // MARK: - Properties
   
   private var currentPage = 0
}

// MARK: - UICollectionViewDataSource
extension CarouselView: UICollectionViewDataSource {
   func numberOfSections(in collectionView: UICollectionView) -> Int {
      return 1
   }

   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       print(imagesNames)
      return imagesNames.count
   }

   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselCell.cellId, for: indexPath) as? CarouselCell else { return UICollectionViewCell() }

      let image = imagesNames[indexPath.row]
      
    cell.imageName = image

      cell.setup()

      return cell
   }
    
}
