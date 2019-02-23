#import "ViewController.h"

@implementation ViewController

-(void)loadView {
    CustomView *customView = [[CustomView alloc] init];
    [self setView:customView];
}

@end
