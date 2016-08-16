//
//  FishImagesCell.swift
//  RivneFish
//
//  Created by Anatolii Kyryliuk on 10/08/16.
//  Copyright © 2016 rivnefish. All rights reserved.
//

class FishImagesCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!

    let kCellIdentifier = "imagesCellIdentifier"
    let kFishCellIdentifier = "fishImagesCellIdentifier"
    static let kFishCellWidth: CGFloat = 70.0
    var currentImageIndex = 0

    @IBOutlet weak var imagesCollectionView: UICollectionView! {
        didSet {
            setupFishCollectionView()
        }
    }

    var fishArray: Array<Fish>?
    var imagesArray: Array<UIImage?>!

    func setup(withFishArray fishArray: Array<Fish>) {
        self.fishArray = fishArray

        correctCollectionViewOffset()
        imagesCollectionView.reloadData()
    }

    func setupFishCollectionView() {
        imagesCollectionView.dataSource = self
        imagesCollectionView.delegate = self

        self.imagesCollectionView.registerNib(UINib(nibName: "FishCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: kFishCellIdentifier)

        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        flowLayout.minimumInteritemSpacing = 0.0
        flowLayout.minimumLineSpacing = 0.0

        imagesCollectionView.collectionViewLayout.invalidateLayout()
        imagesCollectionView.collectionViewLayout = flowLayout
    }

    private func correctCollectionViewOffset() {
        let offset = CGFloat(currentImageIndex) * imagesCollectionView.frame.size.width
        imagesCollectionView.contentOffset = CGPoint(x: offset, y: 0)
    }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fishArray?.count ?? 0
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if let cell: FishCollectionViewCell = self.imagesCollectionView.dequeueReusableCellWithReuseIdentifier(kFishCellIdentifier, forIndexPath: indexPath) as? FishCollectionViewCell,
            let fish = fishArray?[indexPath.row] {
            cell.image = fish.image
            cell.name = fish.ukrName
            cell.amount = fish.amount ?? 0
            cell.updateCell()
            return cell
        }
        return UICollectionViewCell()
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: FishImagesCell.kFishCellWidth, height: self.imagesCollectionView.frame.height)
    }

    internal func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        currentImageIndex = Int(imagesCollectionView.contentOffset.x / imagesCollectionView.frame.size.width)
    }
}
