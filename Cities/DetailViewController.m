//
//  DetailViewController.m
//  Cities
//
//  Created by Gabriel Borri de Azevedo on 1/16/15.
//  Copyright (c) 2015 Gabriel Enterprises. All rights reserved.
//

#import "DetailViewController.h"
#import "ViewController.h"
#import "WebViewController.h"
#import "City.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *stateTextField;

@property ViewController *previousVC;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation DetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.nameLabel.text = self.city.name;
    self.stateLabel.text = self.city.state;
    self.nameTextField.hidden = TRUE;
    self.stateTextField.hidden = TRUE;
    self.previousVC = [ViewController new];
    [self.imageView setImage:self.city.image];
}

- (IBAction)onEditButtonTapped:(UIBarButtonItem *)button
{
    if (self.editing)
    {
        if (![self.nameTextField.text isEqualToString:self.nameLabel.text])
        {
            self.city.name = self.nameTextField.text;
            self.city.state = self.stateTextField.text;

            self.nameLabel.text = self.city.name;
            self.stateLabel.text = self.city.state;
        }

        self.nameTextField.hidden = TRUE;
        self.stateTextField.hidden = TRUE;

        self.nameLabel.hidden = FALSE;
        self.stateLabel.hidden = FALSE;

        //[self.previousVC changeTitle:@"we"];

        button.title = @"Edit";
        button.style = UIBarButtonItemStylePlain;
        self.editing = FALSE;
    }
    else
    {
        self.nameTextField.text = self.city.name;
        self.stateTextField.text = self.city.state;

        self.nameTextField.hidden = FALSE;
        self.stateTextField.hidden = FALSE;

        self.nameLabel.hidden = TRUE;
        self.stateLabel.hidden = TRUE;

        button.title = @"Done";
        button.style = UIBarButtonItemStyleDone;
        self.editing = TRUE;
    }
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    WebViewController *webVC = [segue destinationViewController];
    webVC.city = [[City alloc] init];
    webVC.city = self.city;
}

- (IBAction)onUpdateButtonTapped:(id)sender
{
    [self.delegate updateTitle:self.city.name];
}


@end
