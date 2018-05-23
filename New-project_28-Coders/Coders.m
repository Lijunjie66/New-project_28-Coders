//
//  Coders.m
//  New-project_28-Coders
//
//  Created by Geraint on 2018/5/23.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import "Coders.h"

@implementation Coders

// 一对多属性访问方法命名约定
// 无序的一对多关系属性实现的方法
- (NSUInteger)countOfDevelopers {
    return [self.developers count];
}

- (NSEnumerator *)enumeratorOfDevelopers {
    return [self.developers objectEnumerator];
}

- (Coder *)memberOfDevelopers:(Coder *)member object:(Coder *)anObject {
    return [self.developers member:anObject];
}

@end
