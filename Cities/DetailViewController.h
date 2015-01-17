//
//  DetailViewController.h
//  Cities
//
//  Created by Gabriel Borri de Azevedo on 1/16/15.
//  Copyright (c) 2015 Gabriel Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "City.h"

@protocol DetailDelegate <NSObject>

-(void)updateTitle:(NSString *)name;

@end

@interface DetailViewController : UIViewController

@property City *city;

- (IBAction)onUpdateButtonTapped:(id)sender;

@property (nonatomic, weak) id <DetailDelegate> delegate;

@end
