//
//  GTNormalTableViewCell.m
//  MyApp
//
//  Created by zhujunli on 2020/11/16.
//

#import "GTNormalTableViewCell.h"


@interface GTNormalTableViewCell()
@property(nonatomic, strong, readwrite) UILabel *titleLabel;
@property(nonatomic, strong, readwrite) UILabel *sourceLabel;
@property(nonatomic, strong, readwrite) UILabel *commentLabel;
@property(nonatomic, strong, readwrite) UILabel *timeLabel;
@property(nonatomic, strong, readwrite) UIImageView *rightImageView;
@property(nonatomic, strong, readwrite) UIButton *deleteButton;
@end
@implementation GTNormalTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:({
            self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 15, self.frame.size.width * 0.6, 50)];
            self.titleLabel.backgroundColor = [UIColor brownColor];
            self.titleLabel.font = [UIFont systemFontOfSize:16];
            self.titleLabel.textColor = [UIColor blackColor];
            self.titleLabel;
        })];
        [self.contentView addSubview:({
            self.sourceLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 80, 50, 20)];
            self.sourceLabel.backgroundColor = [UIColor blueColor];
            self.sourceLabel.font = [UIFont systemFontOfSize:12];
            self.sourceLabel.textColor = [UIColor grayColor];
            self.sourceLabel;
        })];
        [self.contentView addSubview:({
            self.commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 80, 50, 20)];
            self.commentLabel.backgroundColor = [UIColor orangeColor];
            self.commentLabel.font = [UIFont systemFontOfSize:12];
            self.commentLabel.textColor = [UIColor grayColor];
            self.commentLabel;
        })];
        [self.contentView addSubview:({
            self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(170, 80, 50, 20)];
            self.timeLabel.backgroundColor = [UIColor systemPinkColor];
            self.timeLabel.font = [UIFont systemFontOfSize:12];
            self.timeLabel.textColor = [UIColor grayColor];
            self.timeLabel;
        })];
        [self.contentView addSubview:({
            self.rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width - 70, 15, 60, 60)];
            NSLog(@"cell:%f",self.frame.size.width);
            NSLog(@"content:%f",self.frame.size.width);
            self.rightImageView.backgroundColor = [UIColor yellowColor];
            
            self.rightImageView.contentMode = UIViewContentModeScaleAspectFit;
            self.rightImageView;
        })];
        [self.contentView addSubview:({
            self.deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width - 44, self.frame.size.height, 44, 44)];
            self.deleteButton.backgroundColor = [UIColor blueColor];
            [self.deleteButton setTitle:@"x" forState:UIControlStateNormal];
            [self.deleteButton setTitle:@"v" forState:UIControlStateHighlighted];

            [self.deleteButton addTarget:self action:@selector(deleteButtonClick) forControlEvents:UIControlEventTouchUpInside];
            self.deleteButton.contentMode = UIViewContentModeScaleAspectFit;
            self.deleteButton;
        })];
    }
    return self;
}

//- (void)setFrame:(CGRect)frame
//{
//    frame.size.width = 375;
//    [super setFrame:frame];
//
//}



- (void) layoutTableViewCell {
    self.titleLabel.text = @"Jessi";
    self.sourceLabel.text = @"marry";
    [self.sourceLabel sizeToFit];
    self.commentLabel.text = @"miley";
    [self.commentLabel sizeToFit];
    self.commentLabel.frame = CGRectMake(self.sourceLabel.frame.origin.x + self.sourceLabel.frame.size.width + 15, self.commentLabel.frame.origin.y, self.commentLabel.frame.size.width, self.commentLabel.frame.size.height);
    self.timeLabel.text = @"dodie";
    [self.timeLabel sizeToFit];
    self.timeLabel.frame = CGRectMake(self.commentLabel.frame.origin.x + self.commentLabel.frame.size.width + 15, self.timeLabel.frame.origin.y, self.timeLabel.frame.size.width, self.timeLabel.frame.size.height);
    
    
    self.rightImageView.image = [UIImage imageNamed:@"lzj.png"];
}

- (void)deleteButtonClick {
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableViewCell:clickDeleteButton:)]) {
        [self.delegate tableViewCell:self clickDeleteButton:self.deleteButton];
    }
}


@end
