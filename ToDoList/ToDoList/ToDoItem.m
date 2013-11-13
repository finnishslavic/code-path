//
//  ToDoItem.m
//  ToDoList
//
//  Created by Viacheslav Panasenko on 10/31/13.
//  Copyright (c) 2013 Viacheslav Panasenko. All rights reserved.
//

#import "ToDoItem.h"

@implementation ToDoItem

-(id)initWithText:(NSString *)text {
    if (self = [super init]) {
        self.text = text;
    }
    
    return self;
}

+(id)toDoItemWithText:(NSString *)text {
    return [[self alloc] initWithText:text];
}

@end
