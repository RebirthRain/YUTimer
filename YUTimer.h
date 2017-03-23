//
//  YUTimer.h
//  测试程序
//
//  Created by 雨天记忆 on 2017/3/23.
//  Copyright © 2017年 雨天记忆. All rights reserved.
//

#import <Foundation/Foundation.h>

//因为NSTimer和其他交互的时候受到了RunLoop的影响。这里自己写一个和timer功能一样的类
@interface YUTimer : NSObject

//为了使用习惯这里直接采用和timer一样的创建方法
+ (YUTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo repeats:(BOOL)yesOrNo;

//开始执行。
- (void)fire;

//停止以后可以再次执行fire
- (void)stop;

@end
