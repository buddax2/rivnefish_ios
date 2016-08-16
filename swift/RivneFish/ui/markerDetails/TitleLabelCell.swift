//
//  TitleLabelCell.swift
//  RivneFish
//
//  Created by Anatolii Kyryliuk on 07/08/16.
//  Copyright © 2016 rivnefish. All rights reserved.
//

class TitleLabelCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var label: UILabel!

    func setup(withTitle title: String?, text: String?) {
        let title = title ?? ""
        if !title.isEmpty {
            self.title.text = title
        } else {
            self.title.hidden = true
        }
        let text = text ?? ""
        if !text.isEmpty {
            self.label.text = text
        } else {
            self.label.hidden = true
        }
    }
}