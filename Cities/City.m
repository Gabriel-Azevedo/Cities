//
//  City.m
//  Cities
//
//  Created by Gabriel Borri de Azevedo on 1/16/15.
//  Copyright (c) 2015 Gabriel Enterprises. All rights reserved.
//

#import "City.h"

@implementation City

-(instancetype) initWithName:(NSString *)name AndState:(NSString *)state
{
    self = [super init];
    if (self)
    {
        self.name = name;
        self.state = state;
    }
    return self;
}

@end
