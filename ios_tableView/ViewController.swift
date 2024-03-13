//
//  ViewController.swift
//  ios_tableView
//
//  Created by r_murata on 2024/03/08.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "customCell")
        
        // TableViewのセルの高さを自動的に計算する
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = UIScreen.main.bounds.height
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 表示するセルの数を返す
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // カスタムセルを取得して設定する
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomCell
        cell.sampleLabel.text = "テスト\(indexPath.row + 1)"
        cell.sampleImageView.image = UIImage(named: "icon")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            // セルの高さを画面の高さに設定する
            return UIScreen.main.bounds.height
        }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        // TableViewの中で画面いっぱいに表示される最初のセルのインデックスを取得
        let indexPath = tableView.indexPathForRow(at: targetContentOffset.pointee)
        // TableViewの現在のセルの高さを取得
        let cellHeight = UIScreen.main.bounds.height
        // セルの高さで割った余りが半分以上なら、次のセルの位置までスクロールする
        if let indexPath = indexPath, let cell = tableView.cellForRow(at: indexPath), let _ = tableView.indexPath(for: cell) {
            if cell.frame.height.truncatingRemainder(dividingBy: cellHeight) >= cellHeight / 2 {
                targetContentOffset.pointee.y = cell.frame.origin.y + cell.frame.height
            } else { // そうでない場合は、現在のセルの位置までスクロールする
                targetContentOffset.pointee.y = cell.frame.origin.y
            }
        }
    }
    
    
    
}
