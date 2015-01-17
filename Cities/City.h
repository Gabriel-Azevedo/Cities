//
//  City.h
//  Cities
//
//  Created by Gabriel Borri de Azevedo on 1/16/15.
//  Copyright (c) 2015 Gabriel Enterprises. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol CityDelegate <NSObject>

@end

@interface City : NSObject

@property NSString *name;
@property NSString *state;
@property NSString *url;
@property UIImage *image;

-(instancetype)initWithName:(NSString *)name AndState:(NSString *)state;

@end
