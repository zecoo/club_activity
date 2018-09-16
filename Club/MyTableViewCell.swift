//
//  MyTableViewCell.swift
//  hangge_1591
//
//  Created by hangge on 2017/3/12.
//  Copyright © 2017年 hangge.com. All rights reserved.
//

import UIKit
class MyTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource
{
    
    //单元格标题
    @IBOutlet weak var titleLabel: UILabel!
    
    //封面图片集合列表
    @IBOutlet weak var collectionView: UICollectionView!
    
    //collectionView的高度约束
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    
    //封面数据
    var images: [String] = []
    var names: [String] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //设置collectionView的代理
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        titleLabel.layer.cornerRadius = 3.0
        titleLabel.layer.masksToBounds = true
        
        // 注册CollectionViewCell
        self.collectionView!.register(UINib(nibName:"MyCollectionViewCell", bundle:nil),
                                      forCellWithReuseIdentifier: "myCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let firstVC = self.responderViewController()
        let infoVC = firstVC?.storyboard?.instantiateViewController(withIdentifier: "infoVC") as! InfoViewController
        infoVC.image = images[indexPath.item]
        infoVC.clubName = names[indexPath.item]
        firstVC?.navigationController?.pushViewController(infoVC, animated: true)
    }
    
    // Return the father CV of the current Cell
    func responderViewController() -> UIViewController? {
        for view in sequence(first: self.superview, next: {$0?.superview}) {
            if let responder = view?.next {
                if responder.isKind(of: UIViewController.self) {
                    return responder as? UIViewController
                }
            }
        }
        return nil
    }

    
    //加载数据
    func reloadData(catalog: String, images: [String], names: [String]) {
        //设置标题
        self.titleLabel.text = catalog
        //保存图片数据
        self.images = images
        self.names = names
        
        //collectionView重新加载数据
        self.collectionView.reloadData()
        
        //更新collectionView的高度约束
        let contentSize = self.collectionView.collectionViewLayout.collectionViewContentSize
        collectionViewHeight.constant = contentSize.height
    }
    
    //返回collectionView的单元格数量
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    //返回对应的单元格
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell",
                                                for: indexPath) as! MyCollectionViewCell
        cell.clubLabel.text = names[indexPath.item]
        cell.badgeImageView.image = UIImage.init(named: self.images[indexPath.item])

        return cell
    }
    
    //绘制单元格底部横线
    override func draw(_ rect: CGRect) {
        //线宽
        let lineWidth = 1 / UIScreen.main.scale
        //线偏移量
        let lineAdjustOffset = 1 / UIScreen.main.scale / 2
        //线条颜色
        let lineColor = UIColor(red: 0xe0/255, green: 0xe0/255, blue: 0xe0/255, alpha: 1)
        
        //获取绘图上下文
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        //创建一个矩形，它的所有边都内缩固定的偏移量
        let drawingRect = self.bounds.insetBy(dx: lineAdjustOffset, dy: lineAdjustOffset)
        
        //创建并设置路径
        let path = CGMutablePath()
        path.move(to: CGPoint(x: drawingRect.minX, y: drawingRect.maxY))
        path.addLine(to: CGPoint(x: drawingRect.maxX, y: drawingRect.maxY))
        
        //添加路径到图形上下文
        context.addPath(path)
        
        //设置笔触颜色
        context.setStrokeColor(lineColor.cgColor)
        //设置笔触宽度
        context.setLineWidth(lineWidth)
        
        //绘制路径
        context.strokePath()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
