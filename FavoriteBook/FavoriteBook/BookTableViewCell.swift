//
//  BookTableViewCell.swift
//  FavoriteBooks
//
//  Created by Stomach Diego on 11/2/20.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var authorTextLabel: UILabel!
    @IBOutlet weak var genreTextLabel: UILabel!
    @IBOutlet weak var lengthTextLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(with book: Book) {
        titleTextLabel.text = book.title
        authorTextLabel.text = book.author
        genreTextLabel.text = book.genre
        lengthTextLabel.text = book.length
    }

}
