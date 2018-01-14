//
//  ViewController.swift
//  RxSwiftSample02
//
//  Created by 伊藤静那(Ito Shizuna) on 2018/01/14.
//  Copyright © 2018年 ShizunaIto. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources

class ViewController: UIViewController {

    let disposeBag = DisposeBag()
    let breadsData = BreadPresenter()

    @IBOutlet weak var breadsTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, Bread>>(
            configureCell: {_, tableView, indexPath, breads in
                let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
                cell.textLabel?.text = breads.name
                cell.detailTextLabel?.text = breads.taste
                cell.imageView?.image = breads.image
                return cell
        })

        breadsData.breads.bind(to: breadsTableView.rx.items(dataSource: dataSource)).disposed(by: disposeBag)

        breadsTableView.rx.setDelegate(self).disposed(by: disposeBag)

        dataSource.titleForHeaderInSection = { (dataSource, section: Int) -> String in
            return dataSource[section].model
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(65)
    }
}

