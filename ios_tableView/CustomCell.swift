//
//  CustomCell.swift
//  ios_tableView
//
//  Created by riko on 2024/03/10.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var customCellView: CustomCell!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // imageView を縦に並べるためのレイアウトを設定します
        setupImageViewsLayout()
    }
    
    private func setupImageViewsLayout() {
        let imageViewWidth: CGFloat = 55.0
        let spacing: CGFloat = 5.0 // imageView 間のスペース
        
        var previousImageView: UIImageView?
        
        let imageNames = ["icon_human", "icon_star", "icon_good", "icon_bad", "icon_search"]
        for imageName in imageNames {
            let imageView = UIImageView(image: UIImage(named: imageName))
            contentView.addSubview(imageView)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            // 画像のコンテンツモードを設定する
            imageView.contentMode = .scaleAspectFit
            
            // 背景色を設定する
            imageView.backgroundColor = UIColor.lightGray
            
            NSLayoutConstraint.activate([
                imageView.widthAnchor.constraint(equalToConstant: imageViewWidth),
                imageView.heightAnchor.constraint(equalToConstant: imageViewWidth)
            ])
            
            NSLayoutConstraint.activate([
                imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            ])
            
            if let previousImageView = previousImageView {
                NSLayoutConstraint.activate([
                    imageView.topAnchor.constraint(equalTo: previousImageView.bottomAnchor, constant: spacing)
                ])
            } else {
                // 最初の imageView の制約を設定します
                NSLayoutConstraint.activate([
                    imageView.topAnchor.constraint(equalTo: contentView.topAnchor)
                ])
            }
            
            // タップジェスチャーを追加します
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:)))
            imageView.isUserInteractionEnabled = true
            imageView.addGestureRecognizer(tapGesture)
            
            previousImageView = imageView
        }
        
        // 最後の imageView に contentView の bottom に制約を設定します
        if let lastImageView = previousImageView {
            NSLayoutConstraint.activate([
                contentView.bottomAnchor.constraint(equalTo: lastImageView.bottomAnchor)
            ])
        }
    }



    
    // imageView がタップされたときの処理
    @objc private func imageViewTapped(_ sender: UITapGestureRecognizer) {
        // タップされた imageView を特定します
        if let tappedImageView = sender.view as? UIImageView {
            // ここで imageView ごとのクリックイベントの処理を行います
            if let imageName = tappedImageView.image?.accessibilityIdentifier {
                switch imageName {
                case "icon_human":
                    print("Human icon tapped")
                    // ここにアクションを追加してください
                case "icon_star":
                    print("Star icon tapped")
                    // ここにアクションを追加してください
                case "icon_good":
                    print("Good icon tapped")
                    // ここにアクションを追加してください
                case "icon_bad":
                    print("Bad icon tapped")
                    // ここにアクションを追加してください
                case "icon_search":
                    print("Search icon tapped")
                    // ここにアクションを追加してください
                default:
                    break
                }
            }
        }
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
