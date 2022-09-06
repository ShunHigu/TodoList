//
//  MemoViewController.swift
//  TodoList
//
//  Created by 日暮駿之介 on 2022/09/06.
//

import UIKit
import RealmSwift

class MemoViewController: UIViewController, UITextFieldDelegate  {
    
    @IBOutlet var titleTextField:UITextField!
    @IBOutlet var contenrTextView:UITextView!
    @IBOutlet var dayTextField:UITextField!
    
    var titleArray:[String] = []
    var contentArray:[String] = []
    var dayArray:[String]=[]
    
    //受け継いだ内容
    var i:Int!
    
    let realm=try!Realm()

//    var toolBar:UIToolbar!
//    @IBOutlet var wakeTimeTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //保存されたメモの内容を表示
        titleTextField.text=titleArray[i]
        contenrTextView.text=contentArray[i]
        dayTextField.text=dayArray[i]

        let memo: Memo?=read()
        
    }
    
    func read() -> Memo?{
        return realm.objects(Memo.self).first
    }
    
    @IBAction func save(){

        let memo: Memo?=read()
        
        //書いた内容を配列に格納
            titleArray[i]=titleTextField.text!
            contentArray[i]=contenrTextView.text!
            dayArray[i]=dayTextField.text!
            
            if memo != nil{
                try! realm.write{
                    memo!.title=titleArray[i]
                    memo!.content=contentArray[i]
                    memo!.day=dayArray[i]
                }
            }
            else{
                let newmemo=Memo()
                newmemo.title=titleArray[i]
                newmemo.content=contentArray[i]
                newmemo.day=dayArray[i]
                try! realm.write{
                    realm.add(newmemo)
                }
            }
        
        self.navigationController?.popViewController(animated: true)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        var Lobbytitle:String
//        Lobbytitle.text=titleArray[i]
//        let lobbyViewController:LobbyViewControllerr=segue.destination as! LobbyViewController
//        lobbyViewController.Lobytitle=self.Lobbytitle
//    }
        
        
//

}
