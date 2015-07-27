//
//  MarkerAnnotationView.swift
//  RivneFish
//
//  Created by akyryl on 27/07/2015.
//  Copyright (c) 2015 rivnefish. All rights reserved.
//

import MapKit
import UIKit

class MarkerAnnotationView : MKAnnotationView {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var itemsCountLabel: UILabel!
    var itemsCount: Int = 1

    class func instanceFromNib(countElements: Int = 1) -> MarkerAnnotationView {
        var view: MarkerAnnotationView = UINib(nibName: "MarkerAnnotationView", bundle: nil).instantiateWithOwner(nil, options: nil)[0] as! MarkerAnnotationView

        view.itemsCount = countElements
        view.updateImageAndText()
        return view
    }

    /*var annotation: MKAnnotation {
        get {
            return self.annotation
        }
        set {
            self.annotation = newValue
        }
    }*/

    func updateImageAndText() {
        var imagePath = ""
        if self.itemsCount > 99 {
            imagePath = "m100-"
        } else if self.itemsCount > 9 {
            imagePath = "m10-99"
        } else if self.itemsCount > 1 {
            imagePath = "m2-9"
        } else {
            imagePath = "m1"
        }
        self.imageView.image = UIImage(named: imagePath)
        self.itemsCountLabel.text = self.itemsCount > 1 ? String(self.itemsCount) : ""
    }
}
