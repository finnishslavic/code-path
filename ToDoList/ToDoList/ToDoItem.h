//
//  ToDoItem.h
//  ToDoList
//
//  Created by Viacheslav Panasenko on 10/31/13.
//  Copyright (c) 2013 Viacheslav Panasenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject

@property (nonatomic, copy) NSString *text;
@property (nonatomic) BOOL completed;

-(id)initWithText:(NSString *) text;

+(id)toDoItemWithText:(NSString *)text;

@end
