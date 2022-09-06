//
//  LobbyViewController.swift
//  TodoList
//
//  Created by 日暮駿之介 on 2022/09/06.
//

import UIKit

class LobbyViewController: UIViewController,UITableViewDataSource{
    
    @IBOutlet var table:UITableView!
    @IBOutlet var titleArray:UITextField!
    
    var i:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource=self

        // Do any additional setup after loading the view.
    }
    
    //セルの数を設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    //ID付きのセルを取得してセルのtextLabelを「testToDo」とする
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "Cell")
        
//        for i in 0...9{
//            cell?.textLabel?.text=titleArray[i]
//        }
        cell?.textLabel?.text="TestToDo"
        return cell!
    }
    
    
    //cellの何番目を押したかを次の画面に引き継ぐ
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath){
        i=indexPath.row
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let memoViewController:MemoViewController=segue.destination as! MemoViewController
        memoViewController.i=self.i
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
