//
//  Coder.m
//  New-project_28-Coders
//
//  Created by Geraint on 2018/5/23.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import "Coder.h"

@implementation Coder

// 一对多属性访问方法命名约定
// 有序的一对多关系属性实现的方法
- (NSUInteger)countOfLanguages {
    return [self.languages count];
}

- (NSString *)objectInLanguagesAtIndex:(NSUInteger)index {
    return [self.languages objectAtIndex:index];
}

- (void)insertObject:(NSString *)object inLanguagesAtIndex:(NSUInteger)index {
    [self.languages insertObject:object atIndex:index];
}

- (void)removeObjectFromLanguagesAtIndex:(NSUInteger)index {
    [self.languages removeObjectAtIndex:index];
}

// 当含有输入键路径的某个类的属性被更改时，执行下面方法：
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context {
    NSString *newValue = change[NSKeyValueChangeNewKey];
    NSLog(@"Value changed for %@ object, key path: %@, new value: %@", [object class], keyPath, newValue);
}

@end
