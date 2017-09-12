//
//  ViewController.swift
//  simpleSNS
//
//  Created by 加藤諒 on 2017/09/11.
//  Copyright © 2017年 mirai. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,AVAudioPlayerDelegate {
  
  
  var audioPlayer:AVAudioPlayer! = nil //再生するサウンドのインスタンス
  
  var alert:UIAlertController!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // audioPlayer.delegate = self
    // audioPlayer.prepareToPlay()
  }
  
 
  @IBOutlet weak var dogImageView: UIImageView!
  
  
  @IBAction func myTop(_ sender: UITapGestureRecognizer) {
    //再生する　audio ファイルのパスを取得
    let audioPath = Bundle.main.path(forResource: "dog1b", ofType: "mp3")!
    let audioUrl:URL = URL(fileURLWithPath: audioPath)
    
    do {
      audioPlayer = try AVAudioPlayer (contentsOf: audioUrl, fileTypeHint:nil)
    } catch {
      print("AVAudioPlayerインスタンス作成失敗")
    }
    //audioPlayer.currentTime = 0
    audioPlayer.play()
    
      //alert
      alert = UIAlertController(title: "ニャースケ🐶", message: "いたいっ！", preferredStyle: UIAlertControllerStyle.alert)
  
      //アラートにOKボタンを追加
      let alertActionMy = UIAlertAction(title: "これからきをつける", style: UIAlertActionStyle.default, handler: { action in
        print("ここは")
      })
  
      alert.addAction(alertActionMy)//ここで実態を作って、実行
  
      //アラートを表示する
      present(alert,animated: true,completion: nil)
    }
  

  
  @IBAction func mySwipe(_ sender: UISwipeGestureRecognizer) {
    
    //alert
    alert = UIAlertController(title: "SNS", message: "とうこうする", preferredStyle: UIAlertControllerStyle.alert)
    
    //アラートにOKボタンを追加
    let alertAction = UIAlertAction(title: "とうこうする", style: UIAlertActionStyle.default, handler: { action in
      print("ここは")
    })
    
    let alertAction2 = UIAlertAction(title: "やっぱりやめる", style: UIAlertActionStyle.cancel, handler: { action in
      print("カキクケコ")
    })
    
    alert.addAction(alertAction)//ここで実態を作って、実行
    alert.addAction(alertAction2)
    
    //アラートを表示する
    present(alert,animated: true,completion: nil)
    
  }
  
  
  
  
  
  //タップアクション　押されたとき発動
  
  @IBAction func tapAction(_ sender: UIBarButtonItem) {
    
    //p.224
    
    //アクティビティーを作成(インスタンス化)
    //イニシャライザ（初期化）= インスタンス化したものを宣言した変数に直接代入すること。
    //activityItems シェアしたい情報の配列（中身はAny型）
    let controller = UIActivityViewController(activityItems: [dogImageView.image], applicationActivities: nil)
    
    //アクティビティーを表示
    //モーダルを表示（主にAlert, ActionSheet,ActivityViewにしようされるが、通常サイズの画面をモーダル表示するときにも使える）
    present(controller,animated: true, completion: nil)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}



