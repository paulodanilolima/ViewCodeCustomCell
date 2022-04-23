//
//  CustomTableViewCell.swift
//  customCellViewCode
//
//  Created by Paulo Danilo Conceição Lima on 23/04/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    static let identifier = "CustomTableViewCell"
    
    private let _switch: UISwitch = {
        let _switch = UISwitch()
        _switch.onTintColor = .blue
        _switch.isOn = true
        return _switch
    }()
    
    private let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Cat1")
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let mylabel: UILabel = {
        let label = UILabel()
        label.text = "Custom Cell!"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .orange
        contentView.addSubview(_switch)
        contentView.addSubview(myImageView)
        contentView.addSubview(mylabel)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadUI(str: String, lbl: String, bol: Bool){
        
        myImageView.image = UIImage(named: str)
        mylabel.text = lbl
        _switch.isOn = bol
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        mylabel.text = nil
        myImageView.image = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let imageSize = contentView.frame.size.height-6
        let switchSize = _switch.sizeThatFits(contentView.frame.size)
        
        _switch.frame = CGRect(x: 5,
                               y: (contentView.frame.size.height-switchSize.height)/2,
                               width: switchSize.width,
                               height: switchSize.height)
        
        mylabel.frame = CGRect(x: 10+_switch.frame.size.width,
                               y: 0,
                               width: contentView.frame.size.width-10-_switch.frame.size.width-imageSize,
                               height: contentView.frame.size.height)
        
        myImageView.frame = CGRect(x: contentView.frame.size.width-imageSize,
                                   y: 3,
                                   width: imageSize,
                                   height: imageSize)
    }
    
   
    
}
