//
//  FishViewModel.swift
//  RivneFish
//
//  Created by Anatolii Kyryliuk on 24/10/2016.
//  Copyright © 2016 rivnefish. All rights reserved.
//

import Foundation

class FishViewModel {
    let name: String
    let amount: Int
    let image: UIImage?

    init(name: String?, amount: Int?, image: UIImage?) {
        self.name = name ?? ""
        self.amount = amount ?? 0
        self.image = image
    }
}
