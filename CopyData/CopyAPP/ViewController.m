//
//  ViewController.m
//  CopyAPP
//
//  Created by 陈威利 on 2021/5/10.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *mainTableView;
@property (nonatomic,strong)NSArray *nameArray;
@property (nonatomic,strong)NSArray *pswArray;
@end

@implementation ViewController
- (UITableView *)mainTableView{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 00, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
//        _mainTableView.rowHeight = 80;
        [_mainTableView registerClass:[vcCell class] forCellReuseIdentifier:@"vcCell"];
    }
    return _mainTableView;
}





- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.nameArray = @[@"h.zhan+hero@sonyged.co.jp",@"dbc@dbc"];
    self.pswArray = @[@"hero2018!",@"dbc1234"];
    [self.view addSubview:self.mainTableView];
    [self.mainTableView reloadData];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _nameArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    vcCell *cell=[tableView dequeueReusableCellWithIdentifier:@"vcCell"];
    if (cell == nil) {
        cell = [[vcCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"vcCell"];
    }
    [cell setName:self.nameArray[indexPath.row] andPsw:self.pswArray[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 140;
}
@end


@interface vcCell ()
@property (nonatomic,strong)UIButton *btnName;
@property (nonatomic,strong)UIButton *btnPsw;

@end

@implementation vcCell
- (UIButton *)btnName{
    if (!_btnName) {
        _btnName = [UIButton new];
        [_btnName addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchDown];
        _btnName.titleLabel.font = [UIFont systemFontOfSize:20];
        [_btnName setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return _btnName;
}

- (UIButton *)btnPsw{
    if (!_btnPsw) {
        _btnPsw = [UIButton new];
        [_btnPsw addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchDown];
        _btnPsw.titleLabel.font = [UIFont systemFontOfSize:20];
        [_btnPsw setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return _btnPsw;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addUI];
    }
    return self;
}

- (void)addUI{
    float ScreenWidth = [UIScreen mainScreen].bounds.size.width;
//    float ScreenHeight = [UIScreen mainScreen].bounds.size.height;
    [self.contentView addSubview:self.btnName];
    [self.contentView addSubview:self.btnPsw];
    _btnName.frame = CGRectMake(20, 7, ScreenWidth-40, 60);
    _btnPsw.frame = CGRectMake(20, 7*2+60, ScreenWidth-40, 60);
}



// 通过tag获取数据
- (void)btnAction:(UIButton *)btn{
    
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = btn.titleLabel.text;
}

- (void)setName:(NSString *)name andPsw:(NSString *)psw{
    [_btnName setTitle:name forState:UIControlStateNormal];
    [_btnPsw setTitle:psw forState:UIControlStateNormal];
}

@end
