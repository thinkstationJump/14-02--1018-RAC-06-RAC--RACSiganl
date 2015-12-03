//
//  ViewController.m
//  ReactiveCocoa框架
//
//  Created by apple on 15/10/18.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import "ViewController.h"

#import "ReactiveCocoa.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // RAC常见步骤
    // 1.创建信号(冷信号)
    // 2.订阅信号(热信号)
    // 3.发送数据
    // RACSignal:表示有数据传递的时候
    // RACDisposable:取消订阅信号
    // RACSubscriber:订阅者,发送数据
    
    // 1.创建信号
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        // block什么时候调用:当信号被订阅的时候就会调用
        // block作用:在这里面传递数据出去
        
        // 3.发送数据
        [subscriber sendNext:@1];
        
        return nil;
    }];
    
    // 2.订阅信号
    // x:信号传递出来的数据
    [signal subscribeNext:^(id x) {
        // block什么时候调用:当信号内部,发送数据的时候,就会调用,并且会把值传递给你
        // block作用:在这个block中处理数据
        NSLog(@"%@",x);
    }];
    
    // 执行流程:
    // 1.创建信号RACDynamicSignal
    //  * 1.1 把didSubscribe保存到RACDynamicSignal
    // 2.订阅信号
    //  *  2.1 创建订阅者,把nextBlock保存到订阅者里面去
    //  *  2.2 就会调用信号的didSubscribe
    // 3.执行didSubscribe
    //  *  3.1 拿到订阅者发送订阅者
    //  * [subscriber sendNext:@1]内部就是拿到订阅者的nextBlock
    
    // * 信号被订阅,就会执行创建信号时didSubscribe
    // * 订阅者发送信号,就是调用nextBlock
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
