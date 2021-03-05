//
//  ViewController.swift
//  BlogDemo
//
//  Created by Kriti Agarwal on 05/03/21.
//

import UIKit
import RichEditorView

class ViewController: UIViewController, RichEditorToolbarDelegate {

    var editor : RichEditorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editor = RichEditorView(frame: self.view.bounds)
        editor?.html = "<h1>My Awesome Editor</h1>Now I am editing in <em>style.</em>"
        editor?.isEditingEnabled = true
        editor?.bold()
        editor?.italic()
        editor?.setTextColor(.red)
        self.view.addSubview(editor ?? RichEditorView())
        
        let toolbar = RichEditorToolbar(frame: CGRect(x: 0, y: UIScreen.main.bounds.height - 70, width: 320, height: 44))
        toolbar.editor = editor // Previously instantiated RichEditorView
        toolbar.delegate = self
        toolbar.options = RichEditorDefaultOption.all
        editor?.inputAccessoryView = toolbar
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneTapped))
        let add = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneTapped))
        navigationItem.rightBarButtonItems = [add]
    }
    
    @objc func doneTapped() {
        print(editor?.contentHTML ?? "")
    }

    private func randomColor() -> UIColor {
        let colors: [UIColor] = [
            .red, .orange, .yellow,
            .green, .blue, .purple
        ]

        let color = colors[Int(arc4random_uniform(UInt32(colors.count)))]
        return color
    }

    private func richEditorToolbarChangeTextColor(toolbar: RichEditorToolbar) {
        let color = randomColor()
        toolbar.editor?.setTextColor(color)
    }
    
    let clearAllItem = RichEditorOptionItem(image: UIImage(named: "clear"), title: "Clear") { toolbar in
        toolbar.editor?.html = ""
        return
    }
    
    
    
}

