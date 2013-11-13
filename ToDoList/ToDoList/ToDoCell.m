//
//  ToDoCell.m
//  ToDoList
//
//  Created by Viacheslav Panasenko on 10/31/13.
//  Copyright (c) 2013 Viacheslav Panasenko. All rights reserved.
//

#import "ToDoCell.h"
#import "StrikethroughLabel.h"

@implementation ToDoCell
{
    CAGradientLayer *_gradientLayer;
    CGPoint _originalCenter;
    BOOL _deleteOnDragRelease;
    BOOL _completeOnDragRelease;
    StrikethroughLabel *_label;
    CALayer *_itemCompleteLayer;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _label = [[StrikethroughLabel alloc] initWithFrame:CGRectNull];
        _label.textColor = [UIColor whiteColor];
        _label.font = [UIFont boldSystemFontOfSize:17];
        _label.backgroundColor = [UIColor clearColor];
        [self addSubview:_label];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        // Set gradient for the item
        _gradientLayer = [CAGradientLayer layer];
        _gradientLayer.frame = self.bounds;
        _gradientLayer.colors = @[(id)[[UIColor colorWithWhite:1.0f alpha:0.2f] CGColor],
                                  (id)[[UIColor colorWithWhite:1.0f alpha:0.1f] CGColor],
                                  (id)[[UIColor clearColor] CGColor],
                                  (id)[[UIColor colorWithWhite:0.0f alpha:0.1f] CGColor]];
        _gradientLayer.locations = @[@0.00f, @0.01f, @0.95f, @1.00f];
        [self.layer insertSublayer:_gradientLayer atIndex:0];
        
        _itemCompleteLayer = [CALayer layer];
        _itemCompleteLayer.backgroundColor = [[[UIColor alloc] initWithRed:0.0 green:0.6 blue:0.0 alpha:1.0] CGColor];
        _itemCompleteLayer.hidden = YES;
        [self.layer insertSublayer:_itemCompleteLayer atIndex:0];
        
        // Set swipe gesture recognizer
        UIGestureRecognizer *recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
        recognizer.delegate = self;
        [self addGestureRecognizer:recognizer];
    }
    return self;
}

-(BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer
{
    CGPoint translation = [gestureRecognizer translationInView:[self superview]];
    
    if (fabsf(translation.x) > fabsf(translation.y))
    {
        return YES;
    }
    
    return NO;
}

-(void)handlePan:(UIPanGestureRecognizer *) recognizer
{
    if (recognizer.state == UIGestureRecognizerStateBegan)
    {
        _originalCenter = self.center;
    }
    
    if (recognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [recognizer translationInView:self];
        self.center = CGPointMake(_originalCenter.x + translation.x, _originalCenter.y);
        _completeOnDragRelease = self.frame.origin.x > self.frame.size.width / 2;
        _deleteOnDragRelease = self.frame.origin.x < -self.frame.size.width / 2;
    }
    
    if (recognizer.state == UIGestureRecognizerStateEnded)
    {
        CGRect originalFrame = CGRectMake(0, self.frame.origin.y, self.bounds.size.width, self.bounds.size.height);
        
        if (!_deleteOnDragRelease)
        {
            [UIView animateWithDuration:0.2 animations:^
             {
                 self.frame = originalFrame;
             }];
        }
        
        if (_deleteOnDragRelease)
        {
            [self.delegate toDoItemDeleted:self.todoItem];
        }
        
        if (_completeOnDragRelease)
        {
            self.todoItem.completed = YES;
            _itemCompleteLayer.hidden = NO;
            _label.strikethorugh = YES;
        }
    }
}

const float LABEL_LEFT_MARGIN = 15.0f;

-(void)layoutSubviews
{
    [super layoutSubviews];
    _gradientLayer.frame = self.bounds;
    _itemCompleteLayer.frame = self.bounds;
    _label.frame = CGRectMake(LABEL_LEFT_MARGIN, 0, self.bounds.size.width - LABEL_LEFT_MARGIN, self.bounds.size.height);
}

-(void)setTodoItem:(ToDoItem *)todoItem {
    _todoItem = todoItem;
    _label.text = todoItem.text;
    _label.strikethorugh = todoItem.completed;
    _itemCompleteLayer.hidden = !todoItem.completed;
}

@end
