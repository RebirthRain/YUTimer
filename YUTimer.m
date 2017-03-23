//
//  YUTimer.m
//  测试程序
//
//  Created by 雨天记忆 on 2017/3/23.
//  Copyright © 2017年 雨天记忆. All rights reserved.
//

#import "YUTimer.h"

@interface YUTimer ()

@property (nonatomic, assign) NSTimeInterval ti;

@property (nonatomic, assign) BOOL yesOrNo;

@property (nonatomic, weak) id aTarget;

@property (nonatomic, assign) SEL aSelector;

@property (nonatomic, strong) id userInfo;

//判断是否执行了停止执行的程序
@property (nonatomic, assign) BOOL isStop;

@end

@implementation YUTimer

+ (YUTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo repeats:(BOOL)yesOrNo{
    //创建对象
    YUTimer *yu = [[YUTimer alloc] init];
    //执行一个延迟方法
    [yu performSelector:@selector(action:) withObject:userInfo afterDelay:ti];
    //接收外界传递进来的值
    yu.ti = ti;
    yu.yesOrNo = yesOrNo;
    yu.aTarget = aTarget;
    yu.aSelector = aSelector;
    yu.userInfo = userInfo;
    return yu;
}

- (void)fire{
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(action:) object:_userInfo];
    self.isStop = NO;
    [self action:_userInfo];
}

- (void)stop{
    self.isStop = YES;
}

- (void)action:(id)userInfo{
    if ([_aTarget respondsToSelector:_aSelector]) {
        if (!self.isStop) {
            [_aTarget performSelector:_aSelector withObject:userInfo];
        }
    }else{
        [self stop];
        self.aTarget = nil;
    }
    //是否循环执行
    if (self.yesOrNo && !self.isStop && self.aTarget != nil) {//循环执行
        [self performSelector:@selector(action:) withObject:userInfo afterDelay:_ti];
    }
}

@end
