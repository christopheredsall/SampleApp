#import "CustomView.h"

@implementation CustomView
{
    UIButton* button;
    int width;
    int height;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button setTitle:@"Click me!" forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:button];
        [button addTarget:self action:@selector(onButtonClick:) forControlEvents:UIControlEventTouchDown];
    }
    return self;
}

-(void)onButtonClick:(UIEvent*)event {
    [UIView animateWithDuration:1.0 animations:^{
        int py = button.frame.origin.y;
        if(py == 0) {
            button.frame = CGRectMake(0, height, width, height);
            [button setBackgroundColor:[UIColor yellowColor]];
        }
        else if(py == height) {
            button.frame = CGRectMake(0, 0, width, height);
            [button setBackgroundColor:[UIColor greenColor]];
        }
    }];
}

- (void)drawRect:(CGRect)rect {
    width = self.bounds.size.width;
    height = self.bounds.size.height / 2;
    button.frame = CGRectMake(0, 0, width, height);
}

@end
