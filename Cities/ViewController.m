//
//  ViewController.m
//  Cities
//
//  Created by Gabriel Borri de Azevedo on 1/16/15.
//  Copyright (c) 2015 Gabriel Enterprises. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "City.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, CityDelegate, DetailDelegate>

@property City *city1;
@property City *city2;
@property City *city3;
@property City *city4;

@property NSMutableArray *cities;
@property NSArray *images;

@property DetailViewController *detailVC;

@property (weak, nonatomic) IBOutlet UINavigationItem *navBar;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self createCitiesArray];
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

-(void)createCitiesArray
{
    self.city1 = [[City alloc] initWithName:@"Paris" AndState:@"Île-de-France"];
    self.city2 = [[City alloc] initWithName:@"San Francisco" AndState:@"California"];
    self.city3 = [[City alloc] initWithName:@"Buenos Aires" AndState:@"Buenos Aires"];
    self.city4 = [[City alloc] initWithName:@"Miami" AndState:@"Florida"];

    self.city1.url = @"http://www.en.wikipedia.org/wiki/Paris";
    self.city2.url = @"http://www.en.wikipedia.org/wiki/San_Francisco";
    self.city3.url = @"http://www.en.wikipedia.org/wiki/Buenos_Aires";
    self.city4.url = @"http://www.en.wikipedia.org/wiki/Miami";

    self.city1.image = [UIImage imageNamed:@"Paris.jpeg"];
    self.city2.image = [UIImage imageNamed:@"SF.jpeg"];
    self.city3.image = [UIImage imageNamed:@"Buas.jpeg"];
    self.city4.image = [UIImage imageNamed:@"Miami.jpeg"];

    self.images = [[NSArray alloc] initWithObjects:self.city1.image, self.city2.image, self.city3.image, self.city4.image, nil];

    self.cities = [[NSMutableArray alloc] init];
    [self.cities addObject:self.city1];
    [self.cities addObject:self.city2];
    [self.cities addObject:self.city3];
    [self.cities addObject:self.city4];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    City *city = [self.cities objectAtIndex:indexPath.row];
    cell.textLabel.text =  city.name;
    cell.detailTextLabel.text = city.state;
    [cell.imageView setImage:[self.images objectAtIndex:indexPath.row]];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cities.count;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.cities removeObject:[self.cities objectAtIndex:indexPath.row]];
    [tableView reloadData];
}

-(void)updateTitle:(NSString *)name
{
    self.navigationItem.title = name;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    DetailViewController *detailVC = [segue destinationViewController];
    detailVC.delegate = self;
    detailVC.city = [[City alloc] init];
    detailVC.city = [self.cities objectAtIndex:path.row];
}

@end
