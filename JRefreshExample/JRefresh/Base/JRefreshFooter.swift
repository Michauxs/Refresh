//
//  JRefreshFooter.swift
//  JRefreshExanple
//
//  Created by Lee on 2018/8/22.
//  Copyright © 2018年 LEE. All rights reserved.
//

import UIKit

class JRefreshFooter: JRefreshComponent {
    ///忽略多少scrollView的contentInset的bottom
    public var ignoredScrollViewContentInsetBottom: CGFloat = 0
    //MARK: - 创建footer方法
    class func footerWithRefreshingBlock(_ refreshingBlock: Block) -> JRefreshFooter {
        
        let cmp = self.init()
        cmp.refreshingBlock = refreshingBlock
        return cmp
    }
}

extension JRefreshFooter {
    override func prepare() {
        super.prepare()
        // 设置自己的高度
        height = JRefreshConst.footerHeight
    }
}
//MARK: - 公共方法
extension JRefreshFooter {
    func endRefreshingWithNoMoreData() {
        DispatchQueue.main.async {[weak self] in
            self?.state = .NoMoreData
        }
    }
    func resetNoMoreData() {
        DispatchQueue.main.async {[weak self] in
            self?.state = .Idle
        }
    }
}









